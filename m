Return-Path: <linux-rtc+bounces-4199-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997DFAC79F6
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 09:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8291A4693E
	for <lists+linux-rtc@lfdr.de>; Thu, 29 May 2025 07:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E80207DFE;
	Thu, 29 May 2025 07:54:17 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF31EF0BB
	for <linux-rtc@vger.kernel.org>; Thu, 29 May 2025 07:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748505257; cv=none; b=PUcGxuav4GsPjFRBLSuf1iwJuWFwLHoBCsWmi/b1B0u+NUWyCIgSl5oxF5hctMFK4YJk9SkhBcCs+OQRiA5cnwIldxaa2ESSDNEMlYtjxtwGC0xAUX5XiHsDUiQa5vTLbhU6FWRp9LoWLZ1yZYdPHZpPQRzgAfcDLsIOvRZzJx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748505257; c=relaxed/simple;
	bh=OnpNkluW5Kx+qozRzMGfWbs2m9qS0Cajinsy9uWRg70=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bEHzlrCKGYkV48v7llNx/gi7JVRGB0j06iD09Letc3WrpSV/eIhB1vj49fV4dQ7YoVswzAvP1CrShrpch375gnbdS82o+8p8KydUc3eBboHBTB8UgrRoi0AZ6ye7yfOSHpkiVp6DJwnUw/W4CxPvx/jhLlfwwOuDN/jZGHg8+ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9085F1A17BB;
	Thu, 29 May 2025 09:54:08 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 84A011A0042;
	Thu, 29 May 2025 09:54:08 +0200 (CEST)
Received: from lsv15324.swis.ro-buh01.nxp.com (lsv15324.swis.ro-buh01.nxp.com [10.162.247.227])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 2551420302;
	Thu, 29 May 2025 09:54:07 +0200 (CEST)
From: Elena Popa <elena.popa@nxp.com>
To: alexandre.belloni@bootlin.com,
	hvilleneuve@dimonoff.com,
	r.cerrato@til-technologies.fr
Cc: linux-rtc@vger.kernel.org,
	Elena Popa <elena.popa@nxp.com>
Subject: [PATCH] rtc: pcf2127: fix command byte for PCF2131
Date: Thu, 29 May 2025 10:53:26 +0300
Message-Id: <20250529075326.612550-1-elena.popa@nxp.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

PCF2131 was not responding to read/write operations. PCF2131 has a
different command byte definition, compared to PCF2127/29. Added the new
command byte definition when PCF2131 is detected.

Signed-off-by: Elena Popa <elena.popa@nxp.com>
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


