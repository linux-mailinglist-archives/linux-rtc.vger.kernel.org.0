Return-Path: <linux-rtc+bounces-3266-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BA6A43F85
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 13:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53743165666
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 12:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFAB267B93;
	Tue, 25 Feb 2025 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f/JW+8x1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12571267AE9;
	Tue, 25 Feb 2025 12:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740486929; cv=none; b=oQ7/iDGIQBh8G6c6P+mjjdqgRgj92QXKTDFj3IQsg4IDqXgazhYYKeKO/lklgPXfZmhE2ux/mu9FLMFTDcEDO1N8PZ0YIM/utoVJCaRexdcHcIenO210+GuV8X6EWwKO9LP2hvxaWX1NJ+8BRfkmz3P0pALnqr20Z6J7KaFDfAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740486929; c=relaxed/simple;
	bh=wFZPbJz9gobrNaWQEJ8TlbW2CrX596qwwyNSbBxoLGM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qj3CMZ1TuIXkWlcrr7CuNF6PZ/3x6LpMFSWosOTuwMyg02dqy28Jd5JYqAzrwH+XB0xiBoBepM0gOJ0dXNC9RAe0Fxolc6hIraspyNSBEppHNjiksOgADl8fKyjk3axTSxUyiofT0wHtCtRcgtGgC1ryTCjuQJslte0NhP/YPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f/JW+8x1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P88r66028941;
	Tue, 25 Feb 2025 12:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQbb+uveSF1v5UrtXC6pVHB2
	CIckMd9gNCe2xyG0pPA=; b=f/JW+8x1TtDPODGqLTqYyTMl3o0yPrz9n0w36lzL
	ggXx3MsUcmTjwu0RDFr86AvjC8liP4uqu5+8GRf7BleMF437+0EKJ2IR6FbEdmGz
	+YPu5dtu01vJ75GolopuMmUbKu/s9zTY3rL/OzW/mqz6X/tm9qoyW7xJAF/3cj2Y
	0V0HZVl2FDpC5i/HTs7e8XWPetfwmvkfZMw4U2xR83rfN2z1RYi4X7JMqQAybWED
	PAHC2gR2kzXjt4L0+4kLU8bFAEFJWc3Qgf7wQv3wft+qqxgwL5uAxJlZxqhhY8BD
	o4Cz4gQ4uj64km8ji8xXOkS0z6mcc+e8lMH4upn7p+uEkQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y49eh0pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:35:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PCYxF4019681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:34:59 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 04:34:54 -0800
Date: Tue, 25 Feb 2025 13:34:51 +0100
From: Peter Hilber <quic_philber@quicinc.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Eugenio =?utf-8?B?UMOpcmV6?=
	<eperezma@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <virtualization@lists.linux.dev>,
        David Woodhouse
	<dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>, Marc Zyngier
	<maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Parav Pandit <parav@nvidia.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        Cornelia Huck
	<cohuck@redhat.com>, <virtio-dev@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 0/4] Add virtio_rtc module
Message-ID: <ucphq5pdqdv35anjmrud5egltbbgfwdourk3ahchckk6iwpfmc@goteqcewulgq>
References: <20250219193306.1045-1-quic_philber@quicinc.com>
 <20250225071748-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250225071748-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i4FURIxqQyErqNnCR0lDwLUkgipu4isD
X-Proofpoint-GUID: i4FURIxqQyErqNnCR0lDwLUkgipu4isD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250088

On Tue, Feb 25, 2025 at 07:18:59AM -0500, Michael S. Tsirkin wrote:
> On Wed, Feb 19, 2025 at 08:32:55PM +0100, Peter Hilber wrote:
> > This series implements a driver for a virtio-rtc device conforming to spec
> > proposal v7 [1]. It includes a PTP clock driver and an RTC class driver
> > with alarm.
> > 
> > v5 updates
> > ==========
> > 
> > Important changes compared to the previous driver series [3] are:
> > 
> > - Update to spec proposal v7 [1].
> > 
> > - Fix multiple initialization related bugs.
> > 
> > - Drop the RFC tag, since no major outstanding issues are apparent.
> > 
> > Overview
> > ========
> > 
> > This patch series adds the virtio_rtc module, and related bugfixes. The
> > virtio_rtc module implements a driver compatible with the proposed Virtio
> > RTC device specification [1]. The Virtio RTC (Real Time Clock) device
> > provides information about current time. The device can provide different
> > clocks, e.g. for the UTC or TAI time standards, or for physical time
> > elapsed since some past epoch. The driver can read the clocks with simple
> > or more accurate methods. Optionally, the driver can set an alarm.
> > 
> > For the Virtio RTC device, there is currently a proprietary implementation,
> > which has been used for testing.
> > 
> > PTP clock interface
> > ===================
> > 
> > virtio_rtc exposes clocks as PTP clocks to userspace, similar to ptp_kvm.
> > If both the Virtio RTC device and this driver have special support for the
> > current clocksource, time synchronization programs can use
> > cross-timestamping using ioctl PTP_SYS_OFFSET_PRECISE2 aka
> > PTP_SYS_OFFSET_PRECISE. Similar to ptp_kvm, system time synchronization
> > with single-digit ns precision is possible with a quiescent reference clock
> > (from the Virtio RTC device). This works even when the Virtio device
> > response is slow compared to ptp_kvm hypercalls.
> > 
> > The following illustrates a test using PTP_SYS_OFFSET_PRECISE, with
> > interspersed strace log and chrony [2] refclocks log, on arm64. In the
> > example, chrony tracks a virtio_rtc PTP clock ("PHCV", /dev/ptp0). The raw
> > offset between the virtio_rtc clock and CLOCK_REALTIME is 0 to 1 ns. At the
> > device side, the Virtio RTC device artificially delays both the clock read
> > request, and the response, by 50 ms. Cross-timestamp interpolation still
> > works with this delay. chrony also monitors a ptp_kvm clock ("PHCK",
> > /dev/ptp3) for comparison, which yields a similar offset.
> > 
> > 	ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.000329>
> > 	===============================================================================
> > 	   Date (UTC) Time         Refid  DP L P  Raw offset   Cooked offset      Disp.
> > 	===============================================================================
> > 	2023-06-29 18:49:55.595742 PHCK    0 N 0  1.000000e-09  8.717931e-10  5.500e-08
> > 	2023-06-29 18:49:55.595742 PHCK    - N -       -        8.717931e-10  5.500e-08
> > 	ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.101545>
> > 	2023-06-29 18:49:56.147766 PHCV    0 N 0  1.000000e-09  8.801870e-10  5.500e-08
> > 	2023-06-29 18:49:56.147766 PHCV    - N -       -        8.801870e-10  5.500e-08
> > 	ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.000195>
> > 	2023-06-29 18:49:56.202446 PHCK    0 N 0  1.000000e-09  7.364180e-10  5.500e-08
> > 	2023-06-29 18:49:56.202446 PHCK    - N -       -        7.364180e-10  5.500e-08
> > 	ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.101484>
> > 	2023-06-29 18:49:56.754641 PHCV    0 N 0  0.000000e+00 -2.617368e-10  5.500e-08
> > 	2023-06-29 18:49:56.754641 PHCV    - N -       -       -2.617368e-10  5.500e-08
> > 	ioctl(5</dev/ptp3>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.000270>
> > 	2023-06-29 18:49:56.809282 PHCK    0 N 0  1.000000e-09  7.779321e-10  5.500e-08
> > 	2023-06-29 18:49:56.809282 PHCK    - N -       -        7.779321e-10  5.500e-08
> > 	ioctl(6</dev/ptp0>, PTP_SYS_OFFSET_PRECISE, 0xffffe86691c8) = 0 <0.101510>
> > 	2023-06-29 18:49:57.361376 PHCV    0 N 0  0.000000e+00 -2.198794e-10  5.500e-08
> > 	2023-06-29 18:49:57.361376 PHCV    - N -       -       -2.198794e-10  5.500e-08
> > 
> > This patch series only adds special support for the Arm Generic Timer
> > clocksource. At the driver side, it should be easy to support more
> > clocksources.
> > 
> > Fallback PTP clock interface
> > ----------------------------
> > 
> > Without special support for the current clocksource, time synchronization
> > programs can still use ioctl PTP_SYS_OFFSET_EXTENDED2 aka
> > PTP_SYS_OFFSET_EXTENDED. In this case, precision will generally be worse
> > and will depend on the Virtio device response characteristics.
> > 
> > The following illustrates a test using PTP_SYS_OFFSET_EXTENDED, with
> > interspersed strace log and chrony refclocks log, on x86-64 (with `ts'
> > values omitted):
> > 
> > 	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
> > 	===============================================================================
> > 	   Date (UTC) Time         Refid  DP L P  Raw offset   Cooked offset      Disp.
> > 	===============================================================================
> > 	2023-06-28 14:11:26.697782 PHCV    0 N 0  3.318200e-05  3.450891e-05  4.611e-06
> > 	2023-06-28 14:11:26.697782 PHCV    - N -       -        3.450891e-05  4.611e-06
> > 	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
> > 	2023-06-28 14:11:27.208763 PHCV    0 N 0 -3.792800e-05 -4.023965e-05  4.611e-06
> > 	2023-06-28 14:11:27.208763 PHCV    - N -       -       -4.023965e-05  4.611e-06
> > 	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
> > 	2023-06-28 14:11:27.722818 PHCV    0 N 0 -3.328600e-05 -3.134404e-05  4.611e-06
> > 	2023-06-28 14:11:27.722818 PHCV    - N -       -       -3.134404e-05  4.611e-06
> > 	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
> > 	2023-06-28 14:11:28.233572 PHCV    0 N 0 -4.966900e-05 -4.584331e-05  4.611e-06
> > 	2023-06-28 14:11:28.233572 PHCV    - N -       -       -4.584331e-05  4.611e-06
> > 	ioctl(5, PTP_SYS_OFFSET_EXTENDED, {n_samples=10, ts=OMITTED}) = 0
> > 	2023-06-28 14:11:28.742737 PHCV    0 N 0  4.902700e-05  5.361388e-05  4.611e-06
> > 	2023-06-28 14:11:28.742737 PHCV    - N -       -        5.361388e-05  4.611e-06
> > 
> > PTP clock setup
> > ---------------
> > 
> > The following udev rule can be used to get a symlink /dev/ptp_virtio to the
> > UTC clock:
> > 
> > 	SUBSYSTEM=="ptp", ATTR{clock_name}=="Virtio PTP type 0, variant 0", SYMLINK += "ptp_virtio"
> > 
> > The following chrony configuration directive can then be added in
> > /etc/chrony/chrony.conf to synchronize to the Virtio UTC clock:
> > 
> > 	refclock PHC /dev/ptp_virtio refid PHCV poll -1 dpoll -1
> > 
> > RTC interface
> > =============
> > 
> > This patch series adds virtio_rtc as a generic Virtio driver, including
> > both a PTP clock driver and an RTC class driver.
> > 
> > Feedback is greatly appreciated.
> > 
> > [1] https://lore.kernel.org/virtio-comment/20250123101616.664-1-quic_philber@quicinc.com/
> > [2] https://chrony.tuxfamily.org/
> > [3] https://lore.kernel.org/lkml/20241219201118.2233-1-quic_philber@quicinc.com/
> > 
> > Changelog
> > =========
> > 
> > v5:
> > 
> > - Update to virtio-rtc spec v7, essentially removing definitions.
> > 
> > - Fix multiple bugs after readying device during probe and restore.
> > 
> > - Actually initialize Virtio clock id for RTC class device.
> > 
> > - Add freeze/restore ops already in first patch.
> > 
> > - Minor changes:
> > 
> >   - Use new APIs devm_device_init_wakeup(), secs_to_jiffies().
> > 
> >   - Fix style issues.
> > 
> >   - Improve logging types and clarity.
> > 
> >   - Drop unnecessary memory barrier pair.
> > 
> >   - Return error status from device, whenever available.
> > 
> > v4:
> > 
> > - Update Virtio interface to spec v6.
> > 
> > - Distinguish UTC-like clocks by handling of leap seconds (spec v6).
> > 
> > - Do not create RTC class device for clocks which may step on leap seconds
> >   (Alexandre Belloni).
> > 
> > - Clear RTC class feature bit instead of defining reduced ops
> >   (Alexandre Belloni).
> > 
> > - For PTP clock name, always use numeric clock type, and numeric variant.
> > 
> > - Use macros for 64-bit divisions.
> > 
> > - Remove unnecessary memory barriers.
> > 
> > - Cosmetic improvements.
> > 
> > - Drop upstreamed timekeeping bugfixes from series.
> > 
> > v3:
> > 
> > - Update to conform to virtio spec RFC v3 (no significant behavioral
> >   changes).
> > 
> > - Add RTC class driver with alarm according to virtio spec RFC v3.
> > 
> > - For cross-timestamp corner case fix, switch back to v1 style closed
> >   interval test (Thomas Gleixner).
> > 
> > v2:
> > 
> > - Depend on patch series "treewide: Use clocksource id for
> >   get_device_system_crosststamp()" to avoid requiring a clocksource pointer
> >   with get_device_system_crosststamp().
> > 
> > - Assume Arm Generic Timer will use CP15 virtual counter. Drop
> >   arm_arch_timer helper functions (Marc Zyngier).
> > 
> > - Improve cross-timestamp fixes problem description and implementation
> >   (John Stultz).
> > 
> > 
> > Peter Hilber (4):
> >   virtio_rtc: Add module and driver core
> >   virtio_rtc: Add PTP clocks
> >   virtio_rtc: Add Arm Generic Timer cross-timestamping
> >   virtio_rtc: Add RTC class driver
> > 
> >  MAINTAINERS                          |    7 +
> >  drivers/virtio/Kconfig               |   64 ++
> >  drivers/virtio/Makefile              |    5 +
> >  drivers/virtio/virtio_rtc_arm.c      |   23 +
> >  drivers/virtio/virtio_rtc_class.c    |  262 +++++
> >  drivers/virtio/virtio_rtc_driver.c   | 1404 ++++++++++++++++++++++++++
> >  drivers/virtio/virtio_rtc_internal.h |  122 +++
> >  drivers/virtio/virtio_rtc_ptp.c      |  347 +++++++
> >  include/uapi/linux/virtio_rtc.h      |  237 +++++
> 
> 
> Also, should this driver live under
> ./drivers/rtc/virtio/
> 
> ?

It has a PTP clock driver as well, so I think drivers/rtc would not be
the best location. I tried to avoid splitting the driver across
subsystems.

Maybe it could live under drivers/virtio/rtc, if you don't like having 5
new files in the directory?

Thanks for the comment,

Peter

> 
> 
> 
> >  9 files changed, 2471 insertions(+)
> >  create mode 100644 drivers/virtio/virtio_rtc_arm.c
> >  create mode 100644 drivers/virtio/virtio_rtc_class.c
> >  create mode 100644 drivers/virtio/virtio_rtc_driver.c
> >  create mode 100644 drivers/virtio/virtio_rtc_internal.h
> >  create mode 100644 drivers/virtio/virtio_rtc_ptp.c
> >  create mode 100644 include/uapi/linux/virtio_rtc.h
> > 
> > 
> > base-commit: 8936cec5cb6e27649b86fabf383d7ce4113bba49
> > -- 
> > 2.43.0
> 

