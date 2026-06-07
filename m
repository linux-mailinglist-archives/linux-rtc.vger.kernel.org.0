Return-Path: <linux-rtc+bounces-6634-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dCR5EU0zJWoCEgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6634-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 07 Jun 2026 11:01:01 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E82DB64F310
	for <lists+linux-rtc@lfdr.de>; Sun, 07 Jun 2026 11:01:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yoseli.org header.s=gm1 header.b=Py6KEpw1;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6634-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6634-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=yoseli.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 598743008D67
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jun 2026 09:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31FB37C10A;
	Sun,  7 Jun 2026 09:00:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F4530DEA6;
	Sun,  7 Jun 2026 09:00:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780822859; cv=none; b=AwMP8iuH/BIX7CUhlWL5XZbPG0tDIZFunvklf2pzuKG180NuENRs+LwPb0U8YJ6daqH5RH5oyWpw9+JpCXtSnIeFfqMZnfPBtcUv2ywArKKEomajBefC9bp2+bIzeM5cSjT/GneO4TOCpWxD5go9XHmY7fgjLlVEy6nDpNgI4es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780822859; c=relaxed/simple;
	bh=TmwNvRU5JGmuk7QhxlzVsKnPW8fkOD3xhGVhBTM2hrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nb/NECpGm09org92g/sP/oOEdnj12ilaov2U851X8OkaNyX1U9/UNyuT1yTEBer9GR95RGXXBqKiyTl7P7LZQ7KWAfNjNbL14DMn96weejoG2xv4tfEjWRfGaM/YaolNp1Xsdn60AUV9Az5JAnuspV5QN0vD88IHZs0Pini2T9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=Py6KEpw1; arc=none smtp.client-ip=217.70.183.198
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91C023EBBE;
	Sun,  7 Jun 2026 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1780822851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2StCb0XxuWRTxii1OsJ7SwSKkwi3VYbBfMK9IvuOBs8=;
	b=Py6KEpw1sr7fhj9+TFBrezQiR1bHGkZqG9iJqhf4Ujrb3MLtBGklmGC0g3EWXX3/RWytmI
	M+BC1BqlJmob7u0Wqp9pAoQMm3DBvsxBbz7pDIp0gcvknqjn8zpDsHkprlpk8jQGw0tfMB
	FtgYJjN2dPpTG9LCv6T52OqsIiZxRSn9yDdljOEd5fp2QH3h5D8ZJZZKd8f+pmzF+sX58Q
	0GL0UWV48y+JroBtcORKyyPeVrmvXLzOjZwhT6/i98KghxPB8TM5S4Vv+hWcm6pv2viPuw
	lpUcQNpPJMxNgo4tMm6U+UJhCPcfMdmrSu4SvuQC1DAJWmf9cAL+6VNUJEKLrw==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Sun, 07 Jun 2026 11:00:41 +0200
Subject: [PATCH v2 2/2] m68k: coldfire/m5441x: register the on-chip RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-jmh-upstream-coldfire-rtc-v2-2-948d2b1ed146@yoseli.org>
References: <20260607-jmh-upstream-coldfire-rtc-v2-0-948d2b1ed146@yoseli.org>
In-Reply-To: <20260607-jmh-upstream-coldfire-rtc-v2-0-948d2b1ed146@yoseli.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780822848; l=1672;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=TmwNvRU5JGmuk7QhxlzVsKnPW8fkOD3xhGVhBTM2hrQ=;
 b=DqiwmRxpR+FMhcKWs4RA21CK2tyx/AVIIAqqNp1YyOECD49zYFgUxSShAjjSagjt1i4bSSEsE
 vPzQXtUrqZ7CUUlB38XPis999PryeDM2s+1AaUJiPfMR4Jxk8BZ02dQ
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTF1TTRBcwaWifjVSrwe9mcCWHfParg3qaEeBR+S59vOXOng4ykswcR4GwrhLLfGiMz3fuxk/8ZJVH7BoZ090lEXP1rZYHIQsNh2iH53gOAMR7nN/ZK8NvJQ2fdg/XHZhCfIJaQ9H3/XEt6U8gYIyTA2JhCKJrKlN5Iq0c8MXkvILXkALUOFATJU3RX9d9TV9x6Ekh+GMGC/pOdkeFvpjnTud3nS434KrBAGpTsARqQQmu2B9vtNzHoqtsRqtRZXweBDSxklhtGurxtBhSwxL0cWiCuUNtueGREaCW/QpvswEoSvpIa87pDhkwpYuN2UO4TY8k7OZO44vBB50TTD3Zl+l53wHiawdIA18LzWiY0I1Xv8c1CodbRbSzCbX/+TVJ9Jcev6XV9ZnA6ft2eirRME2Ql4O9HuaYpsVkfyeme5LzyFi+Msrd76Up1F6pkOwbAjiUj2rVdtrBaV9GWt9/Ab/SPa9NkRnFuaJfmmVGfu3kRQqxbGeenQd3VNx4+9UNAwziO0DPfgA6qp4ZvoNJopW7Ohxlp2bFhd1HiYvFsGDjkpzQ+C6s4rcGYIcvEQwJEyG8Yzh2d1CC+31OcODqis1vHtPxgIk+vJmIvnxhKaLrSuw9+q5NRFFY131pCIzlX9I6AW8ICxZ61z2dntIf7WLUv4zLIfywBgjF3aTSuvpg
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yoseli.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[yoseli.org:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6634-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:jeanmichel.hautbois@yoseli.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[yoseli.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jeanmichel.hautbois@yoseli.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeanmichel.hautbois@yoseli.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E82DB64F310

Register the MCF5441x on-chip RTC platform device from the SoC code so
every MCF5441x board gets the rtc-m5441x driver (time/calendar plus the
battery-backed standby RAM via nvmem) without a per-board file.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 arch/m68k/coldfire/m5441x.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 7a25cfc7ac07..b79aebdfd567 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -10,6 +10,7 @@
 #include <linux/param.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
@@ -239,6 +240,34 @@ static void __init m5441x_fec_init(void)
 	__raw_writeb(0x03, MCFGPIO_PAR_FEC);
 }
 
+/*
+ * On-chip "robust" RTC. Exposes the time/calendar and the 2KB
+ * battery-backed standby RAM (rtc-m5441x driver).
+ */
+static struct resource m5441x_rtc_resource[] = {
+	{
+		.start	= MCFRTC_BASE,
+		.end	= MCFRTC_BASE + MCFRTC_SIZE - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	{
+		.start	= MCF_IRQ_RTC,
+		.end	= MCF_IRQ_RTC,
+		.flags	= IORESOURCE_IRQ,
+	},
+};
+
+static int __init m5441x_rtc_init(void)
+{
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_simple("rtc-m5441x", -1,
+					       m5441x_rtc_resource,
+					       ARRAY_SIZE(m5441x_rtc_resource));
+	return PTR_ERR_OR_ZERO(pdev);
+}
+arch_initcall(m5441x_rtc_init);
+
 void __init config_BSP(char *commandp, int size)
 {
 	m5441x_clk_init();

-- 
2.39.5


