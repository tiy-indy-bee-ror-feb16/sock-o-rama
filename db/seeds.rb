# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Quan Tities", email: "quan@example.com", role: "admin", password: "password")

#make all available sizes
available_sizes = %w(S M L XL XXL XXXL)
available_sizes.each do |size|
  Size.create!(size: size)
end

#parse CSV
workbook = RubyXL::Parser.parse("lib/socks.xlsx")

workbook.each do |worksheet|
  category = worksheet.sheet_name
  worksheet.each_with_index do |row, i|
    #first row in spreadsheet is headers.  Ignore it
    unless i == 0 || row[0].value.blank?
      #create a new sock
      sock = Sock.create!(
        category: category,
        name: row[0].value,
        color: row[1].value,
        style: row[2].value,
        price: row[5].value,
        material: row[7].value,
        description: row[8].value
      )
      sizes = row[4].value.split(", ")
      size_quantities = sizes.map do |str|
        str.split(": ")
      end
      #create sock_sizes
      size_quantities_hash = size_quantities.to_h
      size_quantities_hash.each do |key, value|
        sock_size = SockSize.new(quantity: value.to_i)
        sock_size.sock = sock
        sock_size.size = Size.find_by(size: key)
        sock_size.save!
      end
      # create images
      urls = row[6].value.split(", ")
      urls.each do |url|
        sock_image = SockImage.new(url: url)
        sock_image.sock = sock
        sock_image.save!
      end
    end
  end
end
