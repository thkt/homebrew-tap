class Chronicler < Formula
  desc "Documentation lifecycle hook for Claude Code - staleness detection and update reminders"
  homepage "https://github.com/thkt/chronicler"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.1.1/chronicler-aarch64-apple-darwin.tar.gz"
      sha256 "c6a40834101b37716618fafd7d02017c2107569bafc0684e40b3ee297fb23621"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.1.1/chronicler-x86_64-apple-darwin.tar.gz"
      sha256 "7ed6a19775e817240e457e674b29e21a1d5f73f0da29ff985d551242cdd906c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.1.1/chronicler-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a82e06a15db429ebb88ad9448ac785950bcf0cc62fd4ea4663a3bbe007c28f5a"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.1.1/chronicler-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3af65831e0108777c82f81032172388094bb9cc0cf1c58919138333979df921c"
    end
  end

  def install
    bin.install "chronicler"
  end

  def caveats
    <<~EOS
      chronicler can be used as a Claude Code plugin:

        claude plugins add thkt/chronicler

      Or configure hooks manually in ~/.claude/settings.json.
      See https://github.com/thkt/chronicler#usage for details.

      Configure per project in .claude/tools.json:

        {
          "chronicler": {
            "dir": "workspace/docs",
            "edit": true,
            "stop": true,
            "mode": "warn"
          }
        }
    EOS
  end

  test do
    (testpath/".git").mkpath
    assert_equal "", shell_output("#{bin}/chronicler #{testpath}")
  end
end
