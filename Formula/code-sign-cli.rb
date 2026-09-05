class CodeSignCli < Formula
  desc "SSLTrus code signing command-line client"
  homepage "https://www.ssltrus.cn/remotecodesigning/"
  version "1.5.2"
  depends_on :macos

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12461/cli/signtool-darwin-arm64-v1.5.2.zip"
    sha256 "1762d71ede7f98769bfe2aa1730eae41b807dee0b05d7f1756f61d6b6f9ea4b9"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/12461/cli/signtool-darwin-amd64-v1.5.2.zip"
    sha256 "d21defb728acbf47c1f1f8b6e6b7569094ba4baed5bd4235e4eb1cc82a2589d5"
  end

  def install
    bin.install Dir["signtool-darwin-*"].first => "signtool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/signtool --version")
  end
end
