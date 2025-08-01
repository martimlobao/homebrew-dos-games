cask "ready-to-read-with-pooh" do
    version "1.0.2"
    sha256 "e6cf9636a9216ffad08b4c8ed40b28542aa7fcc7475b7129d078854ca35852fc"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/ready-to-read-with-pooh-v#{version}/ready-to-read-with-pooh.app.zip"
    name "Ready to Read with Pooh"
    desc "Windows reading game by Disney from 1997"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "Ready to Read with Pooh.app"

    zap trash: "~/Library/Application Support/Ready to Read with Pooh"
  end
