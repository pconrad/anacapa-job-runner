require 'rails_helper'

RSpec.describe EFinishJob do
  # it { is_expected.to be_processed_in :my_queue }
  # it { is_expected.to be_retryable 5 }
  # it { is_expected.to be_unique }
  # it { is_expected.to be_expired_in 1.hour }

  # it 'enqueues another awesome job' do
  #   subject.perform

  #   expect(AnotherAwesomeJob).to have_enqueued_job('Awesome', true)
  # end

  it 'deletes the pending job passed in' do
    course = "CS 56"
    assignment = "lab00"
    username = "foobar"
    time = Time.now
    @pending_job = PendingJob.new(course: course, assignment: assignment, username: username, time_queued: time, current_stage: "E", current_stage_started: time)
    @pending_job.save
    # make sure it's there before perform
    PendingJob.exists?(@pending_job.id).should be true
    EFinishJob.new.perform(@pending_job.id, course, assignment, username)
    PendingJob.exists?(@pending_job.id).should be false
    # make sure it's gone afterwards
  end
end
