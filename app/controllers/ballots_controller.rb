class BallotsController < ApplicationController
  
  def create
    # Register the vote
    stage = Stage.find(params[:stage])
    current_member.vote(params[:vote], stage) 
    
    # Get the new results 
    @yeas = Stage.find(params[:stage]).ballots.find_all_by_vote(1).count
    @nays = Stage.find(params[:stage]).ballots.find_all_by_vote(2).count
    @abs = Stage.find(params[:stage]).ballots.find_all_by_vote(3).count
    
    # Spit it back out
    respond_to do |format|
      format.js
    end
  end
  
end