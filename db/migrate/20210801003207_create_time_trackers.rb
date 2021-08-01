class CreateTimeTrackers < ActiveRecord::Migration[6.1]
  def change
    create_table :time_trackers do |t|
      t.string :topic, null: false
      t.numeric :rate_per_hour
      t.datetime :started_at, null: false
      t.datetime :ended_at
      t.string :status, null: false

      t.timestamps
    end
  end
end
