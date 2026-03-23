class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.4.1/recall-aarch64-apple-darwin.tar.gz"
      sha256 "6288c78b7b2a9719d20ad1ec9179c234bc63d9609d6498638884d2604243749a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.4.1/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a092a568e844e13fa9d87e462ea9f21a08ea8c7152aad4de2ce8be7b6e19386"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end

