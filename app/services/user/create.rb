class User::Create < Service::Base
  attr_accessor :user

  ## Etc.
  def initialize(attrs)
    @user = User.new(attrs)

    super
  end

  def call
    if valid?
      assign_password
      assign_api_key
      user.save
    end

    self
  end

  private

    def assign_password
      pwd = generate_password

      user.temp_password = pwd
      user.password = User.encrypt_password(pwd)
    end

    def generate_password
      Time.now.strftime('%H%M%m')
    end

    def assign_api_key
      user.api_key = generate_api_key
    end

    def generate_api_key
      loop do
        key = SecureRandom.hex
        break key unless User.find_by(api_key: key)
      end
    end

    def verify
      check_email
    end

    def check_email
      validation_presence(user, :email)
      validation_uniqueness(user, :email)
    end
end
