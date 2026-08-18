class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "28d872f08a755a4a343241747e04cf65df6e59da962c35f16564375874784d27"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "413754b86fd41542b65e75f2ac37cd1d13fa0cbdf113626ced5b2cd1fa8841d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.6.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e131ed6ad5fa2e51ee07aeb40bd42b381fea34a19092fdc0806af5f121977db"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.6.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "468ae35820f9a15d6717a2c60f2f17b4e8da985febf606aea77166ae99c6d09d"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
