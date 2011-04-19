class FavoritetweetsController < ApplicationController
  # GET /favoritetweets
  # GET /favoritetweets.xml
  def index
    @favoritetweets = Favoritetweet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favoritetweets }
    end
  end

  # GET /favoritetweets/1
  # GET /favoritetweets/1.xml
  def show
    @favoritetweet = Favoritetweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favoritetweet }
    end
  end

  # GET /favoritetweets/new
  # GET /favoritetweets/new.xml
  def new
    @favoritetweet = Favoritetweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @favoritetweet }
    end
  end

  # GET /favoritetweets/1/edit
  def edit
    @favoritetweet = Favoritetweet.find(params[:id])
  end

  # POST /favoritetweets
  # POST /favoritetweets.xml
  def create
    @favoritetweet = Favoritetweet.new(params[:favoritetweet])

    respond_to do |format|
      if @favoritetweet.save
        format.html { redirect_to(@favoritetweet, :notice => 'Favoritetweet was successfully created.') }
        format.xml  { render :xml => @favoritetweet, :status => :created, :location => @favoritetweet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favoritetweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favoritetweets/1
  # PUT /favoritetweets/1.xml
  def update
    @favoritetweet = Favoritetweet.find(params[:id])

    respond_to do |format|
      if @favoritetweet.update_attributes(params[:favoritetweet])
        format.html { redirect_to(@favoritetweet, :notice => 'Favoritetweet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favoritetweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favoritetweets/1
  # DELETE /favoritetweets/1.xml
  def destroy
    @favoritetweet = Favoritetweet.find(params[:id])
    @favoritetweet.destroy

    respond_to do |format|
      format.html { redirect_to(favoritetweets_url) }
      format.xml  { head :ok }
    end
  end
end
