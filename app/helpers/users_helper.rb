module DX
  module UsersHelper
    def warden
      env['warden']
    end

    def current_user
      warden.user
    end

    def signed_in?
      current_user.present?
    end
  end
end
