require 'rails_helper'

RSpec.describe "pending_jobs/index", type: :view do
  before(:each) do
    @time1 = Time.now
    assign(:pending_jobs, [
      PendingJob.create!(
        :course => "Course",
        :assignment => "Assignment",
        :username => "Username",
        :time_queued => @time1,
        :current_stage => "Current Stage",
        :current_stage_started => @time1
      ),
      PendingJob.create!(
        :course => "Course",
        :assignment => "Assignment",
        :username => "Username",
        :time_queued => @time1,
        :current_stage => "Current Stage",
        :current_stage_started => @time1
      )
    ])
  end

  it "renders a list of pending_jobs" do
    render
    assert_select "tr>td", :text => "Course".to_s, :count => 2
    assert_select "tr>td", :text => "Assignment".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => @time1.to_s, :count => 4
    assert_select "tr>td", :text => "Current Stage".to_s, :count => 2
  end
end
