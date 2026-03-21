class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.7.0/gates-aarch64-apple-darwin.tar.gz"
      sha256 "979994e0489565247e7567524a7fdc69dd3bb149e4d32e53d9a026325b91fd6a"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.7.0/gates-x86_64-apple-darwin.tar.gz"
      sha256 "f8e2922722ca7f5df0c7380b8378d886246f4f51e38f21e3117e6d3c22211658"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.7.0/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "840a68239acab9536fedcd4db994f02ae943978730460934517e75927552c80e"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.7.0/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a741bb53fcc616ff25cf65edfe77cb2e8363be0694d13a597aabae8a967a2c0"
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
