class CardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy, :index, :new, :create, :get_children]
  before_action :authenticate_board, only: [:show, :edit, :destroy, :index]

  def index
    @cards = @board.cards.where(parent_id: '')
    @completed_cards = @board.cards.competed_cards
    @uncompleted_cards = @board.cards.uncompleted_cards
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

  def get_children
    @parent = Card.find(params[:parent])
    @children = @parent.children
  end

private 

    def card_params
      params.require(:card).permit( :title, :description, :parent_id, :created_by, :board_id)
    end

    def set_board
      @board = Board.find(params[:board_id])
    end


end
