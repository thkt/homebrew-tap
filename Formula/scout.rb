class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.7.1/scout-aarch64-apple-darwin.tar.gz"
      sha256 "7c494aa6132e432f0c1c69369a42b71bf109acdd43fea9cad0f2a28a28b022e1"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.7.1/scout-x86_64-apple-darwin.tar.gz"
      sha256 "18b0d0ad31861211707755bd700351570aad69516a575aa5e666ea32119bc638"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.7.1/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32b4eca5494f3453681e7020e742caf26b87ea9970cd075da01eea9ee311d1fc"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.7.1/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f3f9a6a4dc3c30bcdbac638873ea70847db2b0c0a0916da7e2d58934c2ab76f"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
