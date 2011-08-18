class PartiesController < ApplicationController
  before_filter :authenticate_member!
  
  def caucus
    @party = current_member.party
    @threads = @party.messages.where(:ancestry => nil)
  end
 
end
