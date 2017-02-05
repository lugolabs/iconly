module Iconly
  class Project < ApplicationRecord
    include Concerns::Models::Project

    # belongs_to :user, class_name: 'User'
  end
end
