Return-Path: <linux-rtc+bounces-6275-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKGgCalSzWmnbwYAu9opvQ
	(envelope-from <linux-rtc+bounces-6275-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 19:15:21 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23F37E7E3
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 19:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB10D30826B7
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Apr 2026 16:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF5147A0A7;
	Wed,  1 Apr 2026 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDncxNUs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D2146AEEF
	for <linux-rtc@vger.kernel.org>; Wed,  1 Apr 2026 16:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062388; cv=none; b=RAI7NZLF4zMHGdgdulrT3mX3VvgqeSoJtCIXdTvMIJwKxhOgBTxcsqGjVAy28bY612897vv9yjC9ibRBkNcfu+KALv8f6xv946CDcQ1q8VnXiAkIJH8C45vnK6UmyoIo9vBKO0QjDJWMBrdz65Rv23Yd99Kc6CFVizh72Xx2JIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062388; c=relaxed/simple;
	bh=7JHb/fehHsRGtcjx+wMexUk8TlbQd3DgMwu3xWq0M6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMekJYkyWUgVPHeroEKdowgUSspPZD3zM0Z0Lbbq5tH3w7SLXFhdVGjFCfVwz00y/2O5XRV6Nzf6hlxwxk4U1oHPeQVQJLW1fQ8EbRY4qR7UyKWOojW7fx2lgNsehVm1YvUJXpS+VMDLABnzy2ABvMtUjtI4ZajAHXskROAhxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDncxNUs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a10d130b37so1362463e87.0
        for <linux-rtc@vger.kernel.org>; Wed, 01 Apr 2026 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062384; x=1775667184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15hhqmM+WcmF9r9spsF10nnN5s/DKnsn3oXOisU/ams=;
        b=fDncxNUsBwTn4T7tIZW6bYfkvxxxoaT3XNJj8cJySP+FRPFRPgEvkyX5Hjwx5U4BhE
         6tSrnzL3RfaDNqUQL1pCVLdnRZFvI8xUxA7f1/EiKlA/dblyijNn2mMe2w5I9i/Vr/sx
         jJL1yJJzd0mMngCwSWBfvsc9uEa5yX0nF6BeeoSKt//01uCWYbj9NrjrvAYMKDhyDszu
         YE5D3kzkLhrWrXmaJCOpnD4DsMO5R6M354VjKB/V5JhYj/B/J6VPjW7cEeI0aPK0raPA
         AT3ynm+9sOxZzZQwq+Xr6DTxQMyvZi3ulnNQ4Ywx+TL2W5shzviOhMo1fdWZj4G1jdhq
         OdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062384; x=1775667184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15hhqmM+WcmF9r9spsF10nnN5s/DKnsn3oXOisU/ams=;
        b=j4J5DssR5/POcW2bRnZAtiV66Rbsgw/M3j4EAKlLnnMfwd8NEvrZ7NEhvoBhhtc4in
         JSFBf+XRkpZGC98eavGBCvyNqivuXNzLYYrCmsNtk1iGc1KusDWB150Zp8X1qZ7+2SLz
         59OfFffXfyU0iKs4dxUYywSJ0TykHx9AR24eGQccths6ay2jafHwpCiAiLyljn3FcVG6
         MeBd7Wg04GuhWO0ZqeygGLs80KsAnHiD5hzJkFam2TAF9p0gN17Po4xqnN7R1OfP2L5b
         UghoCxcz19SFUM+bBGBLJ910MAHEvExCCQzg751JmvQ61nxnWOS7THiqTq2kCPULnAIw
         HH9Q==
X-Gm-Message-State: AOJu0YwFFVTY/COfzNyka3XmK9nod9lL4Ota/Qk+JaJ/7D/pfJcdrjpI
	Kvcg3iIMIs6EL0/Enqv2huyFxkIvWZ88LBuzNVeu/YvPnuMmPJ0ByHoBJdRMuxyyckio9Q==
X-Gm-Gg: ATEYQzwYxRD6rjIDZ27l9O02uE7dj6x2cZYcFevodpPMZd5rao7ocDLfgpVYNRukbDQ
	AVzWSQEupZQ92fqYh+70BTwyOGvNgiFxhAPWyhtlIhSSGcc+nWjy+BouoVkwKcVqBc5VV140b3D
	3ak9vS7bsxYboGB8BuL3QFN711ZYiNFuREsCy5fazrQYIh8N29JcAWBJMOy1/4eheDTf2vxU8ea
	5K6OnuccrXQZxxTkPs7H2kwFCt85pTggvTbaUxjsMlcx01VfNapBt8fQQvpVpnbea4douDlDyEk
	hKiIbNrps7ZKnzj5FOGtpK2LyyL/F5gUyO/QDGbZCvBe97h1jZK26XKeYUyfAaYkluPadtVbexT
	BG3Pb1Rl0MMw95vZchFr/GJn9fcr2svfvQd8n+K+DbXtyfbAq5PL48iQdOQXlDbqgefJmiZwIdq
	IlkonS+iCqytBALsYfxUQtDPuf4wZjZdCk1i16kh0=
X-Received: by 2002:a05:6512:8003:20b0:5a2:c66a:d6d1 with SMTP id 2adb3069b0e04-5a2c66ad745mr368019e87.6.1775062383301;
        Wed, 01 Apr 2026 09:53:03 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm63358e87.62.2026.04.01.09.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:53:02 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Steven A . Falco" <sfalco@harris.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 2/6] rtc: m41t80: Rename FEATURE_WD to FEATURE_WDR for clarity
Date: Wed,  1 Apr 2026 19:52:41 +0300
Message-ID: <20260401165245.936428-2-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401165245.936428-1-eagle.alexander923@gmail.com>
References: <20260401165245.936428-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6275-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,harris.com,mba.ocn.ne.jp,towertech.it,linux-foundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F23F37E7E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The FEATURE_WD flag indicates extra watchdog resolution support.
Rename it to FEATURE_WDR to better reflect its purpose
(WatchDog Resolution). No functional change.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 155eded2a921..52f398107d35 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -67,12 +67,12 @@
 #define M41T80_FEATURE_HT	BIT(0)	/* Halt feature */
 #define M41T80_FEATURE_BL	BIT(1)	/* Battery low indicator */
 #define M41T80_FEATURE_SQ	BIT(2)	/* Squarewave feature */
-#define M41T80_FEATURE_WD	BIT(3)	/* Extra watchdog resolution */
+#define M41T80_FEATURE_WDR	BIT(3)	/* Extra watchdog resolution */
 #define M41T80_FEATURE_SQ_ALT	BIT(4)	/* RSx bits are in reg 4 */
 
 static const struct i2c_device_id m41t80_id[] = {
 	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
-	{ "m41t65", M41T80_FEATURE_WD },
+	{ "m41t65", M41T80_FEATURE_WDR },
 	{ "m41t80", M41T80_FEATURE_SQ },
 	{ "m41t81", M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
 	{ "m41t81s", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
@@ -81,7 +81,7 @@ static const struct i2c_device_id m41t80_id[] = {
 	{ "m41st84", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
 	{ "m41st85", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
 	{ "m41st87", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT },
+	{ "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WDR | M41T80_FEATURE_SQ_ALT },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, m41t80_id);
@@ -93,7 +93,7 @@ static const __maybe_unused struct of_device_id m41t80_of_match[] = {
 	},
 	{
 		.compatible = "st,m41t65",
-		.data = (void *)(M41T80_FEATURE_WD)
+		.data = (void *)(M41T80_FEATURE_WDR)
 	},
 	{
 		.compatible = "st,m41t80",
@@ -129,7 +129,7 @@ static const __maybe_unused struct of_device_id m41t80_of_match[] = {
 	},
 	{
 		.compatible = "microcrystal,rv4162",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT)
+		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WDR | M41T80_FEATURE_SQ_ALT)
 	},
 	{ }
 };
@@ -661,7 +661,7 @@ static void wdt_ping(void)
 	 * M41T65 has three bits for watchdog resolution.  Don't set bit 7, as
 	 * that would be an invalid resolution.
 	 */
-	if (clientdata->features & M41T80_FEATURE_WD)
+	if (clientdata->features & M41T80_FEATURE_WDR)
 		i2c_data[1] &= ~M41T80_WATCHDOG_RB2;
 
 	i2c_transfer(save_client->adapter, msgs1, 1);
-- 
2.52.0


