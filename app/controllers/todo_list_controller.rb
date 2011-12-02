class TodoListController < ApplicationController

  def index
    @todo_lists = TodoList.all
  end

  def show
    @todo_list = TodoList.find(params[:id])
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new(params[:todo_list])
    if @todo_list.save
      redirect_to todo_list_index_path, :notice => 'TODO List successfully created'
    else
      render :new
    end
  end
end

