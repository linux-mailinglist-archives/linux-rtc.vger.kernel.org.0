Return-Path: <linux-rtc+bounces-1315-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED4B909702
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 10:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 281EA1C20FAC
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Jun 2024 08:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FC018EB8;
	Sat, 15 Jun 2024 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="soM731N+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B07E18637;
	Sat, 15 Jun 2024 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718440861; cv=none; b=AYZA+o2HCWIBUjm97qtf968ewCvmUvp1ppQbohAVTfr5HAsRZcO3QLiyJtHiGY3ewVPHNM9IisPAYlrJ4rwRETwbjf6Q7WyaNNrpjYivy4+4Hf9/9PrAeJiSgp6mvPIahZM3aH4x7jwJsi8r+SxNJik3rhJL6B8zWH15r9l27js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718440861; c=relaxed/simple;
	bh=4R3uUIxrJQiuGjqkIGpoeNcafPWXyxGNmxhK5Rodovc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HY86H4YM+Ztr4WhhqxutNgz3em2CvZKOAC+7Ff6hf8qoHsO5Sam1dWaphzEvs/MbgBaLYmMlEUzO4uovborpTedXCeVOoF/JNWpJz9dDTjXYKOx4DEPO08OyZKlA3Vu4kNVOrANYJtT4AX+VpGOa+2bkJQ/yxQp+3Z1CDlotnew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=soM731N+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iZPZYccp8Ej58ZDkGCeEMv/9sZD/mBEq7RPSkU84YJE=; b=soM731N+GuejG8ToT2/YbplLdg
	rbdKMhY9hwyk82HdbSd+AEWoeQo2Kq4gFyfBZ0ThRkOU34nOl8sLD2v1kSW0SFtFKtKP4IPlbMlXV
	0K9zN55T7m5TRpMGdi4BSZiukBTifhhla4ITwYzhi7BrAi21izieMHma6cWhd9lxURzZ3WfpDWC9Q
	498Tn2B18+zr+MqDVqUeM2w7TcYQmvHqpQRJKH+GGhGWMr5be5yor7FW7pbqb9P//8Y03ix40VWly
	UTVQ8rO2Mv5etGFqra0GuOPqLLIb6LTWUfvnN3XGZxuWqccJRg4rpLmerX6UZvXyD0oo8TMXEmUQ/
	tDozP7BA==;
Received: from [2001:8b0:10b:5:5157:7793:c27:1b76] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIOxx-000000008Ds-0NX4;
	Sat, 15 Jun 2024 08:40:53 +0000
Message-ID: <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
Subject: Re: [RFC PATCH v3 0/7] Add virtio_rtc module and related changes
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 linux-kernel@vger.kernel.org,  virtualization@lists.linux.dev,
 virtio-dev@lists.oasis-open.org,  linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>, Jason Wang
 <jasowang@redhat.com>, John Stultz <jstultz@google.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, Richard Cochran
 <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 15 Jun 2024 09:40:52 +0100
In-Reply-To: <20231218073849.35294-1-peter.hilber@opensynergy.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-lc60//8qBao9hYxY28aM"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-lc60//8qBao9hYxY28aM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-12-18 at 08:38 +0100, Peter Hilber wrote:
> RFC v3 updates
> --------------
>=20
> This series implements a driver for a virtio-rtc device conforming to spe=
c
> RFC v3 [1]. It now includes an RTC class driver with alarm, in addition t=
o
> the PTP clock driver already present before.
>=20
> This patch series depends on the patch series "treewide: Use clocksource =
id
> for get_device_system_crosststamp()" [3]. Pull [4] to get the combined
> series on top of mainline.
>=20
> Overview
> --------
>=20
> This patch series adds the virtio_rtc module, and related bugfixes. The
> virtio_rtc module implements a driver compatible with the proposed Virtio
> RTC device specification [1]. The Virtio RTC (Real Time Clock) device
> provides information about current time. The device can provide different
> clocks, e.g. for the UTC or TAI time standards, or for physical time
> elapsed since some past epoch. The driver can read the clocks with simple
> or more accurate methods. Optionally, the driver can set an alarm.
>=20
> The series first fixes some bugs in the get_device_system_crosststamp()
> interpolation code, which is required for reliable virtio_rtc operation.
> Then, add the virtio_rtc implementation.
>=20
> For the Virtio RTC device, there is currently a proprietary implementatio=
n,
> which has been used for provisional testing.

As discussed before, I don't think it makes sense to design a new high-
precision virtual clock which only gets it right *most* of the time. We
absolutely need to address the issue of live migration.

When live migration occurs, the guest's time precision suffers in two
ways.

First, even when migrating to a supposedly identical host the precise
rate of the underlying counter (TSC, arch counter, etc.) can change
within the tolerances (e.g. =C2=B150PPM) of the hardware. Unlike the natura=
l
changes that NTP normally manages to track, this is a *step* change,
potentially from -50PPM to +50PPM from one host to the next.

Second, the accuracy of the counter as preserved across migration is
limited by the accuracy of each host's NTP synchronization. So there is
also a step change in the value of the counter itself.

At the moment of migration, the guest's timekeeping should be
considered invalid. Any previous cross-timestamps are meaningless, and
blindly using the previously-known relationship between the counter and
real time can lead to problems such as corruption in distributed
databases, fines for mis-timestamped transactions, and other general
unhappiness.

We obviously can't get a new timestamp from the virtio_rtc device every
time an application wants to know the time reliably. We don't even want
*system* calls for that, which is why we have it in a vDSO.

We can take the same approach to warning the guest about clock
disruption due to live migration. A shared memory region from the
virtual clock device even be mapped all the way to userspace, for those
applications which need precise and *reliable* time to check a
'disruption' marker in it, and do whatever is appropriate (e.g. abort
transactions and wait for time to resync) when it happens.

We can do better than just letting the guest know about disruption, of
course. We can put the actual counter=E2=86=92realtime relationship into th=
e
memory region too. As well as being able to provide a PTP driver with
this, the applications which care about *reliable* timestamps can mmap
the page directly and use it, vDSO-style, to have accurate timestamps
even from the first cycle after migration.

When disruption is signalled, the guest needs to throw away any
*additional* refinement that it's done with NTP/PTP/PPS/etc. and revert
to knowing nothing more than what the hypervisor advertises here.

Here's a first attempt at defining such a memory structure. For now
I've done it as a "vmclock" ACPI device based loosely on vmgenid, but I
think it makes most sense for this to be part of the virtio_rtc spec.
Ultimately it doesn't matter *how* the guest finds the memory region.

Very preliminary QEMU hacks at=20
https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/vmclock
(I still need to do the KVM side helper for actually filling in the
host clock information, converted to the *guest* TSC)

This is the guest side. H aving heckled your assumption that we can use
the virt counter on Arm, I concede I'm doing the same thing for now.
The structure itself is at the end, or see
https://git.infradead.org/?p=3Dusers/dwmw2/linux.git;a=3Dblob;f=3Dinclude/u=
api/linux/vmclock.h;hb=3Dvmclock

=46rom 9e1c3b823d497efa4e0acb21b226a72e4d6e8a53 Mon Sep 17 00:00:00 2001
From: David Woodhouse <dwmw@amazon.co.uk>
Date: Mon, 10 Jun 2024 15:10:11 +0100
Subject: [PATCH] ptp: Add vDSO-style vmclock support

The vmclock "device" provides a shared memory region with precision clock
information. By using shared memory, it is safe across Live Migration.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 drivers/ptp/Kconfig          |  13 ++
 drivers/ptp/Makefile         |   1 +
 drivers/ptp/ptp_vmclock.c    | 404 +++++++++++++++++++++++++++++++++++
 include/uapi/linux/vmclock.h | 102 +++++++++
 4 files changed, 520 insertions(+)
 create mode 100644 drivers/ptp/ptp_vmclock.c
 create mode 100644 include/uapi/linux/vmclock.h

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index 604541dcb320..ace6d58c1781 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -131,6 +131,19 @@ config PTP_1588_CLOCK_KVM
 	  To compile this driver as a module, choose M here: the module
 	  will be called ptp_kvm.
=20
+config PTP_1588_CLOCK_VMCLOCK
+	tristate "Virtual machine PTP clock"
+	depends on X86_TSC || ARM_ARCH_TIMER
+	depends on PTP_1588_CLOCK && ACPI
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
index 000000000000..3c4e027090c5
--- /dev/null
+++ b/drivers/ptp/ptp_vmclock.c
@@ -0,0 +1,404 @@
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
+#include <linux/ptp_kvm.h>
+#include <linux/platform_device.h>
+#include <linux/miscdevice.h>
+#include <linux/acpi.h>
+#include <uapi/linux/vmclock.h>
+
+#include <linux/ptp_clock_kernel.h>
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
+	enum clocksource_ids cs_id;
+	int index;
+	char *name;
+};
+
+static int vmclock_get_crosststamp(struct vmclock_state *st,
+				   struct system_counterval_t *system_counter,
+				   struct timespec64 *tspec)
+{
+	uint64_t cycle, delta, seq, delta_s32, delta_s64, delta_s32b;
+	uint64_t delta_lo, delta_hi, period_lo, period_hi, frac_sec_lo, frac_sec_=
hi;
+	int ret =3D 0;
+
+#ifdef CONFIG_X86
+	if (check_tsc_unstable())
+		return -EINVAL;
+#endif
+
+	preempt_disable_notrace();
+
+	do {
+
+		seq =3D st->clk->seq_count & ~1ULL;
+		virt_rmb();
+
+		if (st->clk->clock_status =3D=3D VMCLOCK_STATUS_UNRELIABLE) {
+			ret =3D -EINVAL;
+			virt_rmb();
+			continue;
+		}
+
+		cycle =3D get_cycles();
+
+		tspec->tv_sec =3D st->clk->utc_time_sec;
+		frac_sec_lo =3D st->clk->utc_time_frac_sec & 0xffffffff;
+		frac_sec_hi =3D st->clk->utc_time_frac_sec >> 32;
+
+		delta =3D cycle - st->clk->counter_value;
+
+		delta_lo =3D delta & 0xffffffff;
+		delta_hi =3D delta >> 32;
+		period_lo =3D st->clk->counter_period_frac_sec & 0xffffffff;
+		period_hi =3D st->clk->counter_period_frac_sec >> 32;
+
+		/* Delta in units of (second >> 32) */
+		delta_s32 =3D delta_lo * period_hi;
+
+		/* Avoid overflow by skimming off the full seconds */
+		tspec->tv_sec +=3D delta_s32 >> 32;
+		delta_s32 &=3D 0xffffffff;
+
+		if (delta_hi) {
+			tspec->tv_sec +=3D delta_hi * period_hi;
+			delta_s32b =3D delta_hi * period_lo;
+
+			tspec->tv_sec +=3D delta_s32b >> 32;
+			delta_s32 +=3D delta_s32b & 0xffffffff;
+		}
+
+		delta_s32 +=3D frac_sec_hi;
+
+		delta_s64 =3D (period_lo * delta_lo) + frac_sec_lo;
+		delta_s32 +=3D delta_s64 >> 32;
+		delta_s64 &=3D 0xffffffff;
+
+		tspec->tv_sec +=3D delta_s32 >> 32;
+		delta_s32 &=3D 0xffffffff;
+
+		tspec->tv_nsec =3D ((delta_s32 * NSEC_PER_SEC) +
+				  ((delta_s64 * NSEC_PER_SEC) >> 32)) >> 32;
+
+		ret =3D 0;
+
+		virt_rmb();
+	} while (seq !=3D st->clk->seq_count);
+
+	preempt_enable_notrace();
+
+	if (ret)
+		return ret;
+
+	if (system_counter) {
+		system_counter->cycles =3D cycle;
+		system_counter->cs_id =3D st->cs_id;
+	}
+
+	return 0;
+}
+
+static int ptp_vmclock_get_time_fn(ktime_t *device_time,
+				   struct system_counterval_t *system_counter,
+				   void *ctx)
+{
+	struct vmclock_state *st =3D ctx;
+	struct timespec64 tspec;
+	int ret;
+
+	ret =3D vmclock_get_crosststamp(st, system_counter, &tspec);
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
+
+	return get_device_system_crosststamp(ptp_vmclock_get_time_fn, st,
+					     NULL, xtstamp);
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
+	return vmclock_get_crosststamp(st, NULL, ts);
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
+	do {
+		seq =3D st->clk->seq_count & ~1ULL;
+		virt_rmb();
+
+		if (copy_to_user(buf, ((char *)st->clk) + *ppos, count))
+			return -EFAULT;
+
+		virt_rmb();
+	} while (seq !=3D st->clk->seq_count);
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
index 000000000000..cac24536c5c8
--- /dev/null
+++ b/include/uapi/linux/vmclock.h
@@ -0,0 +1,102 @@
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
+ */
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
+	uint8_t pad[3];
+
+	/*
+	 * UTC on its own is non-monotonic and ambiguous.
+	 *
+	 * Inform the guest about the TAI offset, so that it can have an
+	 * actual monotonic and reliable time reference if it needs it.
+	 *
+	 * Also indicate a nearby leap second, if one exists. Unlike in
+	 * NTP, this may indicate a leap second in the past in order to
+	 * indicate that it *has* been taken into account.
+	 */
+	int8_t leapsecond_direction;
+	int16_t tai_offset_sec;
+	uint64_t leapsecond_counter_value;
+	uint64_t leapsecond_tai_time;
+
+	/* Paired values of counter and UTC at a given point in time. */
+	uint64_t counter_value;
+	uint64_t utc_time_sec;
+	uint64_t utc_time_frac_sec;
+
+	/* Counter frequency, and error margin. Units of (second >> 64) */
+	uint64_t counter_period_frac_sec;
+	uint64_t counter_period_error_rate_frac_sec;
+
+	/* Error margin of UTC reading above (=C2=B1 picoseconds) */
+	uint64_t utc_time_maxerror_picosec;
+};
--=20
2.44.0



--=-lc60//8qBao9hYxY28aM
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNjE1MDg0MDUyWjAvBgkqhkiG9w0BCQQxIgQgXdotV1z4
oSuhJScLVN9oAHUbApw3FJDqfe1K1lVVxaEwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgB5Nje749HyAyQsYmN75bys3EFmHvIktrU/
UpiOZvf1Rjg0pVtNGbESGTxVXqCcvQWxqjBpmjqz52iHqlUjU5TbqPubiNckO/StdJpzMN88Vy2r
mSreR2vvCtAYCKFvWsSWtV3t7qYF5KcEwrH+ewumDP+bhEzPE+GHM9dNeu2NCObrPJylVKHCB0LE
qeFdBcyeVnpn/yAwyfofQfk79B73XO89fpPwZv3qc7BqHjVDxqMspr9kH9BC3ZoLKpZc9IC2qtwV
jZJ7mE6ey0jOJ6t919BUWQiGI8XTalqUxM/+qfpt/Qd17Myys25HwOWk3tf1O+yGEyXMykkqestY
BfrugudFfudz1ssdoNl1Q41nM+CM/1SQsSX1D9AoGhs7FrEnC2xLXfYABY+B4QsXIoQY0a1pQE1a
ohPGfqC3kHhdpeW3UEMMBavlISs/RadYQ2uMq1G3sOsgjE/Xw+lFJnFqen+aUgZZAZs65geenCs9
5zTjFL8MnwH7H/piVf9BMhb86iCP9PIuId5v56Zgouw+z7bxlzxdItsoBmx6yEnGGbxzesDaQTmq
dS61voh59SUKIoKIHEhFmN+pT0do/p2fsTD2OQeAMGaQas2vSkQGdOHBZwriCj9UNlMDxabvXWDy
gG/U69pdTybl/nRD0pHfQc/SWpuvMNqPEyY006sYwQAAAAAAAA==


--=-lc60//8qBao9hYxY28aM--

