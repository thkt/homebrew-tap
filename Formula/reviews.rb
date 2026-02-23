class Reviews < Formula
  desc "PreToolUse hook for Claude Code - pre-flight static analysis for /audit"
  homepage "https://github.com/thkt/claude-reviews"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.1/reviews-aarch64-apple-darwin.tar.gz"
      sha256 "91108c8b99e597187ee4e2cb1ae429163078292aa2d0500f34fb24585f0bb06f"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.1/reviews-x86_64-apple-darwin.tar.gz"
      sha256 "209e2e5624b694595b6da422dd3d03be7473fe251d36c3bdff56507ec688b9aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.1/reviews-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e95c73290acac69f0cb024bc35f3579e6f346a6c1576454899a7a20088bb30f8"
    end
    on_intel do
      url "https://github.com/thkt/claude-reviews/releases/download/v0.1.1/reviews-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4161d60502a7b7aab8563a006db5e81981ba99048108a9bee7c2f4a08648fd12"
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
