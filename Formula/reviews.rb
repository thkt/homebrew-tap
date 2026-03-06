class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/claude-reviews"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.4.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "db0d67aec4ca0f5d76da575452d08d2aa901ec0860c6943d1f2f2624c7b24ec4"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.4.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "843255f9ec9f080d3be1d5a85f26f889760b8a1631cb2b7f6ed42e12ceec7558"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.4.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "01696e916be30ec6aac340409e121b7a082223f1e970cc7ce4f06d1f02180267"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.4.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b932643d880d9bdcee1f8be7b836d9a9abca71a0ef5312f809926bba2cdd9c0"
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
