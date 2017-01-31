module Iconly
  class Project < ApplicationRecord
    belongs_to :user, class_name: 'User'
  end
end
