class ZeHarness < Formula
  desc "Terminal-based AI agent harness"
  homepage "https://ze.dev"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :ventura
    on_arm do
      url "https://downloads.ze.dev/releases/v0.5.1/ze-harness-v0.5.1-aarch64-apple-darwin.zip"
      sha256 "767945a82df29c7e48096c19fbe3bcbf720d233e519983e5a9cfa75b387c955b"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.ze.dev/releases/v0.5.1/ze-harness-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a34121ae92cb98bf8a245dedebec2dc51e0555cef13384d3448886a0810eb52e"
    end
    on_arm do
      url "https://downloads.ze.dev/releases/v0.5.1/ze-harness-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bc68613c1afb4a4e6046a3dff4d395532c59ae517af443a1a419b4e8e4ad23e"
    end
  end

  def install
    # Node's macOS runtime floor is 13.5, not every Ventura point release.
    odie "ze-harness requires macOS 13.5 or newer" if OS.mac? && MacOS.version < "13.5"

    bin.install "ze-harness"
    prefix.install "LICENSE", "THIRD_PARTY_LICENSES.txt"
  end

  def caveats
    "Linux requires glibc 2.28+, kernel 4.18+, and libatomic." if OS.linux?
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ze-harness --version").strip
  end
end
