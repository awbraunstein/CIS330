class TagmentionsController < ApplicationController
  # GET /tagmentions
  # GET /tagmentions.xml
  def index
    @tagmentions = Tagmention.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tagmentions }
    end
  end

  # GET /tagmentions/1
  # GET /tagmentions/1.xml
  def show
    @tagmention = Tagmention.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tagmention }
    end
  end

  # GET /tagmentions/new
  # GET /tagmentions/new.xml
  def new
    @tagmention = Tagmention.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tagmention }
    end
  end

  # GET /tagmentions/1/edit
  def edit
    @tagmention = Tagmention.find(params[:id])
  end

  # POST /tagmentions
  # POST /tagmentions.xml
  def create
    @tagmention = Tagmention.new(params[:tagmention])

    respond_to do |format|
      if @tagmention.save
        format.html { redirect_to(@tagmention, :notice => 'Tagmention was successfully created.') }
        format.xml  { render :xml => @tagmention, :status => :created, :location => @tagmention }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tagmention.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tagmentions/1
  # PUT /tagmentions/1.xml
  def update
    @tagmention = Tagmention.find(params[:id])

    respond_to do |format|
      if @tagmention.update_attributes(params[:tagmention])
        format.html { redirect_to(@tagmention, :notice => 'Tagmention was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tagmention.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tagmentions/1
  # DELETE /tagmentions/1.xml
  def destroy
    @tagmention = Tagmention.find(params[:id])
    @tagmention.destroy

    respond_to do |format|
      format.html { redirect_to(tagmentions_url) }
      format.xml  { head :ok }
    end
  end
end
