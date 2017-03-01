class ExportJob < ApplicationJob
  queue_as :default

  def perform(article)
    article.export_speech
  end
end
