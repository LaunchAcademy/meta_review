module ApplicationHelper
  def screenshot_for_site(site)
    unless stw_show_url(site.url) =~ /</
      link_to site_path(site), id: "screenshot-link" do
        stw_show(site.url)
      end
    end
  end
end
