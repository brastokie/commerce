
Depot::Application.configure do

  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
    require 'active_support/core_ext/numeric/bytes'
    config.logger = Logger.new(paths['log'].first, 2, 10.kilobytes)
end
