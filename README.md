# lita-hashtag

Let lita bot respond with a random image to '#', and a gif from giphy to '##'.

This is literally a simple stitch work that combine the code from
[lita-google-images](https://github.com/jimmycuadra/lita-google-images) and
[lita-giphy](https://github.com/killpack/lita-giphy) and make them respond to
'#' and '##'. 

## Installation

Add lita-hashtag to your Lita instance's Gemfile:

``` ruby
gem "lita-hashtag"
```


## Configuration

### Optional

* `config.handlers.hashtag.safe_search` - (String, Symbol) - The safe search
  setting to use when querying for images. Possible values are `:high`,
  `:medium`, and `:off`. **Default:** `:medium`.
* `config.handlers.hashtag.google_cse_id` - String - search engine id (see
  below)
* `config.handlers.hashtag.google_cse_key` - String - api key (see below)
* `config.handlers.hashtag.giphy_api_key` - String - Your Giphy API key. You can
  either email the devs for a personal API key, or you can use the default
  public beta key-- dc6zaTOxFJmzC. **Default:** `dc6zaTOxFJmzC`

## Important note about google custom search

Since google has shutdown their free image search API, you'll need to create an
google custom search engine (https://cse.google.com/) allows 100 search per day
free and fill in the `google_cse_key` with the 'search engine ID' (can be found
under 'Basic'->'Details'->'Search engine ID'). Then you need to go create an
api key from Google Developers Console (instructions here:
https://developers.google.com/custom-search/json-api/v1/introduction) and fill
that into the `google_cse_id`.

## Usage

```
You:  #success
Lita: http://ptb-uploads-prod.s3.amazonaws.com/blog/wp-content/uploads/2015/02/success.jpg
```

```
You:  ##victory
Lita: http://media2.giphy.com/media/PzOm3LPWu7fJS/giphy.gif
```

## License

[MIT](http://opensource.org/licenses/MIT)
