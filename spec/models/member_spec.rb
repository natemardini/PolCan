require 'spec_helper'

describe Member do
  
  before(:all) do
    @test_member = Member.create( first_name: "Jack", last_name: "Harkness", password: "torchwood", password_confirmation: "torchwood", email: "jack@torchwood.com" )
  end
  
  describe "Jack Harkness" do
  
    it "print his name" do
      @test_member.to_s should == "Jack Harkness"
    end
  end
  
  after(:all) do
    @test_member.destroy
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

