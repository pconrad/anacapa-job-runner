require 'rails_helper'

RSpec.describe "pending_jobs/show", type: :view do
  before(:each) do
    @pending_job = assign(:pending_job, PendingJob.create!(
      :course => "Course",
      :assignment => "Assignment",
      :username => "Username",
      :current_stage => "Current Stage"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Course/)
    expect(rendered).to match(/Assignment/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Current Stage/)
  end
end
