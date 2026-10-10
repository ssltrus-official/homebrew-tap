cask "code-sign-gui" do
  version "1.6.0"

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12963/gui/SSLTrusCodeSign-darwin-arm64-v1.6.0.zip"
    sha256 "5b24d73ba64562cbe7a868c2861a869951d09f7b81b4a00c191bfcf4b2de9afa"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12963/gui/SSLTrusCodeSign-darwin-amd64-v1.6.0.zip"
    sha256 "d37b490bdc2fa531cb626aa1e0a9d8e07fd58d287b9c6bc2145fb0b4de839eb5"
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
