require 'rails_helper'

RSpec.describe "matrices/index", :type => :view do
  before(:each) do
    assign(:matrices, [
      Matrix.create!(
        :row1 => "Row1",
        :row2 => "Row2",
        :row3 => "Row3",
        :row4 => "Row4"
      ),
      Matrix.create!(
        :row1 => "Row1",
        :row2 => "Row2",
        :row3 => "Row3",
        :row4 => "Row4"
      )
    ])
  end

  it "renders a list of matrices" do
    render
    assert_select "tr>td", :text => "Row1".to_s, :count => 2
    assert_select "tr>td", :text => "Row2".to_s, :count => 2
    assert_select "tr>td", :text => "Row3".to_s, :count => 2
    assert_select "tr>td", :text => "Row4".to_s, :count => 2
  end
end
