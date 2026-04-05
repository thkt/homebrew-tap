class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.7.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "bc87a0a8e5ed7905036c674bf9443a40c4999aa0a8b80bc2d17b5e770333ba16"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.7.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "a14417fa0a1c6bf66c9fe2afadb7507e8ffd0e9aabb5881e711e3edeb05458bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.7.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33fc7b7f7627d6a1791420cda1551a105659a1f5347bb37d5a081b16e48175bc"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.7.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "792d95b1127f0785cb971f5a9f12768d92ea7600e8603ae64d4bf05d7877f0f0"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
