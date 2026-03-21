class Chronicler < Formula
  desc "Documentation lifecycle hook for Claude Code - staleness detection and update reminders"
  homepage "https://github.com/thkt/chronicler"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.2/chronicler-aarch64-apple-darwin.tar.gz"
      sha256 "670c71e3462a239ed2964a77cf703336b0872cdd30ad60c12df05ba1d6dbeca9"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.2/chronicler-x86_64-apple-darwin.tar.gz"
      sha256 "2096e392e167440a00c3a1d3cefa7550733d7fe9dc1a784d5be90e7b703d508a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.2/chronicler-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee6082796ef2d64d6e2df34355d24c48dd26ab455b4473fcb37d3c20d6b19401"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.3.2/chronicler-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af5b6814dddedbc1413e8e1d96532c393057d3a9de03e8d06f87df2157fe8a56"
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
