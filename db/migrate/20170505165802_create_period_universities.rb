class CreatePeriodUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :period_universities do |t|
      t.references :period, foreign_key: true
      t.references :university, foreign_key: true
      t.timestamps
    end
  end
end
