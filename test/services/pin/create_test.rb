require 'test_helper'

class Pin::CreateTest < ActiveSupport::TestCase
  def setup
    user = create_user
    @api_key = user.api_key
    @pin_params = attributes_for(:pin)

    stub_create_api_request
  end

  test 'create' do
    params = @pin_params.merge(api_key: @api_key)

    service = Pin::Create.call(params)

    assert_equal true, service.success?
  end

  test 'status should be 200' do
    params = @pin_params.merge(api_key: @api_key)

    service = Pin::Create.call(params)

    assert_equal 200, service.status
  end

  test 'status should be 403 if api_key invalid' do
    params = @pin_params.merge(api_key: generate(:string))

    service = Pin::Create.call(params)

    assert_equal false, service.success?
    assert_equal 403, service.status
  end
end
