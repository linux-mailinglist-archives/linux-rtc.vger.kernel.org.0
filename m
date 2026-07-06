Return-Path: <linux-rtc+bounces-6933-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ag/KCWgATGrEeQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6933-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 21:22:16 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8229D714E58
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 21:22:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bD56281P;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6933-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6933-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10A5835214AB
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 17:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481A0414A23;
	Mon,  6 Jul 2026 17:51:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31036436BE6
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 17:51:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360319; cv=none; b=uvWz7BzKaGBjKbNTwMM9xTf4PFPTMcvNb5n/gI95iMWIfvZcOehhk6qX7jPrTb/GqNbLWPO5tSAzOaGfoldsHfuEr6nyYokF2GVbC6y9RFE18D3iDedVK3BmveNkNNmjCAb0ISK2KJOX2N6fzH9CquRjZcWJyAhsKMKd13VdltI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360319; c=relaxed/simple;
	bh=7SQfvoAKpxxcRH2D3b0YwhqWQ+wCJTbaacxzePFv7Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sO3cSPebAfXQWgHAM90m4EkU84kMbX2tyjoq5wXSqTOkpi2pILH3vVQB0VfPDYKMtGH0HZq1eUBQ08kinuoA/wpDAxgQjqIM+SeG53Bj1FygV067cMGqgahjQD8EekQkBJhVP+5y8xsPpQ7jMqoJIja/QsYfNiZubH5AfHPnEgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bD56281P; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so24203265e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 10:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360314; x=1783965114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u2G4/GxAoX4gvsvblL6lG8z4Mian34nOC2cqXqU6mo=;
        b=bD56281Pi+yTK3YeMkXD6JXXQ4FyTQZPPv1hPdR87IKsixFkvH+uDNVVBYBstPc1p9
         pPRMr/BaMwp9v4GHH9uGghLqE/2zUDQa4Egr+qlXJXRofZTYNFvKif+rKkfIVshFvk+b
         piVn92Z/f+Z9qdQIQ/gN5gXF6R1UN+iTQzufcfLaROx376Cbop7hpC9B2gXHIR5ZnKKu
         LbeM7i4GfTboskHpouIvPo/iSi5a5EmoquSPX7wu4mbqAs93eJVdLCv8l+4NWXpJZPIN
         0hZWiil9nUTJB9vkARjIQ27GL3cU68Lp8w5NBTCi+1aAFSwb7KhncmdmQue4zQCUNXCX
         lnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360314; x=1783965114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u2G4/GxAoX4gvsvblL6lG8z4Mian34nOC2cqXqU6mo=;
        b=UPCqOnJQfLoodFqhnJCu8dROtLwk0zJB4sPz/v38pwqfHk+Q74jG2Qj1o42VvO5So/
         JtXqjXoNZP9khhuFILe+e+6E+rKmS0hAjLEMjj4X1PoNtUb80gQJ1wesjnjXEmu15921
         aJqqia/7z5/76PHCOdK5FhXbuarEbRTIaUiRWldAw31ItCZ6oUp7PzTwiDjjLtqokMth
         Y3GM0NUUSDnS6yx+kW1/9SJ3mGj4DJNcFxPpnTdzG1mwMlEuy7jpROR2sTQEE1kKuc60
         XyAe3N8vGAssb4fhop+XACtCGxUePzUvmagq3Y4VhyeNEm/Q9FHQDcZBvKRbNXMOLS4P
         Gvqw==
X-Gm-Message-State: AOJu0Yx6eVX8hgRAQcG8YuXHcK1+w7A1SyVAQ9f9hb8euzlSS/+dK4Qk
	hPx3NuwxcBPFGizm25HkUHz6CzwxXQG/JMe2eVHCYEDbGk8g3SLsztYj
X-Gm-Gg: AfdE7clF7vvsjb1saZNq4++XlvWkLz/oB1n3g38COTeHqsg29WyM1hZPGcB/2p1AhKm
	Or1LX9N2ywJNEIgnOhMY9EggnX6+riF1cnYlKc2Zuw8a2O7T38FosrRB3SclDPWVxjrAdgwj+KB
	jyGk0A8JcFvaLgQLbOsBRtPMoscXQ1BTWOgreXw8Ho8ggktK4orEnQGzQM2UHlcxF4mpkRy1T8y
	ntdqHf++644BAn9r2EiOaMGZVz05gR89ipPMYbXj2c2vWAEgKyptCGiLy6LMF3YJAZQjSJAF+mU
	2+aE9+r9C8ta26F6Qw6GWsEkvQ/UHNh/GBTd4+YUm9SA9Mze3oACAv2duJ0U1MbnaJJrIkyn+0g
	Dc0DsTUPszPz1Eygu6n4IP9FPibMqfk8hSRPxyMa8a+N0+pKVYYZ8J8WUftWiq5YHPd+GJaJH3L
	0Cn8u/AOl/aqm7cht6aJWf1xW3Jd5936kNlknT7ldZW3pL57b9vwZVkx1B1CcnKKHQ+3ooMktPG
	XUD4UU6Eb0VjmIJW84b4My5t+2nrHGqYyfd8w==
X-Received: by 2002:a05:600c:818f:b0:493:b750:bd20 with SMTP id 5b1f17b1804b1-493df041d26mr19156285e9.15.1783360314524;
        Mon, 06 Jul 2026 10:51:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 08/12] rtc: rzn1: Dynamically calculate synchronization delay based on clock rate
Date: Mon,  6 Jul 2026 18:51:34 +0100
Message-ID: <20260706175138.12587-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6933-lists,linux-rtc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8229D714E58

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the hardcoded hardware synchronization delays with a calculated
time window derived from the operating sub-clock frequency.

The driver currently hardcodes microsecond ranges assuming a fixed
sub-clock frequency of 32.768 kHz. Newer SoC variants, such as the
RZ/T2H, drive this hardware block using a much faster clock rate
(~195.3 kHz). Hardcoding these wait windows forces faster blocks to
over-sleep, introducing unnecessary delays during clock initialization
and register configuration.

Calculate the duration of the required clock cycles in microseconds based
on the runtime clock rate, and store this value in the driver private
structure to adjust the usleep_range() and readl_poll_timeout() boundaries
dynamically.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No changes.

v1->v2:
- Initialized rate variable to 32768 to avoid timeout_us of 0.
---
 drivers/rtc/rtc-rzn1.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 1e6d26a122b8..763d9a98fd62 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -70,6 +70,7 @@ struct rzn1_rtc {
 	 */
 	spinlock_t ctl1_access_lock;
 	struct rtc_time tm_alarm;
+	unsigned long sync_time;
 };
 
 static void rzn1_rtc_get_time_snapshot(struct rzn1_rtc *rtc, struct rtc_time *tm)
@@ -120,8 +121,8 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 		/* Hold the counter if it was counting up */
 		writel(RZN1_RTC_CTL2_WAIT, rtc->base + RZN1_RTC_CTL2);
 
-		/* Wait for the counter to stop: two 32k clock cycles */
-		usleep_range(61, 100);
+		/* Wait for the counter to stop: two RTC_PCLK clock cycles */
+		usleep_range(rtc->sync_time, rtc->sync_time + 100);
 		ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
 					 val & RZN1_RTC_CTL2_WST, 0, 100);
 		if (ret)
@@ -391,10 +392,10 @@ static void rzn1_rtc_disable_hardware(void *data)
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
+	unsigned long rate = 32768;
 	struct rzn1_rtc *rtc;
 	u32 val, scmp_val = 0;
 	struct clk *xtal;
-	unsigned long rate;
 	int irq, ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -444,12 +445,20 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
 	}
 
+	/*
+	 * The internal clock counter operates in synchronization with the
+	 * RTC_PCLK clock. Calculate the duration of two RTC_PCLK clock
+	 * cycles in microseconds required for operations to complete.
+	 */
+	rtc->sync_time = DIV_ROUND_UP(2 * USEC_PER_SEC, rate);
+
 	/* Disable controller during SUBU/SCMP setup */
 	val = readl(rtc->base + RZN1_RTC_CTL0) & ~RZN1_RTC_CTL0_CE;
 	writel(val, rtc->base + RZN1_RTC_CTL0);
-	/* Wait 2-4 32k clock cycles for the disabled controller */
+	/* Wait 2-4 RTC_PCLK clock cycles for the disabled controller to stop */
 	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
-				 !(val & RZN1_RTC_CTL0_CEST), 62, 123);
+				 !(val & RZN1_RTC_CTL0_CEST), rtc->sync_time,
+				 rtc->sync_time * 2);
 	if (ret)
 		return ret;
 
-- 
2.54.0


