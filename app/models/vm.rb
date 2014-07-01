class Vm
  def initialize(raw_vm)
    @vm = raw_vm
  end

  def name
    @vm.name
  end

  def uptime
    @vm.runtime.bootTime
  end

  def power_state
    if @vm.runtime.powerState == 'poweredOn'
      return true
    end

    false
  end

  def nics
    @vm.guest.net
  end

  def disks
    @vm.guest.disk.map do | disk |
      Disk.new disk
    end
  end

  def tools_status
    if @vm.guest.toolsStatus == 'toolsOk'
      return true
    end

    false
  end

  def cpu
    @vm.summary.config.numCpu
  end

  def memory
    @vm.summary.config.memorySizeMB
  end
end
