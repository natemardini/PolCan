class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

