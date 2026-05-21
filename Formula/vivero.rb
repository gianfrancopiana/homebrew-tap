# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.0/vivero_darwin_arm64.tar.gz"
      sha256 "21a454f1f31d60fdd09b58b4b9c7cc200b2f25d1f5648fa774a59cf01fbe54fc"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.0/vivero_darwin_amd64.tar.gz"
      sha256 "4f04cb0886f516d7353f65f8c4f6f5ae3412a514cacb618f88f046cbbcd6bd4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.0/vivero_linux_arm64.tar.gz"
      sha256 "b0ae81556f6b9a903afd7a8b4c7a896f75b7d74ed9f73f61f953b236105dbacf"
    else
      url "https://github.com/gianfrancopiana/vivero/releases/download/v0.1.0/vivero_linux_amd64.tar.gz"
      sha256 "860fff054ff8ba7b839c5687f50dd3c58b3499099f8603a477fd187be416b644"
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
