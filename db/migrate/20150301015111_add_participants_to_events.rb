class AddParticipantsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :participants, :string, array: true, default: '{}'
  end
end
