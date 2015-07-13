class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :name
      t.string :email
      t.string :password_hash
      t.string :skill_paragraph

      t.timestamps

    end
  end
end
