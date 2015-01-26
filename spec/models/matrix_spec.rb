require 'rails_helper'

describe Matrix do
  let(:matrix) {Matrix.new(row2: "abcd", row3: "abcd", row4:"abcd")}

  it "is invalid without row1" do
  	expect(matrix).to_not be_valid
  end

  it "is invalid if row1 doesn't have length 4" do
  	matrix.row1 = "abcde"
  	expect(matrix).to_not be_valid, "row1 presencce should be be required"
  end

   it "is invalid if row1 doesn't only have letters" do
  	matrix.row1 = "abc4"
  	expect(matrix).to_not be_valid, "row1 presencce should be be required"
  end   
end
