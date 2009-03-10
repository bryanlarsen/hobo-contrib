#  This requires a working hobo skeleton.  Rather than create a
#  symbolic dependency, I haven't included the skeleton.
#
#  Link this file from lib/tasks/render.rake and link
#  doc_generator.dryml to app/views/taglibs in your skeleton

desc "generate documentation"
file "../hobo-contrib/documentation.mdown" => ["#{RAILS_ROOT}/app/views/taglibs/doc_generator.dryml", :environment]+Dir["#{RAILS_ROOT}/../hobo-contrib/taglibs/**/*.dryml"] do |t|
  taglibs = Dir["#{RAILS_ROOT}/../hobo-contrib/taglibs/**/*.dryml"].map {|filename|
    Hobo::Dryml::DrymlDoc::Taglib.new("#{RAILS_ROOT}/../hobo-contrib/taglibs", filename)
  }

  require 'maruku'
  src = open(t.prerequisites.first).read
  locals = []
  imports = []
  renderer_class = Hobo::Dryml.make_renderer_class(src, File.dirname(t.prerequisites.first), locals, imports)
  assigns = {}
  view = ActionView::Base.new(ActionController::Base.view_paths, assigns)
  view.extend(ActionView::Helpers::TagHelper)
  view.extend(Hobo::HoboHelper)
  view.extend(Hobo::RapidHelper)
  renderer = renderer_class.new(File.basename(t.prerequisites.first, ".dryml"), view)
  page_locals = ""
  htmlname = File.dirname(t.name)+"/"+File.basename(t.name, ".mdown")+".html"
  f=open(htmlname, "w")
  f.write(renderer.render_page(taglibs, page_locals).strip)
  f.close  # important! or perl will fail!
  sh "perl #{RAILS_ROOT}/../hobo-contrib/lib/html2markdown.pl #{RAILS_ROOT}/#{htmlname} > #{RAILS_ROOT}/#{t.name}"
  sh "rm #{RAILS_ROOT}/#{htmlname}"
end

