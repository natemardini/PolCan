class BillsController < ApplicationController
  
  def draft
  end
  
  def create
    if !HouseSession.current_session.nil?
      @bill = Bill.new(params[:bill])
      @bill.number_bill
      if @bill.save
        @bill.short_title_section
        flash[:notice] = "Bill was duly drafted by the clerks."
        redirect_to @bill
      else
        render :action => "draft"
      end
    end
  end
  
  
end
