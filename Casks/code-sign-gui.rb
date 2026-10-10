cask "code-sign-gui" do
  version "1.6.1"

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/13002/gui/SSLTrusCodeSign-darwin-arm64-v1.6.1.zip"
    sha256 "5a89a305178ea3cc4078787cf12a878c6fcead5c808d9527d83d1cad0953c833"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/13002/gui/SSLTrusCodeSign-darwin-amd64-v1.6.1.zip"
    sha256 "453f2033d40a0d0c041ff8d4c4078bef42eaff815cd2111998a2282300d20e43"
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
