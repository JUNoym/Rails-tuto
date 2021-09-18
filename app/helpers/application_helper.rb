module ApplicationHelper
    def full_title(page_title = '')
        base_title = "Ruby on Rails Tutorial Sample App"
        nobase_title = "ページタイトルが空です"
        if page_title.empty?
            nobase_title
        else
          page_title + " | " + base_title
        end
      end
end
