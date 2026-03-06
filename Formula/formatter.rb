class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.6.0/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "354ea82e537ac295a8a632863b0ac7458d845d406d89acbe8a41e4abc320e54a"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.6.0/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "2b74490d815c394a7724a607a6e76d41492136a5040d54e709a689841dc4bfea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.6.0/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b2726ceb8dc6a3d343131b6bf7e7cc6a44404297efe6d0f95e98dedc8229fbb"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.6.0/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ff4cc0231edae89123e51d8a8f249380542cb10c20256cc99e7d48d525dbf70"
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
