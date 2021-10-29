class V2::BusinesController < ApplicationController
  def index
    json_response({ message: 'Hello there'})
  end
end
