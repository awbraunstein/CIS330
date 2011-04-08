class InlistsController < ApplicationController
  # GET /inlists
  # GET /inlists.xml
  def index
    @inlists = Inlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inlists }
    end
  end

  # GET /inlists/1
  # GET /inlists/1.xml
  def show
    @inlist = Inlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inlist }
    end
  end

  # GET /inlists/new
  # GET /inlists/new.xml
  def new
    @inlist = Inlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inlist }
    end
  end

  # GET /inlists/1/edit
  def edit
    @inlist = Inlist.find(params[:id])
  end

  # POST /inlists
  # POST /inlists.xml
  def create
    @inlist = Inlist.new(params[:inlist])

    respond_to do |format|
      if @inlist.save
        format.html { redirect_to(@inlist, :notice => 'Inlist was successfully created.') }
        format.xml  { render :xml => @inlist, :status => :created, :location => @inlist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inlists/1
  # PUT /inlists/1.xml
  def update
    @inlist = Inlist.find(params[:id])

    respond_to do |format|
      if @inlist.update_attributes(params[:inlist])
        format.html { redirect_to(@inlist, :notice => 'Inlist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inlists/1
  # DELETE /inlists/1.xml
  def destroy
    @inlist = Inlist.find(params[:id])
    @inlist.destroy

    respond_to do |format|
      format.html { redirect_to(inlists_url) }
      format.xml  { head :ok }
    end
  end
end
