class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v1.0.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "ad7a15bfd036b0573bc65cffa86a23037cbd4f3fb1a3b466cc201e005c08e48d"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v1.0.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "020382125db9cba3a127f484c2a38a4d82f1ffde7e5cbc5fad901b7d0d480e9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v1.0.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b331ac9b3be96a92542b6c8b667f10993bb6ed437feb3f69ce6477c4dbf62293"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v1.0.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9c921f18b17e0549f7b61744064353e51f9d44aad78bcaa7363337ce2533be8"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
