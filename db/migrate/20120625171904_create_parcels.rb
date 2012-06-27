class CreateParcels < ActiveRecord::Migration
  def self.up
    create_table :parcels do |t|
      t.string :title
      t.text :message
      t.datetime :schedule
      t.integer :category
      t.integer :status
      t.integer :user_id
      t.string :to
      t.string :from

      t.timestamps
    end
  end

  def self.down
    drop_table :parcels
  end
end
