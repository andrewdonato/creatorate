class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|

      t.string :skill_word

      t.timestamps

    end
  end
end
