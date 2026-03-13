class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.3.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "1f8a753615a6bdda162833d0e1496c0fbf7b7968938247b31b7fa512f6810b32"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.3.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "39a6778e6884ea33c0feafb3f7fbf6c1f4d82e7e8172eeed77e7263d6bfda909"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.3.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23ee4df5ea02f8ba75efbadd82d479d9131fc917d08b53e2c83c3c33ddc97868"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.3.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c92cad5155e17bdfaf2200bd531000d6caf4916ea66f6a2042f362474c75aa03"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
