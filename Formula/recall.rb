class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.16.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "97282e37e3f35b6facb12acb9f2563aa638c19843d256847a663b8316c84398f"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
