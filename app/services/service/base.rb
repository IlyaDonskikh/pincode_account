class Service::Base
  include Service::Validations

  attr_accessor :success
  attr_reader :errors

  def self.call(*args)
    new(*args).call
  end

  def initialize(*)
    @errors = Service::Errors.new
    @success = false
  end

  def success?
    success == true ? true : false
  end

  private

    def valid?
      verify
      self.success = true unless errors.exists?

      success?
    end

    def verify
      true
    end
end
