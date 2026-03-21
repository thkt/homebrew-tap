class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "44e64cba13d6510428beeb46942da9aa30ef095ad634c6ad904c7c7721ef5bfa"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "10a043a5e2af20eb975a19fc2bfb8e013b03bc83f040e46eac0901633807e9fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9dd8937188b392937b26bdfa473ddeea5757a909c5caa4bd3cd17ac962ca917e"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6e9d26126648f7e35d13e8a1ddce336c6c0c3328e6a05eb548d685dad3c123c"
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
