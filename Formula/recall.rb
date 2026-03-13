class Recall < Formula
  desc "Full-text search CLI for past Claude Code and Codex sessions"
  homepage "https://github.com/thkt/recall"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.2.2/recall-aarch64-apple-darwin.tar.gz"
      sha256 "d39ad6bc5ff23421535bc8a8e6e15974503764ad36e6967cb169d9ba2780e86c"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.2.2/recall-x86_64-apple-darwin.tar.gz"
      sha256 "1e33f266c14e5b272ae017dfd16ac7bda8706aa4af3cc5116732a6bbf1324306"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.2.2/recall-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57b1c7eae90259861ccd48f399100a6510cb7dc531e7b78be4c2255890f552ef"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.2.2/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f6b37da34fa8e50ac908cf4454d3e29e1636a6520fc4abad1792322d10ed016"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
