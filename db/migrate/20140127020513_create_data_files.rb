class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string :file_name
      t.float :total

      t.timestamps
    end
  end
end
