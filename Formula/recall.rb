class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.11.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "ff320eb28bb96723363defe4f6a0b57e7ab33207007e572cc00ca1b736ec67d7"
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
