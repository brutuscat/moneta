describe 'adapter_tokyotyrant', adapter: :TokyoTyrant do
  start_tokyotyrant(10654)

  moneta_build do
    Moneta::Adapters::TokyoTyrant.new(port: 10654)
  end

  moneta_specs ADAPTER_SPECS
end
