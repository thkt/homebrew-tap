class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v1.1.1/scout-aarch64-apple-darwin.tar.gz"
      sha256 "356448935039bcbdbaf33f10f63042004334f9c7eeeaecc6851c430e3b1d3fab"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v1.1.1/scout-x86_64-apple-darwin.tar.gz"
      sha256 "845772ca9edf82df3799167ca1ab1c66706767507bf09d419f25a5b698def618"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v1.1.1/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a31f6aaa7357473b4aa012bf5e4696dc58e09bae2ac1f64aa6647507705fe9c"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v1.1.1/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "873953c2e90ffed1443a818f186e6cf1f60fffef8caf061894b1aaa7100fd30a"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
