class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/reviews"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.8.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "b4a3eeefec64bf64d64060ba2d9683be8ab57f78c91ecab87abc878fd1ef9fef"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.8.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "d20eae17276b260c35ef8d90c32d0217b1a5426109772c284cc8c3e0f69262d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.8.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f3ab49579b71aed985be55a50444d94f5823c1fc8b0ca2c7a78e8b0a18db99a"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.8.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "795ffdf36aef224254c0eb8adc09a7070b75e528db0cf305007cbaeaec9c801c"
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
