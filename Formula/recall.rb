class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.13.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "bef7beedeb623dbbad0e653775ec445e9dc204d45301e7c89de5256a006b3e18"
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
