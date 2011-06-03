class MembersController < ApplicationController
  before_filter 	:authorize
  
  # GET /members
  # GET /members.xml
  
  def index
    @accordian_active = 7
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  def set_member
    @user=User.find(params[:id])
    user_member_id = params[:user][:member_id]
    name = @user.name
    session[:member_id] = user_member_id
    
    if @user.update_attributes(:member_id => user_member_id , :name => name )
  		flash.now[:notice] = "User #{name} updated."
  		redirect_to(:action => "index")
  	else
  		flash.now[:notice] = "Error updating user."
  		render( :action => "index" )
  	end
  end  

  # GET /members/1
  # GET /members/1.xml
  def show
    redirect_to(:action => 'index')
  end

  # GET /members/new
  # GET /members/new.xml
  def new
    @accordian_active = 7
    @member = Member.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @accordian_active = 7
    @member = Member.find(params[:id])
    #@member_logo = MemberPreference.find_by_member_id_and_pref(params[:id], "logo")
    #@member_exp = MemberPreference.find_by_member_id_and_pref(params[:id], "exp_date")
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])
    
    respond_to do |format|
      if @member.save
        flash[:notice] = 'Member was successfully created.'
        format.html { redirect_to(@member) }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        flash[:notice] = 'Member was successfully updated.'
        format.html { redirect_to(@member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  ##    *****   WHY DO I HAVE update_prefs -> looks the same as update   *****
  def update_prefs
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        flash[:notice] = 'Member was successfully updated.'
        format.html { redirect_to(@member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end
  

end
