module Vsphere
  class << self
    def instance
      @instance if @instance

      config = YAML.load_file("#{Rails.root}/config/vcenter.yml")['vcenter']
      
      vsx =  RbVmomi::VIM.connect :host => config['host'],
                                  :user => config['username'],
                                  :password => config['password'],
                                  :insecure => true

      @instance = vsx.serviceInstance.find_datacenter
                                     .vmFolder.childEntity.grep(RbVmomi::VIM::Folder)
                                     .detect { | folder | folder.name == config['folder'] }
      @instance
    end
  end
end
