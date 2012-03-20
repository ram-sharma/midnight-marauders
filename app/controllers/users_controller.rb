class UsersController < ActionController::Base
  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.json {render :json => @post}
    end
  end

  def create
    @user = User.new(params[:post])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created')}
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new"}
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
end
