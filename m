Return-Path: <linux-rtc+bounces-4103-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBC1AB9680
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 09:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5A004E42CA
	for <lists+linux-rtc@lfdr.de>; Fri, 16 May 2025 07:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DA322A4E6;
	Fri, 16 May 2025 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="Wfv0YyVd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB83222592;
	Fri, 16 May 2025 07:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747380249; cv=none; b=a/8dR9eBj47fvbIi+BRCTCHegoOUrTtA2wZJCvzse1yZCxpSZYZCPeU6hM3UdRDONXcHLOyJ/elmyGU53QI7IJzHwkY4/mQ/DuNqQmk21Dx5L/nnaMIn6SmkUz+n2NbwcrPHqbUNxh4HmbKvPI/s2wQMXxJ3miWpVjNEVzdm6to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747380249; c=relaxed/simple;
	bh=Yy3MHZ6ARWN2zLCp0cK5heR+syKaYF14s7J8YWFEFkM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WBH/j7KXsBySW0R8X3Utc66SY+jNE1EDy8RfoYVtLMKR2CLKcQipY/7tY8Ovz6Ibq+5Pk7LGXKQ383TrnE+OXKwa9KdFG8XV/7ym9jD3SOg4Y31mjeq6SOCdFImVWXCgHO/AAnd2XCAR7GpIfG41Fn7JHoXdIK/zKN9mVyAchn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=Wfv0YyVd; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1747380229; x=1747639429;
	bh=I0gaAQiTCyczO3ncCezb5gyuPU+lPv2PjdLi0Zqhbqc=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector:List-Unsubscribe:
	 List-Unsubscribe-Post;
	b=Wfv0YyVdLchPkUnIK0M+avpJNvN58EnjNoNpSoEZTOmUCO4mjJPKAiKvi50id2lAX
	 BY3/5NW5BLOfrYZNmr4gkwqGFe+ookF/EnRmzRbgzphtEY8lTBMPx4fMIfVXXoVIK8
	 oBeL2/AvEZ7nQsGh3fSXNeyYC9SYh1z4ZpTyBKT62To83iIbjdBmtq0tt+FMHKZu4U
	 Lgf57C5tCzXtlYrkABFZXNFKTfCe2ZHS7KqkuIbngH8qvd2mk5W4MUtUBew6PKsCaq
	 HR2yhIR8bNd8wk9aRzzgtm+lcfo/xhGwmDBkWS01CwCM5wUpoARRdrlKf4mePRTzN/
	 KRurX7U1PXbDQ==
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v2 0/5] rtc: Fix problems with missing UIE irqs
Date: Fri, 16 May 2025 09:23:34 +0200
Message-Id: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPbnJmgC/32NQQ6CMBBFr0Jm7Zh2MFpdcQ/DgpQpzMJWWyQYw
 t0dOYDL93/e/ysUzsIFbtUKmWcpkqICHSrwYxcHRumVgQydLJka8+TxLRrnFwZZuGAgV7uLo94
 EB+o9M++FavdWeZQypfzZL2b7S/+tzRYNGkvuzL6/hjo0A3dRlqNPD2i3bfsCK1lv6bMAAAA=
X-Change-ID: 20241203-rtc-uie-irq-fixes-f2838782d0f8
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747380226; l=1695;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=Yy3MHZ6ARWN2zLCp0cK5heR+syKaYF14s7J8YWFEFkM=;
 b=4D5F+hHT3AdVUK968VWXZzzw5RTJxQJ7n9KDgVYY3MaMqB+Na5Bre0xgMOSidQD0dBhHDQdMp
 o6YY0tSz1NvDJmXcJDheZayCHRFGVTBuYxKXr6V6sbbrtl5mNjB2hNW
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

This fixes a couple of different problems, that can cause RTC (alarm)
irqs to be missing when generating UIE interrupts.

The first commit fixes a long-standing problem, which has been
documented in a comment since 2010. This fixes a race that could cause
UIE irqs to stop being generated, which was easily reproduced by
timing the use of RTC_UIE_ON ioctl with the seconds tick in the RTC.

The last commit ensures that RTC (alarm) irqs are enabled whenever
RTC_UIE_ON ioctl is used.

The driver specific commits avoids kernel warnings about unbalanced
enable_irq/disable_irq, which gets triggered on first RTC_UIE_ON with
the last commit. Before this series, the same warning should be seen
on initial RTC_AIE_ON with those drivers.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Changes in v2:
- Dropped patch for rtc-st-lpc driver.
- Link to v1: https://lore.kernel.org/r/20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com

---
Esben Haabendal (5):
      rtc: interface: Fix long-standing race when setting alarm
      rtc: isl12022: Fix initial enable_irq/disable_irq balance
      rtc: cpcap: Fix initial enable_irq/disable_irq balance
      rtc: tps6586x: Fix initial enable_irq/disable_irq balance
      rtc: interface: Ensure alarm irq is enabled when UIE is enabled

 drivers/rtc/interface.c    | 27 +++++++++++++++++++++++++++
 drivers/rtc/rtc-cpcap.c    |  1 +
 drivers/rtc/rtc-isl12022.c |  1 +
 drivers/rtc/rtc-tps6586x.c |  1 +
 4 files changed, 30 insertions(+)
---
base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
change-id: 20241203-rtc-uie-irq-fixes-f2838782d0f8

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


