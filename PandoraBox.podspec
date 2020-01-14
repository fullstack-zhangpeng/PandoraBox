#
# Be sure to run `pod lib lint PandoraBox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    # Pod 名称
    s.name             = 'PandoraBox'
    # Pod 库版本
    
    s.version          = '0.3.0'
    
    # Pod 库摘要
    s.summary          = 'Improve development efficiency'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    # Pod 库描述
    s.description      = <<-DESC
    A treasure trove for developers
    DESC
    
    # Pod 库主页
    s.homepage         = 'https://github.com/fullstack-zhangpeng/PandoraBox'
    
    # Pod 库截图
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    
    # Pod 库协议
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    
    # Pod 库作者
    s.author           = { 'zhangpeng' => 'zhangpeng.0304@aliyun.com' }
    
    # Pod 库 Git 地址
    s.source           = { :git => 'https://github.com/fullstack-zhangpeng/PandoraBox.git', :tag => s.version.to_s }
    
    # Pod 库作者社交地址
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    # Pod 库最低要求的平台及版本
    s.platform = :ios, '8.0'
    # Pod 库最低要求的系统版本
    #  s.ios.deployment_target = '8.0'
    
    # Pod 库包含的文件，相对于 *.podspec 的路径
    # s.source_files = 'PandoraBox/Classes/**/*'
    
    # Pod 库中的头文件，在这个属性中声明过的 .h 文件能够使用<>方法联想调用
    # public_header_files 中的文件，必须在 source_files 中包含
    # s.public_header_files = 'PandoraBox/Classes/**/*.{h}'
    
    # Pod 库资源文件
    # s.resource_bundles = {
    #   'PandoraBox' => ['PandoraBox/Assets/*.png']
    # }
    
    # 需要用到的系统的 .a/.tbd/.dylib 等，比如 libz.dylib, libstdc++.a, libsqlite.a
    # s.libraries = 'z', 'stdc++', 'sqlite'
    # 需要用到的非系统的 .a, 比如新浪微博 SDK 的 libWeiboSDK.a
    # s.vendored_libraries = 'WeiboSDK'
    
    # 需要用到的系统的 frameworks，比如 UIKit, SystemConfiguration
    # s.frameworks = 'UIKit'
    # 需要用到的非系统的 frameworks, 比如QQSDK的TencentOpenAPI.framework
    # s.vendored_frameworks = ''
    
    # 所依赖的其他库
    # s.dependency 'AFNetworking', '~> 2.3'
    
#    s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
    
    # 默认包含的子库
    s.default_subspec = 'PBBase','PBCategories','PBTimerManager','PBFileTool','PBLog'
    
    # 子库
    s.subspec 'PBBase' do |ss|
        # 相对于 *.podspec 的路径
        ss.source_files = 'PandoraBox/Classes/PBBase/**/*.{h,m}'
        ss.public_header_files = 'PandoraBox/Classes/PBBase/**/*.{h}'
    end
    
    s.subspec 'PBCategories' do |ss|
        ss.source_files = 'PandoraBox/Classes/PBCategories/**/*.{h,m}'
        ss.public_header_files = 'PandoraBox/Classes/PBCategories/**/*.{h}'
    end
    
    s.subspec 'PBTimerManager' do |ss|
        ss.source_files = 'PandoraBox/Classes/PBTimerManager/**/*.{h,m}'
        ss.public_header_files = 'PandoraBox/Classes/PBTimerManager/**/*.{h}'
    end
    
    s.subspec 'PBFileTool' do |ss|
        ss.source_files = 'PandoraBox/Classes/PBFileTool/**/*.{h,m}'
        ss.public_header_files = 'PandoraBox/Classes/PBFileTool/**/*.{h}'
        ss.dependency 'SSZipArchive'
    end
    
    s.subspec 'PBLog' do |ss|
        ss.source_files = 'PandoraBox/Classes/PBLog/**/*.{h,m}'
        ss.public_header_files = 'PandoraBox/Classes/PBLog/**/*.{h}'
        ss.vendored_libraries = 'PandoraBox/Classes/PBLog/mars.framework'
        ss.libraries = 'z','resolv.9','c++'
        ss.frameworks = 'CoreTelephony','SystemConfiguration','CoreGraphics'
    end
    
    # 需要排除的文件
    s.exclude_files = ''
end
