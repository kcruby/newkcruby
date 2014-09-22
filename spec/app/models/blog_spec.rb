require 'rails_helper'


RSpec.describe Blog, :type => :model do
    it "can be instantiated" do 
    	blog = Blog.new
    	expect(blog).to be_a Blog
    end

    it 'can be assigned a title' do
    	blog = Blog.new
    	blog.title = "Blog Title"
    	expect(blog.title).to eq("Blog Title")
    end

    it 'can be assigned a message' do
    	blog = Blog.new
    	blog.message = "Blog Message"
    	expect(blog.message).to eq("Blog Message")
    end
end




