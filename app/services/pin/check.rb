class Pin::Check < Service::Base
  attr_accessor :status

  ## Etc.
  def initialize(attrs)
    @id = attrs[:id]
    @code = attrs[:code]
    @api_key = attrs[:api_key]
    @app_key = Rails.application.config.pincode_app_key
    @app_url = Rails.application.config.pincode_app_url

    @status = 403

    super
  end

  def call
    if valid?
      response = make_request
      self.status = response.code
    end

    self
  end

  private

    def make_request
      params = make_request_params
      url = "#{@app_url}/pins/#{@id}/check"

      RestClient.get(url, params)
    end

    def make_request_params
      { code: @code, app_key: @app_key }
    end

    def verify
      check_id
      check_api_key
    end

    def check_id
      return if @id && @id.length < 360

      errors.add('id', 'invilid or undifined')
    end

    def check_api_key
      user = User.find_by(api_key: @api_key)

      return if user

      errors.add('api_key', 'invilid')
    end
end
