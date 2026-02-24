class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/claude-reviews"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.3.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "bceae2031cc4dad74641f72762beddead2b290024967065a2e10eb1a7ee93948"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.3.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "527c5a53a65ae62bf65cce8005d8c6b5992d6d383526663e57ba6916066d62f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.3.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9e08f1c136c6ee25ab3c0bb6428ceaf59c5d20c3bafadc5b2e1a910d671faeb"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.3.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e84586645423c5da29fa3dbe372c08972adf51623abdc65eb69d1a1cdf9e0df"
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
