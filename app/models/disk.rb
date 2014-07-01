class Disk
  def initialize(raw_disk)
    @disk = raw_disk
  end

  def disk_path
    @disk.diskPath
  end

  def capacity(unit = :b)
    if unit == :b
      @disk.capacity
    elsif unit == :gb
      (@disk.capacity.to_f / 1024 / 1024 / 1024).round(2)
    end
  end

  def used_space(unit = :b)
    if unit == :b
      @disk.capacity - @disk.freeSpace
    elsif unit == :gb
      (self.used_space.to_f / 1024 / 1024 / 1024).round(2)
    end
  end

  def percent
    (self.used_space / self.capacity.to_f * 100).to_i
  end
end
