class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/reviews"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.5.2/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "07d2120ff9bd3558155857d4100001270a3d9a0e54593c4d443aac244a5eaaf0"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.5.2/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "ea4f10b38b072e0ab70803d588f6a5722313ab820ad4ff132fe11ea2a01e7214"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.5.2/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cee27f2ccc345cf4245915e62f4c3803559b0d9c36574baad3d77f83275890e0"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.5.2/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e347d12d989eb7dc5a477fb7773b01f2609898a4cf930bfec40d0be49d9ce35e"
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
