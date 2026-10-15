class CodeSignCli < Formula
  desc "sslTrus code signing command-line client"
  homepage "https://www.ssltrus.cn/remotecodesigning/"
  version "1.6.3"
  depends_on :macos

  on_arm do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/13122/cli/signtool-darwin-arm64-v1.6.3.zip"
    sha256 "c84e1e4345c777672f4dc9a0f81ab3a07dc04f8d4b5d0774c08d2aecf0b5b478"
  end

  on_intel do
    url "https://pccs.ssltrus.cn/oss-code-sign-client/13122/cli/signtool-darwin-amd64-v1.6.3.zip"
    sha256 "9770ee12924e77e219149b0a4d92ccfbfb006d7cabcd5a0e6f0fe7de0d15e9a3"
  end

  def install
    bin.install Dir["signtool-darwin-*"].first => "signtool"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/signtool --version")
  end
end
