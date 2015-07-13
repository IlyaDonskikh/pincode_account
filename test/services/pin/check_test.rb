require 'test_helper'

class Pin::CheckTest < ActiveSupport::TestCase
  def setup
    @user = create_user

    @params = generate_check_api_params

    stub_check_api_request(@params[:id])
  end

  test 'check' do
    service = Pin::Check.call(@params)

    assert_equal true, service.success?
  end

  test 'check status should be 200' do
    service = Pin::Check.call(@params)

    assert_equal 200, service.status
  end

  test 'check failed if api key invalid' do
    params = @params.merge(api_key: generate(:string))

    service = Pin::Check.call(params)

    assert_equal false, service.success?
  end
end
