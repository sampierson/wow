module Wow
  class BlizzAuctionsFile

    def initialize(realm)
      @realm = realm
    end

    def last_modified_at
      Time.at metadata['files'].first['lastModified'] / 1000
    end

    def retrieve_auction_data
      json_string = Net::HTTP.get URI(file_location)
      JSON.parse json_string
    end

    private

    def file_location
      metadata['files'].first['url']
    end

    def metadata
      @metadata ||= retrieve_metadata
    end

    def retrieve_metadata
      response = api_client.auctions_datafile_location_for_realm @realm.slug
      raise "There is more than 1 data file!" unless response['files'].size == 1
      response
    end

    def api_client
      @api_client ||= BattleNet::ApiClient.new
    end
  end
end