# # encoding: utf-8

# Inspec test for recipe demo_cookbook::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root') do
    it { should exist }
    skip 'This is an example test, replace with your own test.'
  end
end

describe port(80) do
  it { should be_listening }
end

describe package('vim') do
  it { should be_installed }
end

describe package('mg') do
  it { should be_installed }
end

describe package('nginx') do
  it { should be_installed }
end

describe file('/var/www/html/index.nginx-debian.html') do
  it { should be_file }
  its('content') { should match %r{inspec} }
end

describe service('nginx') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
