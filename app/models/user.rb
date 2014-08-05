class User < ::ActiveRecord::Base
  mattr_accessor :case_insensitive_keys
  @@case_insensitive_keys = [ :email ]

  attr_reader   :password, :current_password
  attr_accessor :password_confirmation

  validates_presence_of   :email, :name
  validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  validates_format_of     :email, with: DX::App.settings.auth[:email_regexp], allow_blank: true, if: :email_changed?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, within: 6..20, allow_blank: true

  before_validation :downcase_keys
  before_validation :strip_whitespace

  def password=(new_password)
    @password = new_password
    self.encrypted_password = AuthService::Model.generate_password(@password) if @password.present?
  end

  def valid_password?(password)
    return false if encrypted_password.blank?
    bcrypt   = ::BCrypt::Password.new(encrypted_password)
    password = ::BCrypt::Engine.hash_secret("#{password}#{DX::App.settings.auth[:pepper]}", bcrypt.salt)
    AuthService::Model.secure_compare(password, encrypted_password)
  end

  def as_json(*args)
    {
      id: id,
      name: name,
      email: email
    }
  end

protected

  def authenticatable_salt
    encrypted_password[0,29] if encrypted_password
  end

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def downcase_keys
    @@case_insensitive_keys.each { |k| send("#{k}=", send(k).downcase) }
  end

  def strip_whitespace
    [:email, :password].each { |k| send("#{k}=", send(k).strip) }
  end
end
