class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.1.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "e76cbe4f42bc74a87c2b549e079abcd6ae2023ff2b5acf4c091268cea38ebe5c"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.1.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "dd1b7e06a65d80af3223f72d75d0dfe9e70d40c6a619e3ddec7af619ec9fd909"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.1.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f79e31f48742a46f7b2a3966aa7eab2c3f46d6d9bdbd41c2b3644a7afe49568e"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.1.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c11daa6654e1df83ef8a2caa85da4fb6149f4da3899a59c82fe74f76f847385"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
