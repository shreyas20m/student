class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :subject_code
      t.integer :sem_id
      t.references :semester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
