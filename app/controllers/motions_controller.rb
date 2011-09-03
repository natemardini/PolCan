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
