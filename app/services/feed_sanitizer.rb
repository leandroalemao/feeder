class FeedSanitizer
  include Callee

  option(:name, type: Dry::Types['strict.string'])
  option(:after, type: Dry::Types['params.date_time'], optional: true)
  option(:import_limit, type: Dry::Types['strict.integer'], optional: true)
  option(:loader, type: Dry::Types['strict.string'], optional: true)
  option(:normalizer, type: Dry::Types['strict.string'], optional: true)
  option(:processor, type: Dry::Types['strict.string'], optional: true)
  option(:url, type: Dry::Types['strict.string'], optional: true)

  option(
    :options,
    type: Dry::Types['strict.hash'],
    optional: true,
    default: proc { {} }
  )

  option(
    :refresh_interval,
    type: Dry::Types['strict.integer'],
    optional: true,
    default: proc { 0 }
  )

  def call
    option_names
      .map { |target| [target, send(target)] }
      .filter { |_, value| value.present? }
      .to_h
  end

  private

  def option_names
    self.class.dry_initializer.options.map(&:target)
  end
end
