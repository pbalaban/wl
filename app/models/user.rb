class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Pagination
  paginates_per 100
  has_many :places

  # Validations
  with_options presence: true do |pt|
    pt.validates :first_name
    pt.validates :last_name
  end

  # Callbacks
  before_save :ensure_access_token

  class << self
    def paged(page_number)
      order(admin: :desc, email: :asc).page page_number
    end

    def search_and_order(search, page_number)
      (search ? where('email LIKE ?', "%#{search.downcase}%") : all).paged(page_number)
    end

    def last_signups(count)
      order(created_at: :desc).limit(count).select(:id, :email, :created_at)
    end

    def last_signins(count)
      order(last_sign_in_at: :desc).limit(count).select(:id, :email, :last_sign_in_at)
    end

    def users_count
      where(admin: false, locked: false).count
    end
  end

  private
    def ensure_access_token
      self.access_token ||= generate_access_token
    end

    def generate_access_token
      loop do
        token = Devise.friendly_token
        break token unless self.class.where(access_token: token).first
      end
    end
end
