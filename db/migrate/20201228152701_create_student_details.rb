class CreateStudentDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :student_details do |t|
      t.string :name
      t.string :gender
      t.string :address
      t.string :usn

      t.timestamps
    end
  end
end
