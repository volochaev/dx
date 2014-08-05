module AuthService
  class SocialNetworks

  end

  class Model
    class << self
      @@settings = DX::App.settings.auth

      def generate_password(password)
        ::BCrypt::Password.create("#{password}#{@@settings[:pepper]}", cost: @@settings[:stretches]).to_s
      end

      def secure_compare(a, b)
        return false if a.blank? || b.blank? || a.bytesize != b.bytesize
        l = a.unpack "C#{a.bytesize}"

        res = 0
        b.each_byte { |byte| res |= byte ^ l.shift }
        res == 0
      end
    end
  end
end
