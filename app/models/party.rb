class Party < ActiveRecord::Base
  attr_accessible :short_name, :long_name, :letters, :seats
  
  has_one :wallet
  has_one :forum
  has_many :members
  has_many :ridings
  has_many :provinces, :through => :ridings, :uniq => true
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
  
  def self.joinable
    joinables = []
    self.all.each do |party|
      if party.id != 5 and party.members.count < party.seats
        joinables << party
      end
    end
    joinables
  end
  
  def available_provinces
    ridings.where(:member_id => nil).group(:province_id).map(&:province)
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

