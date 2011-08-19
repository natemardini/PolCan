class ProvisionsController < ApplicationController
  uses_tiny_mce :options => {
                                :forced_root_block => false,
                                :force_br_newlines => true,
                                :force_p_newlines => false,
                                :theme_advanced_resizing => true,
                            }
  
  def new 
    @bill = Bill.find(params[:bill_id])
    @provision = Provision.new(:bill => @bill)
    @provision.article = @bill.provisions.count + 1
  end
  
  def create
    @provision = Provision.new(params[:provision])
    if @provision.in_effect == 3
      @provision.effect_date = DateTime.parse(params[:provision][:effect_date])
    else
      @provision.effect_date = nil
    end
    @provision.bill_id = params[:bill_id]
      if @provision.save
        flash[:notice] = "Section added"
        redirect_to @provision.bill
      end
  end
  
  def destroy
    provision = Provision.find(params[:id])
    deleted_section = "<del>" + provision.body + "</del>"
    provision.update_attributes( :body => deleted_section, :enacted_date => nil, :in_effect => 0 )
    flash[:notice] = "Section removed."
  end 
  
  
end
