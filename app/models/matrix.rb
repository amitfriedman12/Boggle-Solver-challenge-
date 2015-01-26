class Matrix < ActiveRecord::Base
	validates_presence_of :row1, :row2, :row3, :row4
	validates :row1, :row2, :row3, :row4, length: { is: 4 }
	validates :row1, :row2, :row3, :row4, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

	before_save :prepare_rows


	def to_array
		[row1, row2, row3, row4]
	end

	private

	def prepare_rows 
		self.row1 = self.row1.upcase.strip
		self.row2 = self.row2.upcase.strip
		self.row3 = self.row3.upcase.strip
		self.row4 = self.row4.upcase.strip
	end
end
