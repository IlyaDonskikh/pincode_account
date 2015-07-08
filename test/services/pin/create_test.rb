require 'test_helper'

class Pin::CreateTest < ActiveSupport::TestCase
  def setup
    user = create_user
    @api_key = user.api_key
    @pin_params = attributes_for(:pin)

    stub_create_request
  end

  test 'create' do
    params = @pin_params.merge(api_key: @api_key)

    service = Pin::Create.call(params)

    assert_equal service.success?, true
  end

  test 'status should be 200' do
    params = @pin_params.merge(api_key: @api_key)

    service = Pin::Create.call(params)

    assert_equal service.status, 200
  end

  private

    def create_user
      email = generate(:email)

      service = User::Create.call(email: email)

      service.user
    end

    def stub_create_request
      stub_request(:post, "http://localhost:9292/v1/pins/").to_return(
        status: 200
      )
    end
end
