class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/claude-reviews"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.2.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "12a6cc75abd2c47803a2e8c75fe2b0be1458e8ad6444a5b9dc57b9547942cf52"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.2.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "d09da19221ca222d930bf6cca01cda16d3704cb9852e042ebbedf6c96d2c257d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.2.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13927c8ab2004f433902eeb70cfa3aa2d81a4ef64f323ea6033386a92fb9cbb2"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.2.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "103431fdb132c50d7d03a4ef89087b0b50857c4eca6b2be2852bad6a16590b7a"
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
