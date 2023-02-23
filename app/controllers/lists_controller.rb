class ListsController < ApplicationController

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to root_path
    end
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
