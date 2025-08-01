cask "ready-to-read-with-pooh" do
    version "1.0"
    sha256 "<INSERT_SHA256>"

    url "https://github.com/martimlobao/dos-games/releases/download/ready-to-read-with-pooh-v#{version}/Ready to Read with Pooh.app.zip"
    name "Ready to Read with Pooh"
    desc "Windows reading game by Disney from 1997"
    homepage "https://github.com/martimlobao/dos-games"

    app "Ready to Read with Pooh.app"

    zap trash: "~/Library/Application Support/Ready to Read with Pooh"
  end
