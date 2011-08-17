class MessagesController < ApplicationController
  
  def index
    if params[:bill_id].present? 
      @messages = Message.includes(:member).where(:bill_id => params[:bill_id]).order('created_at DESC').all
      @topic = Bill.find(params[:bill_id])
    elsif params[:motion_id].present?
      @messages = Message.where(:motion_id => params[:motion_id]).order('created_at DESC').all
      @topic = Motion.find(params[:motion_id])
    elsif params[:house_session_id].present?
      @messages = Message.where(:house_session_id => params[:house_session_id]).order('created_at DESC').all
      @topic = HouseSession.find(params[:house_session_id])
 #  elsif params[:member_id].present?
 #    @messages = Message.where(:member_id => params[:member_id]).order('created_at DESC').all
 #    @topic = Member.find(params[:member_id])
    end
  end
  
end