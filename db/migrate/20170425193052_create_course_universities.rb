class CreateCourseUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :course_universities do |t|
    	t.references :course, foreign_key: true
    	t.references :university, foreign_key: true
      t.timestamps
    end
  end
end
