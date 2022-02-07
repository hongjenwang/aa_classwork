class User < ApplicationRecord
    validates :session_token, uniqueness: true, presence: true

    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password) 
        @password = password
        password_digest = BCrypt::Password.create(password)
    end

    def self.find_by_credentials(user_name, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end
        
end
