json.extract! time_tracker, :id, :topic, :rate_per_hour, :started_at, :ended_at, :status, :created_at, :updated_at
json.url time_tracker_url(time_tracker, format: :json)
