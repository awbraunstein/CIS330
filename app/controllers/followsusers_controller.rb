class FollowsusersController < ApplicationController
  # GET /followsusers
  # GET /followsusers.xml
  def index
    @followsusers = Followsuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @followsusers }
    end
  end

  # GET /followsusers/1
  # GET /followsusers/1.xml
  def show
    @followsuser = Followsuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @followsuser }
    end
  end

  # GET /followsusers/new
  # GET /followsusers/new.xml
  def new
    @followsuser = Followsuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @followsuser }
    end
  end

  # GET /followsusers/1/edit
  def edit
    @followsuser = Followsuser.find(params[:id])
  end

  # POST /followsusers
  # POST /followsusers.xml
  def create
    @followsuser = Followsuser.new(params[:followsuser])

    respond_to do |format|
      if @followsuser.save
        format.html { redirect_to(@followsuser, :notice => 'Followsuser was successfully created.') }
        format.xml  { render :xml => @followsuser, :status => :created, :location => @followsuser }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @followsuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /followsusers/1
  # PUT /followsusers/1.xml
  def update
    @followsuser = Followsuser.find(params[:id])

    respond_to do |format|
      if @followsuser.update_attributes(params[:followsuser])
        format.html { redirect_to(@followsuser, :notice => 'Followsuser was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @followsuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /followsusers/1
  # DELETE /followsusers/1.xml
  def destroy
    @followsuser = Followsuser.find(params[:id])
    @followsuser.destroy

    respond_to do |format|
      format.html { redirect_to(followsusers_url) }
      format.xml  { head :ok }
    end
  end
end
