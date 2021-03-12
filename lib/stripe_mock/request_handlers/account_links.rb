module StripeMock
  module RequestHandlers
    module AccountLinks
      def AccountLinks.included(klass)
        klass.add_handler 'post /v1/account_links', :new_account_link
      end

      def new_account_link(route, method_url, params, headers)
        params[:id] ||= new_id('acct_link')
        route =~ method_url
        account_links[params[:id]] ||= Data.mock_account_link(params)
      end
    end
  end
end
