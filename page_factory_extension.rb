require 'radiant-page_factory-extension'
require_dependency 'application_controller'

class PageFactoryExtension < Radiant::Extension
  version     RadiantPageFactoryExtension::VERSION
  description RadiantPageFactoryExtension::DESCRIPTION
  url         RadiantPageFactoryExtension::URL

  def activate
    Page.send :include, PageFactory::PageExtensions
    PagePart.send :include, PageFactory::PagePartExtensions
    Admin::PagesController.send :include, PageFactory::PagesControllerExtensions
    Admin::PagesController.helper 'admin/part_description'
    Admin::PagePartsController.helper 'admin/part_description'
    admin.pages.edit.add :part_controls, 'admin/page_parts/part_description'
    ActiveSupport::Dependencies.autoload_paths << File.join(Rails.root, 'lib')
    ActiveSupport::Dependencies.autoload_paths << File.join(Rails.root, %w(app models))
  end
end
