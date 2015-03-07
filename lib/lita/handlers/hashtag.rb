module Lita
  module Handlers
    class Hashtag < Handler
      URL = "https://ajax.googleapis.com/ajax/services/search/images"
      GIF_URL = "http://api.giphy.com/v1/gifs/search"
      VALID_SAFE_VALUES = %w(active moderate off)

      config :safe_search, types: [String, Symbol], default: :active do
        validate do |value|
          unless VALID_SAFE_VALUES.include?(value.to_s.strip)
            "valid values are :active, :moderate, or :off"
          end
        end
      end

      config :giphy_api_key, type: String, default: 'dc6zaTOxFJmzC'

      route(/^#(.+)/, :fetch, command: false, help: {
        "#QUERY" => "Displays a random image from Google Images for query.",
        "##QUERY" => "Display a random gif from giphy.com for query"
      })

      def fetch(response)
        query = response.matches[0][0]

        if query[0] == '#'
          response.reply get_gif(query)
        else
          http_response = http.get(
            URL,
            v: "1.0",
            q: query,
            safe: config.safe_search,
            rsz: 8
          )

          data = MultiJson.load(http_response.body)

          if data["responseStatus"] == 200
            choice = data["responseData"]["results"].sample
            if choice
              response.reply ensure_extension(choice["unescapedUrl"])
            else
              response.reply %{No images found for "#{query}".}
            end
          else
            reason = data["responseDetails"] || "unknown error"
            Lita.logger.warn(
              "Couldn't get image from Google: #{reason}"
            )
          end
        end
      end

      private

      def ensure_extension(url)
        if [".gif", ".jpg", ".jpeg", ".png"].any? { |ext| url.end_with?(ext) }
          url
        else
          "#{url}#.png"
        end
      end

      def get_gif(query)
        process_response(http.get(
          GIF_URL,
          q: query,
          api_key: config.giphy_api_key
        ), query)
      end

      def process_response(http_response, query)
        data = MultiJson.load(http_response.body)

        if data["meta"]["status"] == 200
          choice = data["data"].sample
          if choice.nil?
            reply_text = "I couldn't find anything for '#{query}'!"
          else
            reply_text = choice["images"]["original"]["url"]
          end
        else
          reason = data["meta"]["error_message"] || "unknown error"
          Lita.logger.warn(
            "Couldn't get image from Giphy: #{reason}"
          )
          reply_text = "Giphy request failed-- please check my logs."
        end

        reply_text
      end

    end

    Lita.register_handler(Hashtag)
  end
end
