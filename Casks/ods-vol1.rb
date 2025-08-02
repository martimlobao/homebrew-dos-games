cask "ods-vol1" do
    version "1.0.0"
    sha256 "8797e22371ca5755ff2fb71e80d384ba1c01227c9b771213d6b5404079a83cf8"

    url "https://github.com/martimlobao/homebrew-dos-games/releases/download/ods-vol1-v#{version}/ods-vol1.app.zip"
    name "Ohio Distinctive Software Vol. I"
    desc "Educational compilation by Ohio Distinctive Software from 1997"
    homepage "https://github.com/martimlobao/homebrew-dos-games"

    app "Ohio Distinctive Software Vol. I.app"

    zap trash: "~/Library/Application Support/Ohio Distinctive Software Vol. I"
  end
