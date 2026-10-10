class CodeSignCli < Formula
  desc "SSLTrus code signing command-line client"
  homepage "https://www.ssltrus.cn/remotecodesigning/"
  version "1.6.0"
  depends_on :macos

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12963/cli/signtool-darwin-arm64-v1.6.0.zip"
    sha256 "72ace40dd5f5960a6c7eae39fcdd60dc24a52236cafb32c0298d3fba1bd8c313"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12963/cli/signtool-darwin-amd64-v1.6.0.zip"
    sha256 "ff916e2b7dc0db1d246f62eb2907be58fee8820951e5cb251402e510868757c0"
  end

  def install
    bin.install Dir["signtool-darwin-*"].first => "signtool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/signtool --version")
  end
end
