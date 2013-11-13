class User < ActiveRecord::Base
  # Include devise modules
  devise :trackable, :omniauthable, omniauth_providers: [:github]

  # Use Emotions
  acts_as_emotional

  include ::GithubConnectReady
  include ::RolePlayer

  # Associations
  has_many :posts
  has_many :comments, as: :commenter

  # Validations
  validates :username, presence: true

  # Contants
  ROLES = %w{moderator presentator}

  # Fake :id for path/url helpers, eg. app_user_path(user)
  def to_param
    username
  end
end
