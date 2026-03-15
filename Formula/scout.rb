class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.4.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "116fd7941a65029dfe4652420541eb166b682596e7a51e2cd698e5f1c32700f8"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.4.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "6a6d5289165b3443725319860a8706ada350bbf20cdb9ba25450ef10cdfe541d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.4.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e98ab7d5e6275acddb2e0814cdd8a36cc00f31208e7012537773a7584348ed8"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.4.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "771902f2f02b63e5f4ef50b6c0659a09e2a174719d02ae1dd83cd3b66791a57c"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
