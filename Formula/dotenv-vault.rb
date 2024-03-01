class DotenvVault < Formula
  desc "Sync .env files"
  homepage "https://dotenv.org"
  url "https://dotenv-vault-assets.dotenv.org/versions/1.26.1/71b4bd5/dotenv-vault-v1.26.1-71b4bd5-darwin-arm64.tar.xz"
  sha256 "3f35755f8604c1a0484339637542d9ccd36db9e47a5e5b4d61e37089809a3aaa"
  depends_on "dotenv-org/brew/dotenv-vault-node" => "15.14.0"

  def install
    inreplace "bin/dotenv-vault", /^CLIENT_HOME=/, "export DOTENV_VAULT_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/dotenv-vault", "\"$DIR/node\"", Formula["dotenv-vault-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/dotenv-vault"
  end

  def test
    system bin/"dotenv-vault", "--version"
  end
end
