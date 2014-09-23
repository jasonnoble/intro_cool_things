class CreateInterestingThings < ActiveRecord::Migration
  def change
    create_table :interesting_things do |t|
      t.string :name
      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
