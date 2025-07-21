Return-Path: <linux-rtc+bounces-4535-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A32B0C92D
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jul 2025 19:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACFC543EF5
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jul 2025 17:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1666A2E11C9;
	Mon, 21 Jul 2025 17:01:05 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D62E0B6E
	for <linux-rtc@vger.kernel.org>; Mon, 21 Jul 2025 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753117265; cv=none; b=oh0V4yOeWDOcJJknLXanNSdCFNUN4fQhTqUggYx2PhOMHWs38sIyuNePvYUfr/dQwOeSLgNGcSFSbX/rpgUbbd8tffPtQ1Q98K/FqS+I0eMSVpCpZ/QaZMcMdU8/0htODFtOPJlXU44Pb344/T4a51wAuER3XPpzgOx8OGw+8CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753117265; c=relaxed/simple;
	bh=Sk2T5MQLxD8PWOZNW18arysNz38QZo/k9pNkRumqKJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKGVQ5SadnfeuitoGHaADl5dCP59SeyjSdkv1dGul+2QetBq2BCzTRd6sRRCUjktCPJMqbcOhLu7zlz2LO7P4AIe8hzA7f+zBuo7uE/hbWxSrpNEzxJrR6E4ii+C20gjpQ7osXu2HO6cVxX44fq8jeLLVqshjE5UOcsxWGqJZ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from caradhras.arda (pool-96-241-31-235.washdc.fios.verizon.net [96.241.31.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kumba)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 950E1340E53;
	Mon, 21 Jul 2025 17:01:02 +0000 (UTC)
From: Joshua Kinard <kumba@gentoo.org>
To: linux-rtc@vger.kernel.org
Cc: Joshua Kinard <linux@kumba.dev>,
	Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH] rtc: ds1685: Update Joshua Kinard's email address.
Date: Mon, 21 Jul 2025 13:00:51 -0400
Message-ID: <20250721170051.32407-1-kumba@gentoo.org>
X-Mailer: git-send-email 2.50.0
Reply-To: Joshua Kinard <linux@kumba.dev>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am switching my address to a personal domain, so need to update the
driver's files and the entry in MAINTAINERS.

Signed-off-by: Joshua Kinard <kumba@gentoo.org>
---
 MAINTAINERS                | 2 +-
 drivers/rtc/rtc-ds1685.c   | 4 ++--
 include/linux/rtc/ds1685.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10850512c118..0b3a7e1f5a28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6612,7 +6612,7 @@ S:	Supported
 F:	drivers/input/keyboard/dlink-dir685-touchkeys.c
 
 DALLAS/MAXIM DS1685-FAMILY REAL TIME CLOCK
-M:	Joshua Kinard <kumba@gentoo.org>
+M:	Joshua Kinard <linux@kumba.dev>
 S:	Maintained
 F:	drivers/rtc/rtc-ds1685.c
 F:	include/linux/rtc/ds1685.h
diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 38e25f63597a..97423f1d0361 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -3,7 +3,7 @@
  * An rtc driver for the Dallas/Maxim DS1685/DS1687 and related real-time
  * chips.
  *
- * Copyright (C) 2011-2014 Joshua Kinard <kumba@gentoo.org>.
+ * Copyright (C) 2011-2014 Joshua Kinard <linux@kumba.dev>.
  * Copyright (C) 2009 Matthias Fuchs <matthias.fuchs@esd-electronics.com>.
  *
  * References:
@@ -1436,7 +1436,7 @@ EXPORT_SYMBOL_GPL(ds1685_rtc_poweroff);
 /* ----------------------------------------------------------------------- */
 
 
-MODULE_AUTHOR("Joshua Kinard <kumba@gentoo.org>");
+MODULE_AUTHOR("Joshua Kinard <linux@kumba.dev>");
 MODULE_AUTHOR("Matthias Fuchs <matthias.fuchs@esd-electronics.com>");
 MODULE_DESCRIPTION("Dallas/Maxim DS1685/DS1687-series RTC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
index 5a41c3bbcbe3..01da4582db6d 100644
--- a/include/linux/rtc/ds1685.h
+++ b/include/linux/rtc/ds1685.h
@@ -8,7 +8,7 @@
  * include larger, battery-backed NV-SRAM, burst-mode access, and an RTC
  * write counter.
  *
- * Copyright (C) 2011-2014 Joshua Kinard <kumba@gentoo.org>.
+ * Copyright (C) 2011-2014 Joshua Kinard <linux@kumba.dev>.
  * Copyright (C) 2009 Matthias Fuchs <matthias.fuchs@esd-electronics.com>.
  *
  * References:
-- 
2.50.0


