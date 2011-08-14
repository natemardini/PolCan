require 'spec_helper'

describe HouseSession do
  
  before(:all) do
    opening = DateTime.now
    ending = 4.year.since(opening)
    @test_session = HouseSession.create( legislature: 20, session: 1, opening: opening, ending: ending )
  end
  
  describe "House Sessions" do
    it "should not be empty" do 
      HouseSession.all.should_not be_empty
    end
  end
  
  describe "#current_session" do
    it "should bring back the current session entity" do
      HouseSession.current_session.should == @test_session
    end
  end
  
  after(:all) do
    @test_session.destroy
  end
  
end
