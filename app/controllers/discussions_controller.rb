class DiscussionsController < ApplicationController
    uses_tiny_mce :options => {
                                :forced_root_block => false,
                                :force_br_newlines => true,
                                :force_p_newlines => false,
                                :theme_advanced_resizing => true,
                              }
  
  
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

