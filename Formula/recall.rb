class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.4.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "0f54f7c26bb7e941da180a06a59e25cf397c6eba796e5770f77313ba07ee327e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.4.0/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a8ac37a0121326b91c94d266df53d5b8f2930f688c54449ac4f4a47f1c02a49"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end

