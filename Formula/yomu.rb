class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "0a56c3420e0da66913577c8963f7d2c4b435b59ec0d77bbd841f02fcd00c9af3"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "b5f860e617e1e24c1faa06bb364826bb30f2017e8b7e102c9e5e418c25b1880e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbb1ba9d30a80983ca358f5a2efca7bffbbb8be44382c79b1c2fcc393791c3c7"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d2f2b250534a1aa9c132af25e5d8aaeb28720983eff028c53235ece4242fcd2"
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
