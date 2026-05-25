# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.0/vivero_darwin_arm64.tar.gz"
      sha256 "3665348f0aa6125cc44e93dd6fa3c116ee51048d4de0584794c41fe0d44f5aef"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.0/vivero_darwin_amd64.tar.gz"
      sha256 "a59afee56ad0c6268c07551815c26014bafd19392ae03bd542c8bde1d57aba88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.0/vivero_linux_arm64.tar.gz"
      sha256 "d74bdce3fc6d61cf73b75dfcd44de1cf27751d78b11ab1aa211d1bcd6b48628a"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.5.0/vivero_linux_amd64.tar.gz"
      sha256 "7fd280b385ac9beced36b66350bd87f2cfe1c11b44e8f10205a192f113dbdcfd"
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
