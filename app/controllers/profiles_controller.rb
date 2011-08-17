class ProfilesController < ApplicationController 
  
  def profile
    @profile = Member.find(params[:id])
  end
  
end
