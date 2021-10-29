module V1
  class BusinesController < ApplicationController
  before_action :set_busine, only: [:show, :update, :destroy]

  # GET /busines
  def index
    @busines = current_user.busines.paginate(page: params[:page], per_page: 20)
    json_response(@busines)
  end

  # POST /busines
  def create
    @busine = current_user.busines.create!(busine_params)
    json_response(@busine, :created)
  end

  # GET /busines/:id
  def show
    json_response(@busine)
  end

  # PUT /busines/:id
  def update
    @busine.update(busine_params)
    head :no_content
  end

  # DELETE /busines/:id
  def destroy
    @busine.destroy
    head :no_content
  end

  private

  def busine_params
    # whitelist params
    params.permit(:name, :mercantil_code, :address, :description)
  end

  def set_busine
    @busine = Busine.find(params[:id])
  end
  end
end
