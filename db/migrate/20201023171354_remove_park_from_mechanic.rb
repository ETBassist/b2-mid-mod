class RemoveParkFromMechanic < ActiveRecord::Migration[5.2]
  def change
    remove_column :mechanics, :park_id
  end
end
