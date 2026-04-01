Return-Path: <linux-rtc+bounces-6278-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL32FjlOzWkWbwYAu9opvQ
	(envelope-from <linux-rtc+bounces-6278-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 18:56:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5C37E40E
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 18:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDB8A3018C21
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Apr 2026 16:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76067477980;
	Wed,  1 Apr 2026 16:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sbx0sgVE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988D947A0AB
	for <linux-rtc@vger.kernel.org>; Wed,  1 Apr 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062392; cv=none; b=MwBnmlVFrKE9m5opfasmQRGBwd9VZhv+eM2MeM4BJ2ME4R4bK1mhEhO0wxGG31gA9BdkdaYwojHt0OzrP9d+mtXzY9JlXLmTvoEq95D5wAGoshzy1CeAb+SpT4l84etOkc+DwfUA+4TaI5u5B9iTV0wCgIjSwF1w+/gUd0Xzp8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062392; c=relaxed/simple;
	bh=biFcUWuNIua/wZDXIZYn6KmNKG94eRj8znPQgBGyhd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJz3TQSmZFClNe9FSScs0MYSHj5wonBf+Qu59ie8A6uR8v+sRk4PuWLNFUZ4l8scI2KxhCOyCv6lFvxy6kCyNKOmqxpVGbZMprGU3KZts3NuvacoN0vR28RQJXN3+KL/SJU7htrLM4TWsNm45PcI6CnaTCLcJaphCOKRzAH4OEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sbx0sgVE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a27daa652fso20917e87.0
        for <linux-rtc@vger.kernel.org>; Wed, 01 Apr 2026 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062388; x=1775667188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSrW7uinHyEPl9MpObFcULO0rS4hxdmspdNWU1MPL6o=;
        b=Sbx0sgVEOla5xQM1JX42g2/Q0HokrLhC8AtdQSRfkcjY7KWTqrHCrxjiL4TviSzLp8
         7rweMVCvj+Wnv5F2CC2XD8OYfuaZMK2ayTJz4yA7o21Z4r2cf00Dqw5QhOUaH88J1tRF
         muffg4n7crvBlfJ5tk5Qm5Iv71AVj5WvowDI5tUmJl+H8JhP7IqEtn1z5sUbjsiz9bOH
         PVvvfSPIRW/CIMWSx14AFdIfFVxRrke9fJXUE0cu0cP/E9vVAavvgS3uqoaPaSPwt9Va
         rwL0ZddCOLMQ48/q6KaSX45WWezRcFZ3k6+1ecWstmCtv7n8g+g0MsOxgHPcPz6XoFlQ
         6yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062388; x=1775667188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSrW7uinHyEPl9MpObFcULO0rS4hxdmspdNWU1MPL6o=;
        b=cOd0xzvCKz5xSwNfK9axZ2XyCsowkKgD0I9lo6QEYyQFBdW7R/O0X3iBuRjeprqJHR
         cqhM3h6d5i5je8F+X8lq2XclhlKIcZeDLFvDvaYcXVmiaMJhAG+mL1v+v4af/xu7/W1k
         azQcmcCmUaVXavmfvSiOrK2wqVH75WIGqSQIbp2WbyXmgyLXsQ/gJsUjrGNvPrZEgv0g
         AY5V1XqVh3r5XstXEOnSprgWa0lAam+2QFsQUl55q9jt1Y70q09tgRCHa/qjT/uBiyQ5
         73/P0wTEUisN39mymsQElf6VA83H0hq2aTA1l9eA/nP9NPCMUYmns6cXWLmaq8IJKpFl
         kLmA==
X-Gm-Message-State: AOJu0YzSIH/244v78CYPmUuqDpai0HLA8jFSG31COwqp4Oq0igqWcw6D
	Ree7pdGzLHMJm8CI+D/b93oDq7WCW0ltDMf75a2kqjODZgiqyHBraptGz7+k7oM50jGaPQ==
X-Gm-Gg: ATEYQzz9dahiz3YyfYv3z2r38I8zAdL1hEgDcX4+CZcxqVbJxlkJ7jCWUVWIC7wxRiK
	4mliee/bviowFfUJky0pzV64+QYUjQ9UfMj5tSFN0udi/3P6fzrL99Q6rMxO1s0mm242BdhfShq
	Ov8KnnhTyiDR7FQaOKtgm7fh3nfGUKZBhN1ILhDPjJyNZfwnIFO34dLv/jRsoU4A/FJS8lLYSYh
	xeuMOcLbHIhQgD8kslxtW2lceSavBskhQ2qgtYe63dK+0Tx4eTus1j50P529sXUebllIfYoZDea
	orPOXdp4zdnEDfuPSPDrCmcm4GP3OOi7W5p58rL69cvYFxlHBOOVdCq+zEoQr5ofM0Ru6kfcV+y
	cjGutyFxxJqOLzvzfo9m7PI2leAxAuYQuG784cLxy/e0J4qnbnNbs3mlvp0+P10jHnsKyps1pw7
	y5UEApxlZqWbwepL4OgukhJ4FicMTQ1FcC2SSl2Eo=
X-Received: by 2002:a05:6512:39c3:b0:5a2:a8ab:ab5a with SMTP id 2adb3069b0e04-5a2c1f3f588mr1749383e87.30.1775062387980;
        Wed, 01 Apr 2026 09:53:07 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm63358e87.62.2026.04.01.09.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:53:07 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Steven A . Falco" <sfalco@harris.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 5/6] rtc: m41t80: Add missing FEATURE_HT and FEATURE_WDR for m41t62
Date: Wed,  1 Apr 2026 19:52:44 +0300
Message-ID: <20260401165245.936428-5-eagle.alexander923@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6278-lists,linux-rtc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,harris.com,mba.ocn.ne.jp,towertech.it,linux-foundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CDE5C37E40E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The m41t62 chip supports both Halt feature and extra watchdog resolution.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 0ef0c1f19e15..5ba714b25e4d 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -71,7 +71,7 @@
 #define M41T80_FEATURE_SQ_ALT	BIT(4)	/* RSx bits are in reg 4 */
 
 static const struct i2c_device_id m41t80_id[] = {
-	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
+	{ "m41t62", M41T80_FEATURE_HT | M41T80_FEATURE_SQ | M41T80_FEATURE_WDR | M41T80_FEATURE_SQ_ALT },
 	{ "m41t65", M41T80_FEATURE_HT | M41T80_FEATURE_WDR },
 	{ "m41t80", M41T80_FEATURE_SQ },
 	{ "m41t81", M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
@@ -89,7 +89,7 @@ MODULE_DEVICE_TABLE(i2c, m41t80_id);
 static const __maybe_unused struct of_device_id m41t80_of_match[] = {
 	{
 		.compatible = "st,m41t62",
-		.data = (void *)(M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT)
+		.data = (void *)(M41T80_FEATURE_HT | M41T80_FEATURE_SQ | M41T80_FEATURE_WDR | M41T80_FEATURE_SQ_ALT)
 	},
 	{
 		.compatible = "st,m41t65",
-- 
2.52.0


