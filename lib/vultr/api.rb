module Vultr
  class API
    # Creates a new API client instance.
    #
    # @param [Hash] params
    # @option params [String] :api_key The api_key (required)
    # @option params [String] :base_url ('https://api.digitalocean.com/') API base url
    # @option params [Symbol] :faraday_adapter ('Faraday.default_adapter')  Faraday adapter/http client library to use.
    # @raise [ArgumentError] when no client_id is provided
    # @raise [ArgumentError] when no api_key is provided
    # @example
    #   client = Vultr::API.new(:api_key => '#######')
    #
    # @see [Faraday]
    def initialize(params)
      @api_key             = params[:api_key]
      @debug               = params[:debug]
      @ssl                 = params[:ssl] || { :verify => true }
      @base_url            = params[:base_url]            || 'https://api.vultr.com/'
      @faraday_adapter     = params[:faraday_adapter]     || Faraday.default_adapter
      @raise_status_errors = params[:raise_status_errors] || false
      @faraday             = params[:faraday]             || default_faraday
      raise ArgumentError, ':api_key missing' unless @api_key
    end

    # Access Servers (virtual machines)
    # @see Vultr::Resource::Server
    # @return [Vultr::Resource::Server]
    def servers
      Vultr::Resource::Server.new(@faraday)
    end

    # Access Plans (virtual machine types/sizes)
    # @see Vultr::Resource::Plan
    # @return [Vultr::Resource::Plan]
    def sizes
      Vultr::Resource::Plan.new(@faraday)
    end

    # Access Regions (data center location)
    # @see Vultr::Resource::Region
    # @return [Vultr::Resource::Region]
    def regions
      Vultr::Resource::Region.new(@faraday)
    end

    # Access OSes (Snapshots, Backups)
    # @see Vultr::Resource::OS
    # @return [Vultr::Resource::OS]
    def images
      Vultr::Resource::OS.new(@faraday)
    end

    def default_faraday
      Faraday.new(:url => @base_url, :ssl => @ssl) do |faraday|
        faraday.use AuthenticationMiddleware, @api_key
        faraday.use Faraday::Response::RaiseError if @raise_status_errors
        faraday.request  :url_encoded
        faraday.response :mashify
        faraday.response :json
        faraday.response(:logger) if @debug
        faraday.adapter @faraday_adapter
      end
    end
  end
end
