class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.integer :creator_id
      t.string :name
      t.string :timeframe
      t.string :finances
      t.string :description
      t.string :needs

      t.timestamps

    end
  end
end
