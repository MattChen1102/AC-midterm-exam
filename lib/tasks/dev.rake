namespace :dev do
		task :fake => :environment do

		puts "Create Fake data"

		Post.delete_all
		Comment.delete_all

		user = User.first

		20.times do |i|
			p = Post.create( :title => "Post #{i}", :user_id => user.id)
			20.times do |j|
				# new_comment = p.comments.new
				# new_comment.comment = "Comment #{j}"
				# new_comment.save
				p.comments.create(:comment => "Comment #{j}")
			end
		end
	end
end