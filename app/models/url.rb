class Url < ApplicationRecord

  validates :longurl, presence: true, length: { minimum: 30}
  before_create :generate_short_url_code, :generate_short_url, :sanitize

  def generate_short_url_code
    short_url_code = rand(36**8).to_s(36)
  end

  def generate_short_url
    short_url = baseurl + '/' + shorturlcode
  end

  def sanitize
    longurl.strip!
    sanitize_url = self.longurl.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    "http://#{sanitize_url}"
  end

end
