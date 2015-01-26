require 'rails_helper'

RSpec.describe "matrices/edit", :type => :view do
  before(:each) do
    @matrix = assign(:matrix, Matrix.create!(
      :row1 => "MyString",
      :row2 => "MyString",
      :row3 => "MyString",
      :row4 => "MyString"
    ))
  end

  it "renders the edit matrix form" do
    render

    assert_select "form[action=?][method=?]", matrix_path(@matrix), "post" do

      assert_select "input#matrix_row1[name=?]", "matrix[row1]"

      assert_select "input#matrix_row2[name=?]", "matrix[row2]"

      assert_select "input#matrix_row3[name=?]", "matrix[row3]"

      assert_select "input#matrix_row4[name=?]", "matrix[row4]"
    end
  end
end
