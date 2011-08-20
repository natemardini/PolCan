class PagesController < ApplicationController
  
  def index
  end
  
  def control
    if !signed_in? or !current_member.is_admin?
      redirect_to :root
    end

  end
  
  def setrole
    @member = Member.find(params[:member_id])
    @role = Role.find(params[:role_id])
    if @member.roles.exists?(@role)
      @member.roles.delete(@role)
      flash[:notice] = "Role removed!"
    else
      @member.roles << @role
      flash[:notice] = "Role granted!"
    end
    redirect_to :action => 'control'
  end 
  
  
end
