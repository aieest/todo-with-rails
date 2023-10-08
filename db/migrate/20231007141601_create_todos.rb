class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :action
      t.string :description
      t.string :rating

      t.timestamps
    end
  end
end
