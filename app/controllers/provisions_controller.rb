class ProvisionsController < ApplicationController
  
  def new
    @bill = Bill.find(params[:bill_id])
    @provision = Provision.new(:bill => @bill)
    @provision.article = @bill.provisions.count + 1
  end
  
  def create
    @provision = Provision.new(params[:provision])
    if @provision.in_effect == 3
      @provision.effect_date = params[:provision][:effect_date]
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
    Provision.find(params[:id]).destroy
    flash[:notice] = "Section removed."
  end 
  
  
end
