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
  setting to use when querying for images. Possible values are `:active`,
  `:moderate`, and `:off`. **Default:** `:active`.
* `config.handlers.hashtag.giphy_api_key` - String - Your Giphy API key. You can
  either email the devs for a personal API key, or you can use the default
  public beta key-- dc6zaTOxFJmzC.

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
