class Yomu < Formula
  desc "Frontend-specialized semantic code search MCP server"
  homepage "https://github.com/thkt/yomu"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.4.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "0c88b5546e11d4b8bb34cb524b4aecda947f82b9488a402396f26baa922c10a4"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.4.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "8530ff89c27f1b6189eec33825943095e580862c41a9c1db9d8673eae793db22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.4.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3a05c288872a7030bfc85a09e654f7514266b92711544d30c77c329b337eda0"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.4.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "beab4e052545fcc35a0d3fd2d471ebe94ee1e8963c118ce8391aa8ef5002ba24"
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
