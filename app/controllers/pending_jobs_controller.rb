class PendingJobsController < ApplicationController
  before_action :set_pending_job, only: [:show, :edit, :update, :destroy]

  # GET /pending_jobs
  # GET /pending_jobs.json
  def index
    @pending_jobs = PendingJob.all
  end

  # GET /pending_jobs/1
  # GET /pending_jobs/1.json
  def show
  end

  # GET /pending_jobs/new
  def new
    @pending_job = PendingJob.new
  end

  # GET /pending_jobs/1/edit
  def edit
  end

  # POST /pending_jobs
  # POST /pending_jobs.json
  def create
    @pending_job = PendingJob.new(pending_job_params)
    current_stage = 'E'
    @pending_job.time_queued = Time.now
    @pending_job.current_stage = current_stage
    @pending_job.current_stage_started = Time.now

    respond_to do |format|
      if @pending_job.save
        EFinishJob.perform_in(1.minutes, @pending_job.id, @pending_job.course, @pending_job.assignment, @pending_job.username)
        format.html { redirect_to @pending_job, notice: 'Pending job was successfully created.' }
        format.json { render :show, status: :created, location: @pending_job }
      else
        format.html { render :new }
        format.json { render json: @pending_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pending_jobs/1
  # PATCH/PUT /pending_jobs/1.json
  def update
    respond_to do |format|
      if @pending_job.update(pending_job_params)
        format.html { redirect_to @pending_job, notice: 'Pending job was successfully updated.' }
        format.json { render :show, status: :ok, location: @pending_job }
      else
        format.html { render :edit }
        format.json { render json: @pending_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_jobs/1
  # DELETE /pending_jobs/1.json
  def destroy
    @pending_job.destroy
    respond_to do |format|
      format.html { redirect_to pending_jobs_url, notice: 'Pending job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending_job
      @pending_job = PendingJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pending_job_params
      params.require(:pending_job).permit(:course, :assignment, :username)
    end
end
