class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.string :duracao, default: ""

      t.timestamps
    end
  end
end
