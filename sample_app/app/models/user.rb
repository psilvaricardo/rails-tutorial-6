class User < ApplicationRecord

    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }

=begin
    To help understand where this comes from, we break it into pieces:

    /               start of regex
    \A              match start of a string
    [\w+\-.]+       at least one word character, plus, hyphen, or dot
    @               literal “at sign”
    [a-z\d\-.]+     at least one letter, digit, hyphen, or dot
    \.              literal dot
    [a-z]+          at least one letter
    \z              match end of a string
    /               nend of regex
    i               case-insensitive
=end
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: true
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
end
