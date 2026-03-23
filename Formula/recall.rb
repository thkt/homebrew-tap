class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.4.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "e74bca136aebaeec896ca5a5dcbca62b1c3945d5709fe2a777d47c90e2eb43d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.4.0/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54dbca4f3e0cc2faac27398b9ca02379fe26087eb3abc1e10824f6ebfcf3a744"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end

