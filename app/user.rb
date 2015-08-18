class User < ActiveRecord::Base
  validates :username, :password, presence: true
  validates :username, uniqueness: true

  def log_out
    update_attributes(auth_token: nil)
  end

  def token_valid?(token)
    return false unless auth_token

    token == auth_token
  end

  def generate_token!
    token = SecureRandom.hex
    update_attributes(auth_token: token)
    token
  end
end
