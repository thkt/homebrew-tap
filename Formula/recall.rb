class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.8.1/recall-aarch64-apple-darwin.tar.gz"
      sha256 "da2085a99bada1496313e02d8b6eaf63f44821c2592287ea2583ac218a40e867"
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
