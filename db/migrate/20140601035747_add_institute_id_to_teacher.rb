class AddInstituteIdToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :institute_id, :integer
  end
end
