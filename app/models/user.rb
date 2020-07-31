class User < ActiveRecord::Base
  module Providers
    GOOGLE = 'google_oauth2'
  end

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         # :trackable,
         :validatable,
         :omniauthable, :omniauth_providers => [Providers::GOOGLE]

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
end