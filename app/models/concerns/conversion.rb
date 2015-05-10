class Conversion
  def self.month_number_to_name(number)
    %w(0 enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre)[number]
  end

  def self.month_name_to_number(name)
    %w(0 enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre).index(name)
  end
end
