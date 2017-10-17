Pod::Spec.new do |s|
  s.name     = 'FULiveDemo'
  s.version  = '1.0'
  s.license  = 'MIT'
  s.summary  = 'faceunity namaSDK'
  s.homepage = 'https://github.com/jdbbjd/FULiveDemo'
  s.author   = { 'jdbbjd' => '1090336995@qq.com' }
  s.platform     = :ios, "8.0"
  s.source   = { :git => 'https://github.com/jdbbjd/FULiveDemo.git', :tag => s.version }
  s.source_files = 'FULiveDemo/Faceunity/FaceUnity-SDK-iOS/**/*.{h,m,a}'
  s.resources = 'FULiveDemo/Faceunity/FaceUnity-SDK-iOS/**/*.{bundle}'
  s.requires_arc = true
  s.ios.frameworks   = ['OpenGLES', 'CoreMedia', 'QuartzCore', 'AVFoundation']
  end