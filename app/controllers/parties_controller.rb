class PartiesController < ApplicationController
  before_filter :authenticate_member!
  
  uses_tiny_mce :options => {
                              :forced_root_block => false,
                              :force_br_newlines => true,
                              :force_p_newlines => false,
                              :theme_advanced_resizing => true,
                            }
  
  def caucus
    @party = current_member.party
    @discussions = @party.forum.discussions.order('updated_at DESC')
  end
  

 
end
