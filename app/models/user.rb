class User < ApplicationRecord
  validates :name, :username, :email, presence: true

  def self.from_omniauth(auth)
    where(username: auth.info.nickname).first_or_initialize do |user|
      puts auth.info
      user.name = auth.info.name
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.access_token = auth.credentials.access_token
      user.refresh_token = auth.credentials.refresh_token
    end
  end

end
