class PasswordsController < ApplicationController
  protect_from_forgery with: :null_session
  include MailHelper

  def forgot
    if params[:email].blank? # check if email is present
      return render json: {error: 'Email not present'}
    end

    user = User.find_by(email: params[:email]) # if present find user by email

    if user.present?
      # user.set_reset_password_token() #generate pass token
      user.send_reset_password_instructions
      # SEND EMAIL HERE
      send_mail user
      # render json: {status: 'ok'}, status: :ok
      redirect_to new_user_session_url
    else
      # render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
      redirect_to new_user_session_url
    end
  end

  def reset
    token = params[:token].to_s

    user = User.find_by(reset_password_token: token)
    if user.present? && user.reset_password_period_valid?
      if user.reset_password(params[:password], params[:password_confirmation])
        sign_in(user)
        redirect_to home_url
      else
        redirect_to new_user_session_url
        # render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_url
      # render json: {error:  user.reset_password_period_valid?}, status: :not_found
    end
  end

  def send_mail user
    reset_password user
  end

  def reset_new_password
    @token = params[:token].to_s
  end
end
