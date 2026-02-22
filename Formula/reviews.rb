class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/claude-reviews"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "48e2b9b208193a11b2c443a7234469ba39272da4d180212e6967ae495aa2f923"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "6d19d5d8db8a4531f0f5f0f351d5cfc8344932f888a05ddb07d6e120aa446c65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f6497d5c9dd22980e016b3e852c66513ca2e5165b4797eee55d6a0bb7f338fb"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd7d880e6759fcd6d1516984987adc87b02544ce9a1849001adede30c887fdac"
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
