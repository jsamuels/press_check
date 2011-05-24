class ControlBarsController < ApplicationController
  before_filter 	:authorize
  #layout "devices"
  
  # GET /control_bars
  # GET /control_bars.xml
  def index
    @accordian_active = 6
    @control_bars = ControlBar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @control_bars }
    end
  end

  # GET /control_bars/1
  # GET /control_bars/1.xml
  def show
    @accordian_active = 6
    @control_bar = ControlBar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @control_bar }
    end
  end

  # GET /control_bars/new
  # GET /control_bars/new.xml
  def new
    @accordian_active = 6
    @control_bar = ControlBar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @control_bar }
    end
  end

  # GET /control_bars/1/edit
  def edit
   @accordian_active = 6
    @control_bar = ControlBar.find(params[:id])
  end

  # POST /control_bars
  # POST /control_bars.xml
  def create
    @control_bar = ControlBar.new(params[:control_bar])

    respond_to do |format|
      if @control_bar.save
        flash[:notice] = 'ControlBar was successfully created.'
        format.html { redirect_to(@control_bar) }
        format.xml  { render :xml => @control_bar, :status => :created, :location => @control_bar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @control_bar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /control_bars/1
  # PUT /control_bars/1.xml
  def update
    @accordian_active = 6
    @control_bar = ControlBar.find(params[:id])

    respond_to do |format|
      if @control_bar.update_attributes(params[:control_bar])
        flash[:notice] = 'ControlBar was successfully updated.'
        format.html { redirect_to(@control_bar) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @control_bar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /control_bars/1
  # DELETE /control_bars/1.xml
  def destroy
    @accordian_active = 6
    @control_bar = ControlBar.find(params[:id])
    @control_bar.destroy

    respond_to do |format|
      format.html { redirect_to(control_bars_url) }
      format.xml  { head :ok }
    end
  end
end
