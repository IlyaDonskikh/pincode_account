require 'test_helper'

class Api::V1::PinsControllerTest < ActionController::TestCase
  def setup
    @user = create_user
  end

  test 'create' do
    stub_create_api_request

    post :create, pin_create_params

    assert_equal 200, response.status
  end

  test 'check' do
    params = generate_check_api_params

    stub_check_api_request(params[:id])

    get :check, params

    assert_equal 200, response.status
  end

  private

    def pin_create_params
      api_key = @user.api_key
      pin_params = attributes_for(:pin)

      pin_params.merge(api_key: api_key)
    end
end
