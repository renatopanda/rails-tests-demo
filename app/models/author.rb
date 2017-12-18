class Author < ApplicationRecord
	has_many :articles

	def test
		return "#{self.name} (#{self.id})"
	end
end
