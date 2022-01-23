class CreateYogaClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :yoga_classes do |t|
      t.date :date
      t.time :time
      t.string :style
      t.integer :teacher_id
      t.intger :studio_id

      t.timestamps
    end
  end
end
