describe 'mutex' do
  moneta_store :Memory

  it 'should have #lock' do
    mutex = Moneta::Mutex.new(store, 'mutex')
    mutex.lock.should be true
    mutex.locked?.should be true
    expect do
      mutex.lock
    end.to raise_error(RuntimeError)
    expect do
      mutex.try_lock
    end.to raise_error(RuntimeError)
    mutex.unlock.should be_nil
    mutex.locked?.should be false
  end

  it 'should have #enter' do
    mutex = Moneta::Mutex.new(store, 'mutex')
    mutex.enter.should be true
    mutex.locked?.should be true
    expect do
      mutex.enter
    end.to raise_error(RuntimeError)
    expect do
      mutex.try_enter
    end.to raise_error(RuntimeError)
    mutex.leave.should be_nil
    mutex.locked?.should be false
  end

  it 'should lock with #lock' do
    a = Moneta::Mutex.new(store, 'mutex')
    b = Moneta::Mutex.new(store, 'mutex')
    a.lock.should be true
    b.try_lock.should be false
    a.unlock.should be_nil
  end

  it 'should have lock timeout' do
    a = Moneta::Mutex.new(store, 'mutex')
    b = Moneta::Mutex.new(store, 'mutex')
    a.lock.should be true
    b.lock(1).should be false
    a.unlock.should be_nil
  end

  it 'should have #synchronize' do
    mutex = Moneta::Mutex.new(store, 'mutex')
    mutex.synchronize do
      mutex.locked?.should be true
    end
    mutex.locked?.should be false
  end
end
