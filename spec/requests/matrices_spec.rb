require 'rails_helper'

RSpec.describe "Matrices", :type => :request do
  describe "GET /matrices" do
    it "works! (now write some real specs)" do
      get matrices_path
      expect(response).to have_http_status(200)
    end
  end
end
