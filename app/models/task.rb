class Task < ActiveRecord::Base
  belongs_to :story
  has_and_belongs_to_many :profiles
end
