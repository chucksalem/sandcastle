class Stay
  include Virtus.model

  class Unavailable < StandardError; end

  class Tax
    include Virtus.model
    attribute :amount, Float, default: 0.0
  end

  class Fee
    include Virtus.model
    attribute :name, String
    attribute :amount, Float, default: 0.0
    attribute :currency_code, String
    attribute :mandatory, Boolean, default: false
  end

  attribute :base_amount, Float
  attribute :taxes, Array[Tax], default: []
  attribute :fees, Array[Fee], default: []
  attribute :total_amount, Float

  def self.lookup(code, start_date:, end_date:, guests:)
    stay = Escapia::UnitStay.new
    response = stay.execute({
      date_range: { start: start_date, end: end_date, },
      guests:     [{ type: 10, count: guests }],
      unit_code:  code
    })
    from_response(response)
  rescue Escapia::Request::Error => e
    raise Unavailable, e.message
  end

  def self.from_response(response)
    unit_stay = response[:unit_stay]
    rate      = unit_stay[:unit_rates][:unit_rate][:rates][:rate]

    taxes = rate[:base][:taxes] || []
    taxes = [taxes[:tax]] if taxes.is_a?(Hash)
    taxes = taxes.map { |t| { amount: t[:@amount].to_f } }

    fees = rate[:fees][:fee]
    fees = [fees] if fees.is_a?(Hash)
    fees = fees.map do |f|
      description = f[:description].select { |d| d[:@name] == 'Charge Description' }
      {
        name:           description.count > 0 ? description[0][:text] : '',
        amount:         f[:@amount].to_f,
        currency_code:  f[:@currency_code],
        mandatory:      f[:@mandatory_indicator] == 'true'
      }
    end

    new(
      base_amount: rate[:base][:@amount_before_tax],
      taxes: taxes,
      fees: fees,
      total_amount: unit_stay[:total][:@amount_before_tax].to_f + unit_stay[:total][:taxes][:@amount].to_f
    )
  end

  def self.stay_lookup(ranges)
    range_array = []
    return range_array if ranges[:rate_range].nil?
    ranges[:rate_range].each do |range|
      if range.is_a?(Hash) && range[:@rate_type] == 'Nightly'
        range_array << {
            start:  stay_date_format(range[:@start]),
            end:    stay_date_format(range[:@end]),
            stay_type: range[:@rate_type],
            price: !range[:@min_rent].blank? ? range[:@min_rent].split('.').first.to_i : 0
        }
      end
    end
    range_array
  end

  def self.stay_date_format(date)
    date_array = date.split("/")
    date = "#{date_array[1]}/#{date_array[0]}/#{date_array[2]}"
    date
  end
end
