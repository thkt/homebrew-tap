class Litmus < Formula
  desc "Test quality linter for TypeScript/JavaScript - detects tests that pass but verify nothing"
  homepage "https://github.com/thkt/litmus"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/litmus/releases/download/v0.2.0/litmus-aarch64-apple-darwin.tar.gz"
      sha256 "a9ee197876b62f1ee9e263fb26fac9eb2ad2561ac9b9cbc303e38a1ec9dc28e4"
    end
    on_intel do
      url "https://github.com/thkt/litmus/releases/download/v0.2.0/litmus-x86_64-apple-darwin.tar.gz"
      sha256 "22c9f139cd4ce04b8bc9e828d7a9a62d12f2a85ec2957a076cf6cb3446b6da59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/litmus/releases/download/v0.2.0/litmus-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba76b781d497e3c7ccd48d42d5145a43026cebdd58f3f11fb64c593eccde4284"
    end
    on_intel do
      url "https://github.com/thkt/litmus/releases/download/v0.2.0/litmus-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "184fea68b6856efef8359ed52f8eff5e2bb8ed6b7c62a68a0fab072919fe7516"
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
