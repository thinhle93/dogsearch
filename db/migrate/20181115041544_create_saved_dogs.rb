class CreateSavedDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_dogs do |t|
      t.string :name
      t.string :api_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
