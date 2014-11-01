module CommonApiScopes
  extend ActiveSupport::Concern

  included do
    scope :limit_with, ->(value) { limit(value.to_i) if value.to_i > 0 }
  end
end
