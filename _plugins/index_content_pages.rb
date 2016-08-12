module IndexContentPages
  class Generator < Jekyll::Generator
    def generate(site)
      standards_pages = site.pages
        .select { |page| page.data.fetch('standards', false) }
        .select { |page| page.data.fetch('nav_order', 1) == 1 }
        .sort_by { |page| page.data['standards'] }

      index_page = site.pages.find { |page| page.name == 'index.html' }
      index_page.data['standards_pages'] = standards_pages
    end
  end
end
module IndexSubContentPages
  class Generator < Jekyll::Generator
    def generate(site)
      sub_category_pages = site.pages
        .select { |page| page.data.fetch('sub_category', false) }
        .select { |page| page.data.fetch('nav_order', 1) == 1 }
        .sort_by { |page| page.data['sub_category'] }

      index_page = site.pages.find { |page| page.name == 'index.md' }
      index_page.data['sub_category_pages'] = sub_category_pages
    end
  end
end
