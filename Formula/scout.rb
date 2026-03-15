class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.3.2/scout-aarch64-apple-darwin.tar.gz"
      sha256 "909d62c872fb9be09adb4a33bc8d5f77c035ef1cf177e357956a2d2e1f0473f8"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.3.2/scout-x86_64-apple-darwin.tar.gz"
      sha256 "d396b52dc30e8ee89763b0e127e3d841686ba6f81952e1462cd64932c3288070"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.3.2/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57437f1a57451f98f8b05c31beb467d50c37a0362febc5f066114abf868ddde1"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.3.2/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34abca502c861608fa87ee6cf6c842c9215e097f632c4f9f11e9fb7931e357a3"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
