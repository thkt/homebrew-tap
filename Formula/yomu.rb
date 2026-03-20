class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.7.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "2f605fccf030259c8610f0bcf4d6cb1b6df567b5936a2b133cfd44dd5d333b06"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.7.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "7a6ba574c361ee6be1fca9f7accda01d6ba749a734f2387a8eb595f23b0c5e1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.7.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f2aaebdf386389c07784958791a838d8e7728bbae4744047a2e0e6a9d00b304"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.7.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "28d72c40deb83c026b3d1065ff924ff21d1710de11e9b0e0e1bb5318a9d629a4"
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
