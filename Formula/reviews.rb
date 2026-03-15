class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/reviews"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.6.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "6f27d9c4622bce9651ad287d4c531d36114b6919a495b8aada69e307f7f4b0c4"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.6.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "22afc53a15811984633ce22f36d9e02e50cea0200ebd2e7ecd9204a51f9c3f11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.6.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ba2f55141f93fbcc34c8a85df00c90fb364890f240e645d792449b245fc5ce0"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.6.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "946b1f9182f75d1c20564a421615ee351a143a2e64917d6b3b0b6e9998d524a0"
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
