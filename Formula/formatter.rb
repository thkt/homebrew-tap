class Formatter < Formula
  desc "PostToolUse hook for Claude Code - auto-formats files using biome"
  homepage "https://github.com/thkt/claude-formatter"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.3.1/formatter-aarch64-apple-darwin.tar.gz"
      sha256 "64a0833fd71b73aa736440a9270a0196a47680f99a5aed7c00ac70e174a7d297"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.3.1/formatter-x86_64-apple-darwin.tar.gz"
      sha256 "ff663b30b9f545451b584f9331e0eb4af2238a9139bfb3f70faaac64adf1cafb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.3.1/formatter-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "836e02ea2b118f5be4ddc4cdf0ef6933b385822fbae84210c4b04ae2d4af0a4a"
    end
    on_intel do
      url "https://github.com/thkt/claude-formatter/releases/download/v0.3.1/formatter-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a517d246d734da8b04435a664d2494ad6529f37825f047e7e9af48aa43e760bc"
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
