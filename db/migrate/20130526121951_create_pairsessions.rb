class CreatePairsessions < ActiveRecord::Migration
  def change
    create_table :pairsessions do |t|

      t.timestamps
    end
  end
end
