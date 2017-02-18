class Users::SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate(auth_options)
    if !resource
      @errors = [t(:invalid_login)]
      render :error, status: :unprocessable_entity
      return
    end
    sign_in(resource_name, resource)
    render status: :ok
  end

end
