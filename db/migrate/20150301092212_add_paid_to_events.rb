class AddPaidToEvents < ActiveRecord::Migration
  def change
    add_column :events, :amount, :integer, array: true
  end
end
