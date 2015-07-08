class Pin::Create < Service::Base
  attr_accessor :status

  ## Etc.
  def initialize(attrs)
    @attrs = attrs
    @id = attrs[:id]
    @api_key = attrs[:api_key]
    @app_key = Rails.application.config.pincode_app_key
    @app_url = Rails.application.config.pincode_app_url

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
      url = "#{@app_url}/pins/"

      RestClient.post(url, params)
    end

    def make_request_params
      id = "#{@api_key}:#{@id}"

      @attrs.merge(id: id, app_key: @app_key)
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
      user = User.where(api_key: @api_key)

      return if user

      errors.add('api_key', 'invilid')
    end
end
