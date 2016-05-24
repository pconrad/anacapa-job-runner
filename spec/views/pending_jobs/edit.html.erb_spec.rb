require 'rails_helper'

RSpec.describe "pending_jobs/edit", type: :view do
  before(:each) do
    @pending_job = assign(:pending_job, PendingJob.create!(
      :course => "MyString",
      :assignment => "MyString",
      :username => "MyString",
      :current_stage => "MyString"
    ))
  end

  it "renders the edit pending_job form" do
    render

    assert_select "form[action=?][method=?]", pending_job_path(@pending_job), "post" do

      assert_select "input#pending_job_course[name=?]", "pending_job[course]"

      assert_select "input#pending_job_assignment[name=?]", "pending_job[assignment]"

      assert_select "input#pending_job_username[name=?]", "pending_job[username]"

      assert_select "input#pending_job_current_stage[name=?]", "pending_job[current_stage]"
    end
  end
end
