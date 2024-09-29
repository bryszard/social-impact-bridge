class Project < ApplicationRecord
  belongs_to :nonprofit

  enum :status, { planned: 0, ongoing: 1, finished: 2 }
end
