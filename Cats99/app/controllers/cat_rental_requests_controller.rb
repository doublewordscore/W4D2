require 'byebug'
class CatRentalRequestsController < ApplicationController

  def new
    render :new
  end

  def create
    @request = CatRentalRequest.new(request_params)
    #debugger
    if @request.save
      redirect_to "/cats/#{request_params[:cat_id]}"
    else
      render json: @request.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end
