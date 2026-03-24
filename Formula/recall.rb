class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.6.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.6.5/recall-aarch64-apple-darwin.tar.gz"
      sha256 "5a372f4c98ec4c4237ab9edbf075e8d5c7087f6eb92d97f3d8ea92e7caf8c01b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.6.5/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4506c23fb39147ff6838c509d7ab8685364225fbb83f3603813366ade0271b3f"
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
