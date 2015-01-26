class CreateMatrices < ActiveRecord::Migration
  def change
    create_table :matrices do |t|
      t.string :row1
      t.string :row2
      t.string :row3
      t.string :row4

      t.timestamps
    end
  end
end
