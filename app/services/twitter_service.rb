class TwitterService
    def self.tweet!(message)
        require 'oauth/request_proxy/typhoeus_request'

        require 'oauth/request_proxy/typhoeus_request'

        body = {
        "text": message
        }

        @consumer = OAuth::Consumer.new(
        ENV['consumer_key'],
        ENV['consumer_secret'],
        )
        @token = OAuth::Token.new(ENV['oauth_token'], ENV['oauth_token_secret'])
        options = {
        method: :post,
        headers: {
            "content-type" => "application/json"
        },
        body: body.to_json
        }

        oauth_params = {:consumer => @consumer, :token => @token}

        hydra = Typhoeus::Hydra.new
        url = 'https://api.twitter.com/2/tweets'
        req = Typhoeus::Request.new(url, options)
        oauth_helper = OAuth::Client::Helper.new(req, oauth_params.merge(:request_uri => url))
        req.options[:headers].merge!({"Authorization" => oauth_helper.header})

        response = req.run

        if response.success?
        puts "Credentials work! Tweet:"
        puts JSON.pretty_generate(JSON.parse(response.body))
        else
        puts "Credentials failed, please try generating again."
        end

    end
end