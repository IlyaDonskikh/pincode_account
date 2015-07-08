class Api::V1::PinsController < Api::V1::ApplicationController
  def create
    render nothing: true, status: 200
  end

  def check
    render nothing: true, status: 200
  end
end
