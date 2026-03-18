class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.6.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "26a7024c5a4ae1912139f945d725fc9d936cdb7ea83379e8544889a69ff40058"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.6.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "d69be89d75cd26e88ce4bf732e13f2ef182d77ad5c686d1714d290adc457ad08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.6.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f472afebb021316ef37d8fb827a625d81f351e9da00822005532a8635c88a55f"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.6.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d275844072769bb4bf97c1f0be3da5c955395903eca8750dd9a371a126398e0"
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
