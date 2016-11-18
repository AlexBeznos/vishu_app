class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :request_number
      t.string :sequence_number
      t.string :request_type
      t.string :request_action
      t.jsonb :service_area
      t.jsonb :excavator
      t.string :well_known_text

      t.timestamps null: false
    end

    add_index :requests, :request_number
    add_index :requests, :request_type
    add_index :requests, :request_action
  end
end
