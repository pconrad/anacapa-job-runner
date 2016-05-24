class CreatePendingJobs < ActiveRecord::Migration
  def change
    create_table :pending_jobs do |t|
      t.string :course
      t.string :assignment
      t.string :username
      t.datetime :time_queued
      t.string :current_stage
      t.datetime :current_stage_started

      t.timestamps null: false
    end
  end
end
