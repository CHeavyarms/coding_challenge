class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.float :value
      t.string :scale_to
	  t.string :scale_from
      t.timestamps
    end
  end
end
