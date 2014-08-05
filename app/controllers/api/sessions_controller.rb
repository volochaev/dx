module DX
  module API
    class SessionsController < DX::App
      respond_to :json

      post '/new' do
        warden.authenticate!(:password)
        # executes only if successfully authorized
        status 200
        respond_with :json, {
          info: 'Authorized',
          success: true,
          user: current_user
        }
      end

      post '/unauthenticated' do
        status 401

        respond_with :json, {
          info: 'Unauthorized',
          success: false,
          messages: warden.message
        }
      end
    end
  end
end
