class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.5.1/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "5740a20ff5040d3ac21881e6f6c6ff14ca1983fbefd5e56b5e53b8092f164342"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.5.1/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "5ef08aeab769c2427dfffd1970c8821232e70c7599b9138816341b53205f88c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.5.1/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f139f189e0f5b0f1233ef1850abe0f10981cc06d3d721a4128901ebc2620c8b2"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.5.1/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2842c527a2b51fd5b51c4a6f508ce1849c82453bcf6b6c4cfc824eae2fa2de62"
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
