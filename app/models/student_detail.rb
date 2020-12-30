class StudentDetail < ApplicationRecord
	has_many :results
	validates :usn  presence: true
	before_create do
    self.usn = usn.capitalize
  end
end
