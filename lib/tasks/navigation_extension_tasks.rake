namespace :radiant do
  namespace :extensions do
    namespace :navigation do
      
      desc "Runs the migration of the Navigation extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          NavigationExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          NavigationExtension.migrator.migrate
        end
      end
      
      task :update => :environment do
        puts "nothing to do"
      end
    
    end
  end
end