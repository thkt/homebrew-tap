class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/claude-reviews"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.2/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "b0666c6df9510964469c142c33ced8e253fc205825d428bf872b6ee4d4191303"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.2/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "fd5e32958da214ab27e3f2c827955a1d5dd08d9e97ffb84d3cc0e6d2ea58d778"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.2/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10edf260a7b4ba2e52be0158c69a553e5fc597a138b46793f97ad25787d90faf"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.2/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f63992f79d325138e1202c656157d8aab42af6c32563a485f119a2ba5ed09b24"
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
