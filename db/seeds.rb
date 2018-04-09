# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Product.destroy_all
# Category.destroy_all

  require 'time'
  require 'uri'
  require 'openssl'
  require 'base64'  
    ACCESS_KEY_ID = "AKIAIONONMVS5BPD3WDQ"

    # Your Secret Key corresponding to the above ID, as taken from the Your Account page
    SECRET_KEY = "0yLyluDzN2uPUZdtBW08EufGagHq7natiqh+tLro"

    # The region you are interested in
    ENDPOINT = "webservices.amazon.com"

    REQUEST_URI = "/onca/xml"  
    list_product_group = ["Appliances", "ArtsAndCrafts", "MobileApps", "HealthPersonalCare", "Grocery", "GiftCards", "FashionWomen", "FashionMen", "FashionGirlss", "FashionBoys", "Beauty"]
    list_result = []
    product_item = nil
    product_obj = Product.new
    list_product_group.each do |value|
    params = {
      "Service" => "AWSECommerceService",
      "Operation" => "ItemSearch",
      "AWSAccessKeyId" => "AKIAIONONMVS5BPD3WDQ",
      "AssociateTag" => " storetestapp-20",
      "SearchIndex" => "All",
      "Keywords" => "HTC phone",
      "ResponseGroup" => "Accessories,ItemAttributes,Large,Offers"
    }

    # Set current timestamp if not set
    params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")

    # Generate the canonical query
    canonical_query_string = params.sort.collect do |key, value|
    [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
    end.join('&')

    # Generate the string to be signed
    string_to_sign = "GET\n#{ENDPOINT}\n#{REQUEST_URI}\n#{canonical_query_string}"

    # Generate the signature required by the Product Advertising API
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), SECRET_KEY, string_to_sign)).strip()

    # Generate the signed URL
    request_url = "http://#{ENDPOINT}#{REQUEST_URI}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"

    xml = Net::HTTP.get(URI.parse(request_url))

    product = Hash.from_xml(xml)
    product_item = product

    end
    category = Category.create(title: 'HTC phone')

    product_item["ItemSearchResponse"]["Items"]["Item"].each do |item|

      # puts "===SKU==="
      # puts  item["ASIN"]
      # puts "===Title===="
      # puts item["ItemAttributes"]["Title"]
      # puts "===LargeImage===="
      # puts item["LargeImage"]["URL"]

      # puts "=====ListPrice====="
      # puts item["ItemAttributes"]["ListPrice"]["FormattedPrice"]
      # puts item["ItemAttributes"]["ListPrice"]["FormattedPrice"].slice(1,10)

      product = Product.create(sku: item["ASIN"], name: item["ItemAttributes"]["Title"] ,price:item["ItemAttributes"]["ListPrice"]["FormattedPrice"].slice(1,10),  description: item["ItemAttributes"]["Feature"],image: item["LargeImage"]["URL"], category_id: category.id)
    end
