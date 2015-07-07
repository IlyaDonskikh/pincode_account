class User::Create < Service::Base
  attr_accessor :user

  ## Etc.
  def initialize(attrs)
    @user = User.new(attrs)

    super
  end

  def call
    if valid?
      assign_api_key
      assign_password
      user.save

      send_mail
    end

    self
  end

  private

    def assign_api_key
      user.api_key = generate_api_key
    end

    def assign_password
      user.password = User.encrypt_password(user.api_key)
    end

    def send_mail
      UserMailer.create(user).deliver_now
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
