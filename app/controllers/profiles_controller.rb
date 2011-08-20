class ProfilesController < Devise::RegistrationsController 
  before_filter :authenticate_member!, :except => [:profile, :new, :create, :update]
  
  uses_tiny_mce :options => {
                                :forced_root_block => false,
                                :force_br_newlines => true,
                                :force_p_newlines => false,
                                :theme_advanced_resizing => true,
                            }
  
  def new
    super
  end
  
  def update
    super
  end
  
  def edit
    super 
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      @member.create_wallet({cash: 0, popularity: 40, clout: 5})
      flash[:notice] = "Welcome #{current_member}, now let's get you magically elected to Parliament!"
      sign_in @member
      redirect_to constituency_path
    else
      render :action => 'new'
    end
  end
  
  def profile
    @profile = Member.find(params[:id])
  end
  
  def constituency
    @member = current_member
    @parties = Party.find([1, 2, 3, 4])
    @ridings = Riding.order('name').where(:member_id => nil)
  end
  
  def setconstituency
    current_member.riding = Riding.find(params[:riding])
    current_member.party_id = params[:party]
    current_member.description = params[:description]
    current_member.save(:validate => false)
    Role.find(1).members << current_member
    flash[:notice] = "Congrats! You've been elected to represent #{current_member.riding.name}. Welcome to the game."
    redirect_to :action => 'caucus', :controller => 'parties'
  end
   
  
end
