class PartiesController < ApplicationController
  before_filter :authenticate_member!
  
  def caucus
    @party = current_member.party
    @discussions = @party.forum.discussions.order('updated_at DESC')
  end
 
end
