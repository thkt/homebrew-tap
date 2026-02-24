class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/claude-reviews"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.3.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "14545813434b1502219b6da2bc20b10adb8403655905062fd3e45ce873bd1523"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.3.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "2219cefa6529fc99b4ca766b3ee8f3178fd9c1922216521e16283c6c8236a865"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.3.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fa9ac0fa5b9446b3c5d5452d0e594a384f0ebdc2e67bdea379403221424fe2e"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.3.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be7df285a3484dfc401cdaaf6a72c096c3c5b8bbca476a340cd895fc822bb0d5"
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
