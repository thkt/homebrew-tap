class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.1.0/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "f558a607cb5ad0e7f65f54cf70cf687c0b65b1058b53979e489a1717ee2bb3ad"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.1.0/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "6570d79e6c43e44e2ad9e6b609224c9cdb6a212a1b9a37fca5d1444e00566d56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.1.0/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba437fed5ce5d572d519c5a09c4368f67e727305af1826403cd5817fab26bbb7"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.1.0/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f38e3c1ff82918afd69f2e9deb8243dd907fbbf78f349bc322b8bf4cf9342a86"
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
