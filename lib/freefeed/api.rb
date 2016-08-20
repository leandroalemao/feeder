module Freefeed
  class API
    BASE_URL = 'https://freefeed.net/v1/'

    def initialize(token)
      @token = token
    end

    def create_attachment(file_name)
      execute(:post, 'attachments',
        'miltipart' => true,
        'file' => File.new(file_name, 'rb')
      )
    end

    def create_post(body, options = {})
      execute(:post, 'posts',
        'post' => {
          'body' => body,
          'attachments' => options[:attachments] || []
        },
        'meta' => {
          'feeds' => options[:feeds]
        }
      )
    end

    def post(id)
      execute(:get, "posts/#{id}", 'maxComments' => 0)
    end

    private

    def token
      @token
    end

    def url(path)
      BASE_URL + path
    end

    def execute(method, path, payload = {})
      process_response RestClient::Request.execute(
        method: method,
        url: url(path),
        payload: payload,
        headers: {
          'X-Authentication-Token' => token
        }
      )
    end

    def process_response(response)
      return JSON.parse(response.body) if response.code == 200
      raise "response code: #{response.code}"
    end
  end
end
