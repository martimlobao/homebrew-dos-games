cask "ready-to-read-with-pooh" do
    version "1.0.1"
    sha256 "a69a19612cce850258b705e8c8919dd41a94d69b226642a02200d92c2cb1322a"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/ready-to-read-with-pooh-v#{version}/ready-to-read-with-pooh.app.zip"
    name "Ready to Read with Pooh"
    desc "Windows reading game by Disney from 1997"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "Ready to Read with Pooh.app"

    zap trash: "~/Library/Application Support/Ready to Read with Pooh"
  end
