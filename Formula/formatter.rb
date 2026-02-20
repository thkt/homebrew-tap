class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.2.0/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "a8d4bfe5ad6c2f66b7300afa296e23a6b1d5f9bd3900c7a2566642042cc53a22"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.2.0/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "55366b171ae2af17de758bb639c3ceaba17313db8bdbefff030f0b7460b59b07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.2.0/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3eacaab5b395743875a44f73ff599a1b841e9fc2a44b6e15bfa3533472cf2e64"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.2.0/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef9ed813567cfc5d7051277d6112e54e1e8ebfa217c76daea6be8702027bd811"
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
