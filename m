Return-Path: <linux-rtc+bounces-3481-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C70A5FE05
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 18:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE6119C576A
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Mar 2025 17:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7611AAE17;
	Thu, 13 Mar 2025 17:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aA1tknTS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE3A189BAF;
	Thu, 13 Mar 2025 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741887504; cv=none; b=SJXmj9Sodw9yt172dN3FkPbGBAwRpejSCEMuNm/D6xNa3MiXROr9r0gyqDg3AK4QeJeoRI+n35E9bObrqnS4sGIasg24vLdQdDn/0j9QjzkUbviNIiiMH2PK4SbitQqMTlCcuAtKBMBEF/F6U9quPBdnYDsR5B1xqrn2CGqms8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741887504; c=relaxed/simple;
	bh=sJQHlDmoBndg40QlRDNVL8OjmbHYcQ5yy/Ir1GAjq2o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r/CNTj1YpaP3ucSHao5r9xN0MAB+CCcU+SsAIJpOTn1D1iPTddJ77A5NSzCOF7p54MTEskEu+77ExWdeazECJqFgxDAVPlMoDtTjID4EAxtZ7bKtyUGhnx/vj76FRPqgvpOFitQd67iljpOEOAnNxfHk9VR13WwUbB/Uus7nhF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aA1tknTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9pjYR018375;
	Thu, 13 Mar 2025 17:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wnjrGjtplq5ITag3q2KDIs
	jhDvdS8gSP3aILgKJHZbw=; b=aA1tknTSxPHDFvZ2MVvuk0yOz0AnaMXeOEzRpp
	Urp8ypwmiEU10BWGWpzPdqkToaWjAZcFifJZmWAmWbaEH7WO/PWyUC/VCdf6FUUA
	JP+baRhKt3Cm/g2+ikQTJjhe133oXF65uyRM3DEo6bsHl1Yvb2/9aW0FnYOxaZQn
	IB7tW15A8jor5z2R3/9LBc5Ae+hpgxf9IIa019pXLuRlfMkAf7UXF7RsqIVPJ8L5
	EhNUUeQb8pproJzEgXS4W5BJzthDS7n/3Z4YNFosqpazeTMFYFWabJsjKcVCAdC8
	vD6FuBa/zx02ecvdfeMcsTY282xWVRYNVNhkyVGqvL4IcENA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nxqsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 17:37:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DHbhfI025196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 17:37:43 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 10:37:38 -0700
From: Peter Hilber <quic_philber@quicinc.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: Trilok Soni <quic_tsoni@quicinc.com>,
        Peter Hilber
	<quic_philber@quicinc.com>,
        =?UTF-8?q?Eugenio=20P=C3=A9rez?=
	<eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <virtualization@lists.linux.dev>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Parav Pandit <parav@nvidia.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        Cornelia Huck
	<cohuck@redhat.com>, Simon Horman <horms@kernel.org>,
        <virtio-dev@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>
Subject: [PATCH v6 0/4] Add virtio_rtc module
Date: Thu, 13 Mar 2025 18:36:56 +0100
Message-ID: <20250313173707.1492-1-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MOVWaCWILqQBWsCpWUGNq9pmqWxcDy9_
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d317e8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=dIu3SnmMAAAA:8 a=nYO1uykr7MxyYb2uiYgA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=Ua9G7VpiFza3u12uuhVB:22
X-Proofpoint-ORIG-GUID: MOVWaCWILqQBWsCpWUGNq9pmqWxcDy9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130135

This series implements a driver for a virtio-rtc device conforming to spec
proposal v8 [1]. It includes a PTP clock driver and an RTC class driver
with alarm.

v6 updates
==========

v6 fixes the PTP clock name length, and a few style issues, some of which
resulted in warnings.

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

	SUBSYSTEM=="ptp", ATTR{clock_name}=="Virtio PTP type 0/variant 0", SYMLINK += "ptp_virtio"

The following chrony configuration directive can then be added in
/etc/chrony/chrony.conf to synchronize to the Virtio UTC clock:

	refclock PHC /dev/ptp_virtio refid PHCV poll -1 dpoll -1

RTC interface
=============

This patch series adds virtio_rtc as a generic Virtio driver, including
both a PTP clock driver and an RTC class driver.

Feedback is greatly appreciated.

[1] https://lore.kernel.org/virtio-comment/20250306095112.1293-1-quic_philber@quicinc.com/
[2] https://chrony.tuxfamily.org/

Changelog
=========

v6:

- Shorten PTP clock names to always fit into 32 bytes.

- Fix sparse warning about endianness mismatch (Simon Horman).

- Do not mark comments missing parameter documentation as kernel doc (Simon
  Horman).

- Improve error status computation readability.

- Avoid conditional locking within a block.

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
 drivers/virtio/virtio_rtc_driver.c   | 1407 ++++++++++++++++++++++++++
 drivers/virtio/virtio_rtc_internal.h |  122 +++
 drivers/virtio/virtio_rtc_ptp.c      |  347 +++++++
 include/uapi/linux/virtio_rtc.h      |  237 +++++
 9 files changed, 2474 insertions(+)
 create mode 100644 drivers/virtio/virtio_rtc_arm.c
 create mode 100644 drivers/virtio/virtio_rtc_class.c
 create mode 100644 drivers/virtio/virtio_rtc_driver.c
 create mode 100644 drivers/virtio/virtio_rtc_internal.h
 create mode 100644 drivers/virtio/virtio_rtc_ptp.c
 create mode 100644 include/uapi/linux/virtio_rtc.h


base-commit: 9d8960672d63db4b3b04542f5622748b345c637a
-- 
2.43.0


