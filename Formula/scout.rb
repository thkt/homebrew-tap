class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.1.1/scout-aarch64-apple-darwin.tar.gz"
      sha256 "15538cb3d76c450d73faf424519892fe546afbccfbf210b22c0491a6c93f10c4"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.1.1/scout-x86_64-apple-darwin.tar.gz"
      sha256 "60c0357923131cc0a7b26ac06a9f30b269b0b50be808e0ea368afe7b8bac9529"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.1.1/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87d349c7951b188361cd37c616e17e43122c73e69f5d6b134010313f42dcbc6c"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.1.1/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3686939e3a3612248c04209fc70979ff3f39eb3cf2d79e89b3bf4f7d78285674"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
