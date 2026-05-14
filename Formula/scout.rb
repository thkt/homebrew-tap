class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "1.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v1.1.2/scout-aarch64-apple-darwin.tar.gz"
      sha256 "a5bfca311fb69fa9a377b307f6d868d04ad6bf3f2b9a4d3dc0f18cb8cf95b6a4"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v1.1.2/scout-x86_64-apple-darwin.tar.gz"
      sha256 "10a98cdbd384da9f4701058a34c1cea94c9cc6d5373fe5ffdb707ba420651317"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v1.1.2/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04f16467453aaeccffb386e7309352d7b03e2f36ec24634313b1f0c04bd695e6"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v1.1.2/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7b25f9d5cfe6ffcd7e4475d7a3528650ba1be05c323a2dca0d6ddb6742aa3af"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
