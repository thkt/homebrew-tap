class Yomu < Formula
  desc "Frontend-specialized semantic code search CLI"
  homepage "https://github.com/thkt/yomu"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/thkt/yomu/releases/download/v0.12.0/yomu-aarch64-apple-darwin.tar.gz"
      sha256 "9db26d46f108446eef6f50a7f2dd321aa951527062edf956a49db5964db3b323"
    end
  end

  def install
    bin.install "yomu"
    bin.install "mlx.metallib" if File.exist?("mlx.metallib")
  end

  test do
    assert_predicate bin/"yomu", :executable?
  end
end
