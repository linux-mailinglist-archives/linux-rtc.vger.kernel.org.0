Return-Path: <linux-rtc+bounces-2073-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61345989D78
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Sep 2024 10:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA4A285D68
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Sep 2024 08:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F100F1862BB;
	Mon, 30 Sep 2024 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlbWM9yZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95971862B3;
	Mon, 30 Sep 2024 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727686661; cv=none; b=XiwSFFSH7IGmJzDhqY4nCjxO5pJkAzB+0D+lDwCTc0KJJGBUE394inx5WM0flcG0iXptzYO5JyroYop0vnNJskY8eAm4XujNy9/q3s4czEqVYv8zH/Pcmoc9V8w+EicwfwrDWf55Dbxes0qmP73QPA9H1Ek/jjqqbPAqR+tNRfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727686661; c=relaxed/simple;
	bh=NSmd+IBlXmuqAilK8ONqpwTsTLMxni3ctAIQmJtmuoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SuojUci09Xg1FOhIerUftJkANxP7junlwsvK28+QBTeaoBg8ETz9SNcAd4qkO/EZmupmzbnmM63JWSWMBGZM7AWPO+uaoPM8qeUs5Qp2//PVZLgo6rkrpjhrf2hT7hVzs5j0uXxrWxAs2mv2gaARWiLB0z8TbNU+Ya+WTqu1L1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlbWM9yZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A549C4CEC7;
	Mon, 30 Sep 2024 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727686661;
	bh=NSmd+IBlXmuqAilK8ONqpwTsTLMxni3ctAIQmJtmuoQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HlbWM9yZLHR8Pvu1j9+/rKTLO8Cl4v13RrJUX/WqdRYix5E7wyWeQDI6W6D/JpGZb
	 yxPgDxJajLvQ7SbzTxV1cLgdwsGEfcQ+oykdQCsclwfWtYu2y0Fnl6XJ/AjYjFExi5
	 /rfVucGzBWRf/2TxfVdRw8lv05+otISfC2IcgnxVWL59oym0eRSP8UikIrV/hDfh05
	 CU0LjHtmRCcFhtnfL/69yQXlVs5qHYUrgBFXbVtnYePK5/OPs0djkwd9ITtHYT8E26
	 L6wtyS2sHiodAd9aFM7B9Sw8ZSTXV2A9wxCf/ZP3/9QJZrswC7mI5k46UN8iNl/uru
	 wHT7ZOxKe9Bjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACF5CF649D;
	Mon, 30 Sep 2024 08:57:41 +0000 (UTC)
From: =?utf-8?q?T=C3=B3th_J=C3=A1nos_via_B4_Relay?= <devnull+gomba007.gmail.com@kernel.org>
Date: Mon, 30 Sep 2024 10:57:40 +0200
Subject: [PATCH] rtc: Makefile: Replace spaces with tab.
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240930-rtc-makefile-spaces-v1-1-e936e0a7b02a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAANo+mYC/x2MSwqDQBAFryK9TsM4Bn9XCS6a8amNX6ZFAuLdM
 2RZFFU3GaLCqM1uirjUdN8S5K+MwiTbCNY+MXnn364pHMcz8CozBl3AdkiAsS+Rl1JBirqiVB4
 x6e//+ume5wfBo0OTZQAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727686660; l=913;
 i=gomba007@gmail.com; s=20230706; h=from:subject:message-id;
 bh=DO0jltegohA+gSXye9IARyoHoswXbGhgo3i6eJ4aPs0=;
 b=KsjtGzLRud2lZZRAj3zioqjjGCyJo+4/bzT3bbaLEOXLKcM9aYyqNbGfBnKRAXmsoU2/g2uHX
 b/y1EG6oNEoA31ZPgW6l15miaDYLqK1FVwJSEW4A84d21Q7Rvj/+io0
X-Developer-Key: i=gomba007@gmail.com; a=ed25519;
 pk=iY9MjPCbud82ULS2PQJIq3QwjKyP/Sg730I6T2M8Y5U=
X-Endpoint-Received: by B4 Relay for gomba007@gmail.com/20230706 with
 auth_id=60
X-Original-From: =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>
Reply-To: gomba007@gmail.com

From: Tóth János <gomba007@gmail.com>

Fix a style error.

Signed-off-by: Tóth János <gomba007@gmail.com>
---
 drivers/rtc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index f62340ecc534..3deacb1ee71f 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -164,7 +164,7 @@ obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
 obj-$(CONFIG_RTC_DRV_SA1100)	+= rtc-sa1100.o
 obj-$(CONFIG_RTC_DRV_SC27XX)	+= rtc-sc27xx.o
 obj-$(CONFIG_RTC_DRV_SD2405AL)	+= rtc-sd2405al.o
-obj-$(CONFIG_RTC_DRV_SD3078)   += rtc-sd3078.o
+obj-$(CONFIG_RTC_DRV_SD3078)	+= rtc-sd3078.o
 obj-$(CONFIG_RTC_DRV_SH)	+= rtc-sh.o
 obj-$(CONFIG_RTC_DRV_SNVS)	+= rtc-snvs.o
 obj-$(CONFIG_RTC_DRV_SPEAR)	+= rtc-spear.o

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20240930-rtc-makefile-spaces-26e16a7ea387

Best regards,
-- 
Tóth János <gomba007@gmail.com>



