class Friend < ApplicationRecord
  scope :exist, -> { where is_deleted: false }
end
