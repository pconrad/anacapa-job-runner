require 'rails_helper'

RSpec.describe "pending_jobs/index", type: :view do
  before(:each) do
    assign(:pending_jobs, [
      PendingJob.create!(
        :course => "Course",
        :assignment => "Assignment",
        :username => "Username",
        :current_stage => "Current Stage"
      ),
      PendingJob.create!(
        :course => "Course",
        :assignment => "Assignment",
        :username => "Username",
        :current_stage => "Current Stage"
      )
    ])
  end

  it "renders a list of pending_jobs" do
    render
    assert_select "tr>td", :text => "Course".to_s, :count => 2
    assert_select "tr>td", :text => "Assignment".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Current Stage".to_s, :count => 2
  end
end
