cask "ods-v1" do
    version "1.0.0"
    sha256 "XXX"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/ods-v1-v#{version}/ods-v1.app.zip"
    name "Ohio Distinctive Software Vol. I"
    desc "Educational compilation by Ohio Distinctive Software from 1997"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "Ohio Distinctive Software Vol. I.app"

    zap trash: "~/Library/Application Support/Ohio Distinctive Software Vol. I"
  end
