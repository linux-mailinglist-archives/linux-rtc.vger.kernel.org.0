Return-Path: <linux-rtc+bounces-4205-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960DAC8C60
	for <lists+linux-rtc@lfdr.de>; Fri, 30 May 2025 12:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A384E40FF
	for <lists+linux-rtc@lfdr.de>; Fri, 30 May 2025 10:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9413521FF55;
	Fri, 30 May 2025 10:49:10 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46513AC1;
	Fri, 30 May 2025 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602150; cv=none; b=dEeG7AMxnMk93c3FF2D1gj5Yr1OXGg7rYitUhBZsAWBEYzVUUln/b4QmQWGP5bK+unL2oEaYJ7ymj7de80t7PTs163SBMV5xYCb/nMrjvCOtszRpqkoRV8F7IErMDADQQ9cCjvgUqR5aY9Wm4oYQ5RoJNXsdMc139wphG6+Z6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602150; c=relaxed/simple;
	bh=e79QSVZ7W/SAlxX3LZpAzvuZTa3ERSx370r0pKDj/1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=URONODEi1sU/YXQwaWllosfgCrsP9ZJFxPJbE0fi92webjUr3aApWcb99hRpq3/OatUBETegMA3f+oJBeIJhghi7SF9pEhdcoU9LZkTUazpshiOs4CQu2S/UTVYSnnkVpE4rEVD048hJQf+WEO/aFwKdOQAJSr+G/FxRB2VI4lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DEBEA204425;
	Fri, 30 May 2025 12:41:04 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DAE5A204422;
	Fri, 30 May 2025 12:41:04 +0200 (CEST)
Received: from lsv15324.swis.ro-buh01.nxp.com (lsv15324.swis.ro-buh01.nxp.com [10.162.247.227])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 4417B202FA;
	Fri, 30 May 2025 12:41:04 +0200 (CEST)
From: Elena Popa <elena.popa@nxp.com>
To: alexandre.belloni@bootlin.com,
	hvilleneuve@dimonoff.com,
	r.cerrato@til-technologies.fr
Cc: linux-rtc@vger.kernel.org,
	Elena Popa <elena.popa@nxp.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] rtc: pcf2127: fix SPI command byte for PCF2131
Date: Fri, 30 May 2025 13:40:00 +0300
Message-Id: <20250530104001.957977-1-elena.popa@nxp.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

PCF2131 was not responding to read/write operations using SPI. PCF2131
has a different command byte definition, compared to PCF2127/29. Added
the new command byte definition when PCF2131 is detected.

Fixes: afc505bf9039 ("rtc: pcf2127: add support for PCF2131 RTC")
Cc: stable@vger.kernel.org
Signed-off-by: Elena Popa <elena.popa@nxp.com>
Acked-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
Changes for v2:
- explicitly mentioned SPI
---
 drivers/rtc/rtc-pcf2127.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 31c7dca8f469..2c7917bc2a31 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1538,6 +1538,11 @@ static int pcf2127_spi_probe(struct spi_device *spi)
 		variant = &pcf21xx_cfg[type];
 	}
 
+	if (variant->type == PCF2131) {
+		config.read_flag_mask = 0x0;
+		config.write_flag_mask = 0x0;
+	}
+
 	config.max_register = variant->max_register,
 
 	regmap = devm_regmap_init_spi(spi, &config);
-- 
2.34.1


