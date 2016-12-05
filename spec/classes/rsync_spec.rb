require 'spec_helper'


describe 'simp_options::rsync' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|

      context "on #{os}" do
        let(:facts){ facts }

        context 'default parameters' do
          it { is_expected.to compile.with_all_deps }
        end

        context 'invalid server' do
          let(:params){{ :server => '1.2.3.400' }}
          it { is_expected.not_to compile.with_all_deps}
        end
      end
    end
  end
end