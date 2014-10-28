class Step < ActiveRecord::Base
  belongs_to :howto
  validates :name, presence: true
end
