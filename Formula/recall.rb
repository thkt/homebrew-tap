class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.4.1/recall-aarch64-apple-darwin.tar.gz"
      sha256 "5dfd4b03cc8515868fb6ce95de0aa81e4f198adfca9a7383759f5fb97b120128"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.4.1/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c39844e6e48eecbbb11e449e1e203acaf9f052120e4495a3f13c4798d178c2c"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end

