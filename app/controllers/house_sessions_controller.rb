class HouseSessionsController < ApplicationController
  
  def open
    if HouseSession.current_session.nil?
      HouseSession.open_session
      flash[:notice] = "Session started!"
    else
      flash[:notice] = "Parliament is already in session"
    end
    redirect_to :action => 'control', :controller => 'pages'
  end
  
  def prorogue
    current = HouseSession.current_session
    if !current.nil?
      current.update_attribute(:ending, DateTime.now)
      flash[:notice] = "Parliament prorogued"
    else
      flash[:notice] = "Parliament isn't in session, sir"
    end
    redirect_to :action => 'control', :controller => 'pages'
  end
  
  def dissolve
    last_session = HouseSession.last_session!
    if !last_session.nil?
      last_session.update_attributes(:ending => DateTime.now, :dissolved => true)
      flash[:notice] = "Parliament dissolved, and elections called!"
    else
      flash[:notice] = "Cannot compute, game didn't begin?"
    end
    redirect_to :action => 'control', :controller => 'pages'
  end
  
end
