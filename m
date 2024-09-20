Return-Path: <linux-rtc+bounces-2043-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779997D87D
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Sep 2024 18:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9655284034
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Sep 2024 16:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27721428E3;
	Fri, 20 Sep 2024 16:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="VdfzrC8H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3053413AA3F;
	Fri, 20 Sep 2024 16:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726850736; cv=none; b=IJa8v3eHQpCkOx8yRdJ0B+JqVi4sjPui1cuQwGOxm4NQekdawLz0fNLIvGuv03dyspGOzdqEi0oTVb7rYLz2dw8mouoL0aKPNopS+EUASHfWPqOzFNZ1bXWQ6v3HKAlLxdqWuHN09bP/0R2VgqhABle8HGfkyHn7hzE9xqDvuXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726850736; c=relaxed/simple;
	bh=cLMGwBDbHOwlp6l2fxlf5v0qFNWyzYBnuy3KDrHgc1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOQfgZCx/MpN9IZs85ceTrPC8vfd7YR0jJlYT2bj16SCoqUVD2iZjbXGuRFraHXt7SjzwB/reXGrB9aXFlwALAIPWPfn4t/4eXw9BDwWW7Nus3uLobjgsQGn6ZYuRJmyvMdMAJK4gO2jZ3Z7BOA4BuzpTN5WVdywbR9Bzf+7hOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=VdfzrC8H; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1726849008; x=1728149008;
	bh=sTV3/3SaZ+NJbD9hQE/+9IHDpO4DnCnmNCh4a+dGmAM=; h=From;
	b=VdfzrC8H86sUNAxt/CMOl4apHFbHQDTYR0+ECZDDpmkA+SvAfpEVJYFoiF5PxLCls
	 qbubCNHf6VB9NYeC9MJRerZ6gvaW1TRGGD+cSj69j/iRbpq7EXAHPj7ted09WfkOmT
	 ecyTD6BTfB2MM8VBn3syady7wjWlX0H4qSC2UnaAYvLT80/C+wpaxENzvInhlS3D9b
	 yU8azb6hmJ7cAIHtbMv3JIBJW88e2GW4Uh2CX0uOJYTC4YBXHiA4bq2ePZOGwBy1ll
	 s1tv3c5EO8A9W6xtsOf8nS4Ym3niQDRlODUoq26bWpPBV7Oy28fJLphKEs0I/AAH+i
	 enq+5RMXBxmjQ==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 48KGGjEg017529
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 20 Sep 2024 18:16:47 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: duje.mihanovic@skole.hr, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [RFC PATCH 1/2] mfd: 88pm886: add the RTC cell and relevant definitions
Date: Fri, 20 Sep 2024 18:12:34 +0200
Message-ID: <20240920161518.32346-1-balejk@matfyz.cz>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTC lives on the base register page of the chip. Add definitions of the
registers needed for a basic set/read time functionality.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 drivers/mfd/88pm886.c       | 1 +
 include/linux/mfd/88pm886.h | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
index dbe9efc027d2..891fdce5d8c1 100644
--- a/drivers/mfd/88pm886.c
+++ b/drivers/mfd/88pm886.c
@@ -37,6 +37,7 @@ static struct resource pm886_onkey_resources[] = {
 static struct mfd_cell pm886_devs[] = {
 	MFD_CELL_RES("88pm886-onkey", pm886_onkey_resources),
 	MFD_CELL_NAME("88pm886-regulator"),
+	MFD_CELL_NAME("88pm886-rtc"),
 };
 
 static int pm886_power_off_handler(struct sys_off_data *sys_off_data)
diff --git a/include/linux/mfd/88pm886.h b/include/linux/mfd/88pm886.h
index 133aa302e492..85eca44f39ab 100644
--- a/include/linux/mfd/88pm886.h
+++ b/include/linux/mfd/88pm886.h
@@ -31,6 +31,15 @@
 #define PM886_INT_WC			BIT(1)
 #define PM886_INT_MASK_MODE		BIT(2)
 
+#define PM886_REG_RTC_CNT1		0xd1
+#define PM886_REG_RTC_CNT2		0xd2
+#define PM886_REG_RTC_CNT3		0xd3
+#define PM886_REG_RTC_CNT4		0xd4
+#define PM886_REG_RTC_SPARE1		0xea
+#define PM886_REG_RTC_SPARE2		0xeb
+#define PM886_REG_RTC_SPARE3		0xec
+#define PM886_REG_RTC_SPARE4		0xed
+#define PM886_REG_RTC_SPARE5		0xee
 #define PM886_REG_RTC_SPARE6		0xef
 
 #define PM886_REG_BUCK_EN		0x08
-- 
2.46.0


