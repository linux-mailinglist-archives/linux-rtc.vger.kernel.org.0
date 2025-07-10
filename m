Return-Path: <linux-rtc+bounces-4481-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29645B0139E
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 08:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E202776255C
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Jul 2025 06:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB6C1DBB3A;
	Fri, 11 Jul 2025 06:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="O0iOs1dV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58B17A30F
	for <linux-rtc@vger.kernel.org>; Fri, 11 Jul 2025 06:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215744; cv=none; b=f4yus0ctWuRVL1R2mMBBdMt3+xNDW6URx2yCtxvERVfKPq3OSiFjoeb6ggEkpetJqSB8IYWQOcbUgvccJenbozSWFI8uqyPu940DkE5Oc6ndhcnqkKoTdxRLZmrWVLhLZlnO7bdia3c7yQkWFmhTTS5l2fdJ/QU9OidQ/xfp72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215744; c=relaxed/simple;
	bh=AEXqVE0etQh37WXsg6HkMKCvaPGPubgogFWsxy/xjCk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=taE+IcjkIwGS9Z69Dk8o81Ux/8XD/VhS3gEHV2pBTuKkwUyBq+YvIiMTKPxYAa0zuBoTqWW56d0tV+18O3pIyrEBt2emqrBpFPjpi0WgK9F+57Ffc9NGQb/HpGYkpzMpFlTM09t5fsXoccloghsJI8oeQkq2Ebt/2DVyO1UtwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=O0iOs1dV; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250711063539epoutp012b76310cb6d47dcba8a790179187c763~RHu6Fj3nO0231502315epoutp01d
	for <linux-rtc@vger.kernel.org>; Fri, 11 Jul 2025 06:35:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250711063539epoutp012b76310cb6d47dcba8a790179187c763~RHu6Fj3nO0231502315epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752215739;
	bh=ArMuUjUjfuaCEhQVg7xbi9LyS0T9hCbQPYjtmfTWZJs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=O0iOs1dVDNI1zMe79WFeXMG2qN92E08vjdqSAZY4d6BLGCGfxBTBS4BJKHg1OkH3+
	 /YBdSKK4Lg6uPK9ajYl6vIc4WWLXfYVAVv7y8NUXq/5K517ZKjY9T6p5jCZyqHsezi
	 fWtty6C0vG6J5mCe0lDF5NeAeVKI8udZKCWxoxQE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250711063539epcas5p26f35b218af46423626481ec75f82db1e~RHu5nraKp3228232282epcas5p23;
	Fri, 11 Jul 2025 06:35:39 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.182]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bdhmR4vCgz2SSKw; Fri, 11 Jul
	2025 06:35:35 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf~Q1lkNxKgj2321423214epcas5p1T;
	Thu, 10 Jul 2025 08:25:33 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082531epsmtip157b0106af49bac387934c44e814c6078~Q1litj7Re0693006930epsmtip1w;
	Thu, 10 Jul 2025 08:25:31 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
Date: Thu, 10 Jul 2025 14:04:31 +0530
Message-Id: <20250710083434.1821671-1-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf
References: <CGME20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf@epcas5p1.samsung.com>

Enable on-chip RTC support. The on-chip RTC of this SoC is similar
to the previous versions of Samsung SoC. So re-use the existing
RTC driver with applicable call-backs for initialization and IRQ handling.
Add a separate call-back for disabling RTC since existing '.disable'
call-backs updates additional bit not valid for RTC of ExynosAutov9.

Setting and getting hardware clock has been tested using 'hwclock'
and 'date' utilities.

Alarm interrupt has been checked with incrementing interrupt
count via "cat /proc/interrupts | grep rtc" for 10sec
wakeup time via "echo +10 > /sys/class/rtc/rtc0/wakealarm"

changelog
---
Changes in v2:
- Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
- link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-dev.tailor@samsung.com/


Devang Tailor (3):
  dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
  rtc: s3c: support for exynosautov9 on-chip RTC
  arm64: dts: exynosautov9: add RTC DT node

 .../devicetree/bindings/rtc/s3c-rtc.yaml       |  1 +
 .../boot/dts/exynos/exynosautov9-sadk.dts      |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 10 ++++++++++
 drivers/rtc/rtc-s3c.c                          | 18 ++++++++++++++++++
 4 files changed, 33 insertions(+)


base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
-- 
2.34.1


