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
