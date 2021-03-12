module StripeMock
  module RequestHandlers
    module AccountLinks
      def AccountLinks.included(klass)
        klass.add_handler 'post /v1/account_links', :new_account
      end

      def new_account(route, method_url, params, headers)
        params[:id] ||= new_id('acct_link')
        route =~ method_url
        accounts[params[:id]] ||= Data.mock_account_link(params)
      end
    end
  end
end
