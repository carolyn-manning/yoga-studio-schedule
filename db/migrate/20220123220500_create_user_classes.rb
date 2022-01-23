class CreateUserClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_classes do |t|
      t.integer :user_id
      t.integer :yoga_class_id

      t.timestamps
    end
  end
end
