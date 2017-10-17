Pod::Spec.new do |s|
  s.name     = 'FUNama'
  s.version  = ‘1.1’
  s.license  = 'MIT'
  s.summary  = 'faceunity namaSDK'
  s.homepage = 'https://www.faceunity.com'
  s.author   = { 'jdbbjd' => '1090336995@qq.com' }
  s.platform     = :ios, "8.0"
  s.source   = { :git => 'https://github.com/jdbbjd/FULiveDemo.git', :tag => s.version }
  s.source_files = 'FULiveDemo/Faceunity/FaceUnity-SDK-iOS/**/*.{h,m}'
  s.resources = 'FULiveDemo/Faceunity/FaceUnity-SDK-iOS/**/*.{bundle}'
  s.ios.vendored_library = 'FULiveDemo/Faceunity/FaceUnity-SDK-iOS/libnama.a'
  s.requires_arc = true
  s.ios.frameworks   = ['Accelerate', 'AVFoundation']
  end