class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  private

  def card_params
    params[:card][:gender] = params[:card][:gender].to_i
    params.require(:card).permit(:photo_id, :first_name, :last_name, :gender)
  end
end
