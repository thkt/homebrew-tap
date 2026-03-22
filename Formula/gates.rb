class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.9.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "fbbaae1a6831389ef58007a024f6e4d2b8392e78d8ff8fe16d2e29b19fba128f"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.9.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "e9575cd3a19833b017582255c5a28dfa60950c9581af10a8dc68f3b8fa9e22f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.9.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e379727d93d0ced159740069b97939e0ccbebbeb574479af47f9a4735318b42"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.9.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "213a7c1cd3cdc3799a7e35d49f78fd5b89b51f672aab1808614b7a7cd0f54e00"
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
