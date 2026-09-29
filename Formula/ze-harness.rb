class ZeHarness < Formula
  desc "Terminal-based AI agent harness"
  homepage "https://ze.dev"
  license "Apache-2.0"

  on_macos do
    depends_on macos: :ventura
    on_arm do
      url "https://downloads.ze.dev/releases/v0.4.0/ze-harness-v0.4.0-aarch64-apple-darwin.zip"
      sha256 "940c4017301c69668e9b732b84ec18a4c1147c704d1923b0bcec79658eba1a02"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.ze.dev/releases/v0.4.0/ze-harness-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8df027e7dc7e27f115bf52f61b29c825d5d43689b29cab8aa019dde44f378ba2"
    end
    on_arm do
      url "https://downloads.ze.dev/releases/v0.4.0/ze-harness-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa67e925badda6d1bf9855aeda2f34c2e5c12f59d19713dabd21ef7a0b6636ae"
    end
  end

  def install
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
