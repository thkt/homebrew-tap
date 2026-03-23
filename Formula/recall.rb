class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.5.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "b42c375a77208e218b1a8c036f6e1b198ea507b9dbdf732ebb0e51b00cfcb161"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.5.0/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab84408d0e76ca9e64463f558e07f6d91141f14d1f6d397a021575837aa3c2e5"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end

