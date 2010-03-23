class CreateNavigations < ActiveRecord::Migration
  def self.up
    create_table :navigations do |t|
      t.string :name
      t.timestamps
    end
    
    add_column :pages, :navigation_id, :integer
  end

  def self.down
    drop_table :navigations
    remove_column :pages, :navigation_id
  end
end
