class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.10.1/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "3f1718e7a20262e937d29c94b8cd5faedfe29e8911be08403d37f0a7802bd3d6"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.10.1/yomu-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.10.1/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.10.1/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 ""
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
