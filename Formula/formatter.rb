class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.0/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "8bd3d2042b520ec8647f94350e15d8a9617ef7e8278418e6311c5243735464aa"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.0/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "9b24434488410532722bc1a482046c46680d2b8e63c6ad5f337b9708158bebd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.0/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "abc48fc37e2ea7971fe317bec0d9a2e53293c97e21aa3c71f9770a6619b36d8c"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.0/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d38e4a7d8d9c95e28f3c6443fbf43798d802507be4c7d9cdec6fb0802216ec1"
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
