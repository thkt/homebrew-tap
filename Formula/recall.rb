class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.15.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "2492c7e5c752024330b0c1492898ab8d6507a56d30c2f835282362bcdd97c0e6"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
