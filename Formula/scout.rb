class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.5.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "d99733375e12e56c8a143652c1c4e40ad98097c0eeba84cb5ef10d7ecef9971b"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.5.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "b2e2c8afe19f48379cc4c3a2bf4f03a53b369c67ff50b827d7dc249bf0168e68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v0.5.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9701dfe235fb5759de16aaaf8dee6fe5bdceff1ef0379edaf4139bbe23b1e297"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v0.5.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eba9aa3aab581683befd454d8d3e673f348a594fc56a407e6bbd67e03f7d59d2"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
