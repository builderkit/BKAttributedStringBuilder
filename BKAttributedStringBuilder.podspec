#
#  Be sure to run `pod spec lint BKAttributedStringBuilder.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "BKAttributedStringBuilder"
  spec.version      = "1.0.0"
  spec.summary      = "@_functionBuilder for NSAttributedString."
  spec.description  = <<-DESC
  @_functionBuilder for NSAttributedString, using NSAttributedString as SwiftUI style.
  Project Link: https://github.com/builderkit/BKAttributedStringBuilder
                   DESC
  spec.homepage     = "https://github.com/builderkit/BKAttributedStringBuilder"
  spec.license      = "MIT"
  spec.author             = { "xiaolong.jin" => "xiaolong.jin@icloud.com" }
  spec.swift_versions = '5.1'
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.11"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"
  spec.source       = { :git => "https://github.com/builderkit/BKAttributedStringBuilder.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources", "Sources/**/*.{swift}"

end
