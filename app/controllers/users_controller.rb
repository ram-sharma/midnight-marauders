class UsersController < ActionController::Base
  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.json {render :json => @post}
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(root_url, :notice => 'User was successfully created')}
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new"}
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def login
    if session[:user]
      redirect_to root_url
    else
      if request.post?
        respond_to do |format|
          if user = User.login(params[:user])
            session[:user] = user
            format.html { redirect_to(root_url, :notice => 'Log in successful')}
          else
            format.html {render :action => "login"}
          end
        end
      end
    end
  end

  def logout
    session[:user] = nil
    redirect_to root_url
  end
end
