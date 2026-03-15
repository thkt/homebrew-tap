class Recall < Formula
  desc "Full-text search CLI for past Claude Code and Codex sessions"
  homepage "https://github.com/thkt/recall"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.3.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "c9ab5f6c5fdf2260c344583f148a0b942e38a73a3754c67eea642c3878af72d1"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.3.0/recall-x86_64-apple-darwin.tar.gz"
      sha256 "b138c97f0bf02d6afe375b4a3bd679652e30dd5872482612190b0694b0c6d350"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.3.0/recall-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a096788e63922760c9c6b02796783521e285acbff16a700ff3a9d38a102564f"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.3.0/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1b037c6fea5c8445b7afdc9cb98b5b3139553748312ae172cca7e6a70ff3077"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
