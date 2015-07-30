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
        downcase_row(row)
        model.create(row.to_hash)
      end

      puts "#{model.all.size} #{model} records imported successfully"
    end
    puts "Data imported in #{Time.now - start_time} seconds."
  end
end

def downcase_row(row)
   row[:first_name].downcase! if row[:first_name]
   row[:last_name].downcase!  if row[:last_name]
   row[:name].downcase!       if row[:name]
end
