class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_many :tracks
    has_many :lessons, through: :tracks
end
