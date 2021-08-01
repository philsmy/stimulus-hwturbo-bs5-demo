module TimeTrackersHelper
    def duration_display(time_tracker)
      duration = ActiveSupport::Duration.build(time_tracker.duration).parts

      format('%02d:%02d:%02d', (duration[:hours]||0), (duration[:minutes]||0), (duration[:seconds]||0))
    end
end
