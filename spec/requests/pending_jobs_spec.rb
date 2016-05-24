require 'rails_helper'

RSpec.describe "PendingJobs", type: :request do
  describe "GET /pending_jobs" do
    it "works! (now write some real specs)" do
      get pending_jobs_path
      expect(response).to have_http_status(200)
    end
  end
end
