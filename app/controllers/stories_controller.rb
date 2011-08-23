class StoriesController < ApplicationController
  before_filter :authenticate_member!, :except => [:index, :show]

  uses_tiny_mce :options => {

                              :forced_root_block => false,
                              :force_br_newlines => true,
                              :force_p_newlines => false,
                              :theme_advanced_resizing => true,
                            }
  # GET /stories
  # GET /stories.json
  def index
    @hansard = Story.where(:category => 5).limit(5)
    @headline = Story.where(:category => [3, 4]).limit(5)
    @game = Story.where(:category => [1, 2]).limit(5)
    
    respond_to do |format|
      format.html { render :layout => 'news' } # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    if current_member.is_admin?
      @story = Story.new
      @categories = { "OOC - Game News" => 1, "OOC - Real News" => 2, "National Post" => 3, "Globe & Mail" => 4 }

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @story }
      end
    else
      flash[:notice] = "Admins only"
      redirect_to :root
    end
  end

  # GET /stories/1/edit
  def edit
    if signed_in? and current_member.is_admin?
      @story = Story.find(params[:id])
    else
      flash[:notice] = "Admins only!"
      redirect_to @story
    end 
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])
    @story.member = current_member

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :ok }
    end
  end
end
