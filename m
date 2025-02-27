Return-Path: <linux-rtc+bounces-3281-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC9A47FD4
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 14:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80530189787A
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Feb 2025 13:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A974923314E;
	Thu, 27 Feb 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hjWu5KVe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9B9231C9C
	for <linux-rtc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663821; cv=none; b=PlKEvG57Oh7AHuFefaT5U/YmtAkvUAbSXicNVTSbSUT6qdWgkVyduF4Y+FieJ7NUUubhSct4k16GwMBrjv+n1+IguDvrGzYz/PSAwz/ejGw4xI634uRucr1r/SEKWOWZ1WhpoAsuP7vSmfkfvGo2NjcY54Im5743SY3Ljk8zj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663821; c=relaxed/simple;
	bh=opsIEewIztJ1IZyoYzEP+SwNMi+LKIs5nXcMDwD8Uro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYdMVf+beWmSWNsuk42xovVNwge/fKoo7L1TZpOxH9TEqB6hiNV8DzG9mZ2y8qiLOhJy03Esjeo/+eirkO+mEL43VKighTBGY18pl1MNV6l8EXLjM0dYXXIvKB0mvcoan3cld7rFWJGyMAZKZ9tLMepa6W4DU4RWTt7hIKD+76E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hjWu5KVe; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Nt37Sk0W0XmXtsZPL85MIICCq9BwucCIJ7J3iZrg4Fg=; b=hjWu5K
	Veln0Eobur44VjNVEKdg02Y5pAOr7fl4nHZrjZFw0QKkkFBCWS0JwVmVJb4LamUd
	5b5wBzFLt2spHelrj0O9hXElA1ietAUKH9jGD8Am7ZJUcDYgDO43cmkcsSvpRDnR
	kVzWjnO52oJNMd4Lxm/akpfQ3qovMvK2nB/Qsnl1/pxfbmVolwqh31wSMgmQpcgQ
	zj/8Mlhv7b7j83msA0jBmAXxPwS09Y60iHfJqBMQDI1q0uocpsripuGR02fQzsf5
	7HPYd5vLSfgnPUcIzVFlJ2BRZUxouSLxXZmaKdDcYzgIbMwNFiEoqfRBuVg+ybHj
	LdDgtvKe+ziFg0pg==
Received: (qmail 962291 invoked from network); 27 Feb 2025 14:43:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:29 +0100
X-UD-Smtp-Session: l3s3148p1@vin+3x8vqyJtKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 1/8] rtc: sh: assign correct interrupts with DT
Date: Thu, 27 Feb 2025 14:42:56 +0100
Message-ID: <20250227134256.9167-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
References: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT bindings for this driver define the interrupts in the order as
they are numbered in the interrupt controller. The old platform_data,
however, listed them in a different order. So, for DT based platforms,
they are mixed up. Assign them specifically for DT, so we can keep the
bindings stable. After the fix, 'rtctest' passes again on the Renesas
Genmai board (RZ-A1 / R7S72100).

Fixes: dab5aec64bf5 ("rtc: sh: add support for rza series")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 9ea40f40188f..3409f5764224 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -485,9 +485,15 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	rtc->periodic_irq = ret;
-	rtc->carry_irq = platform_get_irq(pdev, 1);
-	rtc->alarm_irq = platform_get_irq(pdev, 2);
+	if (!pdev->dev.of_node) {
+		rtc->periodic_irq = ret;
+		rtc->carry_irq = platform_get_irq(pdev, 1);
+		rtc->alarm_irq = platform_get_irq(pdev, 2);
+	} else {
+		rtc->alarm_irq = ret;
+		rtc->periodic_irq = platform_get_irq(pdev, 1);
+		rtc->carry_irq = platform_get_irq(pdev, 2);
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
-- 
2.45.2


