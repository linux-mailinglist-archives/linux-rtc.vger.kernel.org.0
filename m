Return-Path: <linux-rtc+bounces-1275-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0271F903FF5
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 17:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AFEF1C208B0
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 15:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE5322F1E;
	Tue, 11 Jun 2024 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="uJ0vzSkn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1A219E7;
	Tue, 11 Jun 2024 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718119678; cv=none; b=C/VquWtlCHbj1hNCTZOoN248Y4u0wcZ+N3ukPRM71lkABqbqIZmH3809+2RDjSOWzsdQ8WXwqV9PxfHID8wZU3ml10mCcFaPBIWH9Ji5tonr7cOmIaY8U7sUm++0+0/gwyB7x8hrXCzVOmXrnAK6Lqi4klykxTx65ENhX/YHcew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718119678; c=relaxed/simple;
	bh=bckD34ce3BLIg4fhivwUbxeT9ELN7t78T8hp5H2vVD4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dNU4/UZNLOEDxQSrHBrlZtJSuooD00ZFHhxK7cqa2z/ckbogDGSzA156M/bBL84OQ7Qhvd3G0S34G6Mm11/kTJ2hTgaXAJBPpcekHA7ipN9ABH0hQJspXVWyocfikKBVkBa3JMTT7kqk9gCCgrL8rFlKIhpXDDF+7a1dmxRCpGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=uJ0vzSkn; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0382EA0A9B;
	Tue, 11 Jun 2024 17:27:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=+fcXqLCe4F1bXJgjKSJ//mKl8KYr7kb10sDPWBlrK7M=; b=
	uJ0vzSknW5jLFMW3SUQ9qTgps1gqUv99wdY/LGus0tp97XextN81kQ6hmSHeFKl5
	2LJljIwe05aPK07c9fv2VYs0Tb615ZBn7QmDnof1FLyoIPl1cfdUU8zCFIvLpbWD
	koguLizVQf4QKl10YrsmsV3FPhXqTw2q513fBTKwTrjdoo8ndiAIbr4JCdxHPOJh
	Cdg4SvIMVKZllzlR9DbX5V5XRfjbEWMUPKuTitW+rUSoiZfCw4jP/MH6/6F3ldnC
	v0IP54NVKbEOIi/OmmC85YX3oRNdTwxLXqlS3aPbLgIPDY8HQo4VTcL9ArrwExAy
	mnbqijlj0R4ELO4uErzfBeNAuFKV5RsW3ELMuBdMqLDm0M4GtAm4vGzKRwpqwV2f
	QPYZ1ae4/nB0Cf8Md6HahnTUdooIBfsTWYS0YA7vvjQ954RRtcFL9DjPs6MBAJZN
	SqZIUvZs7fYIyMX5qHIIvS6EzHyYHuNFYMOykvHQZ7GmtjqvnSKaYY6hmPuMeLFy
	SN5KbzDso8JU36vjrylC2NOlJVbO8vl1GhGs/vkRz9aV9ja3jDOPXL2Jv0lQmKJ4
	2JzaJqQNRi+TRRuenF7PIfDc1ZtEolFdnw1Fx0uccue622JJz7iLnOtxZhh5COgA
	89vpUOtpn+s6XFUToQteJMQV+uJvmNr0Rd0cuk5v6us=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Subject: [PATCH] rtc: interface: Add RTC offset to alarm after fix-up
Date: Tue, 11 Jun 2024 17:27:00 +0200
Message-ID: <20240611152701.685011-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1718119673;VERSION=7972;MC=2950704555;ID=512276;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29916D3B54627C65

`rtc_add_offset()` is called by `__rtc_read_time()`
and `__rtc_read_alarm()` to add the RTC's offset to
the raw read-outs from the device drivers. However,
in the latter case, a fix-up algorithm is run if
the RTC device does not report a full `struct rtc_time`
alarm value. In that case, the offset was forgot to be
added.

Fixes: fd6792bb022e ("rtc: fix alarm read and set offset")

Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/rtc/interface.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 1b63111cdda2..db8dffffed91 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -275,8 +275,7 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 
 		/* full-function RTCs won't have such missing fields */
 		if (rtc_valid_tm(&alarm->time) == 0) {
-			rtc_add_offset(rtc, &alarm->time);
-			return 0;
+			goto done;
 		}
 
 		/* get the "after" timestamp, to detect wrapped fields */
@@ -380,6 +379,8 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 		dev_warn(&rtc->dev, "invalid alarm value: %ptR\n",
 			 &alarm->time);
 
+	rtc_add_offset(rtc, &alarm->time);
+
 	return err;
 }
 
-- 
2.34.1



