class BillsController < ApplicationController
  uses_tiny_mce :options => {
                              :forced_root_block => false,
                              :force_br_newlines => true,
                              :force_p_newlines => false,
                              :theme_advanced_resizing => true,
                            }
                            
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
        redirect_to :action => "index"
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
    @discussion = @bill.forum.discussions.find(:first)
    @yeas = @bill.stage.ballots.find_all_by_vote(1).count
    @nays = @bill.stage.ballots.find_all_by_vote(2).count
    @abs = @bill.stage.ballots.find_all_by_vote(3).count
    if (@yeas + @nays) > 0
      @percent = (@yeas / (@yeas + @nays) * 100).round
    else
      @percent = 50
    end
    @regal_style =  ((@bill.stage.last_movement.to_date - DateTime.parse("February 6, 1952").to_date) / 365).round.to_s + " Elizabeth II, #{@bill.stage.last_movement.year}."
  end
 
  def index
    @session = HouseSession.current_session
    @publicbills = @session.bills.order('bill_number DESC').includes(:stage).where('stages.reading > ? AND bill_type = ?', 0, 1)
    @privatebills = @session.bills.order('bill_number DESC').includes(:stage).where('stages.reading > ? AND bill_type = ?', 0, 2)
    @draftbills = @session.bills.order('bill_number DESC').includes(:stage).where('stages.reading = ?', 0) & current_member.bills
  end 
  
  def present
    bill = Bill.find(params[:id])
    bill.stage.update_attribute(:reading, 1)
    redirect_to :action => 'index'
  end 
  
  def edit
    @bill = Bill.find(params[:id])
    @bill_options = current_member.bill_options 
    render 'bills/new'
  end 
  
  def update
    bill = Bill.find(params[:id])
    bill.update_attributes(params[:bill])
    redirect_to bill
  end
  
  def confidence
    bill = Bill.find(params[:id])
    bill.update_attribute(:confidence, true)
    redirect_to :action => 'index' 
  end
  
end
