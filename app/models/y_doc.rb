class YDoc < ApplicationRecord
  belongs_to :record, polymorphic: true
end
