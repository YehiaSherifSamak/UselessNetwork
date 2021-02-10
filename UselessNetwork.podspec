Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "UselessNetwork"
s.summary = "Useless Network helps you in manging your network."
s.requires_arc = true

# 2
s.version = "0.2.0"

# 3
s.license = { :type => 'MIT', :text => <<-LICENSE
                   Copyright 2012
                   Permission is granted to...
                 LICENSE
               }

# 4
s.author = { "Yehia Samak" => "ysamak17@gmail.com" }

# 5
s.homepage = "https://github.com/YehiaSherifSamak/UselessNetwork"

# 6
s.source = { :git => "https://github.com/YehiaSherifSamak/UselessNetwork.git",
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"
s.dependency 'SDWebImage', '~> 5.0.0'

# 8
s.source_files = "UselessNetwork/**/*.{swift}"

# 9
#s.resources = "UselessNetwork/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5"

end
