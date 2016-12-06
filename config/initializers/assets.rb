# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( jquery-2.1.4.min.js )
Rails.application.config.assets.precompile += %w( jquery-ui.min.js )
Rails.application.config.assets.precompile += %w( jquery.validate.min.js )
Rails.application.config.assets.precompile += %w( modernizr.js )
Rails.application.config.assets.precompile += %w( moment.js )
Rails.application.config.assets.precompile += %w( pikaday.jquery.js )
Rails.application.config.assets.precompile += %w( pikaday.js )
Rails.application.config.assets.precompile += %w( jquery.fancybox.pack.js )
Rails.application.config.assets.precompile += %w( jquery.fancybox-media.js )
Rails.application.config.assets.precompile += %w( jquery.bxslider.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )

%w( home pages properties accommodations hotellists rentals).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js"]
end
