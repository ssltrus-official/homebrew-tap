cask "code-sign-gui" do
  version "1.5.2"

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12461/gui/SSLTrusCodeSign-darwin-arm64-v1.5.2.zip"
    sha256 "e3295d70239085dc08fd7b7f255ee1850fab9082fe7b9c1c396df4e20d56f827"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12461/gui/SSLTrusCodeSign-darwin-amd64-v1.5.2.zip"
    sha256 "a571739ae23b59439a2ced2fe48844402205012d238c64e06dfa0374e270982b"
  end

  name "SSLTrusCodeSign"
  desc "SSLTrus code signing desktop application"
  homepage "https://www.ssltrus.cn/remotecodesigning/"

  container nested: "SSLTrusCodeSign.dmg"
  app "SSLTrusCodeSign.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "/Applications/SSLTrusCodeSign.app"],
                   sudo: true
  end
end
