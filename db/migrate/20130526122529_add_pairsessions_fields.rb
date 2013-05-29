class AddPairsessionsFields < ActiveRecord::Migration
  def change
    add_column :pairsessions, :note, :text
    add_column :pairsessions, :technologies, :string
    add_column :pairsessions, :date, :date
    add_column :pairsessions, :start_time, :time
    add_column :pairsessions, :end_time, :time
    add_column :pairsessions, :user_id, :integer
  end
end
