class TasksController < ApplicationController
  before_action :set_card, only: [:index, :new, :create]

  def index
    @tasks = @card.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = @card.tasks.new(task_params)
    
    respond_to do |format|
      if @task.save
          format.html {redirect_to board_cards_url(@card.board) , notice: 'Task was successfully created.' }
        else
          format.html { render :new }
        end
      end 
  end

  def show
  end

  def edit
  end

  def update
  end

  def change
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])
    @card = @task.card
    card_report
  end

  private

  def set_card
    @card = Card.find(params[:card_id])
  end

    def task_params
      params.require(:task).permit( :title, :card_id)
    end

    def card_report
      @board = @card.board
      @completed_cards = @board.cards.competed_cards
      @uncompleted_cards = @board.cards.uncompleted_cards
    end

end
