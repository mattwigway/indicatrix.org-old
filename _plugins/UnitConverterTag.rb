module Indicatrix
  class UnitConverterBlock < Liquid::Tag
    def initialize (tag_name, text, tokens)
      # Figure out the units
      parsed = /([0-9\.]+)\W+([\/a-zA-Z]+)/.match(text)
      @original = text
      @alt = calculate_alt(parsed[1].to_f, parsed[2])
    end

    def render (context)
      return '<span class="units" title="%s">%s</span>' % [@alt, @original] 
    end

    # calculate the title for a given set of units
    def calculate_alt (number, units)
      units = units.downcase

      # TODO: calculate from input
      precision = 2

      if units == 'mph' or units == 'mi/hr' or units == 'mi/h'
        # calculate kmph
        return (number * 1.609344).round.to_s + ' km/h'

      elsif units == 'kmh' or units == 'kph' or units == 'km/hr' or units == 'km/h'
        return (number / 1.609344).round.to_s + ' mph'

      elsif units == 'km' or units == 'kilometers'
        return (number * 1.609344).round.to_s + ' mi'

      elsif units == 'mi' or units == 'mile' or units == 'miles'
        return (number / 1.609344).round.to_s + ' km'

      else
        return ''
      end

    end
  end
end

Liquid::Template.register_tag('units', Indicatrix::UnitConverterBlock)
