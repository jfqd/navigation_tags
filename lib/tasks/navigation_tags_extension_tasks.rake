namespace :radiant do
  namespace :extensions do
    namespace :navigation_tags do
      
      desc "Runs the migration of the Navigation-Tags extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          NavigationTagsExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          NavigationTagsExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Navigation-Tags to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[NavigationTagsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(NavigationTagsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
