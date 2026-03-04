class Recall < Formula
  desc "Full-text search CLI for past Claude Code and Codex sessions"
  homepage "https://github.com/thkt/recall"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.1.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "62c00a6f4e43f3279073d4b0414cdab5a2882e911b720fbf6bb984e4446078ea"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.1.0/recall-x86_64-apple-darwin.tar.gz"
      sha256 "98c04a44e45da1134be29998c1a106caa25ecefca9e64ca20b4275e16b944fd7"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
