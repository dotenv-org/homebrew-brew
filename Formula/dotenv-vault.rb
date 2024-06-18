class DotenvVault < Formula
  desc "Sync .env files"
  homepage "https://dotenv.org"
  url "https://github.com/dotenv-org/dotenv-vault/releases/download/v1.26.2/dotenv-vault-v1.26.2-3613e80-darwin-arm64.tar.gz"
  sha256 "384fdd9be49a4baf2fe2d8fd05ea867374a6cd07cd725548015427103ba968e9"
  depends_on "dotenv-org/brew/dotenv-vault-node" => "16.15.1"

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
