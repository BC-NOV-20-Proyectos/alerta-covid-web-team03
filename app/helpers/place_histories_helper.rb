module PlaceHistoriesHelper
  def get_place(qr_code)
    Place.find_by(qr_code: qr_code)
  end

  
end
