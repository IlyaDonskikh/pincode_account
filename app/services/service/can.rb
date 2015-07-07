class Service::Can < Service::Base
  ## Etc.
  def initialize(action_name, object, *params)
    @action_name = action_name
    @object = object
    @params = params

    super
  end

  def call
    valid?

    self
  end

  def init_error(text = 'error')
    errors.add('error', text)
  end

  private

    def verify
      send(@action_name + '?')
    end
end
