class TimeTrackersController < ApplicationController
  before_action :set_time_tracker, only: %i[show edit update destroy]

  # GET /time_trackers or /time_trackers.json
  def index
    start = Time.current
    @time_trackers = TimeTracker.all.reverse

    @time_tracker = TimeTracker.new

    Rails.logger.debug "The index method took #{Time.current - start}"

    ::TASKS_LOGGER.debug "We did it! Awesome!"
  end

  # GET /time_trackers/1 or /time_trackers/1.json
  def show; end

  # GET /time_trackers/new
  def new
    @time_tracker = TimeTracker.new
  end

  # GET /time_trackers/1/edit
  def edit; end

  # POST /time_trackers or /time_trackers.json
  def create
    @time_tracker = TimeTracker.new({ started_at: Time.current, status: 'running' }.merge(time_tracker_params))

    respond_to do |format|
      if @time_tracker.save
        format.html { redirect_to @time_tracker, notice: 'Time tracker was successfully created.' }
        format.json { render :show, status: :created, location: @time_tracker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @time_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_trackers/1 or /time_trackers/1.json
  def update
    respond_to do |format|
      if @time_tracker.update(time_tracker_params)
        format.html { redirect_to @time_tracker, notice: 'Time tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_tracker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @time_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_trackers/1 or /time_trackers/1.json
  def destroy
    @time_tracker.destroy
    respond_to do |format|
      format.html { redirect_to time_trackers_url, notice: 'Time tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_time_tracker
    @time_tracker = TimeTracker.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def time_tracker_params
    params.require(:time_tracker).permit(:topic, :rate_per_hour, :started_at, :ended_at, :status)
  end
end
