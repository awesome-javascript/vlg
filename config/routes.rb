VLG::Application.routes.draw do
  root 'dashboard#index'

  get '/vm/status', to: 'dashboard#status'
  get '/vm/:vm/details', to: 'dashboard#details'

  get '/vm/:vm/shutdown', to: 'dashboard#shutdown', as: :vm_shutdown
  get '/vm/:vm/reboot', to: 'dashboard#reboot', as: :vm_reboot
  get '/vm/:vm/start', to: 'dashboard#start', as: :vm_start
  get '/vm/:vm/stop', to: 'dashboard#stop', as: :vm_stop
  get '/vm/:vm/reset', to: 'dashboard#reset', as: :vm_reset

  get '/vm/:vm/console', to: 'dashboard#console', as: :vm_console
end
