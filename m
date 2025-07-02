Return-Path: <linux-rtc+bounces-4428-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D37AFAC28
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 08:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0C33A2E21
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Jul 2025 06:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F5E27A455;
	Mon,  7 Jul 2025 06:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gyKBUyc6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8082627F9
	for <linux-rtc@vger.kernel.org>; Mon,  7 Jul 2025 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871165; cv=none; b=IY0xvqxBh/W8VjjdJbdtDah7Wkfaw/4fE3Z2rqRhMpLuITofcB04BxqXfbNAV9DY3jKwkmAh9If6eyr+fvbyHvg8ydstFyV9gdCd1LQaFXuYob2xloc6hvQ70KeUA7Z731EKupwKuLvovoi3g1ghE0HHTGicS2edaMtW3Szpag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871165; c=relaxed/simple;
	bh=ZP791bj2hjwCZQDCpCyVU4iEWQD7W8DNUS8LI2sIB54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=HmOVzajb+ETpCxk0OVkZtLbh+5e6kEiQt5THRZZDgcVyDB3OediKLLmVUdLK2ZdsRkTBGSCKC7PjxrE+h/PllQwjyuySmjZIU76jsP804jKWR2PTFSyeIoa8n87Tbzj9QA3Su/5QuB0wpZZ49MSd7XrfhJGQu1y83JVUPQST3Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gyKBUyc6; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250707065235epoutp034b3211e89961182cc68f5e752ac61368~P5YjAjVnu1103911039epoutp03G
	for <linux-rtc@vger.kernel.org>; Mon,  7 Jul 2025 06:52:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250707065235epoutp034b3211e89961182cc68f5e752ac61368~P5YjAjVnu1103911039epoutp03G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751871155;
	bh=FrHDaDAfk3KgT2C7ZF/2Xkfs1k54PYVs+MuIo0auhxk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=gyKBUyc6qB1QH0nY/ZI+TA9i4lgHhcYsAcy7ug6QhfnkfXoBfd0qe5esBBGqeexNQ
	 YX0/rpLgnM9ro6bkuNopGfpM2j56RoAt2/5FLbjM9Mm/T3ptxEi+VPFcxPwZA1SfbY
	 xFgHXsyVs/doD90NeTzmYirloilMYGKhqur50GO8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250707065234epcas5p23ac75f7dc240733c821cb66fa63a4753~P5YiTaled2809428094epcas5p2K;
	Mon,  7 Jul 2025 06:52:34 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.175]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bbFKs4FW6z3hhTD; Mon,  7 Jul
	2025 06:52:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250702051528epcas5p24abd15d8f554ea057bd6aac586644f4e~OV1UswxWQ0155001550epcas5p2i;
	Wed,  2 Jul 2025 05:15:28 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702051526epsmtip242781ce8ef6cad04273a3004ce7c9ae4~OV1TOPjAE0268202682epsmtip2n;
	Wed,  2 Jul 2025 05:15:26 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH 0/3] On-chip RTC support for ExynosAutov9
Date: Wed,  2 Jul 2025 10:54:23 +0530
Message-Id: <20250702052426.2404256-1-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702051528epcas5p24abd15d8f554ea057bd6aac586644f4e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702051528epcas5p24abd15d8f554ea057bd6aac586644f4e
References: <CGME20250702051528epcas5p24abd15d8f554ea057bd6aac586644f4e@epcas5p2.samsung.com>

Enable on-chip RTC support. The on-chip RTC of this SoC is similar
to the previous versions of Samsung SoC. So re-use the existing
RTC driver with additional changes required for timer counter
specific registers.

Setting and getting hardware clock has been tested using 'hwclock'
and 'date' utilities.

Alarm interrupt has been checked with incrementing interrupt
count via "cat /proc/interrupts | grep rtc" for 10sec
wakeup time via "echo +10 > /sys/class/rtc/rtc0/wakealarm"

Devang Tailor (3):
  dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
  rtc: s3c: support for exynosautov9 on-chip RTC
  arm64: dts: exynosautov9: add RTC DT node

 .../devicetree/bindings/rtc/s3c-rtc.yaml      |  1 +
 .../boot/dts/exynos/exynosautov9-sadk.dts     |  4 +++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  | 10 +++++++
 drivers/rtc/rtc-s3c.c                         | 26 +++++++++++++++++++
 drivers/rtc/rtc-s3c.h                         |  4 +++
 5 files changed, 45 insertions(+)


base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
-- 
2.34.1


