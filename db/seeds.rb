class Seed

  def self.start
    seed = Seed.new
    User.delete_all
    List.delete_all
    Article.delete_all
    seed.generate_users_and_lists
    seed.generate_articles
    seed.articles_into_lists
  end

  def create_user
    User.create!(
      email:      Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name:  Faker::Name.last_name
    )
  end

  def generate_users_and_lists
    user = create_user
    5.times do
      user.lists.create!(
        name:     Faker::Lorem.word
      )
    end
  end

  def generate_articles
    50.times do
      Article.create!(
        url:      Faker::Internet.url,
        title:    Faker::Name.title,
        author:   Faker::Book.author,
        body:     Faker::Lorem.paragraph
      )
    end
  end

  def articles_into_lists
    List.each do |list|
      articles = Article.all.sample(10)
      articles.each do |article|
        list.articles << article
      end
    end
  end
end

Seed.start
