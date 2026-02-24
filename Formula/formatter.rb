class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.5.0/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "30a5536425db03ba61042432330f7fdcf82f4c7375f8e56d39f26a5d50e3ba01"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.5.0/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "e87d066ff86fc104826cc8e3adefd29123507f6aba9867dc0f42c651bfbd9d7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.5.0/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fbf9a8fad666dffd386b58eca0c57bb11a11fc53fd2c30228a378ec80c48721"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.5.0/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c68241ea9fa1cb468ed2165cb65ee492109bb8b49ef816e43a9a2b239d7e03c5"
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
