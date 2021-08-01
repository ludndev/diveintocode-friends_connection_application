class User < ApplicationRecord
  has_secure_password

  validates :firstname, presence: true, allow_blank: false, allow_nil: false
  validates :lastname, presence: true, allow_blank: false, allow_nil: false
  validates :username, presence: true, allow_blank: false, allow_nil: false, uniqueness: { case_sensitive: false }
end
