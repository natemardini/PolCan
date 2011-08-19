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
    if @provision.in_effect == 3 
      @provision.date_of_effect = Date.strptime(params[:provision][:date_of_effect], '%m/%d/%Y') if !params[:provision][:date_of_effect].blank?
    else
      @provision.date_of_effect = nil
    end
    @provision.save
    flash[:notice] = "Section added"
    redirect_to @provision.bill
  end
  
  def destroy
    provision = Provision.find(params[:id])
    if provision.in_effect != 0 
      deleted_section = "<strike>" + provision.text + "</strike>"
      provision.update_attributes( :text => deleted_section, :enacted_date => nil, :in_effect => 0 )
      flash[:notice] = "Section struck out."
    else
      provision.update_attribute( :in_effect, 1 )
      flash[:notice] = "Section re-inserted. You may edit out the strikeline."
    end
    redirect_to provision.bill
  end 
  
  def edit
    @bill = Bill.find(params[:bill_id])
    @provision = Provision.find(params[:id])
    render 'provisions/new'
  end
  
  def update
    bill = Bill.find(params[:bill_id])
    Provision.find(params[:id]).update_attributes(params[:provision])
    redirect_to bill
  end
  
  
end
