class PagesController < ApplicationController
  
  def index
  end
  
  def restaurant
    @forum = Forum.where(:special => 1).first
    @discussions = @forum.discussions.order('updated_at DESC')
  end
  
  def parliament
    @session = HouseSession.current_session
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
  
  def cabinet
    if current_member.cabinet?
      @discussions = Forum.where(:special => 2).first.discussions
      @briefings = current_member.briefings.order('expiry ASC')
      @orders = current_member.orders.order('created_at DESC')
    else
      redirect_to :root
    end
  end
  

  
end
