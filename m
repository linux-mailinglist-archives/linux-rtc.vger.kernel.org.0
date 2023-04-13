Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8891C6E0DD1
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Apr 2023 14:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjDMMzK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 13 Apr 2023 08:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjDMMzJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 13 Apr 2023 08:55:09 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5787410F4
        for <linux-rtc@vger.kernel.org>; Thu, 13 Apr 2023 05:55:07 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id mwThpE7lOPm6CmwTipKOhq; Thu, 13 Apr 2023 14:55:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1681390506; bh=AmyPAwyE23hxI5N/DdjI4JGRQk1Q/Omh5fjDH33sHKw=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Bmht6jUuIyHRCgqp0+GaVqsbPruZPNZnmWbrGDzi/eDLcEMovntlMbbZ0LFfkG0GH
         gkNviCTJ5U8Elnl50KbqHoVe5GlviK3+vPD6RCfDZBqMHRNqQlbWT3uwNWpnz98rCo
         kIy80lMabKDnkL2rkFS+hk4XpRHJdkwrFSV33pqJIjyRNFGaZPu+tJFlEuzaxDnhGZ
         pVGqYnXUhkPwNKEs/qXaxwO4IlJfKVYnXADh8hOyhxZDuLddt2M3K8TZ1r5iycOwVN
         Qg+8jD/z+riIvLswBfbfW+NC0akbC7eHLD05rbbUamZPW/nAU2vY6hkvV6YCMGLRZr
         ryvTqxge745OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1681390506; bh=AmyPAwyE23hxI5N/DdjI4JGRQk1Q/Omh5fjDH33sHKw=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=Bmht6jUuIyHRCgqp0+GaVqsbPruZPNZnmWbrGDzi/eDLcEMovntlMbbZ0LFfkG0GH
         gkNviCTJ5U8Elnl50KbqHoVe5GlviK3+vPD6RCfDZBqMHRNqQlbWT3uwNWpnz98rCo
         kIy80lMabKDnkL2rkFS+hk4XpRHJdkwrFSV33pqJIjyRNFGaZPu+tJFlEuzaxDnhGZ
         pVGqYnXUhkPwNKEs/qXaxwO4IlJfKVYnXADh8hOyhxZDuLddt2M3K8TZ1r5iycOwVN
         Qg+8jD/z+riIvLswBfbfW+NC0akbC7eHLD05rbbUamZPW/nAU2vY6hkvV6YCMGLRZr
         ryvTqxge745OA==
Date:   Thu, 13 Apr 2023 14:55:05 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     linux-rtc@vger.kernel.org
Cc:     linux-omap@vger.kernel.org
Subject: [PATCH] rtc: rtc-twl: add NVRAM support
Message-ID: <ZDf7qZTiml0ijD2g@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4wfI02poVSKl5s+9k6CotBW9U9SplIG5BhPhCUcEdA05XI5JYlWbUCvUfpp140spCKWyARbMFYf4JYyaf8l+gtF546AQUKBGc8Pjn6THaEGn6dV/EBPHcr
 up5wPUrvIgCCTmtaqXPjy9hlMoGRHo7eZuLHYTEBM3LxZbGjQo6IJxmIh0p0VBdhIyCzGHWQCYUYVy9n7AEr/pTSXyAzhzwNqRQ=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Ladislav Michl <ladis@linux-mips.org>
Date: Sat, 28 May 2022 19:36:13 +0200

Export SRAM using nvmem.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 drivers/rtc/rtc-twl.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/rtc/rtc-twl.c b/drivers/rtc/rtc-twl.c
index c24d1e18f56c..31877522b379 100644
--- a/drivers/rtc/rtc-twl.c
+++ b/drivers/rtc/rtc-twl.c
@@ -487,11 +487,24 @@ static const struct rtc_class_ops twl_rtc_ops = {
 	.alarm_irq_enable = twl_rtc_alarm_irq_enable,
 };
 
+static int twl_nvram_read(void *priv, unsigned int offset, void *val,
+			  size_t bytes)
+{
+	return twl_i2c_read((long)priv, val, offset, bytes);
+}
+
+static int twl_nvram_write(void *priv, unsigned int offset, void *val,
+			   size_t bytes)
+{
+	return twl_i2c_write((long)priv, val, offset, bytes);
+}
+
 /*----------------------------------------------------------------------*/
 
 static int twl_rtc_probe(struct platform_device *pdev)
 {
 	struct twl_rtc *twl_rtc;
+	struct nvmem_config nvmem_cfg;
 	struct device_node *np = pdev->dev.of_node;
 	int ret = -EINVAL;
 	int irq = platform_get_irq(pdev, 0);
@@ -579,6 +592,30 @@ static int twl_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	memset(&nvmem_cfg, 0, sizeof(nvmem_cfg));
+	nvmem_cfg.name = "twl-secured-";
+	nvmem_cfg.type = NVMEM_TYPE_BATTERY_BACKED;
+	nvmem_cfg.reg_read = twl_nvram_read,
+	nvmem_cfg.reg_write = twl_nvram_write,
+	nvmem_cfg.word_size = 1;
+	nvmem_cfg.stride = 1;
+	if (twl_class_is_4030()) {
+		/* 20 bytes SECURED_REG area */
+		nvmem_cfg.size = 20;
+		nvmem_cfg.priv = (void *)TWL_MODULE_SECURED_REG;
+		devm_rtc_nvmem_register(twl_rtc->rtc, &nvmem_cfg);
+		/* 8 bytes BACKUP area */
+		nvmem_cfg.name = "twl-backup-";
+		nvmem_cfg.size = 8;
+		nvmem_cfg.priv = (void *)TWL4030_MODULE_BACKUP;
+		devm_rtc_nvmem_register(twl_rtc->rtc, &nvmem_cfg);
+	} else {
+		/* 8 bytes SECURED_REG area */
+		nvmem_cfg.size = 8;
+		nvmem_cfg.priv = (void *)TWL_MODULE_SECURED_REG;
+		devm_rtc_nvmem_register(twl_rtc->rtc, &nvmem_cfg);
+	}
+
 	return 0;
 }
 
-- 
2.32.0

