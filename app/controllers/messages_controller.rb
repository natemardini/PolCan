class MessagesController < ApplicationController
  
  def index
    if params[:bill_id].present? 
      @messages = Message.includes(:member).where(:bill_id => params[:bill_id]).order('created_at DESC').all
      @bill = Bill.find(params[:bill_id])
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
  
  def new
    @subject = false
    @message = Message.new
    if params[:bill_id].present? 
      @bill = Bill.find(params[:bill_id])
    elsif params[:motion_id].present?
    elsif params[:house_session_id].present?
    elsif params[:party_id].present?
      @subject = true
 #  elsif params[:member_id].present?
 #    @messages = Message.where(:member_id => params[:member_id]).order('created_at DESC').all
 #    @topic = Member.find(params[:member_id])
    end
  end
  
  def create
    if params[:bill_id].present? 
      @message = Message.new(params[:message])
      @message.bill = Bill.find(params[:bill_id])
      @message.member = current_member
      if @message.save
        flash[:notice] = "The Speaker acknowledges your words."
        redirect_to :action => 'index'
      end
    elsif params[:motion_id].present?
      @messages = Message.where(:motion_id => params[:motion_id]).order('created_at DESC').all
      @topic = Motion.find(params[:motion_id])
    elsif params[:house_session_id].present?
      @messages = Message.where(:house_session_id => params[:house_session_id]).order('created_at DESC').all
      @topic = HouseSession.find(params[:house_session_id])
    elsif params[:party_id].present?
      @message = Message.new(params[:message])
      @message.party = Bill.find(params[:bill_id])
      @message.member = current_member
      if @message.save
        flash[:notice] = "The Speaker acknowledges your words."
        redirect_to :action => 'index'
      end
 #  elsif params[:member_id].present?
 #    @messages = Message.where(:member_id => params[:member_id]).order('created_at DESC').all
 #    @topic = Member.find(params[:member_id])
    end
  end
  
  def edit
     if params[:bill_id].present? 
      @message = Message.find(params[:id])
      @bill = Bill.find(params[:bill_id])
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
  
  def update
    Message.find(params[:id]).update_attributes(params[:message])
    flash[:notice] = "The clerk dutifully editted the record."
    redirect_to :action => 'index'
  end
  
  def destroy
    Message.find(params[:id]).destroy
  end
  
  def show
    redirect_to :action => 'index'
  end
  
end
