def login_admin
  @admin ||= FactoryGirl.create(:admin)
  visit new_admin_session_path
  click_on("Admin Login")
  fill_in("Email", with: @admin.email)
  fill_in("Password", with: @admin.password)
  click_on("Sign in")
end