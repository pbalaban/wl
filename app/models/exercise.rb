class Exercise < ActiveRecord::Base
  VALUES_TYPES = [['Times', 0], ['Kg', 1]]
  belongs_to :place
end
