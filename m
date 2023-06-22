Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E093C73A3FA
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jun 2023 16:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbjFVO6w (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Jun 2023 10:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232128AbjFVO63 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Jun 2023 10:58:29 -0400
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A401B1FE0;
        Thu, 22 Jun 2023 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
        ; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BGhVxQ4kyRqNucBoiEMvM4/s26xgGee59+8lJt1ayqM=; b=opFXvbw49LihcHZNn9+2NElnTX
        Hn98lQqhfiSuCXGKxXcVxBl2wJavGpPWWehuhryewtEBceCvsASa3XeJi7mj0uBxgq+mLwdzsXJ4f
        GgbuCkz8bbzQAsr43a/Dgdv0UrN6xTJ2nAggc/nIP3XxV/50iK8lrQMOIh/D7gHEJqS4=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:55382 helo=localhost.localdomain)
        by mail.hugovil.com with esmtpa (Exim 4.92)
        (envelope-from <hugo@hugovil.com>)
        id 1qCLlL-0002fr-Fv; Thu, 22 Jun 2023 10:58:20 -0400
From:   Hugo Villeneuve <hugo@hugovil.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, hugo@hugovil.com,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Thu, 22 Jun 2023 10:57:55 -0400
Message-Id: <20230622145800.2442116-13-hugo@hugovil.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230622145800.2442116-1-hugo@hugovil.com>
References: <20230622145800.2442116-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
Subject: [PATCH v4 12/17] rtc: pcf2127: add support for PCF2131 interrupts on output INT_A
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

The PCF2127 and PCF2129 have one output interrupt pin. The PCF2131 has
two, named INT_A and INT_B. The hardware support that any interrupt
source can be routed to either one or both of them.

Force all interrupt sources to go to the INT A pin.

Support to route any interrupt source to INT A/B pins is not supported
by this driver at the moment.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 09607b67c282..2eef65232417 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -179,6 +179,7 @@ struct pcf21xx_config {
 	int max_register;
 	unsigned int has_nvmem:1;
 	unsigned int has_bit_wd_ctl_cd0:1;
+	unsigned int has_int_a_b:1; /* PCF2131 supports two interrupt outputs. */
 	u8 reg_time_base; /* Time/date base register. */
 	u8 regs_alarm_base; /* Alarm function base registers. */
 	u8 reg_wd_ctl; /* Watchdog control register. */
@@ -845,6 +846,7 @@ static struct pcf21xx_config pcf21xx_cfg[] = {
 		.max_register = 0x1d,
 		.has_nvmem = 1,
 		.has_bit_wd_ctl_cd0 = 1,
+		.has_int_a_b = 0,
 		.reg_time_base = PCF2127_REG_TIME_BASE,
 		.regs_alarm_base = PCF2127_REG_ALARM_BASE,
 		.reg_wd_ctl = PCF2127_REG_WD_CTL,
@@ -869,6 +871,7 @@ static struct pcf21xx_config pcf21xx_cfg[] = {
 		.max_register = 0x19,
 		.has_nvmem = 0,
 		.has_bit_wd_ctl_cd0 = 0,
+		.has_int_a_b = 0,
 		.reg_time_base = PCF2127_REG_TIME_BASE,
 		.regs_alarm_base = PCF2127_REG_ALARM_BASE,
 		.reg_wd_ctl = PCF2127_REG_WD_CTL,
@@ -893,6 +896,7 @@ static struct pcf21xx_config pcf21xx_cfg[] = {
 		.max_register = 0x36,
 		.has_nvmem = 0,
 		.has_bit_wd_ctl_cd0 = 0,
+		.has_int_a_b = 1,
 		.reg_time_base = PCF2131_REG_TIME_BASE,
 		.regs_alarm_base = PCF2131_REG_ALARM_BASE,
 		.reg_wd_ctl = PCF2131_REG_WD_CTL,
@@ -989,6 +993,28 @@ static int pcf2127_enable_ts(struct device *dev, int ts_id)
 	return ret;
 }
 
+/* Route all interrupt sources to INT A pin. */
+static int pcf2127_configure_interrupt_pins(struct device *dev)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	int ret;
+
+	/* Mask bits need to be cleared to enable corresponding
+	 * interrupt source.
+	 */
+	ret = regmap_write(pcf2127->regmap,
+			   PCF2131_REG_INT_A_MASK1, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(pcf2127->regmap,
+			   PCF2131_REG_INT_A_MASK2, 0);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			 int alarm_irq, const char *name, const struct pcf21xx_config *config)
 {
@@ -1047,6 +1073,15 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		set_bit(RTC_FEATURE_ALARM, pcf2127->rtc->features);
 	}
 
+	if (pcf2127->cfg->has_int_a_b) {
+		/* Configure int A/B pins, independently of alarm_irq. */
+		ret = pcf2127_configure_interrupt_pins(dev);
+		if (ret) {
+			dev_err(dev, "failed to configure interrupt pins\n");
+			return ret;
+		}
+	}
+
 	if (pcf2127->cfg->has_nvmem) {
 		struct nvmem_config nvmem_cfg = {
 			.priv = pcf2127,
-- 
2.30.2

