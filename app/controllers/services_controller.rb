class ServicesController < ApplicationController
  before_action :set_busine
  before_action :set_busine_service, only: [:show, :update, :destroy]

  # GET /busines/:busine_id/services
  def index
    json_response(@busine.services)
  end

  # GET /busines/:busine_id/services/:id
  def show
    json_response(@service)
  end

  # POST /busines/:busine_id/services
  def create
    @busine.services.create!(service_params)
    json_response(@busine, :created)
  end

  # PUT /busines/:busine_id/services/:id
  def update
    @service.update(service_params)
    head :no_content
  end

  # DELETE /busines/:busine_id/services/:id
  def destroy
    @service.destroy
    head :no_content
  end

  private

  def service_params
    params.permit(:title, :aproximate_price, :description, :top_people, :min_people)
  end

  def set_busine
    @busine = Busine.find(params[:busine_id])
  end

  def set_busine_service
    @service = @busine.services.find_by!(id: params[:id]) if @busine
  end
end
