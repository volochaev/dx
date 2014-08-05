module DX
  module API
    class UsersController < DX::App
      respond_to :json

      get '/show' do
        respond_with :json, current_user.as_json || {}
      end

      post '/create' do
        @user = User.new(params[:user].slice('name', 'email', 'password'))

        if @user.valid?
          @user.save and warden.session_serializer.store(@user, :user)

          respond_with :json, {
            info: 'Registered',
            success: true,
            user: current_user
          }
        else
          respond_with :json, {
            info: 'Registration error',
            success: false,
            errors: @user.errors.messages
          }
        end
      end
    end
  end
end
