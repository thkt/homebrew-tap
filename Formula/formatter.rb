class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.3.0/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "7db23f25da49060fe731244dc8044eff2b25edb041aaa79f6aa33da874945414"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.3.0/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "f50af17d8e28841786197032c22f62a5f7142dddf5aa2732d23fdb5b64f359a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.3.0/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "149eabe32956751e5bd5990ac1b98ef63953af0ee6fbf458be9a7692d8aae144"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.3.0/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "750405977ad9325409d96b2ddf31e3bf36133f0b0d7f4cc98de78ae77335403f"
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
