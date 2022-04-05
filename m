Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC364F487D
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 02:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344470AbiDEVkx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Apr 2022 17:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573375AbiDES7u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Apr 2022 14:59:50 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03665CD338
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 11:57:49 -0700 (PDT)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id BFEC4C2F7B
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 18:47:30 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CEBCB200006;
        Tue,  5 Apr 2022 18:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649184443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0wCROVhxQkzi01xQZ7CtsJyXoDnqptRHhKKgXAf97I8=;
        b=nZgbol2lDFRyYnzqBtJaMKxRbItRYY9JnbB1a5Y+UcpARzJUkFKNDstOqUNCes3VX8N/2f
        c7Xn9vYwgvePaycby+DlY5IFtH6sCptZ0SL2r6cjsf+IFGpwVY+6ny3X0NqWYDjhQ0UMHG
        /3gywrTtSC/Ye3t1OQkQgIiH19PGwe9Li9hCeI530bBQbxme/WXNAZ6Cfk4AOC6fxf2xdG
        3ntESKddPzvde6rL1rlZG9PL1Xe2zwoYk97tncuZ8A/7I8F4HLVDFSHgfZDtALzvulePyn
        c7/o1sy3kD7K9I7oLpiPdMQssy5xBY0/gFkks6b5dHF6tDMESJ4PVJRzwqJwgQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/7] soc: renesas: rzn1-sysc: Export a function to enable/disable the RTC
Date:   Tue,  5 Apr 2022 20:47:11 +0200
Message-Id: <20220405184716.1578385-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
References: <20220405184716.1578385-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There are two RTC registers located within the system controller.

Like with the dmamux register, let's add a new helper to enable/disable
the power, reset and clock of the RTC.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c        | 49 +++++++++++++++++++
 include/linux/soc/renesas/r9a06g032-sysctrl.h |  2 +
 2 files changed, 51 insertions(+)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1df56d7ab3e1..7e61db39a43b 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -26,6 +26,13 @@
 #include <dt-bindings/clock/r9a06g032-sysctrl.h>
 
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
+#define R9A06G032_SYSCTRL_PWRCTRL_RTC 0x140
+#define   R9A06G032_SYSCTRL_PWRCTRL_RTC_CLKEN BIT(0)
+#define   R9A06G032_SYSCTRL_PWRCTRL_RTC_RST BIT(1)
+#define   R9A06G032_SYSCTRL_PWRCTRL_RTC_IDLE_REQ BIT(2)
+#define   R9A06G032_SYSCTRL_PWRCTRL_RTC_RSTN_FW BIT(3)
+#define R9A06G032_SYSCTRL_PWRSTAT_RTC 0x144
+#define   R9A06G032_SYSCTRL_PWRSTAT_RTC_IDLE BIT(1)
 
 struct r9a06g032_gate {
 	u16 gate, reset, ready, midle,
@@ -343,6 +350,48 @@ int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val)
 }
 EXPORT_SYMBOL_GPL(r9a06g032_sysctrl_set_dmamux);
 
+/* Exported helper to enable/disable the RTC */
+int r9a06g032_sysctrl_enable_rtc(bool enable)
+{
+	unsigned long flags;
+	u32 val;
+
+	if (!sysctrl_priv)
+		return -EPROBE_DEFER;
+
+	spin_lock_irqsave(&sysctrl_priv->lock, flags);
+
+	if (enable) {
+		val = readl(sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val &= ~R9A06G032_SYSCTRL_PWRCTRL_RTC_RST;
+		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val |= R9A06G032_SYSCTRL_PWRCTRL_RTC_CLKEN;
+		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val |= R9A06G032_SYSCTRL_PWRCTRL_RTC_RSTN_FW;
+		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val &= ~R9A06G032_SYSCTRL_PWRCTRL_RTC_IDLE_REQ;
+		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val = readl(sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRSTAT_RTC);
+		if (val & R9A06G032_SYSCTRL_PWRSTAT_RTC_IDLE)
+			return -EIO;
+	} else {
+		val = readl(sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val |= R9A06G032_SYSCTRL_PWRCTRL_RTC_IDLE_REQ;
+		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val &= ~R9A06G032_SYSCTRL_PWRCTRL_RTC_RSTN_FW;
+		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val &= ~R9A06G032_SYSCTRL_PWRCTRL_RTC_CLKEN;
+		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+		val |= R9A06G032_SYSCTRL_PWRCTRL_RTC_RST;
+		writel(val, sysctrl_priv->reg + R9A06G032_SYSCTRL_PWRCTRL_RTC);
+	}
+
+	spin_unlock_irqrestore(&sysctrl_priv->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(r9a06g032_sysctrl_enable_rtc);
+
 /* register/bit pairs are encoded as an uint16_t */
 static void
 clk_rdesc_set(struct r9a06g032_priv *clocks,
diff --git a/include/linux/soc/renesas/r9a06g032-sysctrl.h b/include/linux/soc/renesas/r9a06g032-sysctrl.h
index 066dfb15cbdd..914c8789149c 100644
--- a/include/linux/soc/renesas/r9a06g032-sysctrl.h
+++ b/include/linux/soc/renesas/r9a06g032-sysctrl.h
@@ -4,8 +4,10 @@
 
 #ifdef CONFIG_CLK_R9A06G032
 int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val);
+int r9a06g032_sysctrl_enable_rtc(bool enable);
 #else
 static inline int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val) { return -ENODEV; }
+static inline int r9a06g032_sysctrl_enable_rtc(bool enable) { return -ENODEV; }
 #endif
 
 #endif /* __LINUX_SOC_RENESAS_R9A06G032_SYSCTRL_H__ */
-- 
2.27.0

