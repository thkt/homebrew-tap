class Yomu < Formula
  desc "Frontend-specialized semantic code search MCP server"
  homepage "https://github.com/thkt/yomu"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.1.1/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "de5015fc3a6ae2e0e86cc2c9ca23b2dfb48ad4a3d61b4072c8d68f51e10a074c"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.1.1/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "3ef2310440bebf385ef76232aee3134560ac830cd1e88de2d120453dbec84f9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.1.1/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc987025b0d55b6ab624037a3414e27c0ccecb27662b87909283940ae108b1e4"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.1.1/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "61b8dd5122118ebb195c6a10ca6ab8f7a33d25451e72382ed1a9acd172d6356a"
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
