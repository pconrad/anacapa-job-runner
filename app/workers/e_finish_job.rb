class EFinishJob
  include Sidekiq::Worker
  def perform(id, course, assignment, username)
    params_fields = "(course:#{course}, assignment:#{assignment}, username:#{username})"
    job = PendingJob.find(id)
    if job.course != course or job.assignment != assignment or job.username != username
        logger.error "Mismatched info for job #{job.id} : job = #{job.to_json}, expected #{params_fields}"
        return
    end
    logger.info "Completed job #{job.id} for #{params_fields}"
    job.destroy
  end
end