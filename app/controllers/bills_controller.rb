class BillsController < ApplicationController
  
  def new
    @bill = Bill.new
    @bill_options = current_member.bill_options
  end
  
  def create
    if !HouseSession.current_session.nil?
      @bill = Bill.new(params[:bill])
      @bill.member = current_member
      if @bill.introduce
        flash[:notice] = "Bill was duly introduced by the clerks."
        redirect_to 'index'
      else
        render 'new'
        flash.now[:notice] = "Bill was not saved properly."
      end
    else
      render 'new'
      flash.now[:notice] = "Parliament is not in session."
    end
  end
  
  def show
    @bill = Bill.find(params[:id])
    @yeas = @bill.stage.ballots.find_all_by_vote(1).count
    @nays = @bill.stage.ballots.find_all_by_vote(2).count
    @abs = @bill.stage.ballots.find_all_by_vote(3).count
  end
 
  def index
    @bills = Bill.includes(:stage).where('stages.reading = ?', 0)
  end 
  
end
