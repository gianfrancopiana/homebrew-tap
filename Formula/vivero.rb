# typed: false
# frozen_string_literal: true

class Vivero < Formula
  desc "Local-first preview and QA nursery for coding agents"
  homepage "https://github.com/gianfrancopiana/vivero"
  url "https://github.com/gianfrancopiana/vivero/archive/e6e819f75169bf4d095b16f866d466a8b63646ad.tar.gz"
  version "0.0.0-20260521-e6e819f"
  sha256 "5dfc7d1281a8131fb16244fafdf81d1272fda2edf5b792c712934bd78b500ac0"
  license "MIT"
  head "https://github.com/gianfrancopiana/vivero.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/gianfrancopiana/vivero/internal/vivero.Version=#{version}
      -X github.com/gianfrancopiana/vivero/internal/vivero.Commit=e6e819f
      -X github.com/gianfrancopiana/vivero/internal/vivero.BuildDate=2026-05-21T01:14:01Z
    ]
    system "go", "build", "-ldflags", ldflags.join(" "), "-o", bin/"vivero", "./cmd/vivero"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vivero version --json --no-input")
    system "#{bin}/vivero", "doctor", "--json", "--no-input"
  end
end
