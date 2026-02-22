class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/claude-reviews"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "1cedf96149a6608927893f31d7457ca7ebbb122ce3d2d2a416bfaa6165f2c9e7"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "39834c76ac3ffccedeb3d017aad40b86a2e582a388c4899a70f0ee930f39cf34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cab7373bfa69b4e82271df758ce1037d8e307f53f186b82a5b47881f1d4a4221"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f5983e4d9f01ba0eac9b93850a51e3a26bc3d297c9e685d294b11b07d3902b9"
    end
  end

  def install
    bin.install "reviews"
  end

  def caveats
    <<~EOS
      To use reviews with Claude Code, add to your ~/.claude/settings.json:

        "hooks": {
          "PreToolUse": [
            {
              "matcher": "Skill",
              "hooks": [
                {
                  "type": "command",
                  "command": "#{HOMEBREW_PREFIX}/bin/reviews",
                  "timeout": 45000
                }
              ]
            }
          ]
        }
    EOS
  end

  test do
    pipe_output(bin/"reviews", '{"tool_name":"Skill","tool_input":{"skill":"commit"}}', 0)
  end
end
