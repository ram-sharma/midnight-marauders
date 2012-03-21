class ListsController < ActionController::Base
  def new
    @list = List.new

    respond_to do |format|
      format.html
      format.json {render :json => @post}
    end
  end

  def create
    @list = List.new(params[:post])

    respond_to do |format|
      if @list.save
        format.html { redirect_to(@list, :notice => 'list was successfully created')}
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new"}
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
end
