Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32ACB509B94
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Apr 2022 11:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387218AbiDUJDh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Apr 2022 05:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387202AbiDUJD2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Apr 2022 05:03:28 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA65D1FCFE;
        Thu, 21 Apr 2022 02:00:25 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CADB960018;
        Thu, 21 Apr 2022 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1650531624;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aUsdGZfRO+5bLYaoUtrNLisEBZwE4ffYBoGLqWmNaUg=;
        b=gfCxgv6jtxDMHLIqDZqPcCGBnAE9+uEX9KnzH8R1IEKBRYxckin74SEipkjDBlNrNd4Wso
        N3ZErOP/KSE2kaeQ0bK4zu4c7lFbgGZflhBwUJ63CFadlhxag2JeplB/BnLhIaX43xsMf4
        XXCQJ/7spSLGAy3o/L1mz13LnR61w2yXnzH2V+WXehF0oR/QzMYICDJbSmLSO0XAifWRBe
        Zn33hx3hEwUdgVaUlMYxUygWTPcWj+ivqQ+CrEzuHFm2M5h3v70J+WJTS1SV5qqEJU6nGB
        aeVqT1XY0FrAEjW+rfPF2ydeplrvFRmGMVvYFrzl8yRy95Bh1KwUqqZ1llXbpw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v2 2/7] soc: renesas: rzn1-sysc: Fix the RTC hclock description
Date:   Thu, 21 Apr 2022 11:00:11 +0200
Message-Id: <20220421090016.79517-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421090016.79517-1-miquel.raynal@bootlin.com>
References: <20220421090016.79517-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

It needs to be un-gated, but also a reset must be released and an idle
flag should also be disabled.

The driver already supports all these operations, so update the
description of the RTC hclock to fit these requirements.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1df56d7ab3e1..5bd125552b56 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -260,7 +260,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 	D_MODULE(HCLK_QSPI0, "hclk_qspi0", CLK_REF_SYNC_D4, 0x2a0, 0x2a1, 0x2a2, 0x2a3, 0x300, 0x301, 0x302),
 	D_MODULE(HCLK_QSPI1, "hclk_qspi1", CLK_REF_SYNC_D4, 0x480, 0x481, 0x482, 0x483, 0x4c0, 0x4c1, 0x4c2),
 	D_MODULE(HCLK_ROM, "hclk_rom", CLK_REF_SYNC_D4, 0xaa0, 0xaa1, 0xaa2, 0, 0xb80, 0, 0),
-	D_MODULE(HCLK_RTC, "hclk_rtc", CLK_REF_SYNC_D8, 0xa00, 0, 0, 0, 0, 0, 0),
+	D_MODULE(HCLK_RTC, "hclk_rtc", CLK_REF_SYNC_D8, 0xa00, 0xa03, 0, 0xa02, 0, 0, 0),
 	D_MODULE(HCLK_SDIO0, "hclk_sdio0", CLK_REF_SYNC_D4, 0x60, 0x61, 0x62, 0x63, 0x80, 0x81, 0x82),
 	D_MODULE(HCLK_SDIO1, "hclk_sdio1", CLK_REF_SYNC_D4, 0x640, 0x641, 0x642, 0x643, 0x660, 0x661, 0x662),
 	D_MODULE(HCLK_SEMAP, "hclk_semap", CLK_REF_SYNC_D4, 0x7a3, 0x7a4, 0x7a5, 0, 0xb21, 0, 0),
-- 
2.27.0

