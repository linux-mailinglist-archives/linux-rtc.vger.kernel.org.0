Return-Path: <linux-rtc+bounces-4801-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A0BB4226F
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 15:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A2613BA095
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 13:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C4F30DD06;
	Wed,  3 Sep 2025 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dpd8hw/M"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D9E3054E5
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907489; cv=none; b=XKSunD3ZsOfJZqxmH8F+hMfbCDzeI3AEXtthW492ptDF3vw8tAd991AETcJJbNpuP+z+y50oHPt5R0lbnyAgiPQTl6iPwVKeopzseTOe079j1JUnK6KvDF+htsGjUXRKuF3lYyOE7qJxgc8kdJ+3bQrkFU/LubBnIQhmCDm+7Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907489; c=relaxed/simple;
	bh=n8Ihtdnse3VN/XbE/VuoI9w327s4Ffs6XQa/1KWmmzs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=Q7dt4AI/n18sOSItMvmsaTBkmBItryjXo8+a8eWulnuJmRzRmdalhPIiGHy/ZdktHwTxuKPUmHC/0CQ3KIBAqGwUbqGS04wI0rr8uEc1mHNHxoRsd240zSL43vCwZ5t+QZZw7YPUYsJ3t0ejyNXCYZ/+AXtneNY8uG2kITqwYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dpd8hw/M; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250903135124epoutp04e7f6f4b8b1f3d1bcc97b8df2310776e8~hygyJ-dd-2597625976epoutp04b
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 13:51:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250903135124epoutp04e7f6f4b8b1f3d1bcc97b8df2310776e8~hygyJ-dd-2597625976epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756907484;
	bh=dBdIdnKI53kzwYZV6kySizOPUkzoS2PQD2DaHLLIqVs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=dpd8hw/MupKTr0qtPO77S41WAB8tiH6YV/1JhHJBPEo3/4hwDwHHPHeAglXSEuURo
	 yrsKiwkV5fuDTfYvShVDeCmIhmZwr3zd5ozvD/HAnDR2qhXqhLQzKTGYAWG8J8xYnR
	 AAPqLNsh5LFGngoS6smBXAW7X5xHYz4x7z5ER3yM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250903135124epcas5p18fa26f5f659e6fee887eb66d26da80c4~hygxjFWjW3191731917epcas5p1g;
	Wed,  3 Sep 2025 13:51:24 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cH3tM1dWgz2SSKY; Wed,  3 Sep
	2025 13:51:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250903135122epcas5p33bc7da2841b332773bceb3535f368af2~hygwEAZGf2373223732epcas5p3U;
	Wed,  3 Sep 2025 13:51:22 +0000 (GMT)
Received: from INBRO002520 (unknown [107.122.1.191]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903135121epsmtip12fd955463311b1f218dd2bddb5a961ad~hyguqdbwg1911719117epsmtip1h;
	Wed,  3 Sep 2025 13:51:20 +0000 (GMT)
From: "Devang Tailor" <dev.tailor@samsung.com>
To: "'Alexandre Belloni'" <alexandre.belloni@bootlin.com>
Cc: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<faraz.ata@samsung.com>
In-Reply-To: <20250903122342a2996825@mail.local>
Subject: RE: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
Date: Wed, 3 Sep 2025 19:21:19 +0530
Message-ID: <001a01dc1cd9$d52c1830$7f844890$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ8w0UJjWiHDR7+9bjoByRdFpd+nAMc6yo9AXLNbhMBpryuBbMOciLw
Content-Language: en-in
X-CMS-MailID: 20250903135122epcas5p33bc7da2841b332773bceb3535f368af2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf
References: <CGME20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf@epcas5p1.samsung.com>
	<20250710083434.1821671-1-dev.tailor@samsung.com>
	<000001dc1cc7$6bfee9d0$43fcbd70$@samsung.com>
	<20250903122342a2996825@mail.local>


Hi Alexandre,


> -----Original Message-----
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Sent: 03 September 2025 17:54
> To: Devang Tailor <dev.tailor@samsung.com>
> Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-rtc@vger.kernel.org; faraz.ata@samsung.com
> Subject: Re: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
> 
> On 03/09/2025 17:09:32+0530, Devang Tailor wrote:
> >
> > Hi,
> >
> >
> > > -----Original Message-----
> > > From: Devang Tailor <dev.tailor@samsung.com>
> > > Sent: 10 July 2025 14:05
> > > To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > > alim.akhtar@samsung.com; alexandre.belloni@bootlin.com;
> > > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > linux- samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > > linux- rtc@vger.kernel.org; faraz.ata@samsung.com
> > > Cc: Devang Tailor <dev.tailor@samsung.com>
> > > Subject: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
> > >
> > > Enable on-chip RTC support. The on-chip RTC of this SoC is similar
> > > to the previous versions of Samsung SoC. So re-use the existing RTC
> > > driver with applicable call-backs for initialization and IRQ handling.
> > > Add a separate call-back for disabling RTC since existing '.disable'
> > > call-backs updates additional bit not valid for RTC of ExynosAutov9.
> > >
> > > Setting and getting hardware clock has been tested using 'hwclock'
> > > and 'date' utilities.
> > >
> > > Alarm interrupt has been checked with incrementing interrupt count
> > > via "cat /proc/interrupts | grep rtc" for 10sec wakeup time via
> > > "echo +10 > /sys/class/rtc/rtc0/wakealarm"
> > >
> > > changelog
> > > ---
> > > Changes in v2:
> > > - Fixed the review comment of v1 for mis-aligmnent & asymmetry bit
> logic.
> > > - link for v1 :
> > > https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-
> > > dev.tailor@samsung.com/
> > >
> >
> > Reminder!
> > Can you please help to identify if anything is pending in this patch
series ? I
> see all three patches are reviewed.
> >
> 
> You have actions after those reviews:
> 
>
https://lore.kernel.org/all/20250711-shapeless-adorable-lobster-d2efbf@krzk-
> bin/
> 

Thanks for the pointer. I had given the explanation for that,
https://lore.kernel.org/all/188001dbf249$831afd00$8950f700$@samsung.com/
after which I didn't get any feedback.

As per my understanding I have addressed the review comment given in V1 for
[PATCH 2/3] (without ignoring any).
So I am not getting what I have missed. Would you help to point out what was
left ?

> > >
> > > Devang Tailor (3):
> > >   dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
> > >   rtc: s3c: support for exynosautov9 on-chip RTC
> > >   arm64: dts: exynosautov9: add RTC DT node
> > >
> > >  .../devicetree/bindings/rtc/s3c-rtc.yaml       |  1 +
> > >  .../boot/dts/exynos/exynosautov9-sadk.dts      |  4 ++++
> > >  arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 10 ++++++++++
> > >  drivers/rtc/rtc-s3c.c                          | 18
++++++++++++++++++
> > >  4 files changed, 33 insertions(+)
> > >
> > >
> > > base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
> > > --
> > > 2.34.1
> >
> >
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> engineering https://protect2.fireeye.com/v1/url?k=62b10b19-03cce365-
> 62b08056-74fe485cc33c-bc602ba9f8c455fd&q=1&e=14890047-79c7-46fe-
> 85a0-48fc7c9b3d91&u=https%3A%2F%2Fbootlin.com%2F


