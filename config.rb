###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.add_import_path "bower_components/foundation-sites/scss/"
  config.output_style = :compact

  # Set this to the root of your project when deployed:
  config.http_path = "/"
  config.css_dir = "stylesheets"
  config.sass_dir = "stylesheets"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"
end

# Reload the browser automatically whenever files change
# activate :livereload

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Use the correct vendor prefixes for foundation
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'ie >= 9', 'and_chr >= 2.3']
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :partials_dir, 'partials'

activate :directory_indexes

set :index_file, "index.html"

activate :prismic_middleman do |f|
  f.url = 'https://philips-defibrillatori.prismic.io/api'
  f.new_article_template = "fdt_templates/blog.tt"
  f.permalink = '/blog/{category}/{year}-{month}-{day}-{title}.html'
  f.default_extension = ".erb"
end

activate :podio_middleman do |f|
  f.podio_api_key = 'runscope'
  f.podio_api_secret = 'D3FrXAJWyuyNY0A7uA2WYFRvnT9IcweKpTXsdgmRn1Rot5iOZ5XX17KarPUoqJTO'
  f.podio_app_id = '9325823'
  f.podio_app_token = '7cf9678005ab4dc7977677d289ec134a'
  f.podio_views = {'consumabili'=>'22962502'}
  f.podio_templates = {'consumabili'=>'prodotti'}
  f.podio_fields_to_get = {'consumabili'=>['Nome Prodotto', 'Prezzo', 'Descrizione', 'Immagine', 'Stato', 'Per il modello', 'Categoria', 'Codice Prodotto Iredeem', 'Prezzo con IVA']}
end

activate :blog do |blog|
    blog.default_extension = ".erb"

    blog.tag_template = "tag.html"
    blog.calendar_template = "calendar.html"
    blog.sources = "/blog/{category}/{year}-{month}-{day}-{title}.html"
    blog.permalink = "/blog/{category}/{year}-{month}-{day}-{title}.html"

    # Enable pagination
    blog.paginate = true
    blog.per_page = 10
    blog.page_link = "page/{num}"

    blog.custom_collections = {
        category: {
            link: '/blog/categories/{category}.html',
            template: '/category.html'
        }
    }
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
