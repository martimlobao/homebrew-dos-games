cask "ready-to-read-with-pooh" do
    version "1.0.1"
    sha256 "d2bd36ef6e947f3f60356384859189a1c4cec431d513570fc45272c0b5d31a69"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/ready-to-read-with-pooh-v#{version}/ready-to-read-with-pooh.app.zip"
    name "Ready to Read with Pooh"
    desc "Windows reading game by Disney from 1997"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "Ready to Read with Pooh.app"

    zap trash: "~/Library/Application Support/Ready to Read with Pooh"
  end
