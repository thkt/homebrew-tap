class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.6.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.6.4/recall-aarch64-apple-darwin.tar.gz"
      sha256 "8fc68a50d5829c3ea8d675cc15e19f20526ac1a662d73efc63fc0ec9f05ce5a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.6.4/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4506393835df4482a8af7b224c9bc0ab16ef30b7caa61e19dbe6382709bedcc9"
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
