class Chronicler < Formula
  desc "Documentation lifecycle hook for Claude Code - staleness detection and update reminders"
  homepage "https://github.com/thkt/chronicler"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.1/chronicler-aarch64-apple-darwin.tar.gz"
      sha256 "ddc5f6a55977eaa07fa27ea233e680f7cf1eba42df94c15dee16d73941a2972b"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.1/chronicler-x86_64-apple-darwin.tar.gz"
      sha256 "a7967fa8ca53e462a7bb55d63d0a688e935f1208408886058e38e1dd0416c75d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.1/chronicler-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7ee339877ee3b5566bb0fdae8810559b52520efda1d25342385f806ff2da7f7"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.1/chronicler-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33bbfd9e1e4b9f1a73d8b393d3893b645849635d978b695db90ad9f36479af5c"
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
