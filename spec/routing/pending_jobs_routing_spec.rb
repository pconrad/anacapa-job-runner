require "rails_helper"

RSpec.describe PendingJobsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pending_jobs").to route_to("pending_jobs#index")
    end

    it "routes to #new" do
      expect(:get => "/pending_jobs/new").to route_to("pending_jobs#new")
    end

    it "routes to #show" do
      expect(:get => "/pending_jobs/1").to route_to("pending_jobs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pending_jobs/1/edit").to route_to("pending_jobs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pending_jobs").to route_to("pending_jobs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pending_jobs/1").to route_to("pending_jobs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pending_jobs/1").to route_to("pending_jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pending_jobs/1").to route_to("pending_jobs#destroy", :id => "1")
    end

  end
end
