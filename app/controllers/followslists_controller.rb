class FollowslistsController < ApplicationController
  # GET /followslists
  # GET /followslists.xml
  def index
    @followslists = Followslist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @followslists }
    end
  end

  # GET /followslists/1
  # GET /followslists/1.xml
  def show
    @followslist = Followslist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @followslist }
    end
  end

  # GET /followslists/new
  # GET /followslists/new.xml
  def new
    @followslist = Followslist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @followslist }
    end
  end

  # GET /followslists/1/edit
  def edit
    @followslist = Followslist.find(params[:id])
  end

  # POST /followslists
  # POST /followslists.xml
  def create
    @followslist = Followslist.new(params[:followslist])

    respond_to do |format|
      if @followslist.save
        format.html { redirect_to(@followslist, :notice => 'Followslist was successfully created.') }
        format.xml  { render :xml => @followslist, :status => :created, :location => @followslist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @followslist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /followslists/1
  # PUT /followslists/1.xml
  def update
    @followslist = Followslist.find(params[:id])

    respond_to do |format|
      if @followslist.update_attributes(params[:followslist])
        format.html { redirect_to(@followslist, :notice => 'Followslist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @followslist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /followslists/1
  # DELETE /followslists/1.xml
  def destroy
    @followslist = Followslist.find(params[:id])
    @followslist.destroy

    respond_to do |format|
      format.html { redirect_to(followslists_url) }
      format.xml  { head :ok }
    end
  end
end
