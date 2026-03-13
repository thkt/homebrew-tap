class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.3.1/scout-aarch64-apple-darwin.tar.gz"
      sha256 "5fce29ac3dc40bd495a9122817bc63b2d00ca44f287e4b5c3ec7b447c782207c"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.3.1/scout-x86_64-apple-darwin.tar.gz"
      sha256 "07d1d01ec7e041f883a8d44178dfb39432981b0d9ce1e643edcd243181b49987"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.3.1/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5770e1753f472f2370696a615add31fa1f156d5e828da4b6196f445cc7a3cb1"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.3.1/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2633b7e25845952cbdfc33c253e3d40800a987c485b7d949273633756b2dfbd9"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
