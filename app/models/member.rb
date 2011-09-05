class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :trackable
  devise :registerable, :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :first_name, :last_name, :description, :avatar, :avatar_cache,
                :password_confirmation, :remember_me
  
  mount_uploader :avatar, AvatarUploader
  
  # Associations
  has_and_belongs_to_many :roles
  belongs_to :party
  has_one :wallet
  has_one :riding
  has_many :bills
  has_many :motions
  has_many :orders
  has_many :ballots
  has_many :messages
  has_many :stories
  has_many :readings
  has_many :oral_questions
  has_many :departments
  has_many :briefings, :through => :departments
  
  
  # Validations for certain properties
  validates :password,   :presence => true,
                         :confirmation => true, :on => :create
                        
  # Methods
  
  def is_admin?
    !self.roles.where('access_level > ?', 7).empty?
  end
  
  def to_s 
    "#{first_name} #{last_name}"
  end
  
  def vote(choice, stage)
    # Let's see if he already voted first
    previous_vote = (stage.ballots & self.ballots).first
    if previous_vote.nil?
      # Create a new ballot and send it to bill if he hasn't voted yet
      stage.ballots << self.ballots.create(vote: choice)
    else
      # Update previous vote choice if he did
      previous_vote.update_attribute(:vote, choice)
    end
  end
  
  def bill_options
    if !self.roles.find_all_by_access_level([6, 7]).empty?
      { "Public Bill" => 1, "Private Member's Bill" => 2 }
    else
      { "Private Member's Bill" => 2 }
    end
  end
  
  def main_role(style = 'short')
    top_level = self.roles.order('access_level DESC').first
    if !top_level.nil?
      if style == 'short'
        "#{self}, #{top_level.short_name}"
    elsif style == 'long'
        "#{top_level.long_name}"
      end
    else
      "#{self}"
    end
  end
  
  def cabinet?
    if !self.roles.find_all_by_access_level([4, 6, 7]).empty? and self.party.house_group.side == 1
      true
    else
      false
    end
  end
  
  def self.ooleader
    ool = (HouseGroup.find_by_name('Opposition').parties.order('seats DESC').first.members & Role.find_by_short_name('Leader').members).first 
    if ool.nil?
      "Vacant"
    else
      ool
    end 
  end
    
  def prefix
    top_level = self.roles.order('access_level DESC').first
    if !top_level.nil?
      if top_level.access_level == 6
        "Hon."
  elsif top_level.access_level == 7 or 10
        "Rt. Hon."
      end
    else
      ""
    end
  end
  
  def constituency(long = true)
    if !self.riding.nil?
      if long == false
        "#{self.riding.name} (#{self.riding.province.letters})"  
      else 
        "Member for #{self.riding.name}, #{self.riding.province.letters} #{self.party}"   
      end
    else
      "Officer of Parliament"
    end
  end
  
  def update_with_password(params={})
    params.delete(:current_password)
    self.update_without_password(params)
  end  
end




# == Schema Information
#
# Table name: members
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  party_id               :integer
#  avatar                 :string(255)
#  description            :text
#

