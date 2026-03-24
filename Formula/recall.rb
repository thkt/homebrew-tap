class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.6.3/recall-aarch64-apple-darwin.tar.gz"
      sha256 "7b52e05f65ee2318861042b114c85685012f53d1c55d2c0aa1f43c6ac498e2fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.6.3/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcaac27a5c5bdb3ba76527f1ee79631b0e0a026f57d5cbc407ee3261c4314ab4"
    end
  end

  def install
    if OS.mac?
      libexec.install "recall", "mlx.metallib"
      bin.install_symlink libexec/"recall"
    else
      bin.install "recall"
    end
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
