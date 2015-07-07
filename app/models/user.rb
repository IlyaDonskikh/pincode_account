class User < ActiveRecord::Base
  ## Var
  ROLES = %w(admin)

  ## Etc.
  def self.encrypt_password(pwd)
    Digest::SHA2.hexdigest(pwd)
  end
end
