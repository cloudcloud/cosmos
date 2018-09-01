
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"DxrRe419a89mKjeYvxqPP5b0l+wxfbGWj4/fMtUdMFY="
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"DxrRe419a89mKjeYvxqPP5b0l+wxfbGWj4/fMtUdMFY="
end

release :cosmos do
  set version: current_version(:cosmos)
  set applications: [
    :runtime_tools
  ]
end
