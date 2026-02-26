class Yomu < Formula
  desc "Frontend-specialized semantic code search MCP server"
  homepage "https://github.com/thkt/yomu"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.1.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "0738b424128249518f14dfaeb78037a73933977f50b0166670d6c62f2a760d97"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.1.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "d058cfe82bb031ef3252867105f3fe7d251da591841be47ac872524e3ce7c710"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.1.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6cd8bad21f4de276b948c6b315daf19d399ba54ef6e53be331eb3924146d4596"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.1.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41bca916065e09d43626223723fd20fd04ed045b7a7bd387285350663633c579"
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
