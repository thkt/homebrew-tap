class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.1.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "ac167e3c87747545a6ceb30d3072e8eb859d766369688669e70a5c4e5958e6da"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.1.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "231e3ec206574068406ad8c3f65e60ee60bb513e15327f08ee15323386410f48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.1.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8c87d13ab1a6a2f0b1ed0d6c46fa29f237363c89faa3011520755165c65907d"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.1.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35378f8f6705bfa41b175e306b5e50132f462ff9d24422ddec31217e0daf805d"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
