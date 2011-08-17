class ProfilesController < ApplicationController 
  
  def profile
    @profile = Member.find(params[:id])
  end
  
  def constituency
    @member = current_member
    @parties = Party.all
    @ridings = Riding.order('name').where(:member_id => nil)
  end
  
  def setconstituency
    current_member


  end
   
  
end
