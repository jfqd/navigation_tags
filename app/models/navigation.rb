class Navigation < ActiveRecord::Base
  
  validates_presence_of  :name
  
  class << self
    def search(search, filter, page)
      unless search.blank?
 
        search_cond_sql = []
        search_cond_sql << 'LOWER(name) LIKE (:term)'
 
        cond_sql = search_cond_sql.join(" or ")
 
        @conditions = [cond_sql, {:term => "%#{search.downcase}%" }]
      else
        @conditions = []
      end
 
      options = { :conditions => @conditions,
                  :order => 'name ASC',
                  :page => page,
                  :per_page => 10 }
 
      Navigation.paginate(:all, options)
    end
  end
end
