Return-Path: <linux-rtc+bounces-6629-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xs2NIFEvH2rliQAAu9opvQ
	(envelope-from <linux-rtc+bounces-6629-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:30:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD167631686
	for <lists+linux-rtc@lfdr.de>; Tue, 02 Jun 2026 21:30:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TIGS5BM0;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6629-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6629-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 343D8306A88F
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jun 2026 19:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86403FD955;
	Tue,  2 Jun 2026 19:26:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41B3FCB33
	for <linux-rtc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428375; cv=none; b=QNfdseHcY8fatWJIpx4q9rQk5Cr9yErR+esVpLkQtDwYiMD3ledjcxxiQ9QKMB+/YNJKDwFW4vGOS3yF6ohfIT/SzfMGb9GrD9jK3kzHcm0+YawIUbqtmNAsFXw9sUMh73v/UscpG/Z2ehNetGTK5WxqqphCjHVhNzFl1PuNnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428375; c=relaxed/simple;
	bh=eh5Ozs0edkRZsnMQsj4tIuBKDaf7zwjmpDtFtsUTUfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5zSflf4eDmWW0GykV4pos5/G4PgR+qGw0bWhr2EnnvrSzsmtH1FHZn83q/vxnOqCoGZUeEa+tAXbeLCOK+yWwS6QIk5cd0QNFBSgX3ckGZxVGs3S9P6rxWelCvbo/VgnkYgRnY+IG8AFCZc6kDeLrHoheRB06lKV0AxYiRyib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIGS5BM0; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so6871070f8f.1
        for <linux-rtc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428373; x=1781033173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93V/HD08Dr66e6NMTC/hLxCahTv4eoK0wDXtTo0JpXM=;
        b=TIGS5BM0HcKHLeL16kANrka1Y66w/siT89V5iycRxEIZ0GGQyAhEZ2E6gTk9lmqXfo
         2BOwSDPwa5lKO42VXOus8CVqLOjzVhE9HG+cMN1iG2BjE/ZJHYx6GsWtbW0brBr9aDGl
         TeFpg+Gm19ViVXFsXreL2t+qsoVhWS7Bo82hGm2cDG2ItZSJtU0rFJJ3c5lFLhnf3n6r
         8C65kKn1+5MXxfbqSQ+t3iRzq4pvJE+tSYQ7Xy5iRL2nAv+iQqp7B9qlH+0Bil8PLR2h
         akV+D9lxl2tB4LaKyNzXwR/cjcV+9UiuJhmeg/v8mncH8Gp765CqHJrCRsPCuCSEwytH
         KcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428373; x=1781033173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93V/HD08Dr66e6NMTC/hLxCahTv4eoK0wDXtTo0JpXM=;
        b=V3HdarWHm6q2KYF7/AeeJyYo6vDLkcibIIq6RLdGgI8JbquRjG5/9lA/0bB+cgVFO3
         VzG8/VhinE0spnACazhPJtQORqvgvzi9hjVrUgguAcwS32D9z0yl+RQv0KZ5mN1L7n/z
         xdAU6bA+UWUrumb5NUL/0ZPET9xygfUKufSnat2bCe8Y3a+gnuHd7hGh+pIIdc5YjchB
         DB9zBoLmke5Duu/VitPubsQv8FHUocHHKXc9Qq2VRloDuxYejMfKM7pjnIe34OxNEfq6
         dcD/jDrA5d1ISf8nGIj+BwtKYWiPxs1IV9vVWylzeqy5NWbuioyI/CbZvUoE4LFDGRmv
         FQ6A==
X-Forwarded-Encrypted: i=1; AFNElJ/l6KTxmYDzCLVaVucVCocAavCryYIxmBKCdzSfqG4jt3t4gfcUcZkI7ZzWxsWs4vJwliI87Emm06U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgF9CdxsfDmCTTuLdQ/axtRsb+BboQw0L7T18xENVhCw3LNvRW
	6/0J+HCGVA3vcf2Ymfj3PF3UedkI9V3eH8p7e9y9p3uoy0t/k9+jIcTh
X-Gm-Gg: Acq92OGGk593fTKb55Z3B5M7VoJOnsa8YccQAkTzPjuT3OttRGIwoT3H7KQbH9yQv4L
	0fnFsc7huPxOpWyIvno3JV8rDZf6291F4b1ugg+JlQJTkvZv49qmc+vCWlWi2MtlEla+keq6ROv
	siPaetw+pJ4yNYtyA07mV63ODdU4W1Dd3J4nEu5Uh78cHdaFQfZExIAmvTX2xOCK+Bkhn1uCSiF
	rAwnmtOSoWuch0xeChmeZiNNHibK5RAShrFMS7X7pwxY3FLs9hdarfhzIhyyBFQSsGY6qC1vF4B
	9S+KYGMOPg4/rmT3R6F/tFWxJOEDStYmOT+i0NHqcBIGNy4O/m+SKu8ka+8VUz4zxmJKPALeqYM
	dJ1iGF9JOeyUFAFMWXfLttsEyZ0NObclnQHT6NNTz9KcttcOGJ4ggsCD30Rbhey/h7M4HI27die
	lWTW9XtX9QNJsDoUbno4Eohrtndc5z4PP/i8NgwUE53exDCbyjTYl5AYA/YRucUJjEcTgy9HeHc
	LWG5RlpZGRDT+EqVq+Xz8o+Q5qESIZn85YygjDGakdMrUlG1BS5f0y5
X-Received: by 2002:a05:6000:12cb:b0:45e:f266:f4c4 with SMTP id ffacd0b85a97d-4601f645de3mr760603f8f.29.1780428372438;
        Tue, 02 Jun 2026 12:26:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rtc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] rtc: renesas-rtca3: Factor out year decoding helper
Date: Tue,  2 Jun 2026 20:25:59 +0100
Message-ID: <20260602192559.1791344-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6629-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD167631686

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The logic to decode the year value from the hardware registers is
duplicated in both rtca3_read_time() and rtca3_read_alarm().

Introduce a helper rtca3_decode_year() to centralize this conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
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


