require 'csv'

namespace :data_parser do

  desc "Parses data into rails engine app"

  task parse_csv: :environment do
    start_time ||= Time.now

    models = { customers:     Customer,
               merchants:     Merchant,
               items:         Item,
               invoices:      Invoice,
               transactions:  Transaction,
               invoice_items: InvoiceItem }

    models.each do |file, model|

      file = "lib/assets/#{file}.csv"

      CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
        model.find_or_create_by(row.to_hash)
      end

      puts "#{model.all.size} #{model} records imported successfully"
    end
    puts "Data imported in #{Time.now - start_time} seconds."
  end
end

