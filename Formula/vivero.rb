# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.2/vivero_darwin_arm64.tar.gz"
      sha256 "1f9827e326778ba7404293947511942b089310494248e84480a190f26c973ca0"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.2/vivero_darwin_amd64.tar.gz"
      sha256 "35ec5c6d10ea465714512bdf93f26fde7ce8dea50ec7bbfa4658022e1111b6d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.2/vivero_linux_arm64.tar.gz"
      sha256 "99e5105e656cf747361837ee81e39d09b8f7e27d399a19b1d99f0d0d98c0a833"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.2/vivero_linux_amd64.tar.gz"
      sha256 "a3b39d809f5e66f705b0e5188061425a31343765e6053fe7b40dd49efbf64427"
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
