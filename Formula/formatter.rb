class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.1/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "d1443a8ffbc62806be73a1f3e4e52e7bf3838976ebf51f7465b820223298a643"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.1/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "794f0a738a104820db50f5f6c6968d079c2947e9ab26e842c10f25a809b85a3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.1/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d0a76024bcabc3634f2073e7bf2717bf78eb5222fd8f094504ca3d958a83085"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.8.1/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4f7c3a24e873880d6c0dfcdb2596cf7c5424c97754a900239c49ce5dda9b98b"
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
