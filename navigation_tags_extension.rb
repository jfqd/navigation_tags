# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class NavigationTagsExtension < Radiant::Extension
  version "2.0"
  description "Makes building navigations much easier."
  url "http://yourwebsite.com/navigation_tags"
  
  # define_routes do |map|
  #   map.connect 'admin/navigation_tags/:action', :controller => 'admin/navigation_tags'
  # end
  
  def activate
    Page.send :include, NavigationTags
    admin.pages.edit.add :layout_row, "admin/pages/navigation"
  end
  
  def deactivate
  end
  
end