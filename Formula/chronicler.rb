class Chronicler < Formula
  desc "Documentation lifecycle hook for Claude Code - staleness detection and update reminders"
  homepage "https://github.com/thkt/chronicler"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.0/chronicler-aarch64-apple-darwin.tar.gz"
      sha256 "49e71400bdcd6ae71568327f599fc7beda6799452f27e3e1321cd53120feb565"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.0/chronicler-x86_64-apple-darwin.tar.gz"
      sha256 "44581c8110605c18b968255d58e79b1bdf59a76b689b386b3c9d3a1ae0f9f886"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.0/chronicler-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1e3f1b5e81d9b3faa08517990062981a02c2b119826c1ccf97c5e765d4cb822"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.0/chronicler-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6880aff2f7188ae69d5a3c8c3d958cd0570343355d9f7bf08b6223dcd128be7c"
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
