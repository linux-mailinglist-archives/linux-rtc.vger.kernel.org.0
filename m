Return-Path: <linux-rtc+bounces-4396-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31520AED1BA
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Jun 2025 01:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AF5F3AC8C9
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Jun 2025 23:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6D723E352;
	Sun, 29 Jun 2025 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mSNCN0X2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129D6207A32;
	Sun, 29 Jun 2025 23:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751238768; cv=none; b=Me2TveiEQAvHC5G6zw2qO3OgQcxeZ8ZoweC/8Cyrx7rIP2V/SVhHFCUIA61ZX8B2SJKfuP1nDGqEHaoL9MAwQAM+v6iiwM67qrYtADzO7p5GdAnTr3Qo5IPmxAvnYnedQKps7RRb8D7e968OV3Qr67pSk/Xqn/A/00OjVCpTqL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751238768; c=relaxed/simple;
	bh=sM3UETa6XU90atN+ZfAZUAUfVRvrIpxXukJcVWBaQY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUPemMbOh0K6OfzPPevNyfWG92E4WOE7JbySpyxPVNsiOhjvPw8dbGT5mWsTo2vUenEAke0T0gxW24S5sapdBF0IlBKJtF4irUF50cZZrrqV5hFcl7E2S3AYSfwAvfJN2DWUI3lMjpSx+SFtq9O4K6PyGvcPMkimd5xns2ByX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mSNCN0X2; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id D19635811FD;
	Sun, 29 Jun 2025 22:16:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9432243145;
	Sun, 29 Jun 2025 22:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751235354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XhgQsN0VnKkNhIK11az9LcSmeZmLtGa0pNcLMrP664s=;
	b=mSNCN0X2OkntrGHVsj4zei9QPbkKr3dmRtbAXsHae3bS0oFD9ApZLfXQiHo700dcVaolP2
	9aqrfsth9edO3jPhQp/5ck3GXyBn70P3qXcE6QIMt8sOV8l0jol6ef1ozmkCTIh4DGzWBn
	HzZXx9L1W5lY87gfnX8VIT7QR6SyjpOsWWwx+zXTjZV0Ib76a8SVeT2Xa+RKP8Jwl30PRY
	jrsWzLWQaLrFWkzO4c/zMx9FvSMjhhJrzPuCZqgHaPUH2cvin835IMWqPPckJfiVAjtT88
	D8YyAouJ0rtNB7AhJ0fsVldtIH4tU30a/AFcKBprbZpKj/sA8b7GVhuT31svQA==
Date: Mon, 30 Jun 2025 00:15:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC fixes for 6.16
Message-ID: <202506292215542e5ecbab@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggugfesthekredttddtjeenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhueeiffduudeiveetiedvhfetkeeuiedvueetleevgeehvdeuhffhudevueefheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh

Hello Linus,

Here are some fixes for 6.16. The cmos one is important for PREEMPT_RT. I've
also added the s5m changes as they had a dependency on the MFD pull request that
was included in 6.16-rc1 and we didn't synchronize before the merge window and
they won't hurt.

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.16-fixes

for you to fetch changes up to 08d82d0cad51c2b1d454fe41ea1ff96ade676961:

  rtc: pcf2127: add missing semicolon after statement (2025-06-24 16:06:14 +0200)

----------------------------------------------------------------
RTC fixes for 6.16

Drivers:
 - cmos: use spin_lock_irqsave in cmos_interrupt
 - pcf2127: fix SPI command byte for PCF2131
 - s5m: add S2MPG10 support

----------------------------------------------------------------
André Draszik (7):
      rtc: s5m: cache device type during probe
      rtc: s5m: prepare for external regmap
      rtc: s5m: add support for S2MPG10 RTC
      rtc: s5m: fix a typo: peding -> pending
      rtc: s5m: switch to devm_device_init_wakeup
      rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
      rtc: s5m: replace open-coded read/modify/write registers with regmap helpers

Elena Popa (1):
      rtc: pcf2127: fix SPI command byte for PCF2131

Hugo Villeneuve (1):
      rtc: pcf2127: add missing semicolon after statement

Mateusz Jończyk (1):
      rtc: cmos: use spin_lock_irqsave in cmos_interrupt

 drivers/rtc/rtc-cmos.c    |  10 ++-
 drivers/rtc/rtc-pcf2127.c |   7 +-
 drivers/rtc/rtc-s5m.c     | 197 ++++++++++++++++++++++++++++++----------------
 3 files changed, 140 insertions(+), 74 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

