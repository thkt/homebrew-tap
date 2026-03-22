class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.9.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "7557c1771c57395923ef9fe50c74201be5d50de002e34cd86c59e8feced8f88c"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.9.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "1bc7f0ae9faca609752321739bd6037347a97b00e584e9d07046a461aa909bb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.9.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38367d09ce2ce2d0de8004440cc5593a77e35cb0ed8d29e24db6b95731cf934f"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.9.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35a0bc9e48cf02028904fdbfb68803ef0c9e199465fe0f56fe75712d8e5a9a1c"
    end
  end

  def install
    bin.install "yomu"
  end

  def caveats
    <<~EOS
      Set your Gemini API key for semantic search:

        export GEMINI_API_KEY="<your-api-key>"

      Get your API key at: https://aistudio.google.com/apikey

      Usage:

        yomu search "button component"
        yomu index
        yomu impact src/hooks/useAuth.ts
        yomu status
    EOS
  end

  test do
    assert_predicate bin/"yomu", :executable?
  end
end
