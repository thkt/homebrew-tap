class Litmus < Formula
  desc "Test quality linter for TypeScript/JavaScript - detects tests that pass but verify nothing"
  homepage "https://github.com/thkt/litmus"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/litmus/releases/download/v0.1.0/litmus-aarch64-apple-darwin.tar.gz"
      sha256 "080125dca95eeb930137c9d1ef65e3da6aa35cd1db67ec0e151ae584b1e34625"
    end
    on_intel do
      url "https://github.com/thkt/litmus/releases/download/v0.1.0/litmus-x86_64-apple-darwin.tar.gz"
      sha256 "8c52599c47107ba45e9169fa9c0e4a195ba4379d39be679ec5cdbe9aa0dc81a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/litmus/releases/download/v0.1.0/litmus-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0a039c40e1a5f770e46ab5fe4c2675d5d34c342bb91e65b44647a2ff70be8e8"
    end
    on_intel do
      url "https://github.com/thkt/litmus/releases/download/v0.1.0/litmus-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55effcc449756af80122a334783947e4ca9b9f9cad945b35a3fd89c785b3d045"
    end
  end

  def install
    bin.install "litmus"
  end

  test do
    (testpath/"clean.test.ts").write('test("returns correct user data when authenticated", () => { expect(1).toBe(1) })')
    assert_equal "", shell_output("#{bin}/litmus #{testpath}").strip
  end
end
