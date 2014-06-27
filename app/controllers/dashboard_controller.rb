class DashboardController < ApplicationController
  def index
    @vms = []
  end

  def status
    @vms = Vsphere.instance.childEntity.grep(RbVmomi::VIM::VirtualMachine)

    render partial: 'vms', locals: { vms: @vms }
  end

  def details
    @vm = Vsphere.instance.find params[:vm], RbVmomi::VIM::VirtualMachine

    render partial: 'details', locals: { vm: @vm }
  end

  def shutdown
    vm = Vsphere.instance.find params[:vm], RbVmomi::VIM::VirtualMachine
    vm.ShutdownGuest

    render text: 'OK'
  end

  def reboot
    vm = Vsphere.instance.find params[:vm], RbVmomi::VIM::VirtualMachine
    vm.RebootGuest

    render text: 'OK'
  end

  def start
    vm = Vsphere.instance.find params[:vm], RbVmomi::VIM::VirtualMachine
    vm.PowerOnVM_Task.wait_for_completion

    render text: 'OK'
  end

  def stop
    vm = Vsphere.instance.find params[:vm], RbVmomi::VIM::VirtualMachine
    vm.PowerOffVM_Task.wait_for_completion

    render text: 'OK'
  end

  def reset
    vm = Vsphere.instance.find params[:vm], RbVmomi::VIM::VirtualMachine
    vm.ResetVM_Task.wait_for_completion

    render text: 'OK'
  end

  def console
  end
end
