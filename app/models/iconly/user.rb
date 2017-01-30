module Iconly
  class User < ApplicationRecord
    has_many :packages
  end
end
