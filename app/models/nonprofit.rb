class Nonprofit < ApplicationRecord
  has_many :projects, dependent: :destroy
end
