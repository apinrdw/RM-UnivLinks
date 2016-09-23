# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'UnivLinks'
  app.identifier = 'com.test.univlinks'
  app.short_version = '0.0.1'
  app.version = app.short_version
  app.deployment_target = '9.2'
  
  app.development do
    app.codesign_certificate = "iPhone Developer: Jonni"
    app.provisioning_profile = "signing/profiles/Test_Universal_Links.mobileprovision"
    app.info_plist['NSAppTransportSecurity'] = {
      'NSExceptionDomains' => {
        'crowdvoice.me' => {
          'NSIncludesSubdomains' => true,
          'NSThirdPartyExceptionRequiresForwardSecrecy' => false,
          'NSTemporaryExceptionAllowsInsecureHTTPLoads' => true,
          'NSTemporaryExceptionMinimumTLSVersion' => 'TLSv1.1'
        },
        'devmac.local' => {
          'NSIncludesSubdomains' => true,
          'NSThirdPartyExceptionRequiresForwardSecrecy' => false,
          'NSTemporaryExceptionAllowsInsecureHTTPLoads' => true,
          'NSTemporaryExceptionMinimumTLSVersion' => 'TLSv1.1'
        }
      }
    }
    
    app.seed_id = "Y7H5UC8BZ9"
    app.entitlements['keychain-access-groups'] = [ app.seed_id + '.' + app.identifier ]
    app.entitlements['com.apple.developer.associated-domains'] = [
      'applinks:www.crowdvoice.me',
      'applinks:id.crowdvoice.me',
      'applinks:en.crowdvoice.me'
    ]
    app.entitlements['aps-environment'] = 'development'
  end
  
  puts "Name: #{app.name}"
  puts "Using profile: #{app.provisioning_profile}"
  puts "Using certificate: #{app.codesign_certificate}"
end
