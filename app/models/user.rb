class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[twitter]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
        user.uid = data["uid"] if user.uid.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create
  end
end
