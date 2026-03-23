class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.6.2/recall-aarch64-apple-darwin.tar.gz"
      sha256 "edbebf640c5af84f86f011395aa743b579f39de5fd29b192610e491aef59b6f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.6.2/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c8800ea4bd72b81f2cabf03789c9b0360aa1ab2a7ce3cd25671c2bb23468c07"
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
