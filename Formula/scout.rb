class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.0.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "25bafaac89ce05ec9a589c350edac641fbe4aec15c7b3a1706f1fdabc454887b"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.0.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "f26a38e1dbc3cfc4cb18a789cb3338213ddb5858da021e94d592645c3b936f8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.0.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c89082791d69ed749a4f0f6372990c021d871c37d92ce6c927b8b74bc6c6f49c"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.0.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8bd41ef950446c779fcd1176249c4f73e859c057508d4022e90363d48d57cfd"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
