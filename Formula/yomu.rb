class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.10.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "07e5f3b04fc7aa7548bd4236a259d9618692fee182a652a6a2e918dbb63bfc6f"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.10.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "2f86016178e2f85342a3b8aa80e9189f7b808dd5fde9c3dd96ae5fa28332a055"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.10.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e9b536cd5261feead3e1986fdc89775136d8158244a6f75541153151b7f4636"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.10.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c651344a907297b9e21e891633ac6bc0ee4dd50c8853b171b7fde6e6e220bed1"
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
