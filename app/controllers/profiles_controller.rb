class ProfilesController < ApplicationController 
  
  def profile
    @profile = Member.find(params[:id])
  end
  
  def constituency
    if signed_in?
      @member = current_member
      @parties = Party.all
      @ridings = Riding.order('name').where(:member_id => nil)
    end
  end
  
  def setconstituency
    current_member.riding = Riding.find(params[:riding])
    current_member.party_id = params[:party]
    current_member.save(:validate => false)
    Role.find(1).members << current_member
    redirect_to :root
  end
   
  
end
