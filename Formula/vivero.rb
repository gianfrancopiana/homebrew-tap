# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.1/vivero_darwin_arm64.tar.gz"
      sha256 "bc431fb852bc75118c3285364772b37210cde18c4151c07aec6880a7b80225a0"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.1/vivero_darwin_amd64.tar.gz"
      sha256 "698eeb1f521d5569ea8622f1445711ca28d45da31c28a4ea16e6b393700ebcfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.1/vivero_linux_arm64.tar.gz"
      sha256 "7a1b62275a49cc751b50fe78d2c06b680b790269547145c51ea0eb1df626b994"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.1/vivero_linux_amd64.tar.gz"
      sha256 "cb5fde0f2b3c428a46053ee87c596c53bbc5a7df2249c03589d8f836c11ddc58"
    end
  end

  def install
    bin.install "vivero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivero version --json --no-input")
    system "#{bin}/vivero", "doctor", "--json", "--no-input"
  end
end
