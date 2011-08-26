class OralQuestionsController < ApplicationController
  before_filter :authenticate_member!, :except => [:index, :show]
  def new
    if !HouseSession.current_session.nil? and !current_member.cabinet?
      @departments = { "Foreign Affairs" => "Foreign Affairs",
                       "National Defence" => "National Defence",
                       "Justice and Civil Security" => "Justice & Security",
                       "Finance" => "Finance",
                       "Environment" => "Environment",
                       "Health" => "Health",
                       "Industry and Transport" => "Industry & Transport",
                       "Resources and Agriculture" => "Resources & Agriculture",
                       "Indian and Northern Affairs" => "Indian Affairs" }
      @question = OralQuestion.new
    else
      flash[:notice] = "Government questioning itself now?"
      redirect_to :action => 'index'
    end
  end
  
  def create 
    @question = OralQuestion.new(params[:oral_question])
    @question.questioner = current_member
    @question.timelimit = 4.day.since(DateTime.now)
    @question.house_session = HouseSession.current_session
    @question.save 
    redirect_to :action => 'index'
  end
    
  def update
    @question = OralQuestion.find(params[:id])
    @question.update_attributes(:answer => params[:oral_question][:answer], :answerer => current_member) 
    redirect_to @question
  end
    
  def show 
    @question = OralQuestion.find(params[:id])
  end
  
  def index
    @questions = OralQuestion.where(:house_session_id => HouseSession.last_session!).order('timelimit ASC')
  end
   
end
