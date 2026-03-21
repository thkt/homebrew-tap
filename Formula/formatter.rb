class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.2/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "162cb0dff1bfa15131ca935efe1c2347fdd5bd2f408c1c4ef94cb9704cb6c990"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.2/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "121eda82a7cf852f473f23fe95d784a69630092f293036cf843cdd4d5635865a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.2/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "995a6d1cbc7ed359e218277a676a8ee08ce49c6a6b31a16d6f7794539d45fc05"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.2/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b9d075ddae40b5b7a840da7bb20d6728196af93e0c58f45f80c8ed706f0c407"
    end
  end

  def install
    bin.install "formatter"
  end

  def caveats
    <<~EOS
      To use formatter with Claude Code, add to your ~/.claude/settings.json:

        "hooks": {
          "PostToolUse": [
            {
              "matcher": "Write|Edit|MultiEdit",
              "hooks": [
                {
                  "type": "command",
                  "command": "#{HOMEBREW_PREFIX}/bin/formatter",
                  "timeout": 2000
                }
              ]
            }
          ]
        }
    EOS
  end

  test do
    output = pipe_output(bin/"formatter", '{"tool_name":"Write","tool_input":{"file_path":"test.txt"}}', 0)
    assert_equal "", output
  end
end
