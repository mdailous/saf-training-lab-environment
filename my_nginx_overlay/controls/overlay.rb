include_controls 'my_nginx' do
  skip_control 'NGX-0004'
  control 'NGX-0001' do
    impact 0.5
  end
end