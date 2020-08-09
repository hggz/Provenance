# :frozen_string_literal => true

# Be sure to run `pod lib lint PVSupport.podspec' to ensure this is a
# valid spec before submitting.

Pod::Spec.new do |s|
  s.name             = 'PVSupport'
  s.version          = '1.5.0'
  s.summary          = 'Provenance support framework'

  s.description      = <<-DESC
  PVSupport is a iOS/tvOS library for the Provenance platform.
  DESC

  s.homepage = 'https://github.com/Provenance/Provenance'
  s.license = { :type => 'Provenance License', :file => 'LICENSE.md' }
  s.author  = {
    'James Addyman' => 'james@provenance-emu.com',
    'Joseph Mattiello' => 'joe@provenance-emu.com'
  }
  s.source = {
    :git => 'https://github.com/Provenance/Provenance.git',
    :tag => s.version.to_s
  }

  s.cocoapods_version = '>= 1.8.0'

  s.swift_versions = ['5.0', '5.1']
  s.platform = :ios, '10.3'

  s.ios.deployment_target = '10.0'
  s.tvos.deployment_target = '10.0'

  s.frameworks = 'GameController'
  s.frameworks = 'Foundation'

  s.module_name = 'PVSupport'
  s.header_dir = 'PVSupport'

  # s.dependency 'CocoaLumberjack'
  s.dependency 'CocoaLumberjack/Swift'
  s.dependency 'NSLogger'
  s.dependency 'PVLibrary'

  @sources_root = 'PVSupport/Sources'
  @sources_common = "#{@sources_root}/**/*.{swift,h,m,mm}"

  s.public_header_files = %w[
    DebugUtils/DebugUtils.h
    PVSupport/NSFileManager+OEHashingAdditions.h
    PVSupport/NSObject+PVAbbstractAdditions.h
    PVSupport/PVGameControllerUtilities.h
    Audio/OEGameAudio.h
    Audio/OEGeometry.h
    Audio/OERingBuffer.h
    Audio/TPCircularBuffer.h
    EmulatorCore/PVEmulatorCore.h
    Controller/*.h
    Logging/PV*.h
  ].map { |file| "#{@sources_root}/#{file}" }

  s.private_header_files = %w[
    Audio/CARingBuffer/*.h
    Threads/RealTimeThreads.h
    Logging/XCDLumberjackNSLogger.h
  ].map { |file| "#{@sources_root}/#{file}" }

  s.source_files = [
    @sources_common
  ]

  s.test_spec 'PVSupportTests' do |test_spec|
    test_spec.requires_app_host = false
    # test_spec.test_type = :ui
    test_spec.source_files = 'PVLibrary/Tests/**/*.swift'
  end
end