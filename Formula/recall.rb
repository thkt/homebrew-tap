class Recall < Formula
  desc "Search past Claude Code and Codex sessions with semantic search"
  homepage "https://github.com/thkt/recall"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.6.1/recall-aarch64-apple-darwin.tar.gz"
      sha256 "664ba584add07f8c3f3fd9b91fdde597217e1d3605f0f9b707bbd7b34df07143"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.6.1/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28f24e4c45879b7151161dac15a20ed2582295f20c80430cc87e3689e3b42323"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end

