class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :last_name
      t.string :first_name
      t.string :department
      t.string :office_address
      t.string :email_address
      t.string :phone_number
      t.timestamps
    end
  end
end
