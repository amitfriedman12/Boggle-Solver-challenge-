module BoggleArray
	# Returns a Set of all substrings in the matrix
	def all_matrix_substrings
		sbstrngs = Set.new
		for i in 0..3
			for j in 0..3
				# For each index position in the matrix (i,j)
				# we have 8 directions we can travel in given by m and n
				for m in (-1)..1
					for n in (-1)..1
						unless (m == 0 ) && (n == 0)
							strng = self[i][j] # This is our starting letter, we will advance in all 8 directions
							# in order to get every possible substring, originating in the (i,j) index
							row_index = i
							col_index = j
							self.direction(sbstrngs, row_index, col_index, strng, m, n)
						end
					end
				end
			end
		end
		return sbstrngs
	end

	# Finds all substrings found, starting at a particular position in the matrix
	# and going in a particular diredtion, and adds them to the sbstrngs variable
	def direction(sbstrngs, row_index, col_index, strng, row_dir, col_dir)
		#Check we have't stepped outside borders of the array
		if ((row_index + row_dir) >= 0) && ((row_index + row_dir) <= 3) &&((col_index + col_dir)>=0) && ((col_index + col_dir)<= 3 )
			strng << self[row_index + row_dir][col_index + col_dir] # Add next letter
			sbstrngs << strng.upcase

			#Advance to next indices
			row_index += row_dir
			col_index += col_dir
			self.direction(sbstrngs, row_index, col_index, strng, row_dir, col_dir)			
		else
			return
		end
		return sbstrngs
	end	


	#Finds all dictionary word matches in the given matrix
	def find_dictionary_matches(dictionary_hash, two_letter_words=true)
		matches = []
		self.all_matrix_substrings.each do |sbstrng|
			if dictionary_hash[sbstrng]
				if (two_letter_words) || (sbstrng.length >= 3)
					matches << sbstrng
				end
			end
		end
		return matches	
	end
end