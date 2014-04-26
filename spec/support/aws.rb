# Create method for stubbing uploads to Amazon Web Services
# From http://devblog.orgsync.com/2013/03/07/stubbing-external-service-calls-with-rspec/

shared_context 'stub s3' do
  def stub_s3(method, success = true)
    AWS::S3::S3Object.stub(method).
      and_return(double('response', :success? => success))
  end
end