Return-Path: <linux-rtc+bounces-3474-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6800A5DA12
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Mar 2025 11:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34446175142
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Mar 2025 10:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E167323C380;
	Wed, 12 Mar 2025 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="a9GDKI7D"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B507522E3FF
	for <linux-rtc@vger.kernel.org>; Wed, 12 Mar 2025 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741773673; cv=none; b=GPYfITGkpBRD+05wp7hUCr9vlzYkdy07NMEx0Xw1jdsceRd4Ov84GYiazFioBhgavhXLR9EwvXPmMjkSwpdf2YXKmFFESYOblvNDmV885FVUciUo8gSYIvh2RwhIp0UmBCFWS/gfi4fa4C93mgjh7IRqFRCfytHXcOLqE2EAyyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741773673; c=relaxed/simple;
	bh=t9TLKwxeb5RhRXY+BGNp+kk3/V3Ki/trQFFuDfFILkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1leP2mNKCSfYuB/JfuVwbGFvdAub6jtJq0Q7gZPqrC3Nlu82HqqdLNaZTN7Y3d0FiXDAy0G8slTK+85Z1XpvPiqJyCJ6GwMDeCOoQG7ILES///N5vyzqWy7BlcOOye6YXZybybtenaMhWGi0LRYmpnJDlauSj6FfhVxP1ELrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=a9GDKI7D; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=5Pb+XCGv8YBP4o
	i4XlOtiB5Od1w6is+KaxtRCZyLdMQ=; b=a9GDKI7DUcRHk2jkK3XnqPskEtpm+H
	R6diIe0xmALSnT9yBhYik92OdGwsfx/rkgu0SF/ZF4KVS4Xlj7mfGY0TCzzlnYo6
	CAmUyNCXIkoGn8etTanZRA/Rw0n7HLXAyNBAtg9yuaXHJtpBVC7PZTfhNPQQWxPQ
	HrdlCSIVnJL9wg0hr46xZWxpdWC2Rrx4UU8F4VQ2SY81uhmlSwAWfIwOH7vBJHS7
	QU5hLOnxv7nmjXix0im2iT8MU/4Hc3t0ZuV4pp1nEluYwoi9wCL+HA2hWpRHp1vn
	qJgOTRoxjcrBCACGK9UHMISpxfj7XxKtTL6z+C3PqfHEHB5ZV4UJRRJA==
Received: (qmail 1184308 invoked from network); 12 Mar 2025 11:01:08 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Mar 2025 11:01:08 +0100
X-UD-Smtp-Session: l3s3148p1@SprHSCIwkr0gAwDPXwyXABj42nrU+gpI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2] rtc: rzn1: clear interrupts on remove
Date: Wed, 12 Mar 2025 11:00:00 +0100
Message-ID: <20250312100105.36767-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is good practice to clear running interrupts before removing the
driver. This is not really a bugfix because on current systems RuntimePM
will disable the module clock, so interrupts won't be initiated. The
dependency on that behaviour is subtle, though. Better be self-contained
and clean up when removing.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1: fix build failure by adding the 'rtc' variable. Build
and tested on Renesas RZ/N1D.

 drivers/rtc/rtc-rzn1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index eeb9612a666f..3c2861983ff1 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -444,6 +444,11 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 static void rzn1_rtc_remove(struct platform_device *pdev)
 {
+	struct rzn1_rtc *rtc = platform_get_drvdata(pdev);
+
+	/* Disable all interrupts */
+	writel(0, rtc->base + RZN1_RTC_CTL1);
+
 	pm_runtime_put(&pdev->dev);
 }
 
-- 
2.47.2


