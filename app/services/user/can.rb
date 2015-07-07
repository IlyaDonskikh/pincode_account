class User::Can < Service::Can
  private

    def signout?
      return if @object

      init_error
    end
end
