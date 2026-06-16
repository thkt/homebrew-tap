class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.10.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "3c647d1515a165a1114129451d0d0b668f12c8dfc7502dba5f0cd1f2c2af595a"
    end
  end

  def install
    libexec.install "recall", "mlx.metallib"
    bin.install_symlink libexec/"recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
