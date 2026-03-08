class Recall < Formula
  desc "Full-text search CLI for past Claude Code and Codex sessions"
  homepage "https://github.com/thkt/recall"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.2.0/recall-aarch64-apple-darwin.tar.gz"
      sha256 "f04ba37ed824d2900aa9c41a19b14fb080c54aa43c914f8d306141d1f2e19eb4"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.2.0/recall-x86_64-apple-darwin.tar.gz"
      sha256 "4f1c2954d4b733fe59a7b585019ef4bf0352c139e424fda9d2a1472668ca3204"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/recall/releases/download/v0.2.0/recall-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06b6f9546f99cff10269c50f310c18b53777b6dbeef62d231a1836da3a5f1f8a"
    end
    on_intel do
      url "https://github.com/thkt/recall/releases/download/v0.2.0/recall-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "623efb1b41715fb65f940696c7940ce8d5fac49883d33efdb13f7c9710221e41"
    end
  end

  def install
    bin.install "recall"
  end

  test do
    assert_match "recall", shell_output("#{bin}/recall --help")
  end
end
