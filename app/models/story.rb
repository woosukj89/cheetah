class Story < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :tags
end
