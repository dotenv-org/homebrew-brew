# typed: true
# frozen_string_literal: true

# This file was generated by Homebrew Releaser. DO NOT EDIT.
class Dotenv < Formula
  desc "“dotenv made better“ from the creator of `dotenv`"
  homepage "https://github.com/dotenv-org/dotenv"
  url "https://github.com/dotenv-org/dotenv/archive/refs/tags/v0.1.18.tar.gz"
  sha256 "d096359cee9dba7093b8a2d5bff76c1f0fa64e17c97c6424df62e3af4eddcc1f"

  on_macos do
    on_intel do
      url "https://github.com/dotenv-org/dotenv/releases/download/v0.1.18/git-dotenv-0.1.18-darwin-amd64.tar.gz"
      sha256 "69a4789e84b313a3f1c30dcf3e438dcb95422af0ca23eb9eebb5aa9855ad5682"
    end

    on_arm do
      url "https://github.com/dotenv-org/dotenv/releases/download/v0.1.18/git-dotenv-0.1.18-darwin-arm64.tar.gz"
      sha256 "2c1f14caafcae3282faed37709e390fd0588e9fd938be578ce4edc24e5990b37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dotenv-org/dotenv/releases/download/v0.1.18/git-dotenv-0.1.18-linux-amd64.tar.gz"
      sha256 "310b906b8826300af32ac4429d8f405c07d0c1c2557ce0fc6d871fdaf15292da"
    end

    on_arm do
      url "https://github.com/dotenv-org/dotenv/releases/download/v0.1.18/git-dotenv-0.1.18-linux-arm64.tar.gz"
      sha256 "95d4f2a55c29b29500cf6f17fe5ca094da67932fd2f82fdd5a51591abd084f34"
    end
  end

  def install
    bin.install "dotenv"
    bin.install_symlink "dotenv" => "git-dotenv"
  end

  test do
    system bin/"dotenv", "--version"
  end
end
