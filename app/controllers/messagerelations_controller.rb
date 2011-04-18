class MessagerelationsController < ApplicationController
  # GET /messagerelations
  # GET /messagerelations.xml
  def index
    @messagerelations = Messagerelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messagerelations }
    end
  end

  # GET /messagerelations/1
  # GET /messagerelations/1.xml
  def show
    @messagerelation = Messagerelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @messagerelation }
    end
  end

  # GET /messagerelations/new
  # GET /messagerelations/new.xml
  def new
    @messagerelation = Messagerelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @messagerelation }
    end
  end

  # GET /messagerelations/1/edit
  def edit
    @messagerelation = Messagerelation.find(params[:id])
  end

  # POST /messagerelations
  # POST /messagerelations.xml
  def create
    @messagerelation = Messagerelation.new(params[:messagerelation])

    respond_to do |format|
      if @messagerelation.save
        format.html { redirect_to(@messagerelation, :notice => 'Messagerelation was successfully created.') }
        format.xml  { render :xml => @messagerelation, :status => :created, :location => @messagerelation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @messagerelation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messagerelations/1
  # PUT /messagerelations/1.xml
  def update
    @messagerelation = Messagerelation.find(params[:id])

    respond_to do |format|
      if @messagerelation.update_attributes(params[:messagerelation])
        format.html { redirect_to(@messagerelation, :notice => 'Messagerelation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @messagerelation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messagerelations/1
  # DELETE /messagerelations/1.xml
  def destroy
    @messagerelation = Messagerelation.find(params[:id])
    @messagerelation.destroy

    respond_to do |format|
      format.html { redirect_to(messagerelations_url) }
      format.xml  { head :ok }
    end
  end
end
