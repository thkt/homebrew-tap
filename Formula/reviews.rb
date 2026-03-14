class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/reviews"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.5.1/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "378edd8b55466b5a508b78774834405332a51f418c5dd50b58711e43e7703e9a"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.5.1/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "d13c8302b10d0b628d6282c4d4b12d43d78302a3e76b94631419c0e5efc5bb08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.5.1/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "453e93a5ff3e906955781c25cd2b74170972c6b3983624f0f2dba52299bee3bd"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.5.1/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f738a6514090fcef3040e68b929c8f6da5ddf6f7cd058477b75942515bb16eaf"
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
