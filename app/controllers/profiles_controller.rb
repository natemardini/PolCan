class ProfilesController < Devise::RegistrationsController 
  before_filter :authenticate_member!, :except => [:profile, :new, :create]
  
  def new
    super
  end
  
  def update
    super 
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
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
    @parties = Party.all
    @ridings = Riding.order('name').where(:member_id => nil)
  end
  
  def setconstituency
    current_member.riding = Riding.find(params[:riding])
    current_member.party_id = params[:party]
    current_member.save(:validate => false)
    Role.find(1).members << current_member
    redirect_to :root
  end
   
  
end
