class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.7.1/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "aa96f22fda0a4b5829e2286f487031631bff99362f1d00654ca64cf5d89fdfb6"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.7.1/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "565e63972881e9c5057b75f20c3ddc3e8c1b1624f4da21b17945fa343c2f6077"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.7.1/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "000176e1c72bd15e93bb47a0d9bf6f08bf5b937d3b8858aaf621829e6e518d74"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.7.1/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2f78d9c167d038673eb23fd13897e76a5f68184d5c1e2ec2268bb068c2ece09"
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
