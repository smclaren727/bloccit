require 'faker'

# Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

# Create a custom post and check to make sure it doesn't already exist
post = [
  { title: "Test Title", body: "Sample test for the body" }
]

post.each do |post|
  Post.where(post).first_or_create
end

# Create a custom comment and check to make sure it doesn't already exist
comment = [
  { post: "This is a test post", body: "Sample test for the body of the comment" }
]

comment.each do |comment|
  Comment.where(comment).first_or_create
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

