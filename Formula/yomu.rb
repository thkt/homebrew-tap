class Yomu < Formula
  desc "Frontend-specialized semantic code search MCP server"
  homepage "https://github.com/thkt/yomu"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.2.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "ca6c14a9d19b18e5c50bab3fa09426c209c87c18369ea520b5ee71b34e2bdf29"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.2.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "25d980c81cae70f5b9a8093d9ca220807b0fff858b2732853af7fa21bd3281e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.2.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a00e1833df7336ebd452a17989caf4807351b371f64af594339c21e13f62eb58"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.2.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61f5120aff157d5e0cdf40e9cc722b15ba5ac9934f02032ca2c884ea98913a86"
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
