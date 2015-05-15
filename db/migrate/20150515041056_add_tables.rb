class AddTables < ActiveRecord::Migration
  def change
    create_table(:movies) do |t|
      t.column(:name, :string)
      
      t.timestamps
    end
    create_table(:actors) do |t|
      t.column(:name, :string)
      
      t.timestamps
    end
    create_table(:actors_movies) do |t|
      t.belongs_to(:actor)
      t.belongs_to(:movie)
    end
  end
end
