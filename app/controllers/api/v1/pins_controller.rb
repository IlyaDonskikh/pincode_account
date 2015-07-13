class Api::V1::PinsController < Api::V1::ApplicationController
  def create
    service = Pin::Create.call(params)

    render nothing: true, status: service.status
  end

  def check
    render nothing: true, status: 200
  end
end
