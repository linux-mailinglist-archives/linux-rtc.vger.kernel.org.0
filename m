Return-Path: <linux-rtc+bounces-6277-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPgTD6lSzWmnbwYAu9opvQ
	(envelope-from <linux-rtc+bounces-6277-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 19:15:21 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8432C37E7E4
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 19:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2633B3084566
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Apr 2026 16:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C459646AEEF;
	Wed,  1 Apr 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Or1ME/zp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED9C3859D4
	for <linux-rtc@vger.kernel.org>; Wed,  1 Apr 2026 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062390; cv=none; b=FFO1Eh5oFofG1OEWlY5AvWHMKbawXmThbpZrbLTtwEMCGaSnXURN+UcfOJcBno1C5VLHR1Jld5brkDa26s3HdRS/JZZcxhMq8oKFwORWb1oI6TMUN7DY0VYLyiK7Tap1fU9DjuhrhYzPLGFltn/b1sQD4cGJCBJfuXCOkqB9vGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062390; c=relaxed/simple;
	bh=bx2NIF2EnFsooeud6IJ5I9gw6xMFYykC1IUsPjbgYx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7tcHthJM1Ttzmg0h8dUx5yJdL5rtRB9UQxaYT1/j1jyft7+bdlez9RFs/azoV3ngRMp3ZqGF3cYMpw/Eh+3hB/SD1EZgycsE575a7qDci5ScWt1Ac7jSZCNKinNqlEmQvzcb89jvZqslhdiL2qHfYSZWm4HshiOOC7qfgrSr4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Or1ME/zp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2a5236811so6855e87.1
        for <linux-rtc@vger.kernel.org>; Wed, 01 Apr 2026 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062387; x=1775667187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8DorWe32tvVQaGpzVKWVR4c7lC6AQYj4Imhv0VGd+M=;
        b=Or1ME/zpGDZ3n5X5GA0qZ/Jzk8evenlkStU4K29KPXfvQu0N4xpSzAVBdnosZVxShj
         BzJPsWGRMnruyGTt10NyGSUBcnmIdbeXxU8JoQSBlXGnvwb+ohn5BiEwNyVh+Blycijw
         C2Ao4H1IW6ERP3qK+gZRQA38y1N4QMj4QpNSK4TY2aH74RoS9xE9+7dHHfZGcAWBSiXl
         0J88KsBFVOSyygULCS0r/+/jJ6vHQeXWtMaIPzAF0c4yLrXrTxhzgjwHIN04D+Gj0wEB
         /1rIcc+aHalJ166aW8grTi1sjgnoaCN4TKr0UT7O1aZhM3+YBEOB9Yt9Tq/GGbziRzXc
         hK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062387; x=1775667187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j8DorWe32tvVQaGpzVKWVR4c7lC6AQYj4Imhv0VGd+M=;
        b=asO0+sRckKGGYdrNq0MJfz5BuTk05MQ99ApPAgUf3Ze60Wsf2Zfc3QuRpbwVSUH4RS
         E1nMufOIvxRqu2b0oMPYjEdyCX8U4cmmbCZssNIKHyMA8+tAWqB3f9SfSq6A8YbIr+Xt
         rtYaj4BKMa2VzHABQvc6edcDYJ3MJiP0PVVITrIvMbjcd8Gzikw8H7jI6fM/FUKbP/Au
         dUcNhwCTd5C4ssFGwW3QRm4XTBzaY7BkLAwnEAvNJjHTkjQttOlsWYt2rLrgQE5nzAzo
         snfZYm9sEvvJXKiLlZqFQdYTFxOIJT70d+YUHqhuwBmo/asGe60eSW1FDRbzeOV/InKN
         J6Rw==
X-Gm-Message-State: AOJu0Yxa4zncuc/fDO63nIoyuvxetMfERMEkwqTu7fUw8RqT1MRHEqci
	fMK/eLgX+/oy62qN0yzldF2lekmdEIC1pC579USnIXE9iaQe02akOl2PAaH1dljGlraRxQ==
X-Gm-Gg: ATEYQzyqV5zJfpm/DMpsrQ/zhB/ijLxKKuJU9gfRo09LD1e6OJureGmpDwV7eJ4CeWl
	W+Ze3Y2LwgUo4n0/3N5EPPtv7VWfWbT34EGx4VruMQJh3FpSaYoKc5dofvWYt2DqfQ3EZPZls5r
	EZGdWlLAG3MAN9p1m/X2XS11lDZMpdgBlmC42XUiOZtaZZqZ6H3x5JqbFzDbwsfhwOK6btGXvpK
	O/P8DykzR9Xhb83ZLgLiXHfAfLYOoAwtEJuqu+ZB91H6wopD8Qurnp61KvUGTqiFuLEfdxhF8he
	AbNowx2apUp57o/RPW9rbp7dD8ZLfiNJsOl/T0HNKmvsJWzuL4OnkdpxOd/+gQcg2p3eLn9e/y9
	snzGzsATKnjdHOU3/LelmhMcYRS32qzThrAemQa198n1UZrpEixlYu7G2dYE1uldPNAiFeY12TW
	yYbz5Cq3Eq3kU6oU8am9UpgexzP9c+HahjB5rfcKQ=
X-Received: by 2002:a05:6512:2204:b0:59e:5c8f:a5 with SMTP id 2adb3069b0e04-5a2c1eec687mr1418107e87.4.1775062386447;
        Wed, 01 Apr 2026 09:53:06 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm63358e87.62.2026.04.01.09.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:53:05 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Steven A . Falco" <sfalco@harris.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 4/6] rtc: m41t80: Add FEATURE_HT to all chips supporting extra watchdog resolution
Date: Wed,  1 Apr 2026 19:52:43 +0300
Message-ID: <20260401165245.936428-4-eagle.alexander923@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6277-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: 8432C37E7E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The watchdog driver is only registered if the chip has the Halt
feature (FEATURE_HT). Chips like m41t65 and rv4162 support watchdog
but lack FEATURE_HT, preventing watchdog registration.
Add FEATURE_HT to those entries so that the watchdog becomes available.

Fixes: 289642767c2e ("rtc: m41t80: remove HT feature for m41t65")
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 11ef8195e786..0ef0c1f19e15 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -72,7 +72,7 @@
 
 static const struct i2c_device_id m41t80_id[] = {
 	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
-	{ "m41t65", M41T80_FEATURE_WDR },
+	{ "m41t65", M41T80_FEATURE_HT | M41T80_FEATURE_WDR },
 	{ "m41t80", M41T80_FEATURE_SQ },
 	{ "m41t81", M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
 	{ "m41t81s", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
@@ -81,7 +81,7 @@ static const struct i2c_device_id m41t80_id[] = {
 	{ "m41st84", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
 	{ "m41st85", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
 	{ "m41st87", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
-	{ "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WDR | M41T80_FEATURE_SQ_ALT },
+	{ "rv4162", M41T80_FEATURE_HT | M41T80_FEATURE_SQ | M41T80_FEATURE_WDR | M41T80_FEATURE_SQ_ALT },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, m41t80_id);
@@ -93,7 +93,7 @@ static const __maybe_unused struct of_device_id m41t80_of_match[] = {
 	},
 	{
 		.compatible = "st,m41t65",
-		.data = (void *)(M41T80_FEATURE_WDR)
+		.data = (void *)(M41T80_FEATURE_HT | M41T80_FEATURE_WDR)
 	},
 	{
 		.compatible = "st,m41t80",
@@ -129,7 +129,7 @@ static const __maybe_unused struct of_device_id m41t80_of_match[] = {
 	},
 	{
 		.compatible = "microcrystal,rv4162",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_WDR | M41T80_FEATURE_SQ_ALT)
+		.data = (void *)(M41T80_FEATURE_HT | M41T80_FEATURE_SQ | M41T80_FEATURE_WDR | M41T80_FEATURE_SQ_ALT)
 	},
 	{ }
 };
-- 
2.52.0


