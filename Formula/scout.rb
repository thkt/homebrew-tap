class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.1.2/scout-aarch64-apple-darwin.tar.gz"
      sha256 "57d8d6c21e720e06048b65baa21a37ab53a9b09627bb3d20fc976856dbaf5cbd"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.1.2/scout-x86_64-apple-darwin.tar.gz"
      sha256 "3e23cddaaeee5186205f0d7e75f8fc8491904bd3447571fb44f63a1e6473306d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.1.2/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6cbc9905ab404c70d746752897d184bcbe4dbff219df5e010245c16ab7155ad4"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.1.2/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "271e53ba04e0bdb21a8a51966a6e6ed4c19724452c4de37e29104ab434ad468d"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
