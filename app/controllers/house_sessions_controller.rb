class HouseSessionsController < ApplicationController
  
  def open
    if HouseSession.current_session.nil?
      HouseSession.open_session
    end
  end
  
  def prorogue
    current = HouseSession.current_session
    if !current.nil?
      current.update_attribute(:ending, DateTime.now)
    end
  end
  
  def dissolve
    last_session = HouseSession.last_session!
    if !last_session.nil?
      last_session.update_attributes(:ending => DateTime.now, :dissolved => true)
    end
  end
  
end
