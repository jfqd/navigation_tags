# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class NavigationExtension < Radiant::Extension
  version "2.0"
  description "Makes building navigations much easier."
  url "http://github.com/squaretalent/radiant-navigation-extension"
  
  # define_routes do |map|
  #   map.connect 'admin/navigation_tags/:action', :controller => 'admin/navigation_tags'
  # end
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get } do |admin|
      admin.resources :navigations, :as => :navigation
    end
  end
  
  def activate
    Page.send :include, NavigationTags
    admin.page.edit.add :parts_bottom, "navigation", :after  => 'edit_layout_and_type'
    
    tab 'Design' do
      add_item 'Navigation', "/admin/navigation", :after => 'Snippets'
    end
  end
  
end