class EsquirePhotosNormalizer < RssNormalizer
  protected

  def text
    [entity.title, link].reject(&:blank?).join(separator)
  end

  def published_at
    parts = /(\d\d)(\d\d)(\d\d\d\d)/.match(link)
    DateTime.new(Integer(parts[3]), Integer(parts[2]), Integer(parts[1]))
  rescue
    super
  end

  def attachments
    [image_url]
  end

  def comments
    [description]
  end

  private

  def image_url
    Html.first_image_url(entity.description)
  end

  READ_MORE_LINK = /\s*Читать дальше\s*/.freeze

  def description
    Html.comment_excerpt(Html.squeeze(entity.description)).
      gsub(READ_MORE_LINK, '')
  end
end
