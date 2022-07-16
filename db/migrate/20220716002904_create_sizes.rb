class CreateSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :sizes do |t|
      t.string :label, null: false

      t.timestamps
    end
  end
end
