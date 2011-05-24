class JobsController < ApplicationController
  before_filter 	:authorize
  #layout "devices"
  
  # GET /jobs
  # GET /jobs.xml
  def index
    @accordian_active = 1
    @jobs = Job.find(:all, :conditions => ["member_id=#{@member.id}"], :limit => 100, :order => 'created_at DESC' )
    if params[:job].blank? 
      @list_jobs = @jobs
    else
      @list_jobs = Job.find_all_by_id(params[:job])
    end
   
    respond_to do |format|
      format.js if request.xhr?
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end
  
  def say_when
    #render :text => "<p>The time is <b>" + DateTime.now.to_s + "</b></p>"
    @list_jobs = Job.find(:all, :conditions => ["member_id=#{@member.id}"], :limit => 100, :order => 'created_at DESC' )
    respond_to do |format|
      format.js if request.xhr?
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end
  

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @accordian_active = 1
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @accordian_active = 1
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
     @accordian_active = 1
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create
     @accordian_active = 1
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        flash[:notice] = 'Job was successfully created.'
        format.html { redirect_to(@job) }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
     @accordian_active = 1
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        flash[:notice] = 'Job was successfully updated.'
        format.html { redirect_to(@job) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
     @accordian_active = 1
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(jobs_url) }
      format.xml  { head :ok }
    end
  end
end
