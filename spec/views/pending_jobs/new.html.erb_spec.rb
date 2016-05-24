require 'rails_helper'

RSpec.describe "pending_jobs/new", type: :view do
  before(:each) do
    assign(:pending_job, PendingJob.new(
      :course => "MyString",
      :assignment => "MyString",
      :username => "MyString",
    ))
  end

  it "renders new pending_job form" do
    render

    assert_select "form[action=?][method=?]", pending_jobs_path, "post" do

      assert_select "input#pending_job_course[name=?]", "pending_job[course]"

      assert_select "input#pending_job_assignment[name=?]", "pending_job[assignment]"

      assert_select "input#pending_job_username[name=?]", "pending_job[username]"

    end
  end
end
