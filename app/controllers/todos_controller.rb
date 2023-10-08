class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
    def index
      @todos = Todo.all
    end
  
    def new
      @todo = Todo.new
    end
  
    def show; end

    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        redirect_to todos_path, notice: 'Todo item was successfully created.'
      else
        render :new
      end
    end
  
    def view; end
  
    def update
      if @todo.update(todo_params)
        redirect_to todos_path, notice: 'Todo item was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @todo.destroy
      redirect_to todos_path, notice: 'Todo item was successfully deleted.'
    end
  
    private
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:action, :description, :rating)
    end
  end
  