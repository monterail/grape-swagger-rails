require "grape-swagger-rails/engine"

module GrapeSwaggerRails
  class Options < OpenStruct
    def before_filter(&block)
      if block_given?
        self.before_filter_proc = block
      else
        self.before_filter_proc
      end
    end
  end

  mattr_accessor :options

  self.options = Options.new(

    url:                  '/swagger_doc',
    app_name:             'Swagger',
    app_url:              'http://swagger.wordnik.com',
    hide_app_url:         false,

    headers:              {},

    api_auth:             '', # 'basic'
    api_keys:             [],

    before_filter_proc:  nil # Proc used as a controller before filter that returns a boolean
  )

end
