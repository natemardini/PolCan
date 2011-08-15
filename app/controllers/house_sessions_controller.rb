class HouseSessions < ApplicationController
  
  def open
    if HouseSession.current_session.nil?
      # Put in model
      HouseSession.create(opening: DateTime.now, ending: 15.week.since(DateTime.now), dissolved: false)
    end
  end
  
  def prorogue
    if !HouseSession.current_session.nil?
      HouseSession.current_session.update_attribute(:ending, DateTime.now)
    end
  end
  
  def dissolve
    last_session = HouseSession.
    if !last_session.nil? # Actually, get the last entry based on ending
      last_session.update_attributes(:ending => DateTime.now, :dissolved => true)
    end
  end
  
end