class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.3.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "21844f846a4b9cb02b69b5986a39ce898e0dd74554c5cc2a16db363ab4817a42"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.3.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "43cb7ff4dc390f54158c723f1ddf3e1cb512cba7bf5206f9fd9a13ac8b44497e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.3.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1272ced9dbe032a3b75bc54f99614f63939f90b4a91892127af558b4279591c3"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.3.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c45cc592c449186d256a3182481b167eb7eb96d9bef2f2aa95d508457e1cbb05"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
