cask "code-sign-gui" do
  version "1.6.3"

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/13122/gui/SSLTrusCodeSign-darwin-arm64-v1.6.3.zip"
    sha256 "7613b9bb87bcc4335b56b099d112f20aeaf3d7f7bbcbf06ed65a2cc3d3f0bb0a"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/13122/gui/SSLTrusCodeSign-darwin-amd64-v1.6.3.zip"
    sha256 "27f00dc89817355d9ad2464feeba7a8c183ed665c206b166b1dbaf004d72fdcc"
  end

  name "sslTrusCodeSign"
  desc "sslTrus code signing desktop application"
  homepage "https://www.ssltrus.cn/remotecodesigning/"

  container nested: "SSLTrusCodeSign.dmg"
  app "SSLTrusCodeSign.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-rd", "com.apple.quarantine", "/Applications/SSLTrusCodeSign.app"],
        sudo: true
  end
end
