class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/reviews"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.7.0/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "b8d24545c2af4ee88bbd61815d7e42392132e05264836c83db76dea354586b1c"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.7.0/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "13c4150abf889020805b8c5e01a71b075221d62e3d2f265ce716aae431c075c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/reviews/releases/download/v0.7.0/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f0c2653bbf42d438de02041c61adff3e1b1dcb29fd2d1fa8a8e25907695b948"
    end
    on_intel do
      url "https://github.com/thkt/reviews/releases/download/v0.7.0/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85afe33328cbecd0a52f15adbdf989c16e281febe00004f0e7721cd718aee495"
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
