require "grape-swagger-rails/engine"

module GrapeSwaggerRails
  class Options < Struct.new(:url, :api_keys, :api_auth, :headers, :app_name, :app_url, :hide_app_url, :authentication_proc)
    def authenticate_with(&block)
      self.authentication_proc = block
    end
  end

  mattr_accessor :options

  self.options = Options.new(

    url:                  '/swagger_doc.json',
    app_name:             'Swagger',
    app_url:              'http://swagger.wordnik.com',
    hide_app_url:         false,

    headers:              {},

    api_auth:             '', # 'basic'
    api_keys:             [],

    authentication_proc:  nil # Proc used as a controller before filter that returns a boolean
  )

end

