class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.6.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "6abc9e97b5eb9a52df533a74fe9ce2793ca1067ba83dc58e00a2a498f09fb9c8"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.6.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "8cbb7235c33d81bb4661e5320aaa999d1973d9933a89cb16841fe8a7a73ad0db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.6.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d4b63b1443ae3bc46baf2583d6c70252e51fa839d56dee2023b9039492ac2a3"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.6.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c95d80ff4205b0dc5e8a5b206fd95cb513f564eee5b7e42896dc2a1705b0e609"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
