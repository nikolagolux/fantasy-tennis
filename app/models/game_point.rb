class GamePoint < ApplicationRecord
  belongs_to :gem
  belongs_to :set
  belongs_to :match
end
