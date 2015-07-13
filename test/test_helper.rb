ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'webmock/minitest'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  private

    def stub_create_api_request
      url = Rails.application.config.pincode_app_url

      stub_request(:post, "#{url}/pins/").to_return(
        status: 200
      )
    end

    def stub_create_fail_api_request
      url = Rails.application.config.pincode_app_url

      stub_request(:post, "#{url}/pins/").to_return(status: 403)
    end

    def stub_check_api_request(id)
      url = Rails.application.config.pincode_app_url

      stub_request(:get, "#{url}/pins/#{id}/check").to_return(
        status: 200
      )
    end

    def generate_check_api_params
      api_key = @user.api_key
      id = generate(:string)
      code = generate(:string)

      { api_key: api_key, id: id, code: code }
    end

    def create_user
      email = generate(:email)

      service = User::Create.call(email: email)

      service.user
    end
end
