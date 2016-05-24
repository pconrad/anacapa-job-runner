json.array!(@pending_jobs) do |pending_job|
  json.extract! pending_job, :id, :course, :assignment, :username, :time_queued, :current_stage, :current_stage_started
  json.url pending_job_url(pending_job, format: :json)
end
