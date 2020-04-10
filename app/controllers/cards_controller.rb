class CardsController < ApplicationController
  before_action :set_board, only: [ :edit, :update, :index, :new, :create, :get_children]
  before_action :set_card, only: [:show, :destroy]
  before_action :authenticate_board, only: [:show, :edit, :destroy, :index]

  def index
    @cards = @board.cards.where(parent_id: '')
    @completed_cards = @board.cards.competed_cards
    @uncompleted_cards = @board.cards.uncompleted_cards
    @draft_cards = @board.cards.draft_cards
  end

  def new
    @cards = @board.cards.collect {|s| [s.title, s.id]}
    @card = Card.new

  end

  def create
    params[:card][:created_by] = current_user.id
    @card = @board.cards.new(card_params)

    respond_to do |format|
      if @card.save
          format.html {redirect_to board_cards_url , notice: 'Card was successfully created.' }
        else
          format.html { render :new }
        end
    end     
  end

  def edit
  end

  def update
  end

  def destroy
    unless @card.tasks.size > 0 || @card.children.size > 0
      @card.destroy
      notice = "Card was successfully deleted"
    else
      notice = "The card have some dependencies, it may child cards or tasks"
    end
    respond_to do |format|
        format.html {redirect_to board_cards_url(@board) , notice: notice }
    end 
  end

  def get_children
    @parent = Card.find(params[:parent])
    @children = @parent.children
  end

  def show
    @tasks = @card.tasks
  end

private 

    def card_params
      params.require(:card).permit( :title, :description, :parent_id, :created_by, :board_id)
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_card
      @card = Card.find(params[:id])
      @board = @card.board
    end

end
