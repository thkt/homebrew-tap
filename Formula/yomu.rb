class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  url "https://github.com/thkt/yomu/archive/refs/tags/v0.10.2.tar.gz"
  sha256 "3696e89b59e6624c06fdfe6c40dca10f3693d0e19876273245ea90ec518b8940"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/yomu"
    metallib = Dir.glob("target/release/build/mlx-sys-*/out/build/lib/mlx.metallib").first
    bin.install metallib if metallib
  end

  test do
    assert_predicate bin/"yomu", :executable?
  end
end
