Return-Path: <linux-rtc+bounces-4840-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B59B4556A
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 12:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273CF1887505
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 10:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4303B30BB9C;
	Fri,  5 Sep 2025 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="daWxA7cl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93322F744B
	for <linux-rtc@vger.kernel.org>; Fri,  5 Sep 2025 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069835; cv=none; b=VkccEGpZKWnTAefFqulp/Iu8y925shZlQMFIIfSIplqkb3qfhwjzBOvqTJGYFBD1XmwmQrx9cPrtvFgYEwMFFxw5iOH4Mv8JN+RjKWhTnOeZbl9GXCPQ+3tII5JfYSyLWIOW2Ibw0yt4CjY+bSXLWhnBdXW43FWtB2JXmRNN3OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069835; c=relaxed/simple;
	bh=ATKQuN0iSsCm/zTiLYWLcUY1qkuM/AoRRzndqPvHBEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=tMVlLWC2eB/Rpi5SVPyyNcFxRe5aRK+Xps7NJ4zLWZEmXWjKtquyX2OFeECORQ0sv7ZKJzpaIipY3V0TLkjnQMQz5PrO9M70jX1UO9BTXQwARgPoesTQ7idqDPbWJsXki8N2BPTf1JiBlBXrYJNxiymUd2rhqT0CKXTbqriSmGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=daWxA7cl; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250905105710epoutp017bad83dd80c63d00d0fc5f0ad095f4c2~iXbOVtU572762227622epoutp01h
	for <linux-rtc@vger.kernel.org>; Fri,  5 Sep 2025 10:57:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250905105710epoutp017bad83dd80c63d00d0fc5f0ad095f4c2~iXbOVtU572762227622epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757069830;
	bh=eaEYsu1XFh1bBRI84CgBEoTw4JVROEnMh3Hmue1+h3o=;
	h=From:To:Cc:Subject:Date:References:From;
	b=daWxA7clxY7gasOel4hVJxRQy0xVB60sTTTaHn/W/LKexrdG/dyhpneUIXd6P+yWo
	 fPJjvjhpL7Fh8L+HP+dSAnYvTdjZ6voqA5LimH087kt5fhhCngVDLqMCrQjtUro7iS
	 kJa7yU4zMrerzyAg2h5gCF4H1l8Ce20iZI7VIJVU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250905105709epcas5p2be42816c576a97cc611cbb0c4fe810c9~iXbNurTu73082030820epcas5p21;
	Fri,  5 Sep 2025 10:57:09 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cJCwN6db6z3hhT3; Fri,  5 Sep
	2025 10:57:08 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250905105708epcas5p159281b73f87fae88e824b97889908649~iXbMFh6xr2168021680epcas5p1g;
	Fri,  5 Sep 2025 10:57:08 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905105706epsmtip2d75bdbdc4f6d0085b8096f616afb39c0~iXbKeyat70714207142epsmtip2-;
	Fri,  5 Sep 2025 10:57:06 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v3 0/3] On-chip RTC support for ExynosAutov9
Date: Fri,  5 Sep 2025 16:35:51 +0530
Message-Id: <20250905110554.2212304-1-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250905105708epcas5p159281b73f87fae88e824b97889908649
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250905105708epcas5p159281b73f87fae88e824b97889908649
References: <CGME20250905105708epcas5p159281b73f87fae88e824b97889908649@epcas5p1.samsung.com>

Enable on-chip RTC support. The on-chip RTC of this SoC is similar
to the previous version of Samsung SoCs except for TICNT tick time
counter. So re-use the existing RTC driver with applicable call-backs
for initialization and IRQ handling without accessing TICNT counter.

As suggested in review comment, instead of adding separate disable()
call-back, re-used the existing s3c24xx_rtc_disable() by adding a new
bool 'use_s3c2410_ticnt' in rtc_data to avoid accessing TICNT counter
which is not valid for RTC of ExynosAutov9.

Setting and getting hardware clock has been tested using 'hwclock'
and 'date' utilities.

Alarm interrupt has been checked with incrementing interrupt
count via "cat /proc/interrupts | grep rtc" for 10sec
wakeup time via "echo +10 > /sys/class/rtc/rtc0/wakealarm"

changelog
---
Changes in v3:
- 1/3 : Added Tag 'Reviewed-by'
- 2/3 : Fixed the review comment of v2 to re-use the existing disable()
	instead of adding new one.
      : Not adding Tag 'Reviewed-by' from V2 since the patch has been
	changed
- 3/3 : Added Tag 'Reviewed-by'
link for v2 : https://lore.kernel.org/linux-rtc/20250710083434.1821671-1-dev.tailor@samsung.com/


Changes in v2:
- Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
- link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-dev.tailor@samsung.com/


Devang Tailor (3):
  dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
  rtc: s3c: support for exynosautov9 on-chip RTC
  arm64: dts: exynosautov9: add RTC DT node

 .../devicetree/bindings/rtc/s3c-rtc.yaml      |  1 +
 .../boot/dts/exynos/exynosautov9-sadk.dts     |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 10 +++++++++
 drivers/rtc/rtc-s3c.c                         | 21 ++++++++++++++++---
 4 files changed, 33 insertions(+), 3 deletions(-)


base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
-- 
2.34.1


