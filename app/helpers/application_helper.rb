module ApplicationHelper
  def screenshot_for_site(site)
    unless site.screenshot =~ /shrinktheweb/
      link_to site_path(site), id: "screenshot-link" do
        image_tag(site.screenshot)
      end
    end
  end
end
