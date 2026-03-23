class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.4.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "240a22ec6c17fcdb777ba07c1d7400781de43d70743af7beb78678701d07c9c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.4.0/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9fca46a22567170580e30778e0ea7849bfdab655feda71898ceacd7f4bb4404c"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end

