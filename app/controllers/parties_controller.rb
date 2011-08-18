class PartiesController < ApplicationController
  before_filter :authenticate_member!
  
  def caucus
    @party = current_member.party
    @discussions = @party.forum.discussions
  end
 
end
