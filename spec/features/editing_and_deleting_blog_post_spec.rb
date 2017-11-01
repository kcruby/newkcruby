require 'rails_helper'

describe 'blog post authorization' do 
  before do 
    @user_1 = User.create(name: 'name_1', email: 'test_1@example.com', password: 'password', password_confirmation: 'password', bio: 'short bio')
    @user_2 = User.create(name: 'name_2', email: 'test_2@example.com', password: 'password2', password_confirmation: 'password2', bio: 'slightly longer bio')
    @blog = @user_2.blogs.create(title: 'test title', message: 'test message')
  end 
  
  def login(user)
    visit signin_path
    
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_button 'Sign in'
  end 
  
  context "links to edit and delete a blog post" do
    it "are hidden if the user is not the author" do 
      login(@user_1)
      visit blog_path(@blog)
      
      expect(page).to have_content(@blog.title)
      expect(page).to have_content(@blog.message)
      expect(page).to have_content("by #{@user_2.name}")
      expect(page).to_not have_content("edit")
      expect(page).to_not have_content("delete")
    end
    
    it "are exposed if the user is the author" do     
      login(@user_2)
      visit blog_path(@blog)

      expect(page).to have_content('test title')
      expect(page).to have_content('test message')
      expect(page).to have_content("by #{@user_2.name}")
      expect(page).to have_content("edit")
      expect(page).to have_content("delete")
    end 
  end
  
  context 'actually editing a blog post' do 
    it 'can be done by the author' do 
      login(@user_2)
      visit blog_path(@blog)
      click_link 'edit'
      
      fill_in 'blog[title]', with: 'updated title'
      fill_in 'blog[message]', with: 'updated message'
      click_button 'Save'

      expect(current_path).to eq(blog_path(@blog))
      expect(page).to have_content('Blog was successfully updated.')
      expect(page).to have_content('updated title')
      expect(page).to have_content('updated message')
    end 
  end 
  
  context 'actually deleting a blog post' do 
    it 'can be done by the author' do 
      login(@user_2)
      visit blog_path(@blog)
      click_link 'delete'
      
      expect(current_path).to eq(blogs_path)
      expect(Blog.where(id: @blog.id)).to be_empty
    end 
  end 
end 




