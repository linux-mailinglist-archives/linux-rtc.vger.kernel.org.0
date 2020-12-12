Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EA22D845D
	for <lists+linux-rtc@lfdr.de>; Sat, 12 Dec 2020 05:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436485AbgLLEN3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 23:13:29 -0500
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:42130 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438117AbgLLENF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Dec 2020 23:13:05 -0500
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 72AE320CD0
        for <linux-rtc@vger.kernel.org>; Sat, 12 Dec 2020 04:12:24 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 9F26A260EB;
        Sat, 12 Dec 2020 04:11:14 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id A0E363F201;
        Sat, 12 Dec 2020 04:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id E7EAA2A5BB;
        Sat, 12 Dec 2020 05:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1607746181;
        bh=Ejlr4Vm/N68eETmbOxG/1yGC/FJ3CF8ukBOHzwwwHeg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=igSK+3ji+/2GxwURmInGkGLqmM0JLhwIF0NRu/RvXtecFioj6v1qgyOMY7O+IOo/0
         DaahuoHa17vLw3afqLd0a7D1pw5U7z28KmdeAu5uYaS9D2tRRzsdX37OuJgIxtkREU
         vDeBrEcaxWPhKC5XDMc3ayaxMVbOYpcsu8zMi+IQ=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hbEjwtp11xE1; Sat, 12 Dec 2020 05:09:40 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Sat, 12 Dec 2020 05:09:40 +0100 (CET)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id DC69742F46;
        Sat, 12 Dec 2020 04:09:39 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="ASvGa6UJ";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.161.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0EE2C42F46;
        Sat, 12 Dec 2020 04:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1607746170; bh=Ejlr4Vm/N68eETmbOxG/1yGC/FJ3CF8ukBOHzwwwHeg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ASvGa6UJ92ZDg1fWTkAd8xbPBtRo0Qox3JKP9Y1Q0pqdZy00CeXJfaU+ZBJmuyHgw
         4UyGG6fWWnt2faihHYNjEyx8etmZgLefUitpkzVlgIFkYI6PQ4U5Z0sz7Ml0WA6KoU
         aEOearHalD+r7VhDOB/6JSDNu7S1s86DSjPe3a0U=
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [RFC PATCH 07/12] rtc: sun6i: add compatible string for V831/V833 RTC
Date:   Sat, 12 Dec 2020 12:09:15 +0800
Message-Id: <20201212040920.3641480-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201212040157.3639864-1-icenowy@aosc.io>
References: <20201212040157.3639864-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [6.40 / 20.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[59.41.161.2:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all];
         DMARC_NA(0.00)[aosc.io];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_SEVEN(0.00)[11];
         MID_CONTAINS_FROM(1.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: DC69742F46
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

These chips share the same die, and the RTC block is similar to H6
one, but with functionality of dividing 24M clock to get 32k (useful for
32k clock output).

Add compatible string for it. The special clock divider is TODO.

Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/rtc/rtc-sun6i.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index e2b8b150bcb4..c9a1f2319f92 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -378,6 +378,23 @@ static void __init sun50i_h6_rtc_clk_init(struct device_node *node)
 CLK_OF_DECLARE_DRIVER(sun50i_h6_rtc_clk, "allwinner,sun50i-h6-rtc",
 		      sun50i_h6_rtc_clk_init);
 
+static const struct sun6i_rtc_clk_data sun8i_v831_rtc_data = {
+	.rc_osc_rate = 16000000,
+	.fixed_prescaler = 32,
+	.has_prescaler = 1,
+	.has_out_clk = 1,
+	.export_iosc = 1,
+	.has_losc_en = 1,
+	.has_auto_swt = 1,
+};
+
+static void __init sun8i_v831_rtc_clk_init(struct device_node *node)
+{
+	sun6i_rtc_clk_init(node, &sun8i_v831_rtc_data);
+}
+CLK_OF_DECLARE_DRIVER(sun8i_v831_rtc_clk, "allwinner,sun8i-v831-rtc",
+		      sun8i_v831_rtc_clk_init);
+
 /*
  * The R40 user manual is self-conflicting on whether the prescaler is
  * fixed or configurable. The clock diagram shows it as fixed, but there
@@ -745,6 +762,7 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 	{ .compatible = "allwinner,sun8i-h3-rtc" },
 	{ .compatible = "allwinner,sun8i-r40-rtc" },
 	{ .compatible = "allwinner,sun8i-v3-rtc" },
+	{ .compatible = "allwinner,sun8i-v831-rtc" },
 	{ .compatible = "allwinner,sun50i-h5-rtc" },
 	{ .compatible = "allwinner,sun50i-h6-rtc" },
 	{ /* sentinel */ },
-- 
2.28.0
