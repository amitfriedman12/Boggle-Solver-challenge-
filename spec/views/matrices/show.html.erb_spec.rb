require 'rails_helper'

RSpec.describe "matrices/show", :type => :view do
  before(:each) do
    @matrix = assign(:matrix, Matrix.create!(
      :row1 => "Row1",
      :row2 => "Row2",
      :row3 => "Row3",
      :row4 => "Row4"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Row1/)
    expect(rendered).to match(/Row2/)
    expect(rendered).to match(/Row3/)
    expect(rendered).to match(/Row4/)
  end
end
