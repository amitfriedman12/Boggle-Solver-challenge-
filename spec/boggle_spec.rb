# For some reason the lib/core_ext/array.rb file
# is not automatically loaded in the rspec envrnmnt
require File.expand_path("lib/core_ext/array.rb")

describe "Matrix Array" do
	let(:matrix) { @matrix = ['abcd','efgh','ijkl','mnop']}
	let(:simple_matrix) { @matrix = ['aaaa','aaaa','aaaa','aaaa']}
	let(:dictionary) { {"abc" => true, "cgk" =>true , "ejo" => true } }
	let(:sbstrngs) { Set.new }

	it "responds to direction" do
		expect(matrix).to respond_to(:direction)
	end		

	context "#direction" do
		row_index = 0
		col_index = 0

		it "adds new substrings" do
			strng = matrix[row_index][col_index]
			expect{matrix.direction(sbstrngs, row_index, col_index, strng, 1, 1)}.to change{sbstrngs.count}
		end

		it "includes af, afk, afkp" do
			strng = matrix[row_index][col_index]
			matrix.direction(sbstrngs, row_index, col_index, strng, 1, 1)
			expect(sbstrngs).to include("af")
			expect(sbstrngs).to include("afk")
			expect(sbstrngs).to include("afkp")			
		end
	end

	it "responds to all_matrix_substrings" do
		expect(matrix).to respond_to(:all_matrix_substrings)
	end

	context "#all_matrix_substrings" do
		it "calls matrix.direction" do
			expect(simple_matrix).to receive(:direction).at_least(1).times
			simple_matrix.all_matrix_substrings
		end

		it "finds all possible substrings" do
			expect(simple_matrix.all_matrix_substrings).to include("aa")
			expect(simple_matrix.all_matrix_substrings).to include("aaa")
			expect(simple_matrix.all_matrix_substrings).to include("aaaa")			
			expect(matrix.all_matrix_substrings).to include("hkn")
		end
	end


	it "responds to find_dictionary_matches" do
		expect(matrix).to respond_to(:find_dictionary_matches)
	end

	context "#find_dictionary_matches" do
		it "calls matrix.all_matrix_substrings" do
			expect(simple_matrix).to receive(:all_matrix_substrings).and_return(Set.new ["aa","aaa","aaaa"])
			simple_matrix.find_dictionary_matches(dictionary)
		end

		it "finds matches in the dictionary" do
			matrix.stub(:all_matrix_substrings).and_return(Set.new ["abc","bbb","ccc"])

			expect(matrix.find_dictionary_matches(dictionary)).to include("abc")
		end		
	end	
	
end