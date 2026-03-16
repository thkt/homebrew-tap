class Chronicler < Formula
  desc "Documentation lifecycle hook for Claude Code - staleness detection and update reminders"
  homepage "https://github.com/thkt/chronicler"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.0/chronicler-aarch64-apple-darwin.tar.gz"
      sha256 "e2ff6ace540a211048b36010ae980c515c842a344f68775b8159b0b4730cd7e5"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.0/chronicler-x86_64-apple-darwin.tar.gz"
      sha256 "aa1b074667e10d3cccc1964622268c90cc8114b4e5bf274804183f74b0271914"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.0/chronicler-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "799be9ff6213e3017e266eef4f020a608abe45d4aaa89b1f88d365b5421b766f"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.0/chronicler-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5df1618aa0d8a871a1bf881da15fc706f6430b2cc07d23e228251fa0d30e998"
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
