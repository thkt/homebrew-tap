class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.5.2/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "1d07b764c1d0c04c7d0aa2f6db22155ee2fe60ace307235f4ea20d76b8a695f1"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.5.2/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "359bc558ae6706522162207f6bf779b699098d03722f1f0f9b90e2470b7b0095"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.5.2/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f996bdfdd00ba890f8e84e5a4e49225c823049c32ef0b23f2d310a63f0643cc4"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.5.2/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75b261f12dc78dc24148ca20c60bd535b6dcbeb245bc3ef0b86b83a21748144b"
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
