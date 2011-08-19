class RemoveColumnFromProvisions < ActiveRecord::Migration
  def change
    remove_column :provisions, :effect_date
    add_column :provisions, :date_of_effect, :datetime
  end
end
