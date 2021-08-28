logfile = File.open(Rails.root.join('log/order_task_logger.log'), 'a') # create log file
logfile.sync = true # automatically flushes data to file
TASKS_LOGGER = Logger.new(logfile) # constant accessible anywhere
TASKS_LOGGER.level = Rails.env.development? ? Logger::DEBUG : Logger::WARN
