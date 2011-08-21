class ForumsController < ApplicationController
  
  def show
    @forum = Forum.find(params[:id])
    @discussions = @forum.discussions
    @is_party_forum = !@forum.party_id.nil? 
  end
  
end
