class Yomu < Formula
  desc "Frontend-specialized semantic code search MCP server"
  homepage "https://github.com/thkt/yomu"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.2.1/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "4a8c9d408fd1a801b29ee34c09441a0290f2cbf07effeea104766cea91f33874"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.2.1/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "c247fe73c59600a49c25ebf48c1ab9f17ca853acda8d812aac2c9dbf1c512999"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.2.1/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c87fa5e121759945a3fb6169449a74f114b245ecf0a20f91a0c05bf32f144063"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.2.1/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de8a1752be46b06e1f42047bff1595622e301328f8ee0bc0ba9401914087e593"
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
