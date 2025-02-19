Return-Path: <linux-rtc+bounces-3241-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B40BA3C8EA
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 20:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33013AFCFE
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 19:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4D822B58A;
	Wed, 19 Feb 2025 19:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hd2IIzP2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C222AE7E;
	Wed, 19 Feb 2025 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739993645; cv=none; b=elpjPiEVCSQYx5OBT8hA3udSBdS2QQd8hSYGoEBLzx5sQgPPz5WkuHIIU4yE+EnbKxhFraTaRUN7/oK6ulq2T4RLnG95PpJ2TPu0SVi3lO2hre1/dRrQn+M2gYnuKwhYuwbhdx/1o7deFVm6Aymsegkl8giQiK5SvrRnCtffqEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739993645; c=relaxed/simple;
	bh=teNRojGpOLNz5H/L6slazlSb8pZFQ/tNepdoY32xkYc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OezkWmLYUH2zJVl9E9gGlTjSQhrpSQ5hb4mTy5NI6hBgjXSxLqZY5ZeQ8yLtQZt57WjYVGn8I595pFZ4NzZ1RmjGjwhwKCP/KpymIYJ/tMNkzzKCZNVDsKuv/fVwQumQTmDNjP7vA6lrmaYHma9B7qtATcITqozafL5m6/d65/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hd2IIzP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JG6nh0026862;
	Wed, 19 Feb 2025 19:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ucERdosz3meDNO5pP8Ssls
	dhIEqWUsTqCQuLLvq3r+c=; b=Hd2IIzP28GaXzyMBhOcQJsD6lRP8Dy83wI0fur
	HcMCuqD4BFo60UqHZ1+ER5AS0eJzk4K+ABl2UV0hNbpANKTyPVZr88nr/twcpQ8t
	paGo1embi7VDk2ihnSeb3tDzmz/QaesNj8BuiM4GkuPW0RS0UX1tvdUlpu2GWBJu
	gS8oWWpDmv5GsP+xcy0pjaHp7syWF7H1NhYZQGYQ0BlyMqkdXxEoFbzo7z/pC3Ql
	O5FYFTKUoRbyE/fC+W0DpBI7btoilj84zs0Yu1zyZ97kvMrM8BTiuIUxYn43oZpz
	O/ywcNnzSP0NAS7+b8i000lzLR3HF5wiG9SOdueZ6whRpnqA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0kscx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:33:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JJXZlD023787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:33:35 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 11:33:29 -0800
From: Peter Hilber <quic_philber@quicinc.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>,
        Peter Hilber <quic_philber@quicinc.com>,
        =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
        Richard Cochran
	<richardcochran@gmail.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <virtualization@lists.linux.dev>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>, Marc Zyngier <maz@kernel.org>,
        "Mark
 Rutland" <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Parav Pandit
	<parav@nvidia.com>,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>, <virtio-dev@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>
Subject: [PATCH v5 0/4] Add virtio_rtc module
Date: Wed, 19 Feb 2025 20:32:55 +0100
Message-ID: <20250219193306.1045-1-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RiMU8GsxwEQleUbPouAVE_-8jFDYWcbh
X-Proofpoint-ORIG-GUID: RiMU8GsxwEQleUbPouAVE_-8jFDYWcbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_08,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190151

This series implements a driver for a virtio-rtc device conforming to spec
proposal v7 [1]. It includes a PTP clock driver and an RTC class driver
with alarm.

v5 updates
==========

Important changes compared to the previous driver series [3] are:

- Update to spec proposal v7 [1].

- Fix multiple initialization related bugs.

- Drop the RFC tag, since no major outstanding issues are apparent.

Overview
========

This patch series adds the virtio_rtc module, and related bugfixes. The
virtio_rtc module implements a driver compatible with the proposed Virtio
RTC device specification [1]. The Virtio RTC (Real Time Clock) device
provides information about current time. The device can provide different
clocks, e.g. for the UTC or TAI time standards, or for physical time
elapsed since some past epoch. The driver can read the clocks with simple
or more accurate methods. Optionally, the driver can set an alarm.

For the Virtio RTC device, there is currently a proprietary implementation,
which has been used for testing.

PTP clock interface
===================

virtio_rtc exposes clocks as PTP clocks to userspace, similar to ptp_kvm.
If both the Virtio RTC device and this driver have special support for the
current clocksource, time synchronization programs can use
cross-timestamping using ioctl PTP_SYS_OFFSET_PRECISE2 aka
PTP_SYS_OFFSET_PRECISE. Similar to ptp_kvm, system time synchronization
with single-digit ns precision is possible with a quiescent reference clock
(from the Virtio RTC device). This works even when the Virtio device
response is slow compared to ptp_kvm hypercalls.

The following illustrates a test using PTP_SYS_OFFSET_PRECISE, with
interspersed strace log and chrony [2] refclocks log, on arm64. In the
example, chrony tracks a virtio_rtc PTP clock ("PHCV", /dev/ptp0). The raw
offset between the virtio_rtc clock and CLOCK_REALTIME is 0 to 1 ns. At the
device side, the Virtio RTC device artificially delays both the clock read
request, and the response, by 50 ms. Cross-timestamp interpolation still
works with this delay. chrony also monitors a ptp_kvm clock ("PHCK",
/dev/ptp3) for comparison, which yields a similar offset.

	ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.000329>
	===============================================================================
	   Date (UTC) Time         Refid  DP L P  Raw offset   Cooked offset      Disp.
	===============================================================================
	2023-06-29 18:49:55.595742 PHCK    0 N 0  1.000000e-09  8.717931e-10  5.500e-08
	2023-06-29 18:49:55.595742 PHCK    - N -       -        8.717931e-10  5.500e-08
	ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.101545>
	2023-06-29 18:49:56.147766 PHCV    0 N 0  1.000000e-09  8.801870e-10  5.500e-08
	2023-06-29 18:49:56.147766 PHCV    - N -       -        8.801870e-10  5.500e-08
	ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.000195>
	2023-06-29 18:49:56.202446 PHCK    0 N 0  1.000000e-09  7.364180e-10  5.500e-08
	2023-06-29 18:49:56.202446 PHCK    - N -       -        7.364180e-10  5.500e-08
	ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.101484>
	2023-06-29 18:49:56.754641 PHCV    0 N 0  0.000000e+00 -2.617368e-10  5.500e-08
	2023-06-29 18:49:56.754641 PHCV    - N -       -       -2.617368e-10  5.500e-08
	ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.000270>
	2023-06-29 18:49:56.809282 PHCK    0 N 0  1.000000e-09  7.779321e-10  5.500e-08
	2023-06-29 18:49:56.809282 PHCK    - N -       -        7.779321e-10  5.500e-08
	ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.101510>
	2023-06-29 18:49:57.361376 PHCV    0 N 0  0.000000e+00 -2.198794e-10  5.500e-08
	2023-06-29 18:49:57.361376 PHCV    - N -       -       -2.198794e-10  5.500e-08

This patch series only adds special support for the Arm Generic Timer
clocksource. At the driver side, it should be easy to support more
clocksources.

Fallback PTP clock interface
----------------------------

Without special support for the current clocksource, time synchronization
programs can still use ioctl PTP_SYS_OFFSET_EXTENDED2 aka
PTP_SYS_OFFSET_EXTENDED. In this case, precision will generally be worse
and will depend on the Virtio device response characteristics.

The following illustrates a test using PTP_SYS_OFFSET_EXTENDED, with
interspersed strace log and chrony refclocks log, on x86-64 (with `ts'
values omitted):

	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
	===============================================================================
	   Date (UTC) Time         Refid  DP L P  Raw offset   Cooked offset      Disp.
	===============================================================================
	2023-06-28 14:11:26.697782 PHCV    0 N 0  3.318200e-05  3.450891e-05  4.611e-06
	2023-06-28 14:11:26.697782 PHCV    - N -       -        3.450891e-05  4.611e-06
	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
	2023-06-28 14:11:27.208763 PHCV    0 N 0 -3.792800e-05 -4.023965e-05  4.611e-06
	2023-06-28 14:11:27.208763 PHCV    - N -       -       -4.023965e-05  4.611e-06
	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
	2023-06-28 14:11:27.722818 PHCV    0 N 0 -3.328600e-05 -3.134404e-05  4.611e-06
	2023-06-28 14:11:27.722818 PHCV    - N -       -       -3.134404e-05  4.611e-06
	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
	2023-06-28 14:11:28.233572 PHCV    0 N 0 -4.966900e-05 -4.584331e-05  4.611e-06
	2023-06-28 14:11:28.233572 PHCV    - N -       -       -4.584331e-05  4.611e-06
	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
	2023-06-28 14:11:28.742737 PHCV    0 N 0  4.902700e-05  5.361388e-05  4.611e-06
	2023-06-28 14:11:28.742737 PHCV    - N -       -        5.361388e-05  4.611e-06

PTP clock setup
---------------

The following udev rule can be used to get a symlink /dev/ptp_virtio to the
UTC clock:

	SUBSYSTEM=="ptp", ATTR{clock_name}=="Virtio PTP type 0, variant 0", SYMLINK += "ptp_virtio"

The following chrony configuration directive can then be added in
/etc/chrony/chrony.conf to synchronize to the Virtio UTC clock:

	refclock PHC /dev/ptp_virtio refid PHCV poll -1 dpoll -1

RTC interface
=============

This patch series adds virtio_rtc as a generic Virtio driver, including
both a PTP clock driver and an RTC class driver.

Feedback is greatly appreciated.

[1] https://lore.kernel.org/virtio-comment/20250123101616.664-1-quic_philber@quicinc.com/
[2] https://chrony.tuxfamily.org/
[3] https://lore.kernel.org/lkml/20241219201118.2233-1-quic_philber@quicinc.com/

Changelog
=========

v5:

- Update to virtio-rtc spec v7, essentially removing definitions.

- Fix multiple bugs after readying device during probe and restore.

- Actually initialize Virtio clock id for RTC class device.

- Add freeze/restore ops already in first patch.

- Minor changes:

  - Use new APIs devm_device_init_wakeup(), secs_to_jiffies().

  - Fix style issues.

  - Improve logging types and clarity.

  - Drop unnecessary memory barrier pair.

  - Return error status from device, whenever available.

v4:

- Update Virtio interface to spec v6.

- Distinguish UTC-like clocks by handling of leap seconds (spec v6).

- Do not create RTC class device for clocks which may step on leap seconds
  (Alexandre Belloni).

- Clear RTC class feature bit instead of defining reduced ops
  (Alexandre Belloni).

- For PTP clock name, always use numeric clock type, and numeric variant.

- Use macros for 64-bit divisions.

- Remove unnecessary memory barriers.

- Cosmetic improvements.

- Drop upstreamed timekeeping bugfixes from series.

v3:

- Update to conform to virtio spec RFC v3 (no significant behavioral
  changes).

- Add RTC class driver with alarm according to virtio spec RFC v3.

- For cross-timestamp corner case fix, switch back to v1 style closed
  interval test (Thomas Gleixner).

v2:

- Depend on patch series "treewide: Use clocksource id for
  get_device_system_crosststamp()" to avoid requiring a clocksource pointer
  with get_device_system_crosststamp().

- Assume Arm Generic Timer will use CP15 virtual counter. Drop
  arm_arch_timer helper functions (Marc Zyngier).

- Improve cross-timestamp fixes problem description and implementation
  (John Stultz).


Peter Hilber (4):
  virtio_rtc: Add module and driver core
  virtio_rtc: Add PTP clocks
  virtio_rtc: Add Arm Generic Timer cross-timestamping
  virtio_rtc: Add RTC class driver

 MAINTAINERS                          |    7 +
 drivers/virtio/Kconfig               |   64 ++
 drivers/virtio/Makefile              |    5 +
 drivers/virtio/virtio_rtc_arm.c      |   23 +
 drivers/virtio/virtio_rtc_class.c    |  262 +++++
 drivers/virtio/virtio_rtc_driver.c   | 1404 ++++++++++++++++++++++++++
 drivers/virtio/virtio_rtc_internal.h |  122 +++
 drivers/virtio/virtio_rtc_ptp.c      |  347 +++++++
 include/uapi/linux/virtio_rtc.h      |  237 +++++
 9 files changed, 2471 insertions(+)
 create mode 100644 drivers/virtio/virtio_rtc_arm.c
 create mode 100644 drivers/virtio/virtio_rtc_class.c
 create mode 100644 drivers/virtio/virtio_rtc_driver.c
 create mode 100644 drivers/virtio/virtio_rtc_internal.h
 create mode 100644 drivers/virtio/virtio_rtc_ptp.c
 create mode 100644 include/uapi/linux/virtio_rtc.h


base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
-- 
2.43.0


