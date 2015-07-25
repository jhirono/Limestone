class Scraping

  def self.gym_urls
    agent = Mechanize.new
    main_page = agent.get("http://www.climbing-net.com/?search_element_0=315&search_element_1_cnt=9&search_element_2_cnt=1&searchbutton=%E4%B8%8A%E8%A8%98%E3%81%AE%E6%9D%A1%E4%BB%B6%E3%81%8B%E3%82%89%E6%A4%9C%E7%B4%A2&csp=search_add&feadvns_max_line_0=3&fe_form_no=0")
    while true do
      links = []
      elements = main_page.search(".jym_title a")
      elements.each do |ele|
        links << ele[:href]
      end

      links.each do |link|
        gym_detail(link)
      end
      next_url = main_page.at(".nextpostslink").get_attribute(:href)
      main_page = agent.get(next_url)

      unless next_url
        break
      end
    end
  end

  def self.gym_detail(link)
    agent = Mechanize.new
    page = agent.get(link)
    name       = page.at(".line5").inner_text
    image_url  = page.at(".rg-gallery img").get_attribute(:src) if page.at(".rg-gallery img")
    prefecture = page.at(".jym_area").inner_text if page.at(".jym_area")

    elements = []
    elements = page.search(".property_table tr td")

    address   = elements[0].inner_text.strip
    access    = elements[1].inner_text.strip
    tele      = elements[2].inner_text.strip
    open_hour = elements[3].inner_text.strip
    holiday   = elements[4].inner_text.strip
    price     = elements[5].inner_text.strip
    rental    = elements[6].inner_text.strip
    parking   = elements[7].inner_text.strip
    lesson    = elements[8].inner_text.strip
    kid       = elements[9].inner_text.strip
    homepage  = elements[10].inner_text.strip

    indoor =  Indoor.where(name: name, image_url: image_url, prefecture: prefecture).first_or_initialize
    indoor.address   = address
    indoor.access    = access
    indoor.tele      = tele
    indoor.open_hour = open_hour
    indoor.holiday   = holiday
    indoor.price     = price
    indoor.rental    = rental
    indoor.parking   = parking
    indoor.lesson    = lesson
    indoor.kid       = kid
    indoor.homepage  = homepage
    indoor.save

  end

  def self.test
    agent = Mechanize.new
    page = agent.get("http://www.climbing-net.com/gym_detail/b-pump-ogikubo/")
    name       = page.at(".line5").inner_text
    image_url  = page.at(".rg-gallery img").get_attribute(:src)
    prefecture = page.at(".jym_area").inner_text

    elements = []
    elements = page.search(".property_table tr td")

    address   = elements[0].inner_text.strip
    access    = elements[1].inner_text.strip
    tele      = elements[2].inner_text.strip
    open_hour = elements[3].inner_text.strip
    holiday   = elements[4].inner_text.strip
    price     = elements[5].inner_text.strip
    rental    = elements[6].inner_text.strip
    parking   = elements[7].inner_text.strip
    lesson    = elements[8].inner_text.strip
    kid       = elements[9].inner_text.strip
    homepage  = elements[10].inner_text.strip

    indoor =  Indoor.where(name: name, image_url: image_url, prefecture: prefecture).first_or_initialize
    indoor.address   = address
    indoor.access    = access
    indoor.tele      = tele
    indoor.open_hour = open_hour
    indoor.holiday   = holiday
    indoor.price     = price
    indoor.rental    = rental
    indoor.parking   = parking
    indoor.lesson    = lesson
    indoor.kid       = kid
    indoor.homepage  = homepage
    indoor.save
  end
end

# agent = Mechanize.new
# page = agent.get("http://www.climbing-net.com/gym_detail/apex-shinjyukunishi/")
# elements = page.search('.property_table tr td')
# elements.each do |ele|
#   puts ele.inner_text.strip
#   puts "------------------------"
# end