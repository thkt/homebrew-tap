class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.9.0/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "4ed1242d6493ae8ae6f253b920ad70cee9bca7193c7e2e7b1fa892cf05042eff"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.9.0/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "7fff0875c07991ad3691cf25ba6fbad8a5b731885b3ad1721671992b0c67dccc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.9.0/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f28470bcb22fe989ab212b21b19174cee9685cd49943c13724dfa9032923fd6"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.9.0/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b03b1b0f2c3175f1cce6b4d65a60f0ee764dc55a90f01f882a46f715e30b73ad"
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
