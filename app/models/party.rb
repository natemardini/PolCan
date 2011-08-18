class Party < ActiveRecord::Base
  attr_accessible :short_name, :long_name, :letters, :seats
  
  has_one :wallet
  has_one :forum
  has_many :members
  has_many :ridings
  belongs_to :house_group
  
  # Methods
  def officer(title)
    result = self.members & Role.where(:short_name => title).first.members
    if result.empty?
      "Vacant"
    else
      result.first
    end
  end
  
  def to_s
    case id
    when 1
      "(Con.)"
    when 2
      "(Lib.)"
    when 3
      "(NDP)"
    when 4
      "(Bloc)"
    when 5
      "(Green)"  
    end
  end
  
end



# == Schema Information
#
# Table name: parties
#
#  id             :integer         not null, primary key
#  short_name     :string(255)
#  long_name      :string(255)
#  letters        :string(255)
#  seats          :integer
#  created_at     :datetime
#  updated_at     :datetime
#  house_group_id :integer
#

