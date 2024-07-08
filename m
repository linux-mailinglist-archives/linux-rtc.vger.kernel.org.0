Return-Path: <linux-rtc+bounces-1455-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1E929F16
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2024 11:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65DDB286FC3
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2024 09:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E904F6F2FE;
	Mon,  8 Jul 2024 09:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b3gul7qr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B96F067;
	Mon,  8 Jul 2024 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720430981; cv=none; b=JZnvRNMxGxPCVoksApbsgS6OCg0sBTsOQXSHD4OuslLPRLgMQTvsrVDeoH7gWlTm2URBbt3vkFgfAvTu8SUD5MMY8Mlh3IqIT0Lr++lxoK6kQXy/x7mp7D8KZhVUNMto5+8gMPLnh8ECRebNyozueLthyPlXZ8AUIX9lpqBt8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720430981; c=relaxed/simple;
	bh=m0EUkFppD+c26nmNRM0FTxWC7NAY9YgK2p00xp+B4DM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bGk1t6LeZPvgny2q6j7krqStvU/UlPyIOcBeNFjkj4qhDFJsUqvbvVIj6wgoD2gXM5HYOKVmfRAHWDBsnLV+ufbm6bMbBys6D54LheXSBK7JMqI0hULkifUE6umb3Ubtvx/z9Qi2mAODt3PWpUNn5pIQrzFXrAB2nTKy2dTeFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b3gul7qr; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bhYNXSmfiT9IgFTiAf5QYVWGAoT/S/BkinvvQS0a/h8=; b=b3gul7qrWFbMYFN3QBjyepsMpk
	iKgUsgJtB2es2HWitR6nNRdYlSMJXg7i3dgTC0WvNR9QND5SMYTI7ivBQd+xIGuDgyoKAVabgflQx
	DwTlXAf+q9r/L/e6+wNMyPiwkeulOTXz6qUfBLecAHZdidPqxqsi4x+MBDzWG1XyHvMdl/eRF6PDT
	j5izzuxC4zKNG7HYwq+sazpYHcURjpR1Qkf8fUOTJVKgPj+Uyn6lKnkXTtBbZi5sVFhBd+jr79yRI
	yFZJkUAgs1Gdc3KGzFufjkS5+DS8o0QEw4jOQollUsTdiMnj4/LzzmFJFN/8YgSj8Hr9URjnGNmmS
	1Fpq0frQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkgY-00000000Zt8-1n00;
	Mon, 08 Jul 2024 09:29:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQkgW-00000006BKF-0dFB;
	Mon, 08 Jul 2024 10:29:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	virtio-dev@lists.linux.dev,
	"Luu, Ryan" <rluu@amazon.com>,
	"Chashper, David" <chashper@amazon.com>
Cc: "Christopher S . Hall" <christopher.s.hall@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	John Stultz <jstultz@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Simon Horman <horms@kernel.org>
Subject: [RFC PATCH v4] ptp: Add vDSO-style vmclock support
Date: Mon,  8 Jul 2024 10:27:42 +0100
Message-ID: <20240708092924.1473461-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The vmclock "device" provides a shared memory region with precision clock
information. By using shared memory, it is safe across Live Migration.

Like the KVM PTP clock, this can convert TSC-based cross timestamps into
KVM clock values. Unlike the KVM PTP clock, it does so only when such is
actually helpful.

The memory region of the device is also exposed to userspace so it can be
read or memory mapped by application which need reliable notification of
clock disruptions.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---

QEMU implementation at
https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/vmclock

Remaining questions/TODO for virtio-rtc adoption:
 • Use of signed integer for tai_offset field
 • Explicit little-endianness
 • Is picoseconds the right unit for absolute error (I was going to make
   this (seconds>>64) but that actually reduces the *range* that can be
   expressed).
 • Are the clock_status values sensible?

v4:
 • Add esterror fields, MONOTONIC flag.
 • Reduce seq_count to 32 bits
 • Expand size to permit 64KiB pages
 • Align with virtio-rtc fields, values and leap handling
 • Drop gettime() method (since we have gettimex())
 • Add leap second smearing hint
 • Use a real _CRS on the ACPI device

v3: (wrong patch sent)

v2:
 • Add gettimex64() support
 • Convert TSC values to KVM clock when appropriate
 • Require int128 support
 • Add counter_period_shift
 • Add timeout when seq_count is invalid
 • Add flags field
 • Better comments in vmclock ABI structure
 • Explicitly forbid smearing (as clock rates would need to change)


 drivers/ptp/Kconfig              |  13 +
 drivers/ptp/Makefile             |   1 +
 drivers/ptp/ptp_vmclock.c        | 567 +++++++++++++++++++++++++++++++
 include/uapi/linux/vmclock-abi.h | 187 ++++++++++
 4 files changed, 768 insertions(+)
 create mode 100644 drivers/ptp/ptp_vmclock.c
 create mode 100644 include/uapi/linux/vmclock-abi.h

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index 604541dcb320..e98c9767e0ef 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -131,6 +131,19 @@ config PTP_1588_CLOCK_KVM
 	  To compile this driver as a module, choose M here: the module
 	  will be called ptp_kvm.
 
+config PTP_1588_CLOCK_VMCLOCK
+	tristate "Virtual machine PTP clock"
+	depends on X86_TSC || ARM_ARCH_TIMER
+	depends on PTP_1588_CLOCK && ACPI && ARCH_SUPPORTS_INT128
+	default y
+	help
+	  This driver adds support for using a virtual precision clock
+	  advertised by the hypervisor. This clock is only useful in virtual
+	  machines where such a device is present.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called ptp_vmclock.
+
 config PTP_1588_CLOCK_IDT82P33
 	tristate "IDT 82P33xxx PTP clock"
 	depends on PTP_1588_CLOCK && I2C
diff --git a/drivers/ptp/Makefile b/drivers/ptp/Makefile
index 68bf02078053..01b5cd91eb61 100644
--- a/drivers/ptp/Makefile
+++ b/drivers/ptp/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_PTP_1588_CLOCK_DTE)	+= ptp_dte.o
 obj-$(CONFIG_PTP_1588_CLOCK_INES)	+= ptp_ines.o
 obj-$(CONFIG_PTP_1588_CLOCK_PCH)	+= ptp_pch.o
 obj-$(CONFIG_PTP_1588_CLOCK_KVM)	+= ptp_kvm.o
+obj-$(CONFIG_PTP_1588_CLOCK_VMCLOCK)	+= ptp_vmclock.o
 obj-$(CONFIG_PTP_1588_CLOCK_QORIQ)	+= ptp-qoriq.o
 ptp-qoriq-y				+= ptp_qoriq.o
 ptp-qoriq-$(CONFIG_DEBUG_FS)		+= ptp_qoriq_debugfs.o
diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
new file mode 100644
index 000000000000..30f15d7753bb
--- /dev/null
+++ b/drivers/ptp/ptp_vmclock.c
@@ -0,0 +1,567 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Virtual PTP 1588 clock for use with LM-safe VMclock device.
+ *
+ * Copyright © 2024 Amazon.com, Inc. or its affiliates.
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <uapi/linux/vmclock-abi.h>
+
+#include <linux/ptp_clock_kernel.h>
+
+#ifdef CONFIG_X86
+#include <asm/pvclock.h>
+#include <asm/kvmclock.h>
+#endif
+
+#ifdef CONFIG_KVM_GUEST
+#define SUPPORT_KVMCLOCK
+#endif
+
+static DEFINE_IDA(vmclock_ida);
+
+ACPI_MODULE_NAME("vmclock");
+
+struct vmclock_state {
+	struct resource res;
+	struct vmclock_abi *clk;
+	struct miscdevice miscdev;
+	struct ptp_clock_info ptp_clock_info;
+	struct ptp_clock *ptp_clock;
+	enum clocksource_ids cs_id, sys_cs_id;
+	int index;
+	char *name;
+};
+
+#define VMCLOCK_MAX_WAIT ms_to_ktime(100)
+
+/*
+ * Multiply a 64-bit count by a 64-bit tick 'period' in units of seconds >> 64
+ * and add the fractional second part of the reference time.
+ *
+ * The result is a 128-bit value, the top 64 bits of which are seconds, and
+ * the low 64 bits are (seconds >> 64).
+ *
+ * If __int128 isn't available, perform the calculation 32 bits at a time to
+ * avoid overflow.
+ */
+static inline uint64_t mul_u64_u64_shr_add_u64(uint64_t *res_hi, uint64_t delta,
+					       uint64_t period, uint8_t shift,
+					       uint64_t frac_sec)
+{
+	unsigned __int128 res = (unsigned __int128)delta * period;
+
+	res >>= shift;
+	res += frac_sec;
+	*res_hi = res >> 64;
+	return (uint64_t)res;
+}
+
+static inline bool tai_adjust(struct vmclock_abi *clk, uint64_t *sec)
+{
+	if (likely(clk->time_type == VMCLOCK_TIME_UTC))
+		return true;
+
+	if (clk->time_type == VMCLOCK_TIME_TAI &&
+	    (clk->flags & VMCLOCK_FLAG_TAI_OFFSET_VALID)) {
+		if (sec)
+			*sec += clk->tai_offset_sec;
+		return true;
+	}
+	return false;
+}
+
+static int vmclock_get_crosststamp(struct vmclock_state *st,
+				   struct ptp_system_timestamp *sts,
+				   struct system_counterval_t *system_counter,
+				   struct timespec64 *tspec)
+{
+	ktime_t deadline = ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
+	struct system_time_snapshot systime_snapshot;
+	uint64_t cycle, delta, seq, frac_sec;
+
+#ifdef CONFIG_X86
+	/*
+	 * We'd expect the hypervisor to know this and to report the clock
+	 * status as VMCLOCK_STATUS_UNRELIABLE. But be paranoid.
+	 */
+	if (check_tsc_unstable())
+		return -EINVAL;
+#endif
+
+	while (1) {
+		seq = st->clk->seq_count & ~1ULL;
+		virt_rmb();
+
+		if (st->clk->clock_status == VMCLOCK_STATUS_UNRELIABLE)
+			return -EINVAL;
+
+		/*
+		 * When invoked for gettimex64(), fill in the pre/post system
+		 * times. The simple case is when system time is based on the
+		 * same counter as st->cs_id, in which case all three times
+		 * will be derived from the *same* counter value.
+		 *
+		 * If the system isn't using the same counter, then the value
+		 * from ktime_get_snapshot() will still be used as pre_ts, and
+		 * ptp_read_system_postts() is called to populate postts after
+		 * calling get_cycles().
+		 *
+		 * The conversion to timespec64 happens further down, outside
+		 * the seq_count loop.
+		 */
+		if (sts) {
+			ktime_get_snapshot(&systime_snapshot);
+			if (systime_snapshot.cs_id == st->cs_id) {
+				cycle = systime_snapshot.cycles;
+			} else {
+				cycle = get_cycles();
+				ptp_read_system_postts(sts);
+			}
+		} else
+			cycle = get_cycles();
+
+		delta = cycle - st->clk->counter_value;
+
+		frac_sec = mul_u64_u64_shr_add_u64(&tspec->tv_sec, delta,
+						   st->clk->counter_period_frac_sec,
+						   st->clk->counter_period_shift,
+						   st->clk->time_frac_sec);
+		tspec->tv_nsec = mul_u64_u64_shr(frac_sec, NSEC_PER_SEC, 64);
+		tspec->tv_sec += st->clk->time_sec;
+
+		if (!tai_adjust(st->clk, &tspec->tv_sec))
+			return -EINVAL;
+
+		virt_rmb();
+		if (seq == st->clk->seq_count)
+			break;
+
+		if (ktime_after(ktime_get(), deadline))
+			return -ETIMEDOUT;
+	}
+
+	if (system_counter) {
+		system_counter->cycles = cycle;
+		system_counter->cs_id = st->cs_id;
+	}
+
+	if (sts) {
+		sts->pre_ts = ktime_to_timespec64(systime_snapshot.real);
+		if (systime_snapshot.cs_id == st->cs_id)
+			sts->post_ts = sts->pre_ts;
+	}
+
+	return 0;
+}
+
+#ifdef SUPPORT_KVMCLOCK
+/*
+ * In the case where the system is using the KVM clock for timekeeping, convert
+ * the TSC value into a KVM clock time in order to return a paired reading that
+ * get_device_system_crosststamp() can cope with.
+ */
+static int vmclock_get_crosststamp_kvmclock(struct vmclock_state *st,
+					    struct ptp_system_timestamp *sts,
+					    struct system_counterval_t *system_counter,
+					    struct timespec64 *tspec)
+{
+	struct pvclock_vcpu_time_info *pvti = this_cpu_pvti();
+	unsigned pvti_ver;
+	int ret;
+
+	preempt_disable_notrace();
+
+	do {
+		pvti_ver = pvclock_read_begin(pvti);
+
+		ret = vmclock_get_crosststamp(st, sts, system_counter, tspec);
+		if (ret)
+			break;
+
+		system_counter->cycles = __pvclock_read_cycles(pvti,
+							       system_counter->cycles);
+		system_counter->cs_id = CSID_X86_KVM_CLK;
+
+		/*
+		 * This retry should never really happen; if the TSC is
+		 * stable and reliable enough across vCPUS that it is sane
+		 * for the hypervisor to expose a VMCLOCK device which uses
+		 * it as the reference counter, then the KVM clock sohuld be
+		 * in 'master clock mode' and basically never changed. But
+		 * the KVM clock is a fickle and often broken thing, so do
+		 * it "properly" just in case.
+		 */
+	} while (pvclock_read_retry(pvti, pvti_ver));
+
+	preempt_enable_notrace();
+
+	return ret;
+}
+#endif
+
+static int ptp_vmclock_get_time_fn(ktime_t *device_time,
+				   struct system_counterval_t *system_counter,
+				   void *ctx)
+{
+	struct vmclock_state *st = ctx;
+	struct timespec64 tspec;
+	int ret;
+
+#ifdef SUPPORT_KVMCLOCK
+	if (READ_ONCE(st->sys_cs_id) == CSID_X86_KVM_CLK)
+		ret = vmclock_get_crosststamp_kvmclock(st, NULL, system_counter,
+						       &tspec);
+	else
+#endif
+		ret = vmclock_get_crosststamp(st, NULL, system_counter, &tspec);
+
+	if (!ret)
+		*device_time = timespec64_to_ktime(tspec);
+
+	return ret;
+}
+
+
+static int ptp_vmclock_getcrosststamp(struct ptp_clock_info *ptp,
+				      struct system_device_crosststamp *xtstamp)
+{
+	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
+						ptp_clock_info);
+	int ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn, st,
+						NULL, xtstamp);
+#ifdef SUPPORT_KVMCLOCK
+	/*
+	 * On x86, the KVM clock may be used for the system time. We can
+	 * actually convert a TSC reading to that, and return a paired
+	 * timestamp that get_device_system_crosststamp() *can* handle.
+	 */
+	if (ret == -ENODEV) {
+		struct system_time_snapshot systime_snapshot;
+		ktime_get_snapshot(&systime_snapshot);
+
+		if (systime_snapshot.cs_id == CSID_X86_TSC ||
+		    systime_snapshot.cs_id == CSID_X86_KVM_CLK) {
+			WRITE_ONCE(st->sys_cs_id, systime_snapshot.cs_id);
+			ret = get_device_system_crosststamp(ptp_vmclock_get_time_fn,
+							    st, NULL, xtstamp);
+		}
+	}
+#endif
+	return ret;
+}
+
+/*
+ * PTP clock operations
+ */
+
+static int ptp_vmclock_adjfine(struct ptp_clock_info *ptp, long delta)
+{
+	return -EOPNOTSUPP;
+}
+
+static int ptp_vmclock_adjtime(struct ptp_clock_info *ptp, s64 delta)
+{
+	return -EOPNOTSUPP;
+}
+
+static int ptp_vmclock_settime(struct ptp_clock_info *ptp,
+			   const struct timespec64 *ts)
+{
+	return -EOPNOTSUPP;
+}
+
+static int ptp_vmclock_gettimex(struct ptp_clock_info *ptp, struct timespec64 *ts,
+				struct ptp_system_timestamp *sts)
+{
+	struct vmclock_state *st = container_of(ptp, struct vmclock_state,
+						ptp_clock_info);
+
+	return vmclock_get_crosststamp(st, sts, NULL, ts);
+}
+
+static int ptp_vmclock_enable(struct ptp_clock_info *ptp,
+			  struct ptp_clock_request *rq, int on)
+{
+	return -EOPNOTSUPP;
+}
+
+static const struct ptp_clock_info ptp_vmclock_info = {
+	.owner		= THIS_MODULE,
+	.max_adj	= 0,
+	.n_ext_ts	= 0,
+	.n_pins		= 0,
+	.pps		= 0,
+	.adjfine	= ptp_vmclock_adjfine,
+	.adjtime	= ptp_vmclock_adjtime,
+	.gettimex64	= ptp_vmclock_gettimex,
+	.settime64	= ptp_vmclock_settime,
+	.enable		= ptp_vmclock_enable,
+	.getcrosststamp = ptp_vmclock_getcrosststamp,
+};
+
+static int vmclock_miscdev_mmap(struct file *fp, struct vm_area_struct *vma)
+{
+	struct vmclock_state *st = container_of(fp->private_data,
+						struct vmclock_state, miscdev);
+
+	if ((vma->vm_flags & (VM_READ|VM_WRITE)) != VM_READ)
+		return -EROFS;
+
+	if (vma->vm_end - vma->vm_start != PAGE_SIZE || vma->vm_pgoff)
+		return -EINVAL;
+
+        if (io_remap_pfn_range(vma, vma->vm_start,
+			       st->res.start >> PAGE_SHIFT, PAGE_SIZE,
+                               vma->vm_page_prot))
+                return -EAGAIN;
+
+        return 0;
+}
+
+static ssize_t vmclock_miscdev_read(struct file *fp, char __user *buf,
+				    size_t count, loff_t *ppos)
+{
+	struct vmclock_state *st = container_of(fp->private_data,
+						struct vmclock_state, miscdev);
+	ktime_t deadline = ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
+	size_t max_count;
+	int32_t seq;
+
+	if (*ppos >= PAGE_SIZE)
+		return 0;
+
+	max_count = PAGE_SIZE - *ppos;
+	if (count > max_count)
+		count = max_count;
+
+	while (1) {
+		seq = st->clk->seq_count & ~1ULL;
+		virt_rmb();
+
+		if (copy_to_user(buf, ((char *)st->clk) + *ppos, count))
+			return -EFAULT;
+
+		virt_rmb();
+		if (seq == st->clk->seq_count)
+			break;
+
+		if (ktime_after(ktime_get(), deadline))
+			return -ETIMEDOUT;
+	}
+
+	*ppos += count;
+	return count;
+}
+
+static const struct file_operations vmclock_miscdev_fops = {
+        .mmap = vmclock_miscdev_mmap,
+        .read = vmclock_miscdev_read,
+};
+
+/* module operations */
+
+static void vmclock_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vmclock_state *st = dev_get_drvdata(dev);
+
+	if (st->ptp_clock)
+		ptp_clock_unregister(st->ptp_clock);
+
+	if (st->miscdev.minor == MISC_DYNAMIC_MINOR)
+		misc_deregister(&st->miscdev);
+}
+
+static acpi_status vmclock_acpi_resources(struct acpi_resource *ares, void *data)
+{
+	struct vmclock_state *st = data;
+	struct resource_win win;
+	struct resource *res = &(win.res);
+
+	if (ares->type == ACPI_RESOURCE_TYPE_END_TAG)
+		return AE_OK;
+
+	/* There can be only one */
+	if (resource_type(&st->res) == IORESOURCE_MEM)
+		return AE_ERROR;
+
+        if (acpi_dev_resource_memory(ares, res) ||
+	    acpi_dev_resource_address_space(ares, &win)) {
+
+		if (resource_type(res) != IORESOURCE_MEM ||
+		    resource_size(res) < sizeof(st->clk))
+			return AE_ERROR;
+
+		st->res = *res;
+		return AE_OK;
+	}
+
+	return AE_ERROR;
+}
+
+static int vmclock_probe_acpi(struct device *dev, struct vmclock_state *st)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	acpi_status status;
+
+        status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
+                                     vmclock_acpi_resources, st);
+        if (ACPI_FAILURE(status) || resource_type(&st->res) != IORESOURCE_MEM) {
+                dev_err(dev, "failed to get resources\n");
+                return -ENODEV;
+        }
+
+	return 0;
+}
+
+static void vmclock_put_idx(void *data)
+{
+	struct vmclock_state *st = data;
+
+	ida_free(&vmclock_ida, st->index);
+}
+
+static int vmclock_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct vmclock_state *st;
+	int ret;
+
+	st = devm_kzalloc(dev, sizeof (*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	if (has_acpi_companion(dev))
+		ret = vmclock_probe_acpi(dev, st);
+	else
+		ret = -EINVAL; /* Only ACPI for now */
+
+	if (ret) {
+		dev_info(dev, "Failed to obtain physical address: %d\n", ret);
+		goto out;
+	}
+
+	st->clk = devm_memremap(dev, st->res.start, resource_size(&st->res),
+				MEMREMAP_WB | MEMREMAP_DEC);
+	if (IS_ERR(st->clk)) {
+		ret = PTR_ERR(st->clk);
+		dev_info(dev, "failed to map shared memory\n");
+		st->clk = NULL;
+		goto out;
+	}
+
+	if (st->clk->magic != VMCLOCK_MAGIC ||
+	    st->clk->size < sizeof(*st->clk) ||
+	    st->clk->version != 1) {
+		dev_info(dev, "vmclock magic fields invalid\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = ida_alloc(&vmclock_ida, GFP_KERNEL);
+	if (ret < 0)
+		goto out;
+
+	st->index = ret;
+        ret = devm_add_action_or_reset(&pdev->dev, vmclock_put_idx, st);
+	if (ret)
+		goto out;
+
+	st->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
+	if (!st->name) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* If the structure is big enough, it can be mapped to userspace */
+	if (st->clk->size >= PAGE_SIZE) {
+		st->miscdev.minor = MISC_DYNAMIC_MINOR;
+		st->miscdev.fops = &vmclock_miscdev_fops;
+		st->miscdev.name = st->name;
+
+		ret = misc_register(&st->miscdev);
+		if (ret)
+			goto out;
+	}
+
+	/* If there is valid clock information, register a PTP clock */
+	if (IS_ENABLED(CONFIG_ARM64) &&
+	    st->clk->counter_id == VMCLOCK_COUNTER_ARM_VCNT) {
+		/* Can we check it's the virtual counter? */
+		st->cs_id = CSID_ARM_ARCH_COUNTER;
+	} else if (IS_ENABLED(CONFIG_X86) &&
+		   st->clk->counter_id == VMCLOCK_COUNTER_X86_TSC) {
+		st->cs_id = CSID_X86_TSC;
+	}
+
+	/* Only UTC, or TAI with offset */
+	if (!tai_adjust(st->clk, NULL)) {
+		dev_info(dev, "vmclock does not provide unambiguous UTC\n");
+		st->cs_id = CSID_GENERIC;
+	}
+
+	if (st->cs_id) {
+		st->sys_cs_id = st->cs_id;
+
+		st->ptp_clock_info = ptp_vmclock_info;
+		strscpy(st->ptp_clock_info.name, st->name);
+		st->ptp_clock = ptp_clock_register(&st->ptp_clock_info, dev);
+
+		if (IS_ERR(st->ptp_clock)) {
+			ret = PTR_ERR(st->ptp_clock);
+			st->ptp_clock = NULL;
+			vmclock_remove(pdev);
+			goto out;
+		}
+	} else if (!st->miscdev.minor) {
+		/* Neither miscdev nor PTP registered */
+		dev_info(dev, "vmclock: Neither miscdev nor PTP available; not registering\n");
+		ret = -ENODEV;
+		goto out;
+	}
+
+	dev_info(dev, "%s: registered %s%s%s\n", st->name,
+		 st->miscdev.minor ? "miscdev" : "",
+		 (st->miscdev.minor && st->ptp_clock) ? ", " : "",
+		 st->ptp_clock ? "PTP" : "");
+
+	dev_set_drvdata(dev, st);
+
+ out:
+	return ret;
+}
+
+static const struct acpi_device_id vmclock_acpi_ids[] = {
+	{ "VMCLOCK", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, vmclock_acpi_ids);
+
+static struct platform_driver vmclock_platform_driver = {
+	.probe		= vmclock_probe,
+	.remove_new	= vmclock_remove,
+	.driver	= {
+		.name	= "vmclock",
+		.acpi_match_table = vmclock_acpi_ids,
+	},
+};
+
+module_platform_driver(vmclock_platform_driver)
+
+MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
+MODULE_DESCRIPTION("PTP clock using VMCLOCK");
+MODULE_LICENSE("GPL v2");
diff --git a/include/uapi/linux/vmclock-abi.h b/include/uapi/linux/vmclock-abi.h
new file mode 100644
index 000000000000..84f0e37a8a06
--- /dev/null
+++ b/include/uapi/linux/vmclock-abi.h
@@ -0,0 +1,187 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-2-Clause) */
+
+/*
+ * This structure provides a vDSO-style clock to VM guests, exposing the
+ * relationship (or lack thereof) between the CPU clock (TSC, timebase, arch
+ * counter, etc.) and real time. It is designed to address the problem of
+ * live migration, which other clock enlightenments do not.
+ *
+ * When a guest is live migrated, this affects the clock in two ways.
+ *
+ * First, even between identical hosts the actual frequency of the underlying
+ * counter will change within the tolerances of its specification (typically
+ * ±50PPM, or 4 seconds a day). This frequency also varies over time on the
+ * same host, but can be tracked by NTP as it generally varies slowly. With
+ * live migration there is a step change in the frequency, with no warning.
+ *
+ * Second, there may be a step change in the value of the counter itself, as
+ * its accuracy is limited by the precision of the NTP synchronization on the
+ * source and destination hosts.
+ *
+ * So any calibration (NTP, PTP, etc.) which the guest has done on the source
+ * host before migration is invalid, and needs to be redone on the new host.
+ *
+ * In its most basic mode, this structure provides only an indication to the
+ * guest that live migration has occurred. This allows the guest to know that
+ * its clock is invalid and take remedial action. For applications that need
+ * reliable accurate timestamps (e.g. distributed databases), the structure
+ * can be mapped all the way to userspace. This allows the application to see
+ * directly for itself that the clock is disrupted and take appropriate
+ * action, even when using a vDSO-style method to get the time instead of a
+ * system call.
+ *
+ * In its more advanced mode. this structure can also be used to expose the
+ * precise relationship of the CPU counter to real time, as calibrated by the
+ * host. This means that userspace applications can have accurate time
+ * immediately after live migration, rather than having to pause operations
+ * and wait for NTP to recover. This mode does, of course, rely on the
+ * counter being reliable and consistent across CPUs.
+ *
+ * Note that this must be true UTC, never with smeared leap seconds. If a
+ * guest wishes to construct a smeared clock, it can do so. Presenting a
+ * smeared clock through this interface would be problematic because it
+ * actually messes with the apparent counter *period*. A linear smearing
+ * of 1 ms per second would effectively tweak the counter period by 1000PPM
+ * at the start/end of the smearing period, while a sinusoidal smear would
+ * basically be impossible to represent.
+ *
+ * This structure is offered with the intent that it be adopted into the
+ * nascent virtio-rtc standard, as a virtio-rtc that does not address the live
+ * migration problem seems a little less than fit for purpose. For that
+ * reason, certain fields use precisely the same numeric definitions as in
+ * the virtio-rtc proposal. The structure can also be exposed through an ACPI
+ * device with the CID "VMCLOCK", modelled on the "VMGENID" device except for
+ * the fact that it uses a real _CRS to convey the address of the structure
+ * (which should be a full page, to allow for mapping directly to userspace).
+ */
+
+#ifndef __VMCLOCK_ABI_H__
+#define __VMCLOCK_ABI_H__
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+
+struct vmclock_abi {
+	/* CONSTANT FIELDS */
+	uint32_t magic;
+#define VMCLOCK_MAGIC	0x4b4c4356 /* "VCLK" */
+	uint32_t size;		/* Size of region containing this structure */
+	uint16_t version;	/* 1 */
+	uint8_t counter_id; /* Matches VIRTIO_RTC_COUNTER_xxx except INVALID */
+#define VMCLOCK_COUNTER_ARM_VCNT	0
+#define VMCLOCK_COUNTER_X86_TSC		1
+#define VMCLOCK_COUNTER_INVALID		0xff
+	uint8_t time_type; /* Matches VIRTIO_RTC_TYPE_xxx */
+#define VMCLOCK_TIME_UTC			0	/* Since 1970-01-01 00:00:00z */
+#define VMCLOCK_TIME_TAI			1	/* Since 1970-01-01 00:00:00z */
+#define VMCLOCK_TIME_MONOTONIC			2	/* Since undefined epoch */
+#define VMCLOCK_TIME_INVALID_SMEARED		3	/* Not supported */
+#define VMCLOCK_TIME_INVALID_MAYBE_SMEARED	4	/* Not supported */
+
+	/* NON-CONSTANT FIELDS PROTECTED BY SEQCOUNT LOCK */
+	uint32_t seq_count;	/* Low bit means an update is in progress */
+	/*
+	 * This field changes to another non-repeating value when the CPU
+	 * counter is disrupted, for example on live migration. This lets
+	 * the guest know that it should discard any calibration it has
+	 * performed of the counter against external sources (NTP/PTP/etc.).
+	 */
+	uint64_t disruption_marker;
+	uint64_t flags;
+	/* Indicates that the tai_offset_sec field is valid */
+#define VMCLOCK_FLAG_TAI_OFFSET_VALID		(1 << 0)
+	/*
+	 * Optionally used to notify guests of pending maintenance events.
+	 * A guest which provides latency-sensitive services may wish to
+	 * remove itself from service if an event is coming up. Two flags
+	 * indicate the approximate imminence of the event.
+	 */
+#define VMCLOCK_FLAG_DISRUPTION_SOON		(1 << 1) /* About a day */
+#define VMCLOCK_FLAG_DISRUPTION_IMMINENT	(1 << 2) /* About an hour */
+#define VMCLOCK_FLAG_PERIOD_ESTERROR_VALID	(1 << 3)
+#define VMCLOCK_FLAG_PERIOD_MAXERROR_VALID	(1 << 4)
+#define VMCLOCK_FLAG_TIME_ESTERROR_VALID	(1 << 5)
+#define VMCLOCK_FLAG_TIME_MAXERROR_VALID	(1 << 6)
+	/*
+	 * Even regardless of leap seconds, the time presented through this
+	 * mechanism may not be strictly monotonic. If the counter slows down
+	 * and the host adapts to this discovery, the time calculated from
+	 * the value of the counter immediately after an update to this
+	 * structure, may appear to be *earlier* than a calculation just
+	 * before the update (while the counter was believed to be running
+	 * faster than it now is). A guest operating system will typically
+	 * *skew* its own system clock back towards the reference clock
+	 * exposed here, rather than following this clock directly. If,
+	 * however, this structure is being populated from such a system
+	 * clock which is already handled in such a fashion and the results
+	 * *are* guaranteed to be monotonic, such monotonicity can be
+	 * advertised by setting this bit.
+	 */
+#define VMCLOCK_FLAG_TIME_MONOTONIC		(1 << 7)
+
+	uint8_t pad[2];
+	uint8_t clock_status;
+#define VMCLOCK_STATUS_UNKNOWN		0
+#define VMCLOCK_STATUS_INITIALIZING	1
+#define VMCLOCK_STATUS_SYNCHRONIZED	2
+#define VMCLOCK_STATUS_FREERUNNING	3
+#define VMCLOCK_STATUS_UNRELIABLE	4
+
+	/*
+	 * The time exposed through this device is never smeared. This field
+	 * corresponds to the 'subtype' field in virtio-rtc, which indicates
+	 * the smearing method. However in this case it provides a *hint* to
+	 * the guest operating system, such that *if* the guest OS wants to
+	 * provide its users with an alternative clock which does not follow
+	 * the POSIX CLOCK_REALTIME standard, it may do so in a fashion
+	 * consistent with the other systems in the nearby environment.
+	 */
+	uint8_t leap_second_smearing_hint; /* Matches VIRTIO_RTC_SUBTYPE_xxx */
+#define VMCLOCK_SMEARING_STRICT		0
+#define VMCLOCK_SMEARING_NOON_LINEAR	1
+#define VMCLOCK_SMEARING_UTC_SLS	2
+	int16_t tai_offset_sec;
+	uint8_t leap_indicator; /* Based on VIRTIO_RTC_LEAP_xxx */
+#define VMCLOCK_LEAP_NONE	0	/* No known nearby leap second */
+#define VMCLOCK_LEAP_PRE_POS	1	/* Leap second + at end of month */
+#define VMCLOCK_LEAP_PRE_NEG	2	/* Leap second - at end of month */
+#define VMCLOCK_LEAP_POS	3	/* Set during 23:59:60 second */
+#define VMCLOCK_LEAP_NEG	4	/* Not used in VMCLOCK */
+	/*
+	 * These values are not (yet) in virtio-rtc. They indicate that a
+	 * leap second *has* occurred at the start of the month. This allows
+	 * a guest to generate a smeared clock from the accurate clock which
+	 * this device provides, as smearing may need to continue for up to a
+	 * period of time *after* the point of the leap second itself. Must
+	 * be cleared by the 15th day of the month.
+	 */
+#define VMCLOCK_LEAP_POST_POS	5
+#define VMCLOCK_LEAP_POST_NEG	6
+
+	/* Bit shift for counter_period_frac_sec and its error rate */
+	uint8_t counter_period_shift;
+	/*
+	 * Paired values of counter and UTC at a given point in time.
+	 */
+	uint64_t counter_value;
+	/*
+	 * Counter frequency, and error margin. The unit of these fields is
+	 * seconds >> (64 + counter_period_shift)
+	 */
+	uint64_t counter_period_frac_sec;
+	uint64_t counter_period_esterror_rate_frac_sec;
+	uint64_t counter_period_maxerror_rate_frac_sec;
+
+	/*
+	 * Time according to time_type field above.
+	 */
+	uint64_t time_sec;		/* Seconds since time_type epoch */
+	uint64_t time_frac_sec;		/* (seconds >> 64) */
+	uint64_t time_esterror_picosec;	/* (± picoseconds) */
+	uint64_t time_maxerror_picosec;	/* (± picoseconds) */
+};
+
+#endif /*  __VMCLOCK_ABI_H__ */
-- 
2.44.0


