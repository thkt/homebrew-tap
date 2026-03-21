class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.6.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "6f0895ec6a76c133030bdf46add59c81235ce7dbda635a349b2d479c23378213"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.6.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "c9993f8319f67eb368d98ecc5dd0e1ea1c54aadded21e03eb7f0b47aa670667e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.6.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "963e5f1ca76c860ec57279d317585ef436ab67e75f96e30d43d26a432ea4665f"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.6.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "498ce100b6edf8fa59f632be95199ace1dd85e14da8dfe5d0f9135075477fa85"
    end
  end

  def install
    bin.install "gates"
  end

  def caveats
    <<~EOS
      To use gates with Claude Code, add a completion hook to ~/.claude/settings.json.
      See https://github.com/thkt/gates#usage for details.

      Enable gates per project in .claude/tools.json:

        {
          "gates": {
            "knip": true,
            "tsgo": true,
            "madge": true
          }
        }
    EOS
  end

  test do
    (testpath/".git").mkpath
    assert_equal "", shell_output("#{bin}/gates #{testpath}")
  end
end
