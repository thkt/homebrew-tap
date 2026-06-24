class Gates < Formula
  desc "Completion hook for Claude Code - parallel quality gates (knip, tsgo, madge)"
  homepage "https://github.com/thkt/gates"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.11.1/gates-aarch64-apple-darwin.tar.gz"
      sha256 "eda9927c7dd5435d58403ddbd3637c107e05e42e3602c997b3f015bd3902efb5"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.11.1/gates-x86_64-apple-darwin.tar.gz"
      sha256 "084287805d71d0aa4e2403e5a31d24e81fbd39eb60abacb4e9fadab71acc328c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/thkt/gates/releases/download/v0.11.1/gates-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a4b30180cc0d9b72c764e2e58ef24d22ff36056061d7fa35d3aacba400dd5e4"
    end
    on_intel do
      url "https://github.com/thkt/gates/releases/download/v0.11.1/gates-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c026500f0dde22ef6b9f8a9c2f525aa23869a15143d589abf4296e80f3d79eb"
    end
  end

  def install
    bin.install "gates"
  end

  test do
    (testpath/".git").mkpath
    assert_equal "", shell_output("#{bin}/gates #{testpath}")
  end
end
