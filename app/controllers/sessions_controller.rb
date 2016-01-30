class SessionsController < ApplicationController
  def new
  end

  def oauth
    @student = Student.where(
                        email: omniauth_options[:email]
    ).first_or_initialize(omniauth_options)
    if @student.persisted?
      session[:id] = @student.id
      redirect_to root_path,
        notice: "Welcome back #{@student.name}"
    else
      render "sessions/new"
    end
  end

  private

  def omniauth_options
    if auth_hash = request.env['omniauth.auth']
      name = auth_hash[:info][:name]
      {
        email: auth_hash[:info][:email],
        name: name,
        omniauth: true
      }
    end
  end
end
