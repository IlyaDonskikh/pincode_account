module Service
  module Validations
    def validation_presence(object, param)
      return if object[param].present?

      errors.add(param, 'required')
    end

    def validation_uniqueness(object, param, current_class = nil)
      current_class ||= object.class
      value = object[param]

      return if current_class.where(param => value).blank?

      errors.add(param, 'is not unique')
    end
  end
end
