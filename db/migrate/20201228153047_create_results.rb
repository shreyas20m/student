class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :mark
      t.references :student_detail, null: false, foreign_key: true
      t.string :sem_id
      t.string :sub_id

      t.timestamps
    end
  end
end
