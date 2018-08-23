class CreateOpportunities < ActiveRecord::Migration[5.2]
  def change
    create_table :opportunities do |t|
      t.string :photo
      t.text :description
      t.string :titel
      t.string :link

      t.timestamps
    end
  end
end
