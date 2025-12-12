# typed: false
# frozen_string_literal: true

class Bb < Formula
  desc "Bitbucket CLI - Work seamlessly with Bitbucket from the command line"
  homepage "https://github.com/dlbroadfoot/bitbucket-cli"
  version "2.84.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_macOS_arm64.zip"
      sha256 "e404a7d2ccc433fc3275c625c70abaa9fde8dbdfed8739f466ca749e54802d7a"
    else
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_macOS_amd64.zip"
      sha256 "51ec9fedea3c796060c0f1d26b6eb49a90b1028d9a26ce4b4f9e428bfc330711"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_linux_arm64.tar.gz"
      sha256 "057839f9c7a634e9dfeddf2021e4d3dc78a755d1bbe527c83dcc7b5051fdccc2"
    else
      url "https://github.com/dlbroadfoot/bitbucket-cli/releases/download/v#{version}/bb_#{version}_linux_amd64.tar.gz"
      sha256 "1b24cba0bcd2d056a478a94220ae4ebaeb5fb47108ab31c75147ec7946949863"
    end
  end

  def install
    # Handle both wrapped and unwrapped archives
    if File.exist?("bb")
      bin.install "bb"
    else
      # Find bb binary in subdirectory (archives have wrap_in_directory: true)
      bb_binary = Dir.glob("*/bb").first || Dir.glob("bb_*/bb").first
      bin.install bb_binary => "bb" if bb_binary
    end
  end

  test do
    system "#{bin}/bb", "--version"
  end
end
