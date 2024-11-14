Return-Path: <linux-rtc+bounces-2561-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A26E29C9274
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 20:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DD57B23D60
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 19:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0569319D089;
	Thu, 14 Nov 2024 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G1JLclJR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D1714389F
	for <linux-rtc@vger.kernel.org>; Thu, 14 Nov 2024 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731612906; cv=none; b=JiFu+uC2eOUYIM01dycYYGjjBQ6gCreky/vXOFm2u9bmHgp5qTrmKLUiN5nNYRy/o5I4M/eeydw9+ML4obw9BtIAKwA7nGHKst37MSbxnZUFnSTrQ1DBKCghDVUHFViz2/NORhh+quB4pmmeeMtKrSStwP+8+QeQbYee2S/x7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731612906; c=relaxed/simple;
	bh=BZ52REcQef9Kfnn4nGj0tNB300R1Ja5A4ClLycRKIKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H5zhR416O5+vAQ+8zzd92bam2HI91xSbMh17IgLWG2WDGQuYxNIIxKCcuXZ2u2Ohl+3d95Sq96MQHsQalQh8iweKF5DmEVeMCwuQb7KWcCXgDjvTRT2RsbKaGxwVI1jaKH6NEwNcNx4peEEwLRxX+ASLrwBntMboAK4JGq04e5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G1JLclJR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=lYfl1ZTYCOg3I1
	PCMQ70h6iFDEg6TVrq3lsSEBYEMV8=; b=G1JLclJRYSiKTBWAnf1XL9ln17ZXqG
	YQetrAbB+YsfbECXQVtjex22ooCVICCX1tc1k1XCadItmD6w/a6nEpENtegIYJEm
	M82OUZYkSeHrYHDYSF/LSxR+nXkeo7f0Mk/9monpLhkixHQ86qyUeYdXRuy1mCHt
	sQvvHvUru4TY7a3y+prYRJuTIfucaXAGIeE8JxNNHg2nahMkzmRWErUwKw6fLale
	dtDIzW6dwYtL9QDJhofnD5C/YhSBAy1fYtoV4BeU4w3RmgUnvdKkrmIMHr1FzJVT
	Vivj8Vs5hVAGvSuMWvw3ssj3znPTS28jmrPfFKMLuetT/np8M18KA4sg==
Received: (qmail 3266310 invoked from network); 14 Nov 2024 20:34:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Nov 2024 20:34:57 +0100
X-UD-Smtp-Session: l3s3148p1@zB2oi+QmCuhehhtH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Michel Pollet <buserror@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: rzn1: update Michel's email
Date: Thu, 14 Nov 2024 20:34:50 +0100
Message-Id: <20241114193450.13982-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas address bounces, use the alternative one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 8570c8e63d70..b3f85368dd62 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -7,7 +7,7 @@
  * - 2022 Schneider Electric
  *
  * Authors:
- * - Michel Pollet <michel.pollet@bp.renesas.com>, <buserror@gmail.com>
+ * - Michel Pollet <buserror@gmail.com>
  * - Miquel Raynal <miquel.raynal@bootlin.com>
  */
 
@@ -413,7 +413,7 @@ static struct platform_driver rzn1_rtc_driver = {
 };
 module_platform_driver(rzn1_rtc_driver);
 
-MODULE_AUTHOR("Michel Pollet <Michel.Pollet@bp.renesas.com");
+MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.39.2


