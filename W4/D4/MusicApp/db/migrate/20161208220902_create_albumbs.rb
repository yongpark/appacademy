class CreateAlbumbs < ActiveRecord::Migration[5.0]
  def change
    create_table :albumbs do |t|

      t.timestamps
    end
    drop_table :albumbs
  end
end
