class CreateNonprofits < ActiveRecord::Migration[7.2]
  def change
    create_table :nonprofits do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :area_of_activity
      t.string :operating_in
      t.string :desired_impact_on
      t.decimal :income

      t.timestamps
    end
  end
end
