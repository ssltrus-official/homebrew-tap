class CodeSignCli < Formula
  desc "sslTrus code signing command-line client"
  homepage "https://www.ssltrus.cn/remotecodesigning/"
  version "1.6.1"
  depends_on :macos

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/13002/cli/signtool-darwin-arm64-v1.6.1.zip"
    sha256 "00fd44e6622e7e09ed460618950359de8d2032baa03e396c740f2da9722e3c1b"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/13002/cli/signtool-darwin-amd64-v1.6.1.zip"
    sha256 "818d47b48ef304860ecc18b58c5d6908aaca3ddef084da3a25a5bbf08ec2717b"
  end

  def install
    bin.install Dir["signtool-darwin-*"].first => "signtool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/signtool --version")
  end
end
