class Chronicler < Formula
  desc "Documentation lifecycle hook for Claude Code - staleness detection and update reminders"
  homepage "https://github.com/thkt/chronicler"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.1/chronicler-aarch64-apple-darwin.tar.gz"
      sha256 "70d0985e9089a196c09c853cdd3c01a009c1b0e9b1bdb5f468d39dcb1ccea54d"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.1/chronicler-x86_64-apple-darwin.tar.gz"
      sha256 "e1e43ce8d19c372f48a1e42a3fb6cd66e7325a6f199321d7886a06781439fb04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.1/chronicler-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "137917ce148c2957beae6a0dd4eccab80af6c37c6fd45695e028a4bb7b233833"
    end
    on_intel do
      url "https://github.com/thkt/chronicler/releases/download/v0.2.1/chronicler-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68b0446ada265fef79b47d0961214c36019e140235919f52ba939a55974f71aa"
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
