class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.2.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "84a65892728224c2f00230f4cad3e86011922d65136d8a38cfbc65a35be0e099"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.2.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "a7ae208d4b7c88c2c8e69bc939fc2f0e2213f6379393ef4adf49b56093c2dafd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.2.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "966758e78cd15660c4822db09a167a9fc3e0527d31f80dad0de8944c9cd60cb0"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.2.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54cb32b9205be2b67727955ece4045184669d54aaea3a548280f0229d248b87d"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
