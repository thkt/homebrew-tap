class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.9.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "ced8df0edb94583bba644839ab62a257b6c4aa9fbe8f5bfcd5b2844e9bd8d677"
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
