KERNELSRC ?= /workspaces/linux
ifdef ARCH
KARCH := ARCH=$(ARCH)
endif
ifdef CROSS_COMPILE
KCROSS_COMPILE := CROSS_COMPILE=$(CROSS_COMPILE)
endif
PWD ?= $(shell pwd)

obj-m := helloworld.o
# obj-m := helloworld_param.o
# obj-m := proc_info.o

# obj-m := container_of.o
# obj-m := linked_list.o

# obj-m := kthread_simple.o 
# obj-m := kthread_advanced.o 

# obj-m := lock_mutex.o
# obj-m := lock_spin_lock.o
# obj-m := lock_semaphore.o
# obj-m := lock_rw_semaphore.o

# obj-m := char_device.o 
# obj-m := char_device_fops.o
# obj-m := char_device_sysfs.o

# obj-m := timer.o
# obj-m := timer_hr.o
# obj-m := timer_hr_repetitive.o

# obj-m := tasklet.o
# obj-m := wait_queue.o
# obj-m := work_queue_simple.o
# obj-m := work_queue_delayed.o

.PHONY: all default
all default:
	$(MAKE) $(KARCH) $(KCROSS_COMPILE) -C $(KERNELSRC) M=$(PWD) modules

.PHONY: clean
clean:
	$(MAKE) $(KARCH) $(KCROSS_COMPILE) -C $(KERNELSRC) M=$(PWD) clean

.PHONY: install module_install
install module_install:
	$(MAKE) $(KARCH) $(KCROSS_COMPILE) -C $(KERNELSRC) M=$(PWD) module_install
