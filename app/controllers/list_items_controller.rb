class ListItemsController < ApplicationController

  def create
    @list = List.find params[:list_id]
    @list.list_items.create params[:list_item]
    redirect_to list_path @list
  end
end
