class Chronicler < Formula
  desc "Documentation lifecycle hook for Claude Code - staleness detection and update reminders"
  homepage "https://github.com/thkt/chronicler"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.2/chronicler-aarch64-apple-darwin.tar.gz"
      sha256 "b48f51b3aced1ae419ea3c01e69516f7a984be860ce13bce7d3f495465d74a31"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.2/chronicler-x86_64-apple-darwin.tar.gz"
      sha256 "2935c0023544cdedea63004fa03fb6e191f460e060feb194bad9b0597a72227e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.2/chronicler-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d104cfa9c87b9a489612f476b9457d39c3da12b46ec80ba3fe6dcbfba2b2b3e"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.2/chronicler-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df6515277a8db6e5bfb2fc52dd6bbc23b641c2d881099f8a8f250bee49a33547"
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
