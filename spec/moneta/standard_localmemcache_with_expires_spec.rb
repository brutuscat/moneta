describe 'standard_localmemcache_with_expires' do
  let(:t_res){ 0.1 }
  let(:min_ttl){ t_res }

  moneta_store :LocalMemCache do
    {file: File.join(tempdir, "simple_localmemcache_with_expires"), expires: true}
  end

  moneta_specs STANDARD_SPECS.without_increment.without_create.with_expires
end
