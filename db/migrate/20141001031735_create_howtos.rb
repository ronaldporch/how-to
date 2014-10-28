class CreateHowtos < ActiveRecord::Migration
  def change
    create_table :howtos do |t|
      t.string :content

      t.timestamps
    end
  end
end
