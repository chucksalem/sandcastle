module RentalsHelper

  def get_all_units(units)
    properties = Array.new
    units.each do |unit|
      properties << unit if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
    end
    properties
  end

  def get_units_by_rooms(units)
    properties = Array.new
    units.each do |unit|
      start_date = DateTime.parse(@start_date).to_i
      end_date = DateTime.parse(@end_date).to_i
      if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
        unless unit['stay_ranges'].blank?
          unit['stay_ranges'].each do |range|
            u_start_date = (Time.parse(range['start']).strftime("%d/%m/%Y").to_time+1.day).to_i
            u_end_date = (Time.parse(range['end']).strftime("%d/%m/%Y").to_time+1.day).to_i
            if unit['bedrooms'] == @rooms.to_i
              properties << unit if (u_start_date <= start_date && u_end_date >= end_date) && (start_date <= end_date)
            end
          end
        end
      end
    end
    properties.blank? ? [] : properties
  end

  def get_units_by_price(units)
    properties = Array.new
    units.each do |unit|
      start_date = DateTime.parse(@start_date).to_i
      end_date = DateTime.parse(@end_date).to_i
      if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
        unless unit['stay_ranges'].blank?
          unit['stay_ranges'].each do |range|
            u_start_date = (Time.parse(range['start']).strftime("%d/%m/%Y").to_time+1.day).to_i
            u_end_date = (Time.parse(range['end']).strftime("%d/%m/%Y").to_time+1.day).to_i
            if (u_start_date <= start_date && u_end_date >= end_date) && (start_date <= end_date)
              if @min_price.to_i <= range['price'].to_i && @max_price.to_i >= range['price'].to_i
                unit.merge!(price: range['price'].to_i)
                properties << unit
              end
            end
          end
        end
      end
    end
    properties.blank? ? [] : properties
  end

  def get_units_by_rooms_price(units)
    properties = Array.new
    units.each do |unit|
      start_date = DateTime.parse(@start_date).to_i
      end_date = DateTime.parse(@end_date).to_i
      if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
        unless unit['stay_ranges'].blank?
          unit['stay_ranges'].each do |range|
            u_start_date = (Time.parse(range['start']).strftime("%d/%m/%Y").to_time+1.day).to_i
            u_end_date = (Time.parse(range['end']).strftime("%d/%m/%Y").to_time+1.day).to_i
            if (u_start_date <= start_date && u_end_date >= end_date) && (start_date <= end_date)
              if unit['bedrooms'] == @rooms.to_i
                unit.merge!(price: range['price'].to_i)
                properties << unit if (@min_price.to_i <= range['price'].to_i && @max_price.to_i >= range['price'].to_i)
              end
            end
          end
        end
      end
    end
    properties.blank? ? [] : properties
  end

  def get_units_by_guests(units)
    properties = Array.new
    units.each do |unit|
      start_date = DateTime.parse(@start_date).to_i
      end_date = DateTime.parse(@end_date).to_i
      unless unit['stay_ranges'].blank?
        unit['stay_ranges'].each do |range|
          u_start_date = (Time.parse(range['start']).strftime("%d/%m/%Y").to_time+1.day).to_i
          u_end_date = (Time.parse(range['end']).strftime("%d/%m/%Y").to_time+1.day).to_i
          if unit['occupancy'] == @guests.to_i && (u_start_date <= start_date && u_end_date >= end_date) && (start_date <= end_date)
            unit.merge!(price: range['price'].to_i)
            properties << unit
          end
        end
      end
    end
    properties.blank? ? [] : properties
  end

  def get_units_by_rooms_guests(units)
    properties = Array.new
    units.each do |unit|
      start_date = DateTime.parse(@start_date).to_i
      end_date = DateTime.parse(@end_date).to_i
      if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
        unless unit['stay_ranges'].blank?
          unit['stay_ranges'].each do |range|
            u_start_date = (Time.parse(range['start']).strftime("%d/%m/%Y").to_time+1.day).to_i
            u_end_date = (Time.parse(range['end']).strftime("%d/%m/%Y").to_time+1.day).to_i
            if unit['bedrooms'] == @rooms.to_i && unit['occupancy'] == @guests.to_i
              properties << unit if (u_start_date <= start_date && u_end_date >= end_date) && (start_date <= end_date)
            end
          end
        end
      end
    end
    properties.blank? ? [] : properties
  end

  def get_units_by_date_range(units)
    unless units.blank?
      properties = Array.new
      units.each do |unit|
        start_date = DateTime.parse(@start_date).to_i
        end_date = DateTime.parse(@end_date).to_i
        if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
          unless unit['stay_ranges'].blank?
            unit['stay_ranges'].each do |range|
              u_start_date = (Time.parse(range['start']).strftime("%d/%m/%Y").to_time+1.day).to_i
              u_end_date = (Time.parse(range['end']).strftime("%d/%m/%Y").to_time+1.day).to_i
              if (u_start_date <= start_date && u_end_date >= end_date) && (start_date <= end_date)
                properties << unit
              end
            end
          end
        end
      end
      properties.blank? ? [] : properties
    end
  end
end
