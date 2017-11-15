class ListsController < ApplicationController
  # Lists all lists in the db
  def index
    @lists = List.all
  end

  # Selects a specific list from the db
  def show
    @list = List.find(params[:id])
  end

  # Renders a form to CREATE a new list in the db
  def new
    @list = List.new
  end

  # Creates an entry in the db
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "list succesfully added!"
      redirect_to lists_path
    else
      render :new
    end
  end

  # Renders a form to UPDATE a specific list in the db
  def edit
    binding.pry
    @list = List.find(params[:id])
  end

  # Updates the form in the db
  def update
    @list= List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  # DELETES the list from the db
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

private
  def list_params
    params.require(:list).permit(:name, :author, :description)
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
