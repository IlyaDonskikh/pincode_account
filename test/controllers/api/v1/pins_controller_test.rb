require 'test_helper'

class Api::V1::PinsControllerTest < ActionController::TestCase
  test 'create' do
    post :create

    assert_equal 200, response.status
  end

  test 'check' do
    get :check, id: 2

    assert_equal 200, response.status
  end
end
