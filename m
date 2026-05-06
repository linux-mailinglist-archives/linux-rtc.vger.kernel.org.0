Return-Path: <linux-rtc+bounces-6474-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KL0LE9x+2kNbQMAu9opvQ
	(envelope-from <linux-rtc+bounces-6474-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:50:23 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF774DE4F5
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44EC83027370
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2026 16:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3C64949FF;
	Wed,  6 May 2026 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSxO92UI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40288495528
	for <linux-rtc@vger.kernel.org>; Wed,  6 May 2026 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086165; cv=none; b=mShev2N3Ac1NOkgLTYu+zleHCSay2/BRaStdk2b0s+iHfKxfD/L+C1YzLmb8MuCMSmL9sZvKXjOoQdko11oXzxM4IwDWszM1jyj0TLIPmXpCiTQoaUkx8wmfuR/+pBIkjJNeXB/A/vK/q91DyIpkYNjMo8ADqWMZROinHpTyVS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086165; c=relaxed/simple;
	bh=XbIcmfBPvdUsZgt8hYQuWguV5+dMEMnvfD1TFRjc7zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/6EyOX8AaNIrXRLFNEu4bPPMP8O7nFXVuwbNciz0n243GKmb36ydk14Mwl98KchzkTB0SDkxH19shsnzVdXBGSDerFG+vZ5co1ZTzkHKs1mQii5M2cL8MaxrNNg8lATAHwwQUdkhShSefDjPjpG3w4s89+YB5/8JQVIVCIUtpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSxO92UI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48d146705b4so27510965e9.3
        for <linux-rtc@vger.kernel.org>; Wed, 06 May 2026 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086162; x=1778690962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/baJx7mBsqKytKYQaKxdbG5hOnnWG1GzcGphYV5dXY=;
        b=iSxO92UI/pfpIBIpTJ9pEJUCdlNSyr0yOGYRhFT/a6aw3U3MeI+j6WsEzabt4mutsn
         pGxUvVLeFuNoziE+Y2xx7grQfRM8/fyyIJiRfTVfraS06toRB0xgx1EU1n0C7B3Ss6TZ
         fOXTaK/pKgUv2Eiv2x2HrO6rEVex71viiy+gNmK8sy0RtVzoUaRjbpVC6Gb7j4uYEH5z
         KSajT9+1fX1wrtWwEuxZ1oneybAvflnHUT1+g/1+ObW/rWaD2M9o5iUo33QlLDgY8xk9
         HoXAsm28mVZ6vwTfqU8TxcE1+AWbVGHdIhWDv/5p/Apt8svqEheAQspvcE19Pc4subeh
         dgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086162; x=1778690962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/baJx7mBsqKytKYQaKxdbG5hOnnWG1GzcGphYV5dXY=;
        b=sgEqpufx4xMdjUn1cjvMfT91BDNpyABz6Ia+tC3ERk0cpuZEtpta+mF7Vr/5f1BdIt
         uTd9I/14Q0OUYXc/U1N0ex7978lJ7Lgn+KP4TLR8QKGVqSpvdscIIZPztdxKRRSCLhNg
         xlxLu8rAI2pjiE/3LzkV//dpJNXe6snsuuCs/FeStq0HAceVGqVlMRyyb9v9AGLyNr2J
         XeTqMSWGySO8RguhUKia3g85b2k3GPzYnbW2x3VCfbTVdoggyfM8CL2CgLroSxigvR13
         2AFYEtc3tb/vtwjUeE/AdhgYLpKnF9KW8sU0BL7W0T/uhe+NIVlAXBkm6NqI9yEzG4jU
         eJZA==
X-Gm-Message-State: AOJu0YwSEB19utiHy6dVBuUgoYg8WzlZQBlyiuJ1RRREZMteqTL8J8gG
	WT3CDNeXebSBW+MjcZgrcZaD8555uI0829wTjuywvDprSdfel1T7hg2i
X-Gm-Gg: AeBDiesPEKScR7lDf7jSLZOMlugV7BpdwOMYjoRT9DiG31cVEwiAK8EIsTPuLxHsVdX
	JkacbKXwxRYa42o35qnzzDv9gJlz/hwGH0GvW8OUTiedVryiuEd6LhCjz67iCiwthpWk7IIrulg
	P2pcmgW8OscZB6YyiJRZ+ruTfTd/svjUnOwObECgNw/nDp6/X3S06uyiBQAuvPkgmxNsDSxwped
	hfOpE+SlIzuLrnG7xb+RbdLQ1qSEL4l4bjQEkx8jyC2t6TVHd1q74KlrzTD6o7OQdioFHNFe4rQ
	x5TWa1zSnyqX5EPufWqugoHZCwqtQaV7T6+C2M61dMX2f3l14OqSL3bGWcr/pwitSw5s883wgVy
	TK6+dU8XrCGO/vhQZ76LFJWcc7IcLiji+AeAJvFDz/C6wfKvAQbQRPFnLquLMGES4J7VULA25z5
	5J0F5afXbf0la5BUHk6PlCpIIzK17lwG8yffzo+ft8nNIiYytJ+r33e/zOpa6gSCToIzfuS8QK6
	kuGrlFRUkyWyMdyTgv7Id2yyFY+k91PjMB7zu/a1rg3c8Yy4OymdiG6xw==
X-Received: by 2002:a05:600d:10:b0:488:e7e4:8425 with SMTP id 5b1f17b1804b1-48e51f4ea40mr61630205e9.23.1778086161523;
        Wed, 06 May 2026 09:49:21 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] rtc: renesas-rtca3: Factor out year decoding helper
Date: Wed,  6 May 2026 17:49:14 +0100
Message-ID: <20260506164914.3987293-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6AF774DE4F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6474-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The logic to decode the year value from the hardware registers is
duplicated in both rtca3_read_time() and rtca3_read_alarm().

Introduce a helper rtca3_decode_year() to centralize this conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 97e7e65f59a5..b3875d041de5 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -228,12 +228,19 @@ static void rtca3_prepare_cntalrm_regs_for_read(struct rtca3_priv *priv, bool cn
 	}
 }
 
+static u32 rtca3_decode_year(u8 mask, u16 year)
+{
+	u8 y = FIELD_GET(mask, year);
+	u32 century = bcd2bin((y == 0x99) ? 0x19 : 0x20);
+
+	return (century * 100 + bcd2bin(y)) - 1900;
+}
+
 static int rtca3_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct rtca3_priv *priv = dev_get_drvdata(dev);
 	u8 sec, min, hour, wday, mday, month, tmp;
 	u8 trials = 0;
-	u32 year100;
 	u16 year;
 
 	guard(spinlock_irqsave)(&priv->lock);
@@ -274,9 +281,7 @@ static int rtca3_read_time(struct device *dev, struct rtc_time *tm)
 	tm->tm_wday = bcd2bin(FIELD_GET(RTCA3_RWKCNT_WK, wday));
 	tm->tm_mday = bcd2bin(FIELD_GET(RTCA3_RDAYCNT_DAY, mday));
 	tm->tm_mon = bcd2bin(FIELD_GET(RTCA3_RMONCNT_MONTH, month)) - 1;
-	year = FIELD_GET(RTCA3_RYRCNT_YEAR, year);
-	year100 = bcd2bin((year == 0x99) ? 0x19 : 0x20);
-	tm->tm_year = (year100 * 100 + bcd2bin(year)) - 1900;
+	tm->tm_year = rtca3_decode_year(RTCA3_RYRCNT_YEAR, year);
 
 	return 0;
 }
@@ -354,7 +359,6 @@ static int rtca3_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	struct rtca3_priv *priv = dev_get_drvdata(dev);
 	u8 sec, min, hour, wday, mday, month;
 	struct rtc_time *tm = &wkalrm->time;
-	u32 year100;
 	u16 year;
 
 	guard(spinlock_irqsave)(&priv->lock);
@@ -373,9 +377,7 @@ static int rtca3_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 	tm->tm_wday = bcd2bin(FIELD_GET(RTCA3_RWKAR_DAYW, wday));
 	tm->tm_mday = bcd2bin(FIELD_GET(RTCA3_RDAYAR_DATE, mday));
 	tm->tm_mon = bcd2bin(FIELD_GET(RTCA3_RMONAR_MON, month)) - 1;
-	year = FIELD_GET(RTCA3_RYRAR_YR, year);
-	year100 = bcd2bin((year == 0x99) ? 0x19 : 0x20);
-	tm->tm_year = (year100 * 100 + bcd2bin(year)) - 1900;
+	tm->tm_year = rtca3_decode_year(RTCA3_RYRAR_YR, year);
 
 	wkalrm->enabled = !!(readb(priv->base + RTCA3_RCR1) & RTCA3_RCR1_AIE);
 
-- 
2.54.0


