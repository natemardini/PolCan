class DiscussionsController < ApplicationController
  
  def new
    @discussion = Discussion.new
    @forum = params[:id]
  end  
  
  def create
    discussion = Discussion.new(:subject => params[:discussion][:subject], :closed => false)
    forum = Forum.find(params[:forum_id])
    message = Message.new(params[:discussion][:messages_attributes])
    discussion.member = message.member = current_member
    forum.discussions << discussion
    discussion.messages << message    
    if !forum.party_id.nil?
      redirect_to :action => 'caucus', :controller => 'parties' 
    end
  end 
  
  def show
    @discussion = Discussion.find(params[:id])
    @messages = @discussion.messages
  end   
  
end

