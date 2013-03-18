require "open-uri"
require "json"

# Create HTML outputs for show and index functions
class HtmlGenerator

  # looking up a particular product
  def show(id)
    print_header
    puts "    <h1>Product Details</h1>"
    puts "    <br />"

    product = retrieve_data("http://lcboapi.com/products/#{id}.json")

    display_detailed_product(product)

    print_footer
  end

  # outputting a listing of items
  def index
    print_header 
    puts "    <h1>Product Listing</h1>"
    puts "    <br />"

    products = retrieve_data("http://lcboapi.com/products.json")

    products.each do |product|
      display_product(product)
      display_product_info(product)
    end

    print_footer
  end

  # below is only available to methods within class
  private

  def display_product(product)
    puts "    <div class='product'>"
    puts "      <h2>#{product['name']}</h2>"
  end

  def display_product_info(product)
    puts "      <img src='#{product['image_thumb_url']}'>"
    puts "      <ul>"
    puts "        <li><strong>Product ID:</strong> #{product['id']}</li>"
    puts "        <li><strong>Producer:</strong> #{product['producer_name']}</li>"
    puts "        <li><strong>Category:</strong> #{product['primary_category']}</li>"
    puts "        <li><strong>Sub-category:</strong> #{product['secondary_category']}</li>"
    puts "        <li><strong>Volume Sold:</strong> #{product['package_unit_volume_in_milliliters']} ml</li>"
    puts "        <li><strong>Unit Price:</strong> $#{(product['price_in_cents'].to_i/100.0)}</li>"
    puts "      </ul>"
    puts "      <div class = 'clear'></div>"
    puts "      </div>"
  end

  def display_detailed_product(product)
    puts "    <div class='product'>"
    puts "      <h2>#{product['name']}</h2>"
    puts "      <img src='#{product['image_url']}'>"
    puts "      <ul>"
    puts "        <li><strong>Product ID:</strong> #{product['id']}</li>"
    puts "        <li><strong>Producer:</strong> #{product['producer_name']}</li>"
    puts "        <li><strong>Category:</strong> #{product['primary_category']}</li>"
    puts "        <li><strong>Sub-category:</strong> #{product['secondary_category']}</li>"
    puts "        <li><strong>Origin:</strong> #{product['origin']}</li>"
    puts "        <li><strong>Unit volume:</strong> #{product['package_unit_volume_in_milliliters']} ml</li>"
    puts "        <li><strong>Package:</strong> #{product['package']} ml</li>"
    puts "        <li><strong>Unit Price:</strong> $#{(product['price_in_cents'].to_i/100.0)}</li>"
    puts "        <li><strong>Serving Suggestion:</strong> #{product['serving_suggestion']}</li>" if product['serving_suggestion'] != nil
    puts "        <li><strong>Tasting Note:</strong> #{product['tasting_note']}</li>" if product['tasting_note'] != nil
    puts "        <li><strong>Tags:</strong> #{product['tags']}</li>" if product['tags'] != nil
    puts "      </ul>"
    puts "      <div class = 'clear'></div>"
    puts "    </div>"
  end

  # opening HTML code
  def print_header
    puts "<html>"
    puts "  <head>"
    puts "    <title>Connoisseur</title>"
    puts "    <link type='text/css' rel='stylesheet' href='stylesheet.css'/>"
    puts "  </head>"
    puts "  <body>"
  end

  # closing HTML code
  def print_footer
    puts "  </body>"
    puts "</html>"
  end

  # retrieving data
  def retrieve_data(url)
    response = open(url).read
    data = JSON.parse(response)

    return data["result"]
  end

end