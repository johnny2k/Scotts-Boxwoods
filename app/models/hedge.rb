class Hedge
  attr_accessor :length, :distance, :years, :pot_size, :length_units, :distance_units
	validates :length, :distance, :years, :pot_size, :length_units, :distance_units

end

