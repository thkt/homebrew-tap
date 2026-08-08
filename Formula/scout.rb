class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.4.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "06b27d80919e420829c1b5028c91d77afb632be4b07ff6b388365110265cbcb4"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.4.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "79706d188edb71a0d276e301f580c71f952aa2836f2272925e4fd34e268ae6a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.4.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b40c5dcf9186fab9448844f4b2f87a48262f5719a7e35873ee2ecfb176f77c6f"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.4.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43114fa379aedf0d92445973771c358e49c972dd0bb5ba303940f95c802d7493"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
