module ControllerMacros
   def login_admin_for_controller_test
     before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:admin]
       admin = FactoryGirl.create(:admin)
       sign_in admin
     end
   end
 end

# Sources
# https://github.com/plataformatec/devise/wiki/How-To:-Controllers-tests-with-Rails-3-(and-rspec)
# http://stackoverflow.com/questions/11002721/authentication-with-devise-in-rspec-tests

# Adapted by specifying "_for_controller_test" because controller tests need a different
# sign-in method than features.