Pod::Spec.new do |s|
  s.name        = "Scrollable"
  s.version     = "1.0.4"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/exchangegroup/Scrollable"
  s.summary     = "An iOS control that makes content scroll vertically. "
  s.description  = <<-DESC
                   This an an iOS library that helps scrolling screen content vertically, similar how the content is scrolled in the web browser.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/exchangegroup/Scrollable.git", :tag => s.version }
  s.screenshots  = "https://raw.githubusercontent.com/exchangegroup/scrollable-content-ios/master/graphics/scrolling-content-vertically-autolayout-ios.png"
  s.source_files = "Scrollable/**/*.swift"
  s.ios.deployment_target = "8.0"
end