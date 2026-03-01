class Yomu < Formula
  desc "Frontend-specialized semantic code search MCP server"
  homepage "https://github.com/thkt/yomu"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.3.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "d342798f15de61a44adbd6fa1b19e71bb7baca33c09ddb5d731485e30648fed6"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.3.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "12f039070aeea081ba4542589560059c8fca9c8a0050446a7556627a91b7e3a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.3.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f72477b88425ee90c9c23258f61c50832ede609d24dd67e5ed881c9b75efa4f4"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.3.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e53fbfc289654a33d0633fa8c856ce47e336a0035a010cb7a14200196c313b9"
    end
  end

  def install
    bin.install "yomu"
  end

  def caveats
    <<~EOS
      To use yomu with Claude Code, add to your .claude/mcp.json:

        {
          "mcpServers": {
            "yomu": {
              "command": "#{HOMEBREW_PREFIX}/bin/yomu",
              "env": {
                "GEMINI_API_KEY": "<your-api-key>"
              }
            }
          }
        }

      Get your Gemini API key at: https://aistudio.google.com/apikey
    EOS
  end

  test do
    assert_predicate bin/"yomu", :executable?
  end
end
