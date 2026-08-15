class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.5.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "5d496c8b4a67e5e8a9cb5109f5b810bb81086a18f647523815b4ff302b66a597"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.5.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "d2e2dd164d1976cc955b3f0e8e689e4cd3fa7d7335f923fc81207cf9e248de09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.5.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41f9c667fe0397e78272a09a848f67ef14e6fb1a09b90951b0cf2c7dbae6cc75"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.5.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77717a64972ed49e3bcbcbe1a38e58094b16c19606c7a4f19c96bedb7fa36099"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
