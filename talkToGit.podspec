Pod::Spec.new do |s|
  s.name         = "talkToGit"
  s.version      = "0.0.1"
  s.summary      = "测试"
  s.description  = <<-DESC

                  测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试
                   DESC

  s.homepage     = "https://github.com/AzraelWang/gitTest"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "wangzhiming" => "azraelWang@163.com" }
  # Or just: s.author    = "wangzhiming"
  # s.authors            = { "wangzhiming" => "azraelWang@163.com" }
  # s.social_media_url   = "http://twitter.com/wangzhiming"

  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/AzraelWang/gitTest.git", :tag => "0.0.1" }

  s.source_files  = "cocoaThis", "cocoaThis/*"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
