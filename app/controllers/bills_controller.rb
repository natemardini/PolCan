class BillsController < ApplicationController
  
  def new
    @bill = Bill.new
    @bill_options = current_member.bill_options
  end
  
  def create
    if !HouseSession.current_session.nil?
      @bill = Bill.new(params[:bill])
      if @bill.introduce
        flash[:notice] = "Bill was duly introduced by the clerks."
        redirect_to @bill
      else
        render 'new'
        flash[:notice] = "Bill was not saved properly."
      end
    else
      render 'new'
      flash[:notice] = "Parliament is not in session."
    end
  end
  
  def show
    @bill = Bill.find(params[:id])
  end
  
  
end
