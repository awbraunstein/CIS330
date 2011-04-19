class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
     @users = User.search(params[:search])
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find_by_username(params[:id])
    if @user.nil?
      @user = User.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def search
    @users = User.search(params[:string])
    respond_to do |format|
      format.xml  { render :xml => @user}
    end
  end

  def suggestions
    @user = current_user
    @suggestion = @user.follow_suggestion
    @mutual_followers = @user.common_following_count(@suggestion)
    respond_to do |format|
      format.html # suggestions.html.erb
      format.xml {render :xml => @user }
    end
  end
  def relationships
    @user = User.find_by_username(params[:id])
    if @user.nil?
      @user = User.find(params[:id])
    end
    @followers = @user.followers
    @following = @user.following
    respond_to do |format|
      format.html # relationships.html.erb
      format.xml {render :xml => @user }
    end
  end
  
  def approve_user
    @user = User.find_by_username(params[:id])
    if @user.nil?
      @user = User.find(params[:id])
    end
    current_user.approve!(@user)
    respond_to do |format|
      format.html {redirect_to user_tweets_url(@user.username)} 
      format.xml  { render :xml => @user}
    end
  end

  def follow_user
    @user = User.find_by_username(params[:id])
    if @user.nil?
      @user = User.find(params[:id])
    end
    current_user.follow!(@user)
    respond_to do |format|
      format.html {redirect_to user_tweets_url(@user.username)} 
      format.xml  { render :xml => @user}
    end
  end

  def unfollow_user
    @user = User.find_by_username(params[:id])
    if @user.nil?
      @user = User.find(params[:id])
    end
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html {redirect_to user_tweets_url(@user.username)}
      format.xml  { render :xml => @user}
    end
  end
  
  
  def user_page
    if current_user.nil?
        redirect_to login_url()
    else
      @tweet = Tweet.new
      @user = User.find_by_username(params[:username])
      @tweets = @user.tweets
      @followtweets = @user.all_following_tweets
      @alltweets = []
      @alltweets = @alltweets+@tweets
      @alltweets = @alltweets+@followtweets
      @alltweets = @alltweets.sort_by{ |t| t.created_at }.reverse
      respond_to do |format|
        format.html # user_page.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end

  def favorites
    @tweet = current_user.favorites
    respond_to do |format|
      format.html # favorites.html.erb
    end
  end
  

  def requests_page
    if current_user.nil?
      redirect_to root_path
      flash[:notice] = "You must be logged in to view requests"
      return
    end
    @followerrequests = current_user.followerrequests
    @followrequests = current_user.followrequests
    respond_to do |format|
      format.html # requests_page.html.erb
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to(user_tweets_url(@user), :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
