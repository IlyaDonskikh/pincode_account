require 'test_helper'

class Api::V1::PinsControllerTest < ActionController::TestCase
  def setup
    @user = create_user
  end

  test 'create' do
    stub_create_api_request

    post :create, pin_params

    assert_equal 200, response.status
  end

  test 'check' do
    get :check, id: 2

    assert_equal 200, response.status
  end

  private

    def pin_params
      api_key = @user.api_key
      pin_params = attributes_for(:pin)

      pin_params.merge(api_key: @api_key)
    end
end
