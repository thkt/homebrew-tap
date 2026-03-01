class Yomu < Formula
  desc "Frontend-specialized semantic code search MCP server"
  homepage "https://github.com/thkt/yomu"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.3.1/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "8fa10246494cf1bcf1043032623548f80191845c1e3ca9ee375facb367b02ef8"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.3.1/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "dd34b1e7018314ad35505a72ae67a2ce57faa2f863bd8dcc1878ae9c9a606151"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.3.1/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76344993f5637d53ac67e753cd47b38dab80ee769ae6978b6512113a0b17eac3"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.3.1/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bdc73853701e487d92a0084d1529a8e21bf1666904b4bb65b589af8e1b517e6"
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
