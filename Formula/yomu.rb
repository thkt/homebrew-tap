class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "f276fa62c35242e3abac12c976bd1cbf7300a669d6fb0fbd240b18159addd1d8"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-x86_64-apple-darwin.tar.gz"
      sha256 "5999b7d67e1a168fba0c092c5ed5bca19c56817807a303f2df8759b792bc0bd5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f27215c01cfadbfd83f42ba5d3d00c4d6199d27568858943fe2003598ecc59bf"
    end
    on_intel do
      url "https://github.com/thkt/yomu/releases/download/v0.8.0/yomu-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ea095e767b9b3aaf89d75e04c5a4957e37b53fa8716dfaaf5aed5a14830505f"
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
