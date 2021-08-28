class TimeTracker < ApplicationRecord
  broadcasts_to ->(time_tracker) { :time_trackers }, inserts_by: :prepend, target: 'time_trackers'

  validates :status, presence: true

  before_update :set_ended_at
  def set_ended_at
    self.ended_at = Time.current if status[/stopped/] && ended_at.nil?
  end

  def running?
    status[/running/]
  end

  def duration
    if running?
      (Time.current - started_at).to_i
    else
      (ended_at - started_at).to_i
    end
  end
end
