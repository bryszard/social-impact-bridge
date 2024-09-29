class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :impact_on
      t.decimal :budget
      t.string :area_of_activity
      t.integer :status
      t.references :nonprofit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
