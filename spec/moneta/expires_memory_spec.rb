describe 'expires_memory' do
  let(:t_res){ 0.1 }
  let(:min_ttl){ t_res }

  moneta_build do
    Moneta.build do
      use :Expires
      adapter :Memory
    end
  end

  moneta_specs STANDARD_SPECS.without_transform.with_expires.without_persist.returnsame.with_each_key
end
