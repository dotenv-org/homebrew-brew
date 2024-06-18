class DotenvVault < Formula
  desc "Sync .env files"
  homepage "https://dotenv.org"
  url "https://github.com/dotenv-org/dotenv-vault/releases/download/v1.26.2/dotenv-vault-v1.26.1-d813d7a-darwin-arm64.tar.gz"
  sha256 "72936db5242d0e05920d9f2d12f5f0bc7af8e00e4a6bf197f43359971cd41bff"
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
