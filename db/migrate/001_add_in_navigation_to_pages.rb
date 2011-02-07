class AddInNavigationToPages < ActiveRecord::Migration
  
  def self.up
    add_column :pages, :in_navigation, :boolean, :default => false
  end
  
  def self.down
    remove_column :pages, :in_navigation
    
  end
  
end