class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.text :description
      t.string :name
      t.references :author, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
