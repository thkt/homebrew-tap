class Recall < Formula
  desc "Full-text search CLI for past Claude Code and Codex sessions"
  homepage "https://github.com/thkt/recall"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.1.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "958ee1109307032ab4192ad23ccf41eb985625b2806422075d539868f6c8f1b0"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.1.0/recall-x86_64-apple-darwin.tar.gz"
      sha256 "ccccdcb16c09013d0afd5cedd9a529caddb7b8fed45bc9f83d50b3f07915ee0e"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
