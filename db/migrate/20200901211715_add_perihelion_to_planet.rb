class AddPerihelionToPlanet < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :perihelion, :integer
  end
end
