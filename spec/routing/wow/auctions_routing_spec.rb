require 'spec_helper'

describe Wow::AuctionsController do
  describe 'routing' do
    it { expect(get    '/wow/auctions'       ).to route_to('wow/auctions#index') }
    it { expect(get    '/wow/auctions/new'   ).to route_to('wow/auctions#new') }
    it { expect(get    '/wow/auctions/1'     ).to route_to('wow/auctions#show', :id => '1') }
    it { expect(get    '/wow/auctions/1/edit').to route_to('wow/auctions#edit', :id => '1') }
    it { expect(post   '/wow/auctions'       ).to route_to('wow/auctions#create') }
    it { expect(put    '/wow/auctions/1'     ).to route_to('wow/auctions#update', :id => '1') }
    it { expect(delete '/wow/auctions/1'     ).to route_to('wow/auctions#destroy', :id => '1') }
  end
end
