class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.4.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "a83ba4a86e5d61035cc2a5cc1270a1cea7bb7301cc5ab3364093264689b5a130"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.4.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "b4af8a13ac5fd3b1970e3b76db4a3e96c96f7c51b5cc7fdd346cf8503f08e889"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.4.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8e2ebfead2fa68bbd5c48d5474ea061aeeb05e51a94ea00e63cadf9affdb74d"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.4.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42e1458b06299ee9518293733363390591f12cf04f9380868a638dec69227ff9"
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
