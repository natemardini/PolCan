class BillsController < ApplicationController
  
  def new
  end
  
  def create
    if !HouseSession.current_session.nil?
      bill = Bill.new(params[:bill])
      bill.number_bill
      if bill.save
        flash[:notice] = "Bill was duly drafted by the clerks."
        redirect_to bill
      else
        render :action => "draft"
      end
    end
  end
  
  def show
    @bill = Bill.find(params[:id])
  end
  
  
end
