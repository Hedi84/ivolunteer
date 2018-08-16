class AddPhotoToNotes < ActiveRecord::Migration[5.2]
  def change
     add_column :notes, :photo, :string
     add_column :notes, :time, :string
  end
end
