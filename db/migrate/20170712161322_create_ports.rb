class CreatePorts < ActiveRecord::Migration[5.1]
  def change
    create_table :ports do |t|
      t.string :location

      t.timestamps
    end
  end
end

# < ======= location ======= >
