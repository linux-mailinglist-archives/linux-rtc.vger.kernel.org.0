Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B5A4F4885
	for <lists+linux-rtc@lfdr.de>; Wed,  6 Apr 2022 02:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbiDEVlS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Apr 2022 17:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573380AbiDES7w (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Apr 2022 14:59:52 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C1DCD33C
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 11:57:53 -0700 (PDT)
Received: from relay12.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::232])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 9407DCB34D
        for <linux-rtc@vger.kernel.org>; Tue,  5 Apr 2022 18:47:38 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 850E1200004;
        Tue,  5 Apr 2022 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649184450;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HU1wc5MsgG96qTLzOLNsJmhZ3anFEAxSiwSuwGVQASk=;
        b=oGRU0W1seWtDq+NuHL5v458Z8ppx4eB/GvwGMk94NwbLYPLTa+oQV3iXVRI1CtwSKT2s32
        XMm89XB/msM2DghJkfJYN1ge8GgQB6YdO8smFdVqya8rd0Yp0tiLgz9Pvn+HlF058B3zF2
        mVinZFnos1y3nMQwEvxgvhZBIb8nm3LQM0mAmGcs/5kPeEDZXNSJwJttqYB504XM3Eu6M3
        Nn+4EW4t3BsWnFXH4F3K5Ui+k2KesIBNJcYImUSPKLgtkQ0w6A+U50asPIsctoSoxhpkkQ
        mHWw/VsB1hImdExNqjjXhb06KMyMSy/RwIWzsxzbxOwndxo34mr6AosZoNORCw==
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
Subject: [PATCH 5/7] rtc: rzn1: Add oscillator offset support
Date:   Tue,  5 Apr 2022 20:47:14 +0200
Message-Id: <20220405184716.1578385-6-miquel.raynal@bootlin.com>
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

The RZN1 RTC can compensate the imprecision of the oscillator up to
approximately 190ppm.

Seconds can last slightly shorter or longer depending on the
configuration.

Below ~65ppm of correction, we can change the time spent in a second
every minute, which is the most accurate compensation that the RTC can
offer. Above, the compensation will be active every 20s.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/rtc/rtc-rzn1.c | 73 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 85c5a68944a0..64eb1ff20a24 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -246,12 +246,85 @@ static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return 0;
 }
 
+static int rzn1_rtc_read_offset(struct device *dev, long *offset)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	unsigned int ppb_per_step;
+	bool subtract;
+	u32 val;
+
+	val = readl(rtc->base + RZN1_RTC_SUBU);
+	ppb_per_step = val & RZN1_RTC_SUBU_DEV ? 1017 : 3051;
+	subtract = val & RZN1_RTC_SUBU_DECR;
+	val &= 0x3F;
+
+	if (!val)
+		*offset = 0;
+	else if (subtract)
+		*offset = -(((~val) & 0x3F) + 1) * ppb_per_step;
+	else
+		*offset = (val - 1) * ppb_per_step;
+
+	return 0;
+}
+
+static int rzn1_rtc_set_offset(struct device *dev, long offset)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	unsigned int steps, ppb_per_step;
+	int stepsh, stepsl;
+	u32 val;
+	int ret;
+
+	/*
+	 * Check which resolution mode (every 20 or 60s) can be used.
+	 * Between 2 and 124 clock pulses can be added or substracted.
+	 *
+	 * In 20s mode, the minimum resolution is 2 / (32768 * 20) which is
+	 * close to 3051 ppb. In 60s mode, the resolution is closer to 1017.
+	 */
+	stepsh = DIV_ROUND_CLOSEST(offset, 1017);
+	stepsl = DIV_ROUND_CLOSEST(offset, 3051);
+
+	if (stepsh >= -0x3E && stepsh <= 0x3E) {
+		ppb_per_step = 1017;
+		steps = stepsh;
+		val |= RZN1_RTC_SUBU_DEV;
+	} else if (stepsl >= -0x3E && stepsl <= 0x3E) {
+		ppb_per_step = 3051;
+		steps = stepsl;
+	} else {
+		return -ERANGE;
+	}
+
+	if (!steps)
+		return 0;
+
+	if (steps > 0) {
+		val |= steps + 1;
+	} else {
+		val |= RZN1_RTC_SUBU_DECR;
+		val |= (~(-steps - 1)) & 0x3F;
+	}
+
+	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
+				 !(val & RZN1_RTC_CTL2_WUST), 100, 2000000);
+	if (ret)
+		return ret;
+
+	writel(val, rtc->base + RZN1_RTC_SUBU);
+
+	return 0;
+}
+
 static const struct rtc_class_ops rzn1_rtc_ops = {
 	.read_time = rzn1_rtc_read_time,
 	.set_time = rzn1_rtc_set_time,
 	.read_alarm = rzn1_rtc_read_alarm,
 	.set_alarm = rzn1_rtc_set_alarm,
 	.alarm_irq_enable = rzn1_rtc_alarm_irq_enable,
+	.read_offset = rzn1_rtc_read_offset,
+	.set_offset = rzn1_rtc_set_offset,
 };
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
-- 
2.27.0

