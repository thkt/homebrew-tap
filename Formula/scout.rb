class Scout < Formula
  desc "MCP server for web search (Gemini Grounding) and page fetching (HTML to Markdown)"
  homepage "https://github.com/thkt/scout"
  version "2.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.3.1/scout-aarch64-apple-darwin.tar.gz"
      sha256 "59c2f75d6ded321378bcc8d56b567c422fa3e2f1b0172be58ef1656203840be9"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.3.1/scout-x86_64-apple-darwin.tar.gz"
      sha256 "dfd9f417aa2dda91579ca2268acf4104594337557e1946b2e29a8ca0ad6ce8d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/scout/releases/download/v2.3.1/scout-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "425741c401baf64894fd0df3055e64459fa7c318530bbde33bf03a4bf94bf4d2"
    end
    on_intel do
      url "https://github.com/thkt/scout/releases/download/v2.3.1/scout-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6359877c978e426b5cbdf19ea239ef4a992ee06e75b36a897982af2f7b23a30d"
    end
  end

  def install
    bin.install "scout"
  end

  test do
    assert_match "scout", shell_output("#{bin}/scout --help 2>&1", 2)
  end
end
