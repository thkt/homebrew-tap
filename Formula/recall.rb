class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.16.1/recall-aarch64-apple-darwin.tar.gz"
      sha256 "52ffa9384b32a367500f27354a5877090008bb7b46a81a849e6c2c4f4415e15f"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
