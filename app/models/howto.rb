class Howto < ActiveRecord::Base
  has_many :steps
  validates :content, presence: true
end
