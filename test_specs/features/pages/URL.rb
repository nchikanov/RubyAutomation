class URL

  @@url = Hash.new { |h,k| h[k] = {} }

  @@url['google']['url'] = "https://www.google.com/"
  @@url['bing']['url'] = "https://www.bing.com/"
  @@url['duckduckgo']['url'] = "https://www.duckduckgo.com/"
  @@url['facebook']['url'] = "https://www.facebook.com/"
  @@url['gmail']['url'] = "https://www.gmail.com/"
  @@url['linkedin']['url'] = "https://www.linkedin.com/"
  @@url['flights']['url'] = "https://www.amextravel.com/flight_searches/new"
  @@url['cars']['url'] = "https://www.amextravel.com/car_searches/new"

  def getUrl(website)
    @@url[website]['url']
  end

end
