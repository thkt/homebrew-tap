class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.14.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "4964c1d8dd11cdd7eb444a24cca83cd573de90077ee3a5ff990fcdba4ea7e59a"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
