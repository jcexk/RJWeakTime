Pod::Spec.new do |spec|
  spec.name         = "RJWeakTime"
  spec.version      = "1.0.0"
  spec.summary      = "弱引用的NSTimer"
  spec.homepage     = "git@github.com:jcexk/RJWeakTime"
  spec.license      = "MIT"
  spec.author       = { "jcexk" => "2542700177@qq.com" }
  spec.ios.deployment_target = "9.0"
  spec.source       = { :git => "https://github.com/jcexk/RJWeakTime.git", :tag => "#{spec.version}" }
  spec.source_files  = "RJWeakTime/Classes/*.{h,m}"
  spec.requires_arc = true
end
