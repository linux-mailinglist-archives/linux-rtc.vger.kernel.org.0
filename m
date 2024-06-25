Return-Path: <linux-rtc+bounces-1397-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3509170CC
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jun 2024 21:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF5E1C20B59
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Jun 2024 19:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B481717BB1A;
	Tue, 25 Jun 2024 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uJqljuXk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510C17C7C3;
	Tue, 25 Jun 2024 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719342128; cv=none; b=UvHstCaSsW2YA4RV1g4wrxUKMYmwdkmFtHMiVfs44oZ+w4Vs9p4u3598vgr3cT6cO17c+/LZ+Tf9G1nbzOlIx2slMdlaUZzw6cJEJGguABXBoFb4yyQVMSmKiIsrBxnFMg6LEnx/cDc52s03bJqbUweYvrKYizvInmo1+I1tR2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719342128; c=relaxed/simple;
	bh=Vy7k5nI1YHkpWqdlGPOloqA0Y1llKlpKNnCt21KEXaE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E5nmC2vPgoTLI3YwsHd8pnxPAbJAiTkpCal8GwpyHuaJY23cwxHFR80HG8mZbnMonP1ffpCxfk/majUVvPm39hPgnFEugXCiajjIyLaWDeChX+8UtoMk9/0Vh6I5/gSC7UPRF9E7xIXZOQi3q6CSsc+BknNPkK+BBD5/S/U/bHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uJqljuXk; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Li4wUGCgsZUJB4SYcEdiM7L/XEF/BHk1wiv7h9YvUHg=; b=uJqljuXkKkolmOsciHrPDC3/Rk
	M8uc61p3iaetgr5wAJ0jW0YqNkEX0ejEAXLVqEsacHkJ/BmywxogKZWDRzu7wcwJzl/IRmxqUxDE6
	1wlHvz0V6TjWlJIsdkPJO4RjZb1WopYQ5emMMAtGK7ywPKKPxrno323waK9kcPAVEOo1DHJZFMOMl
	GgtX3E2fLlR12dlWm5VV9Mybm6bAicX3M+3tlQH5Stn0lO3jXsmYVnh9Az24/U8TR3YLSn99Sdp0y
	7fPKlzrYzD2tuGf+innzOPZgEMjcNEM5qnQzugw1yff4VDApRuln4/bmYRxo6qRnHJRCYTaZee4rS
	K1GEOsXQ==;
Received: from [2001:8b0:10b:5:4c40:96ca:cd56:bc81] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMBQT-0000000BQhO-0ymJ;
	Tue, 25 Jun 2024 19:01:57 +0000
Message-ID: <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org>
Subject: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 linux-kernel@vger.kernel.org,  virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-rtc@vger.kernel.org, "Ridoux,
 Julien" <ridouxj@amazon.com>,  virtio-dev@lists.linux.dev, "Luu, Ryan"
 <rluu@amazon.com>
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>, Jason Wang
 <jasowang@redhat.com>, John Stultz <jstultz@google.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, Richard Cochran
 <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 25 Jun 2024 20:01:56 +0100
In-Reply-To: <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
	 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
	 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
	 <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org>
	 <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-FMW9TUO+aevWuKuWvAJU"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-FMW9TUO+aevWuKuWvAJU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

v2:=C2=A0
 =E2=80=A2 Add gettimex64() support
 =E2=80=A2 Convert TSC values to KVM clock when appropriate
 =E2=80=A2 Require int128 support
 =E2=80=A2 Add counter_period_shift=20
 =E2=80=A2 Add timeout when seq_count is invalid
 =E2=80=A2 Add flags field
 =E2=80=A2 Better comments in vmclock ABI structure
 =E2=80=A2 Explicitly forbid smearing (as clock rates would need to change)

 drivers/ptp/Kconfig          |  13 +
 drivers/ptp/Makefile         |   1 +
 drivers/ptp/ptp_vmclock.c    | 516 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/vmclock.h | 138 ++++++++++
 4 files changed, 668 insertions(+)
 create mode 100644 drivers/ptp/ptp_vmclock.c
 create mode 100644 include/uapi/linux/vmclock.h

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index 604541dcb320..e98c9767e0ef 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -131,6 +131,19 @@ config PTP_1588_CLOCK_KVM
 	  To compile this driver as a module, choose M here: the module
 	  will be called ptp_kvm.
=20
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
@@ -11,6 +11,7 @@ obj-$(CONFIG_PTP_1588_CLOCK_DTE)	+=3D ptp_dte.o
 obj-$(CONFIG_PTP_1588_CLOCK_INES)	+=3D ptp_ines.o
 obj-$(CONFIG_PTP_1588_CLOCK_PCH)	+=3D ptp_pch.o
 obj-$(CONFIG_PTP_1588_CLOCK_KVM)	+=3D ptp_kvm.o
+obj-$(CONFIG_PTP_1588_CLOCK_VMCLOCK)	+=3D ptp_vmclock.o
 obj-$(CONFIG_PTP_1588_CLOCK_QORIQ)	+=3D ptp-qoriq.o
 ptp-qoriq-y				+=3D ptp_qoriq.o
 ptp-qoriq-$(CONFIG_DEBUG_FS)		+=3D ptp_qoriq_debugfs.o
diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
new file mode 100644
index 000000000000..e19c2eed8009
--- /dev/null
+++ b/drivers/ptp/ptp_vmclock.c
@@ -0,0 +1,516 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Virtual PTP 1588 clock for use with LM-safe VMclock device.
+ *
+ * Copyright =C2=A9 2024 Amazon.com, Inc. or its affiliates.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/miscdevice.h>
+#include <linux/acpi.h>
+#include <uapi/linux/vmclock.h>
+
+#include <linux/ptp_clock_kernel.h>
+
+#ifdef CONFIG_X86
+#include <asm/pvclock.h>
+#include <asm/kvmclock.h>
+#endif
+
+static DEFINE_IDA(vmclock_ida);
+
+ACPI_MODULE_NAME("vmclock");
+
+struct vmclock_state {
+	phys_addr_t phys_addr;
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
+ * Multiply a 64-bit count by a 64-bit tick 'period' in units of seconds >=
> 64
+ * and add the fractional second part of the reference time.
+ *
+ * The result is a 128-bit value, the top 64 bits of which are seconds, an=
d
+ * the low 64 bits are (seconds >> 64).
+ *
+ * If __int128 isn't available, perform the calculation 32 bits at a time =
to
+ * avoid overflow.
+ */
+static inline uint64_t mul_u64_u64_shr_add_u64(uint64_t *res_hi, uint64_t =
delta,
+					       uint64_t period, uint8_t shift,
+					       uint64_t frac_sec)
+{
+	unsigned __int128 res =3D (unsigned __int128)delta * period;
+
+	res >>=3D shift;
+	res +=3D frac_sec;
+	*res_hi =3D res >> 64;
+	return (uint64_t)res;
+}
+
+static int vmclock_get_crosststamp(struct vmclock_state *st,
+				   struct ptp_system_timestamp *sts,
+				   struct system_counterval_t *system_counter,
+				   struct timespec64 *tspec)
+{
+	ktime_t deadline =3D ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
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
+		seq =3D st->clk->seq_count & ~1ULL;
+		virt_rmb();
+
+		if (st->clk->clock_status =3D=3D VMCLOCK_STATUS_UNRELIABLE)
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
+			if (systime_snapshot.cs_id =3D=3D st->cs_id) {
+				cycle =3D systime_snapshot.cycles;
+			} else {
+				cycle =3D get_cycles();
+				ptp_read_system_postts(sts);
+			}
+		} else
+			cycle =3D get_cycles();
+
+		delta =3D cycle - st->clk->counter_value;
+
+		frac_sec =3D mul_u64_u64_shr_add_u64(&tspec->tv_sec, delta,
+						   st->clk->counter_period_frac_sec,
+						   st->clk->counter_period_shift,
+						   st->clk->utc_time_frac_sec);
+		tspec->tv_nsec =3D mul_u64_u64_shr(frac_sec, NSEC_PER_SEC, 64);
+		tspec->tv_sec +=3D st->clk->utc_time_sec;
+
+		virt_rmb();
+		if (seq =3D=3D st->clk->seq_count)
+			break;
+
+		if (ktime_after(ktime_get(), deadline))
+			return -ETIMEDOUT;
+	}
+
+	if (system_counter) {
+		system_counter->cycles =3D cycle;
+		system_counter->cs_id =3D st->cs_id;
+	}
+
+	if (sts) {
+		sts->pre_ts =3D ktime_to_timespec64(systime_snapshot.real);
+		if (systime_snapshot.cs_id =3D=3D st->cs_id)
+			sts->post_ts =3D sts->pre_ts;
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_X86
+/*
+ * In the case where the system is using the KVM clock for timekeeping, co=
nvert
+ * the TSC value into a KVM clock time in order to return a paired reading=
 that
+ * get_device_system_crosststamp() can cope with.
+ */
+static int vmclock_get_crosststamp_kvmclock(struct vmclock_state *st,
+					    struct ptp_system_timestamp *sts,
+					    struct system_counterval_t *system_counter,
+					    struct timespec64 *tspec)
+{
+	struct pvclock_vcpu_time_info *pvti =3D this_cpu_pvti();
+	unsigned pvti_ver;
+	int ret;
+
+	preempt_disable_notrace();
+
+	do {
+		pvti_ver =3D pvclock_read_begin(pvti);
+
+		ret =3D vmclock_get_crosststamp(st, sts, system_counter, tspec);
+		if (ret)
+			break;
+
+		system_counter->cycles =3D __pvclock_read_cycles(pvti,
+							       system_counter->cycles);
+		system_counter->cs_id =3D CSID_X86_KVM_CLK;
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
+	struct vmclock_state *st =3D ctx;
+	struct timespec64 tspec;
+	int ret;
+
+#ifdef CONFIG_X86
+	if (READ_ONCE(st->sys_cs_id) =3D=3D CSID_X86_KVM_CLK)
+		ret =3D vmclock_get_crosststamp_kvmclock(st, NULL, system_counter,
+						       &tspec);
+	else
+#endif
+		ret =3D vmclock_get_crosststamp(st, NULL, system_counter, &tspec);
+
+	if (!ret)
+		*device_time =3D timespec64_to_ktime(tspec);
+
+	return ret;
+}
+
+
+static int ptp_vmclock_getcrosststamp(struct ptp_clock_info *ptp,
+				      struct system_device_crosststamp *xtstamp)
+{
+	struct vmclock_state *st =3D container_of(ptp, struct vmclock_state,
+						ptp_clock_info);
+	int ret =3D get_device_system_crosststamp(ptp_vmclock_get_time_fn, st,
+						NULL, xtstamp);
+#ifdef CONFIG_X86
+	/*
+	 * On x86, the KVM clock may be used for the system time. We can
+	 * actually convert a TSC reading to that, and return a paired
+	 * timestamp that get_device_system_crosststamp() *can* handle.
+	 */
+	if (ret =3D=3D -ENODEV) {
+		struct system_time_snapshot systime_snapshot;
+		ktime_get_snapshot(&systime_snapshot);
+
+		if (systime_snapshot.cs_id =3D=3D CSID_X86_TSC ||
+		    systime_snapshot.cs_id =3D=3D CSID_X86_KVM_CLK) {
+			WRITE_ONCE(st->sys_cs_id, systime_snapshot.cs_id);
+			ret =3D get_device_system_crosststamp(ptp_vmclock_get_time_fn,
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
+static int ptp_vmclock_gettime(struct ptp_clock_info *ptp, struct timespec=
64 *ts)
+{
+	struct vmclock_state *st =3D container_of(ptp, struct vmclock_state,
+						ptp_clock_info);
+
+	return vmclock_get_crosststamp(st, NULL, NULL, ts);
+}
+
+static int ptp_vmclock_gettimex(struct ptp_clock_info *ptp, struct timespe=
c64 *ts,
+				struct ptp_system_timestamp *sts)
+{
+	struct vmclock_state *st =3D container_of(ptp, struct vmclock_state,
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
+static const struct ptp_clock_info ptp_vmclock_info =3D {
+	.owner		=3D THIS_MODULE,
+	.max_adj	=3D 0,
+	.n_ext_ts	=3D 0,
+	.n_pins		=3D 0,
+	.pps		=3D 0,
+	.adjfine	=3D ptp_vmclock_adjfine,
+	.adjtime	=3D ptp_vmclock_adjtime,
+	.gettime64	=3D ptp_vmclock_gettime,
+	.gettimex64	=3D ptp_vmclock_gettimex,
+	.settime64	=3D ptp_vmclock_settime,
+	.enable		=3D ptp_vmclock_enable,
+	.getcrosststamp =3D ptp_vmclock_getcrosststamp,
+};
+
+static int vmclock_miscdev_mmap(struct file *fp, struct vm_area_struct *vm=
a)
+{
+	struct vmclock_state *st =3D container_of(fp->private_data,
+						struct vmclock_state, miscdev);
+
+	if ((vma->vm_flags & (VM_READ|VM_WRITE)) !=3D VM_READ)
+		return -EROFS;
+
+	if (vma->vm_end - vma->vm_start !=3D PAGE_SIZE || vma->vm_pgoff)
+		return -EINVAL;
+
+        if (io_remap_pfn_range(vma, vma->vm_start,
+			       st->phys_addr >> PAGE_SHIFT, PAGE_SIZE,
+                               vma->vm_page_prot))
+                return -EAGAIN;
+
+        return 0;
+}
+
+static ssize_t vmclock_miscdev_read(struct file *fp, char __user *buf,
+				    size_t count, loff_t *ppos)
+{
+	struct vmclock_state *st =3D container_of(fp->private_data,
+						struct vmclock_state, miscdev);
+	ktime_t deadline =3D ktime_add(ktime_get(), VMCLOCK_MAX_WAIT);
+	size_t max_count;
+	int32_t seq;
+
+	if (*ppos >=3D PAGE_SIZE)
+		return 0;
+
+	max_count =3D PAGE_SIZE - *ppos;
+	if (count > max_count)
+		count =3D max_count;
+
+	while (1) {
+		seq =3D st->clk->seq_count & ~1ULL;
+		virt_rmb();
+
+		if (copy_to_user(buf, ((char *)st->clk) + *ppos, count))
+			return -EFAULT;
+
+		virt_rmb();
+		if (seq =3D=3D st->clk->seq_count)
+			break;
+
+		if (ktime_after(ktime_get(), deadline))
+			return -ETIMEDOUT;
+	}
+
+	*ppos +=3D count;
+	return count;
+}
+
+static const struct file_operations vmclock_miscdev_fops =3D {
+        .mmap =3D vmclock_miscdev_mmap,
+        .read =3D vmclock_miscdev_read,
+};
+
+/* module operations */
+
+static void vmclock_remove(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct vmclock_state *st =3D dev_get_drvdata(dev);
+
+	if (st->ptp_clock)
+		ptp_clock_unregister(st->ptp_clock);
+
+	if (st->miscdev.minor =3D=3D MISC_DYNAMIC_MINOR)
+		misc_deregister(&st->miscdev);
+}
+
+static int vmclock_probe_acpi(struct device *dev, struct vmclock_state *st=
)
+{
+	struct acpi_buffer parsed =3D { ACPI_ALLOCATE_BUFFER };
+	struct acpi_device *adev =3D ACPI_COMPANION(dev);
+	union acpi_object *obj;
+	acpi_status status;
+
+	status =3D acpi_evaluate_object(adev->handle, "ADDR", NULL, &parsed);
+	if (ACPI_FAILURE(status)) {
+		ACPI_EXCEPTION((AE_INFO, status, "Evaluating ADDR"));
+		return -ENODEV;
+	}
+	obj =3D parsed.pointer;
+	if (!obj || obj->type !=3D ACPI_TYPE_PACKAGE || obj->package.count !=3D 2=
 ||
+	    obj->package.elements[0].type !=3D ACPI_TYPE_INTEGER ||
+	    obj->package.elements[1].type !=3D ACPI_TYPE_INTEGER)
+		return -EINVAL;
+
+	st->phys_addr =3D (obj->package.elements[0].integer.value << 0) |
+		(obj->package.elements[1].integer.value << 32);
+
+	return 0;
+}
+
+static void vmclock_put_idx(void *data)
+{
+	struct vmclock_state *st =3D data;
+
+	ida_free(&vmclock_ida, st->index);
+}
+
+static int vmclock_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct vmclock_state *st;
+	int ret;
+
+	st =3D devm_kzalloc(dev, sizeof (*st), GFP_KERNEL);
+	if (!st)
+		return -ENOMEM;
+
+	if (has_acpi_companion(dev))
+		ret =3D vmclock_probe_acpi(dev, st);
+	else
+		ret =3D -EINVAL; /* Only ACPI for now */
+
+	if (ret) {
+		dev_info(dev, "Failed to obtain physical address: %d\n", ret);
+		goto out;
+	}
+
+	st->clk =3D devm_memremap(dev, st->phys_addr, sizeof(*st->clk),
+				MEMREMAP_WB);
+	if (IS_ERR(st->clk)) {
+		ret =3D PTR_ERR(st->clk);
+		dev_info(dev, "failed to map shared memory\n");
+		st->clk =3D NULL;
+		goto out;
+	}
+
+	if (st->clk->magic !=3D VMCLOCK_MAGIC ||
+	    st->clk->size < sizeof(*st->clk) ||
+	    st->clk->version !=3D 1) {
+		dev_info(dev, "vmclock magic fields invalid\n");
+		ret =3D -EINVAL;
+		goto out;
+	}
+
+	if (IS_ENABLED(CONFIG_ARM64) &&
+	    st->clk->counter_id =3D=3D VMCLOCK_COUNTER_ARM_VCNT) {
+		/* Can we check it's the virtual counter? */
+		st->cs_id =3D CSID_ARM_ARCH_COUNTER;
+	} else if (IS_ENABLED(CONFIG_X86) &&
+		   st->clk->counter_id =3D=3D VMCLOCK_COUNTER_X86_TSC) {
+		st->cs_id =3D CSID_X86_TSC;
+	}
+	st->sys_cs_id =3D st->cs_id;
+
+	ret =3D ida_alloc(&vmclock_ida, GFP_KERNEL);
+	if (ret < 0)
+		goto out;
+
+	st->index =3D ret;
+        ret =3D devm_add_action_or_reset(&pdev->dev, vmclock_put_idx, st);
+	if (ret)
+		goto out;
+
+	st->name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->inde=
x);
+	if (!st->name) {
+		ret =3D -ENOMEM;
+		goto out;
+	}
+
+	/* If the structure is big enough, it can be mapped to userspace */
+	if (st->clk->size >=3D PAGE_SIZE) {
+		st->miscdev.minor =3D MISC_DYNAMIC_MINOR;
+		st->miscdev.fops =3D &vmclock_miscdev_fops;
+		st->miscdev.name =3D st->name;
+
+		ret =3D misc_register(&st->miscdev);
+		if (ret)
+			goto out;
+	}
+
+	/* If there is valid clock information, register a PTP clock */
+	if (st->cs_id) {
+		st->ptp_clock_info =3D ptp_vmclock_info;
+		strncpy(st->ptp_clock_info.name, st->name, sizeof(st->ptp_clock_info.nam=
e));
+		st->ptp_clock =3D ptp_clock_register(&st->ptp_clock_info, dev);
+
+		if (IS_ERR(st->ptp_clock)) {
+			ret =3D PTR_ERR(st->ptp_clock);
+			st->ptp_clock =3D NULL;
+			vmclock_remove(pdev);
+			goto out;
+		}
+	}
+
+	dev_set_drvdata(dev, st);
+
+ out:
+	return ret;
+}
+
+static const struct acpi_device_id vmclock_acpi_ids[] =3D {
+	{ "VMCLOCK", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, vmclock_acpi_ids);
+
+static struct platform_driver vmclock_platform_driver =3D {
+	.probe		=3D vmclock_probe,
+	.remove_new	=3D vmclock_remove,
+	.driver	=3D {
+		.name	=3D "vmclock",
+		.acpi_match_table =3D vmclock_acpi_ids,
+	},
+};
+
+module_platform_driver(vmclock_platform_driver)
+
+MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
+MODULE_DESCRIPTION("PTP clock using VMCLOCK");
+MODULE_LICENSE("GPL v2");
diff --git a/include/uapi/linux/vmclock.h b/include/uapi/linux/vmclock.h
new file mode 100644
index 000000000000..cf0f22205e79
--- /dev/null
+++ b/include/uapi/linux/vmclock.h
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-2-Cl=
ause) */
+
+/*
+ * This structure provides a vDSO-style clock to VM guests, exposing the
+ * relationship (or lack thereof) between the CPU clock (TSC, timebase, ar=
ch
+ * counter, etc.) and real time. It is designed to address the problem of
+ * live migration, which other clock enlightenments do not.
+ *
+ * When a guest is live migrated, this affects the clock in two ways.
+ *
+ * First, even between identical hosts the actual frequency of the underly=
ing
+ * counter will change within the tolerances of its specification (typical=
ly
+ * =C2=B150PPM, or 4 seconds a day). The frequency also varies over time o=
n the
+ * same host, but can be tracked by NTP as it generally varies slowly. Wit=
h
+ * live migration there is a step change in the frequency, with no warning=
.
+ *
+ * Second, there may be a step change in the value of the counter itself, =
as
+ * its accuracy is limited by the precision of the NTP synchronization on =
the
+ * source and destination hosts.
+ *
+ * So any calibration (NTP, PTP, etc.) which the guest has done on the sou=
rce
+ * host before migration is invalid, and needs to be redone on the new hos=
t.
+ *
+ * In its most basic mode, this structure provides only an indication to t=
he
+ * guest that live migration has occurred. This allows the guest to know t=
hat
+ * its clock is invalid and take remedial action. For applications that ne=
ed
+ * reliable accurate timestamps (e.g. distributed databases), the structur=
e
+ * can be mapped all the way to userspace. This allows the application to =
see
+ * directly for itself that the clock is disrupted and take appropriate
+ * action, even when using a vDSO-style method to get the time instead of =
a
+ * system call.
+ *
+ * In its more advanced mode. this structure can also be used to expose th=
e
+ * precise relationship of the CPU counter to real time, as calibrated by =
the
+ * host. This means that userspace applications can have accurate time
+ * immediately after live migration, rather than having to pause operation=
s
+ * and wait for NTP to recover. This mode does, of course, rely on the
+ * counter being reliable and consistent across CPUs.
+ *
+ * Note that this must be true UTC, never with smeared leap seconds. If a
+ * guest wishes to construct a smeared clock, it can do so. Presenting a
+ * smeared clock through this interface would be problematic because it
+ * actually messes with the apparent counter *period*. A linear smearing
+ * of 1 ms per second would effectively tweak the counter period by 1000PP=
M
+ * at the start/end of the smearing period, while a sinusoidal smear would
+ * basically be impossible to represent.
+ */
+
+#ifndef __VMCLOCK_H__
+#define __VMCLOCK_H__
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+
+struct vmclock_abi {
+	uint32_t magic;
+#define VMCLOCK_MAGIC	0x4b4c4356 /* "VCLK" */
+	uint16_t size;		/* Size of page containing this structure */
+	uint16_t version;	/* 1 */
+
+	/* Sequence lock. Low bit means an update is in progress. */
+	uint64_t seq_count;
+
+	/*
+	 * This field changes to another non-repeating value when the CPU
+	 * counter is disrupted, for example on live migration.
+	 */
+	uint64_t disruption_marker;
+
+	/*
+	 * By providing the TAI offset, the guest can know both UTC and TAI
+	 * reliably. There is no need to choose one *or* the other. Valid if
+	 * VMCLOCK_FLAG_TAI_OFFSET_VALID is set in flags.
+	 */
+	int16_t tai_offset_sec;
+
+	uint16_t flags;
+	/* Indicates that the tai_offset_sec field is valid */
+#define VMCLOCK_FLAG_TAI_OFFSET_VALID		(1 << 0)
+	/*
+	 * Optionally used to notify guests of pending maintenance events.
+	 * A guest may wish to remove itself from service if an event is
+	 * coming up. Two flags indicate the rough imminence of the event.
+	 */
+#define VMCLOCK_FLAG_DISRUPTION_SOON		(1 << 1) /* About a day */
+#define VMCLOCK_FLAG_DISRUPTION_IMMINENT	(1 << 2) /* About an hour */
+	/* Indicates that the utc_time_maxerror_picosec field is valid */
+#define VMCLOCK_FLAG_UTC_MAXERROR_VALID		(1 << 3)
+	/* Indicates counter_period_error_rate_frac_sec is valid */
+#define VMCLOCK_FLAG_UTC_PERIOD_ERROR_VALID	(1 << 4)
+
+	uint8_t clock_status;
+#define VMCLOCK_STATUS_UNKNOWN		0
+#define VMCLOCK_STATUS_INITIALIZING	1
+#define VMCLOCK_STATUS_SYNCHRONIZED	2
+#define VMCLOCK_STATUS_FREERUNNING	3
+#define VMCLOCK_STATUS_UNRELIABLE	4
+
+	uint8_t counter_id;
+#define VMCLOCK_COUNTER_INVALID		0
+#define VMCLOCK_COUNTER_X86_TSC		1
+#define VMCLOCK_COUNTER_ARM_VCNT	2
+
+	/* Bit shift for counter_period_frac_sec and its error rate */
+	uint8_t counter_period_shift;
+
+	/*
+	 * Unlike in NTP, this can indicate a leap second in the past. This
+	 * is needed to allow guests to derive an imprecise clock with
+	 * smeared leap seconds for themselves, as some modes of smearing
+	 * need the adjustments to continue even after the moment at which
+	 * the leap second should have occurred.
+	 */
+	int8_t leapsecond_direction;
+	uint64_t leapsecond_tai_sec; /* Since 1970-01-01 00:00:00z */
+
+	/*
+	 * Paired values of counter and UTC at a given point in time.
+	 */
+	uint64_t counter_value;
+	uint64_t utc_time_sec; /* Since 1970-01-01 00:00:00z */
+	uint64_t utc_time_frac_sec;
+
+	/*
+	 * Counter frequency, and error margin. The unit of these fields is
+	 * seconds >> (64 + counter_period_shift)
+	 */
+	uint64_t counter_period_frac_sec;
+	uint64_t counter_period_error_rate_frac_sec;
+
+	/* Error margin of UTC reading above (=C2=B1 picoseconds) */
+	uint64_t utc_time_maxerror_picosec;
+};
+
+#endif /*  __VMCLOCK_H__ */
--=20
2.44.0



--=-FMW9TUO+aevWuKuWvAJU
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNjI1MTkwMTU2WjAvBgkqhkiG9w0BCQQxIgQgXR5tljqj
a6YSXhIZHOO8CctCgKpzKnnhkH64CLF9Ytcwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBRtZ05ABDiSaZVKrFz6bWu+Ctz8hlLdQit
YSrTrwgFvxAPX2yJfr01yZFWT2U15gBR6PVLkP7BM/D/5n8Sbo1Ui3ifWSnRAecwLUWDJwOSQ49P
IlgC8rtfrBtgUCGsEG98i9LxNRm//NTLgM9mMfAa8n08dDZS90YVuDpOF4IjV4ToEfNB0MEI1tgI
oHTvWCDHLCOYUOkafD3Gx4hnRYlwRr+59x91NVVoMlLZn29xgHCwQYEvzeRka4zAs2cccchl9mSZ
NaPUzuN0jyrqtjArt1cgydXyIQDGnsQH8/dO0SIhu6KnpA0k1YYFuktQg53d+5aLO+m3eL7UzMop
gK0nWQCCMVqT0CSCQyFQwojLUJJuXa0d11mgPsK23Kg+I3FdTHHKYaFLz5W/aQp7i1I4IaZ8obAK
rMvDqjpAHpIPWZqetlIXSrWbKCmfensNXs/UVIIOMFh5q5XtGnQtY3HNhHo6wkYvIyn8bW4z+VUB
MWmUdWaryi9jwTcT7PohO7cvxj6Bu8U3jdL0QXzWaFJzttmUlvn0RoAIICK4Jsm41bWsr5xOp3BS
mBBsMXveMDfycbG+JTTTijZUuRsKyVyp1Z+3vqcK1Tst5lhPMePQ9SumI/rUcWQsDdTOcSTsc37O
VcKcJna3espXPZidjNGqSQHMUsTfihJhy79vFv6yQQAAAAAAAA==


--=-FMW9TUO+aevWuKuWvAJU--

