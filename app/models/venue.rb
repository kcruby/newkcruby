class Venue < HashThing

  def full_address
    "#{address_1},#{city},#{state}"
  rescue
    nil
  end

end
