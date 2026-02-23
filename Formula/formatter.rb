class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.4.0/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "df12e2f062e1f0e8f929c996aa778574afa3bf507b1aeda806c369cf51cd925c"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.4.0/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "07efcda6001a9e3e493a768a27d90749083c1b5c4b555ae74135a7630c565cea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.4.0/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc19172bbdbf36a3a597ab2bab77ab206725a24582e7b4bdc888e36eb66fcab7"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.4.0/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1dbccf2ae7ecec3ed5c4dd85188583ef88ee835ee5e7fcffe0f299fca353ac7d"
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
