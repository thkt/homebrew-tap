class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.2.1/scout-aarch64-apple-darwin.tar.gz"
      sha256 "211805502341d1be5f770b477f1bc9c9babe47d027a58c71e1c923dafba519e4"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.2.1/scout-x86_64-apple-darwin.tar.gz"
      sha256 "d0847a6badff549972a55e052cffcf5972d292ac9f46af1e12902a910624c6e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.2.1/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c2e86742eaec8bd419629efcba2f52d1b98256312c73d8448d9499e9c41cf03"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.2.1/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67a2e27eeefb9cc8a83ff96c68035d6f926d57e7bc77bd141ae390c43512f1c3"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
