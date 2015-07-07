class User < ActiveRecord::Base
  attr_accessor :temp_password

  ## Var
  ROLES = %w(admin)
end
