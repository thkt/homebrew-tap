class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.6.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "168fd862eda14e9a786a87d1bff304740403e8298c8970cb5267deba8cac73ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.6.0/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92880b5f892823b8074fe8c1bdf25a465a07d14be6bd116b668043d95bb29d89"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end

