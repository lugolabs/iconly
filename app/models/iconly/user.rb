module Iconly
  class User < ApplicationRecord
    has_many :packages
    has_many :projects
  end
end
