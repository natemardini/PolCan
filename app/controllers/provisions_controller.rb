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
    @provision.bill_id = params[:bill_id]
    @provision.save
   # @provision.date_of_effect = params[:provision][:date_of_effect]
   # @provision.save(:validate => false)
    flash[:notice] = "Section added"
    redirect_to @provision.bill
  end
  
  def destroy
    provision = Provision.find(params[:id])
    deleted_section = "<strike>" + provision.text + "</strike>"
    provision.update_attributes( :text => deleted_section, :enacted_date => nil, :in_effect => 0 )
    flash[:notice] = "Section struck out."
  end 
  
  
end
