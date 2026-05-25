# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.4.0/vivero_darwin_arm64.tar.gz"
      sha256 "a0cc3da25f3b2ffac5c70d1511522ed471c02b968a2e67ddcc0813a865cccbdf"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.4.0/vivero_darwin_amd64.tar.gz"
      sha256 "dc3c625387bcadaf05a68d15588f856b24195c608f6936dee755db995bde71f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.4.0/vivero_linux_arm64.tar.gz"
      sha256 "1a4b209b01736cc04b51a13ae66db83d74942cef20b5af698dae20cd710185f1"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.4.0/vivero_linux_amd64.tar.gz"
      sha256 "50b09bdc85295e884e84830cd3b5720db82b9735ce1b68ccd64b221233798d2d"
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
