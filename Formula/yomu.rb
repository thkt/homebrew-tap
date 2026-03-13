class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.5.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "f704e1355b9fec018134e75996ab36201fff2729a0fa71393edbcc5dc4553699"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.5.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "5e231b186f660cea3809b704664bfddded22bdb0905ca324d9963da889bc4d5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.5.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e46af37d2a045b202e1db2dbb3c14035e55ead10dec147aa7b493d7b1466f285"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.5.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a25430978901cbbf1833fb51404ae03dc1e99969e97963dd2b11bfa56db000dc"
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
