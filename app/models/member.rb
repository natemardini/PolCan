class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :trackable
  devise :registerable, :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :first_name, :last_name,
                  :password_confirmation, :remember_me
  
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
  
  # Validations for certain properties
  validates :password,   :presence => true,
                         :confirmation => true
                        
  # Methods
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
    if !self.roles.find_all_by_access_level([5, 6]).empty?
      { "Public Bill" => 1, "Private Member's Bill" => 2 }
    else
      { "Private Member's Bill" => 2 }
    end
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
#

