#Model for Place
require 'rqrcode'
class Place < ApplicationRecord
  belongs_to :institution
  before_validation :generate_qrcode


  def self.search(text)
    if text.blank? 
      all
    else
      where('description LIKE ?', "%#{text}%")
    end
  end

  private
  def generate_qrcode
    qr_code = RQRCode::QRCode.new("#{description} #{institution}")
    png = qr_code.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    self.qr_code = Base64.encode64(png.to_s)
  end

end
