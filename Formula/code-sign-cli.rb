class CodeSignCli < Formula
  desc "SSLTrus code signing command-line client"
  homepage "https://www.ssltrus.cn/remotecodesigning/"
  version "1.5.4"
  depends_on :macos

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12463/cli/signtool-darwin-arm64-v1.5.4.zip"
    sha256 "024f96cb39e929d00b516ad709f5f13b9e482b2322ebeea2530ad2c6ab88bf5e"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12463/cli/signtool-darwin-amd64-v1.5.4.zip"
    sha256 "2662bad5b2f3f9192ceec35c5307af0346640a174ca4e4add0fee5a5d3f2134a"
  end

  def install
    bin.install Dir["signtool-darwin-*"].first => "signtool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/signtool --version")
  end
end
