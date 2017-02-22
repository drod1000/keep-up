class ListArticle < ApplicationRecord
  belongs_to :list
  belongs_to :article
end
