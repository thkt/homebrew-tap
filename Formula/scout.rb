class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.2.0/scout-aarch64-apple-darwin.tar.gz"
      sha256 "fb51def349bf3ec43e0f409fad1fa2de83d0f5f222d09d15a06b5e2c2d7aff54"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.2.0/scout-x86_64-apple-darwin.tar.gz"
      sha256 "8c8ddd0a2277921cb49ddfe1da6286aaa62b06279895e174cb79cbe301cf2dce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.2.0/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3886795783dc0ac5552992fbb21578c2ddd19cecbc3be9ebd371b5cce8f4595f"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.2.0/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cb85395a5ae55aa07904b62a2128910e31ef273290a97245dec0cb451f06039"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
