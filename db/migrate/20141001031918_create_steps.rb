class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :content
      t.integer :howto_id

      t.timestamps
    end
  end
end
