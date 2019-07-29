module Service
  class ProcessorResolver
    include Callee

    param :feed

    def call
      available_names_for.each do |name|
        safe_name = name.to_s.gsub(/-/, '_')
        return "processors/#{safe_name}_processor".classify.constantize
      rescue NameError
        next
      end
    end

    private

    FALLBACK_PROCESSOR = 'null'.freeze

    def available_names_for
      [
        feed.name,
        feed.processor,
        FALLBACK_PROCESSOR
      ]
    end
  end
end
