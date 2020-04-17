Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF88B1AE336
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Apr 2020 19:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgDQRIf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Apr 2020 13:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbgDQRIe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Apr 2020 13:08:34 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B469C061A0C;
        Fri, 17 Apr 2020 10:08:34 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k11so3903581wrp.5;
        Fri, 17 Apr 2020 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KvsoRNaIPMpQAi34tFrpdDPuh9TmP9Et+cVWafVFTlM=;
        b=NXoAHHZivibzY4yLgrYyRGMeRigrfaFJn6RcnnC6TiQoW2w8Zh2nPgZcOyN2RV+XqP
         Q6ztj+Trlj1Qlk+Qx8ire2OlXys/jqrOdHPzzTML9oWz7pyz667kMojzdH76bq8P05DZ
         2mxLP6HvQz6Jtn3AaA40ZvVCc0/0SM9NLecxExIsHO8mtHZwwqv0FA2e3lhEh0qOrC1E
         7BN5vByv9s5bpfg05DqbBqPnuJ8VmlFnepygSgREONlycbbE0ILpAmrE5kCdlOjdALyS
         TprgrtlXnpWqrg78lYEq/LLBDSmazQX8iLmoCU6radzCKe8E+JBS02hAm5Qwq3p7ro3E
         0JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KvsoRNaIPMpQAi34tFrpdDPuh9TmP9Et+cVWafVFTlM=;
        b=sF9ch2D8QOVd8mr5k2PX0d0tY9IpBHH7PKbL1yE3r3uXNemrADVYSMpxNRC+9rQZ1a
         UVV0l6l94SG9YTl6pb3gKl0N61ghLhBRgCM7XfoXiV+5anyM6FlppYDVx091IJxmwk0n
         kJSyARFt1yJLC+8lIv2Fj39c+GdkAroPlP/8mCMHO0EVGpVgnxFKu/EM8WEei3s5yc1f
         AImhYehzlgAaaAS6prQhF7W8gnpFaqWaYe/eVs6dKz2qmj3WGT9QjzOA9jrl/5X87Vdm
         ltlmNnq1HU9X5oYkdUBB7kNFlu3zW64RCHALBEuICHVGJBL5GHDOc8v/wK/Wty32d+Vz
         rxDQ==
X-Gm-Message-State: AGi0PuZXkQY0+VKfFLHTTXMyWl4/1Yq19vLi67wbwFgZx6QEzuHFHWrS
        fi8HzZM3m2Dpmuibxln/rR4=
X-Google-Smtp-Source: APiQypKgdT2gpDqOCdnzwUylz3VALkrAqFxBj0ZFndhgeiSg4ua55X8ZE1TIMBymhr+yqIxnbACHGQ==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr4659554wrs.94.1587143313191;
        Fri, 17 Apr 2020 10:08:33 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id a7sm8419517wmj.12.2020.04.17.10.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 10:08:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rtc: max77686: Use single-byte writes on MAX77620
Date:   Fri, 17 Apr 2020 19:08:25 +0200
Message-Id: <20200417170825.2551367-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200417170825.2551367-1-thierry.reding@gmail.com>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The MAX77620 doesn't support bulk writes, so make sure the regmap code
breaks bulk writes into multiple single-byte writes.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/rtc/rtc-max77686.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 35fd74b83626..f53db4d6bead 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -78,6 +78,8 @@ struct max77686_rtc_driver_data {
 	int			alarm_pending_status_reg;
 	/* RTC IRQ CHIP for regmap */
 	const struct regmap_irq_chip *rtc_irq_chip;
+	/* regmap configuration for the chip */
+	const struct regmap_config *regmap_config;
 };
 
 struct max77686_rtc_info {
@@ -182,6 +184,11 @@ static const struct regmap_irq_chip max77686_rtc_irq_chip = {
 	.num_irqs	= ARRAY_SIZE(max77686_rtc_irqs),
 };
 
+static const struct regmap_config max77686_rtc_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
 static const struct max77686_rtc_driver_data max77686_drv_data = {
 	.delay = 16000,
 	.mask  = 0x7f,
@@ -191,6 +198,13 @@ static const struct max77686_rtc_driver_data max77686_drv_data = {
 	.alarm_pending_status_reg = MAX77686_REG_STATUS2,
 	.rtc_i2c_addr = MAX77686_I2C_ADDR_RTC,
 	.rtc_irq_chip = &max77686_rtc_irq_chip,
+	.regmap_config = &max77686_rtc_regmap_config,
+};
+
+static const struct regmap_config max77620_rtc_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.use_single_write = true,
 };
 
 static const struct max77686_rtc_driver_data max77620_drv_data = {
@@ -202,6 +216,7 @@ static const struct max77686_rtc_driver_data max77620_drv_data = {
 	.alarm_pending_status_reg = MAX77686_INVALID_REG,
 	.rtc_i2c_addr = MAX77620_I2C_ADDR_RTC,
 	.rtc_irq_chip = &max77686_rtc_irq_chip,
+	.regmap_config = &max77620_rtc_regmap_config,
 };
 
 static const unsigned int max77802_map[REG_RTC_END] = {
@@ -658,11 +673,6 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
 	return ret;
 }
 
-static const struct regmap_config max77686_rtc_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-};
-
 static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
@@ -698,7 +708,7 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 	}
 
 	info->rtc_regmap = devm_regmap_init_i2c(info->rtc,
-						&max77686_rtc_regmap_config);
+						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap)) {
 		ret = PTR_ERR(info->rtc_regmap);
 		dev_err(info->dev, "Failed to allocate RTC regmap: %d\n", ret);
-- 
2.24.1

