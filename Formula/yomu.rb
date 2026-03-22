class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.9.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "74a04e7c9a6865634f51dced0a4cf6db946e79f59035925c67a859f168b4bf05"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.9.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "2e52a3217562243b159ef49ed3e0311b6e0f140a4491b0188f74c2929019a832"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.9.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9710c081915cece26896b9cb7597b4e1980b15fcf0efc5cafa887518d47b6950"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.9.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e9c7fabeef3161c18fb18928f9f1fa70e4190edb21af88d7de456ee526d70a6"
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
