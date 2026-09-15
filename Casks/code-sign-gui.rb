cask "code-sign-gui" do
  version "1.5.4"

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12463/gui/SSLTrusCodeSign-darwin-arm64-v1.5.4.zip"
    sha256 "f15a8140ab7296ac31fa48d3cc6443b400537d10083e987a7d6e7adbf91c0bf9"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12463/gui/SSLTrusCodeSign-darwin-amd64-v1.5.4.zip"
    sha256 "7344f248d5704c8e167a08498c4395d74f6cd37d36e85070f902666dc0eca5b0"
  end

  name "SSLTrusCodeSign"
  desc "SSLTrus code signing desktop application"
  homepage "https://www.ssltrus.cn/remotecodesigning/"

  container nested: "SSLTrusCodeSign.dmg"
  app "SSLTrusCodeSign.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rd", "com.apple.quarantine", "/Applications/SSLTrusCodeSign.app"],
        sudo: true
  end
end
