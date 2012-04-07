class ListsController < ApplicationController
  before_filter :check_user, :only => :destroy
  def index
    @lists = List.all
  end

  def new
    @list = List.new

    respond_to do |format|
      format.html
      format.json {render :json => @list}
    end
  end

  def create
    @list = List.new(params[:list].merge({:user_id => session[:user].id}))

    respond_to do |format|
      if @list.save
        format.html { redirect_to(@list, :notice => 'list was successfully created')}
        format.json { render :json => @list, :status => :created, :location => @list }
      else
        format.html { render :action => "new"}
        format.json { render :json => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @list = List.find params[:id]
  end

  def destroy
    @list = List.find params[:id]
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :no_content }
    end
    end

    protected

    def check_user
      raise User::NotAuthorized unless List.find(params[:id]).user == session[:user]
    end
  end
