class MotionsController < ApplicationController

  uses_tiny_mce :options => {
                              :forced_root_block => false,
                              :force_br_newlines => true,
                              :force_p_newlines => false,
                              :theme_advanced_resizing => true,
                            }

  def index
    @noticemotions = Motion.includes(:stage).where('stages.reading = ?', 11).all
    @ordermotions = Motion.includes(:stage).where('stages.reading = ?', 12).all
  end
  
  def show
    @motion = Motion.find(params[:id])
    @discussion = @motion.forum.discussions.find(:first)
    @yeas = @motion.stage.ballots.find_all_by_vote(1).count
    @nays = @motion.stage.ballots.find_all_by_vote(2).count
    @abs = @motion.stage.ballots.find_all_by_vote(3).count
    if (@yeas + @nays) > 0
      @percent = (@yeas / (@yeas + @nays) * 100).round
    else
      @percent = 50
    end
    @regal_style =  ((@motion.stage.last_movement.to_date - DateTime.parse("February 6, 1952").to_date) / 365).round.to_s + " Elizabeth II, #{@motion.stage.last_movement.year}."
  end
  
  def new
    if !HouseSession.current_session.nil?
      @motion = Motion.new
    else
      flash[:notice] = 'Parliament is not in session'
      redirect_to :action => 'index'
    end
  end
  
  def create
    motion = Motion.new(params[:motion])
    motion.member_id = current_member
    if motion.introduce
      flash[:notice] = 'Motion presented'
      redirect_to :action => 'index'
    else
      flash[:notice] = 'Something went wrong!'
      render 'new'
    end
  end
  
  def edit
    @motion = Motion.find(params[:id])
  end
  
  def update
    motion = Motion.find(params[:id])
    motion.update_attributes(params[:motion])
    redirect_to motion
  end
  
  def destroy
    Motion.find(params[:id]).destroy
    flash[:notice] = 'Motion deleted'
    redirect_to :action => 'index'
  end
  
end
