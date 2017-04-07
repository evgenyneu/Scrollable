Pod::Spec.new do |s|
  s.name        = "Scrollable"
  s.version     = "2.0.1"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/marketplacer/Scrollable"
  s.summary     = "An iOS control that makes content scroll vertically. "
  s.description  = <<-DESC
                   This an an iOS library that helps scrolling screen content vertically, similar how the content is scrolled in the web browser.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/marketplacer/Scrollable.git", :tag => s.version }
  s.screenshots  = "https://raw.githubusercontent.com/marketplacer/Scrollable/master/graphics/scrolling-content-vertically-autolayout-ios.png"
  s.source_files = "Scrollable/**/*.swift"
  s.ios.deployment_target = "8.0"
end