Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87A57AED48
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2019 16:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbfIJOkQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Sep 2019 10:40:16 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42599 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbfIJOkP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Sep 2019 10:40:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id q14so20775945wrm.9
        for <linux-rtc@vger.kernel.org>; Tue, 10 Sep 2019 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqxD7ov2Kumh7FsbKIaAwtDQZtl0cBFUR7VvvrKEYIM=;
        b=PlwLNLVOUgCbdysqM/uqhc5TLxDP80EbYI0iuhRqk0ViBnBXT3ks0U5CWlxEPwJrtJ
         RbN6C52JGK5IhbOYtPA2IhYRJMAbKh02pduAbUoys2N6PPIYaYawLNrQaidizV68ZjHd
         ygS2cDF6eA+rPHWVD8GuTYIhcCuuoWEQA/dKYjB6t7LuG2vNlxK7F9G+Z9kEepKSRNn/
         IDMqiPPI1RRONBVQfPhK+JcxL5CQk09GfXTy7Dhm6c7Fod/x4l3h5yGIrNmaHoais0Ep
         y8cUUh6Ee/jRm4/mEHYYwPisBImfkMfaq8+HCHv4sY5BMnL2qU4WBTF2WQjnDMH1D/xX
         GgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tqxD7ov2Kumh7FsbKIaAwtDQZtl0cBFUR7VvvrKEYIM=;
        b=HLknOAJbhyyuftzYNArFkPwSHrx6jWjF9Wp8rcyBVLTaZmeRHF0efSQBs1qhLv3SRG
         86+7b6daih61mLxAWKg8fo+sP/6C8OWjkq5FMBqIG+PvoPH1M5JmTKrzy3POJcXOIx44
         4tIkhAM3fE+pq8104/RiviIi5pah6Hr39aCrdTJFwW9j0y9IMZzvKTgVtajzkAgFlGQh
         roGu+WbR3ItB+qtNB5TjQPBCkMZB+a/3/bkxR6sY8g2EJjNy5XgK33UV2EX4Xo/ZLavQ
         Qkjc7yAq/nAE8Wbj/LNz+V4sdC7vbd1ecbRfs09Ci7hK8S+9UGEctXCy+pRriop+bwHd
         eP1Q==
X-Gm-Message-State: APjAAAXzjTDgIIIlXEahukfz7RSJpPug4YxV7b98h/Sekj3GnaHKn/9I
        KmlrB4UtCJKNB6z9m7y0zL7bQcXMqpk=
X-Google-Smtp-Source: APXvYqzsB7tMiN4itYyUFAxd2rplsT9C9eLeBL3Ld/+lzUFDI2O24EsLCfF9PDVsxuHxG2l1rsmhhA==
X-Received: by 2002:adf:bb8e:: with SMTP id q14mr4067920wrg.74.1568126412425;
        Tue, 10 Sep 2019 07:40:12 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id k9sm34057068wrd.7.2019.09.10.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 07:40:11 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        u.kleine-koenig@pengutronix.de, bth@kamstrup.com,
        Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH] rtc: pcf2127: default power management mode
Date:   Tue, 10 Sep 2019 16:39:45 +0200
Message-Id: <20190910143945.9364-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This improves the rtc driver robustness by ensuring that the
chip power management functions are operating in default mode.

As out-of-tree drivers could have changed mode thus resulting in
subtle differences that isn't immediately revealed on upgraded
System-on-Modules (SoM). This happens since chip configuration is
unchanged during reboot and power-cycle of the SoM.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 02b069caffd5..694ec8eefea5 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -37,6 +37,9 @@
 #define PCF2127_BIT_CTRL3_BLF			BIT(2)
 #define PCF2127_BIT_CTRL3_BF			BIT(3)
 #define PCF2127_BIT_CTRL3_BTSE			BIT(4)
+#define PCF2127_BIT_CTRL3_PWRMNG0		BIT(5)
+#define PCF2127_BIT_CTRL3_PWRMNG1		BIT(6)
+#define PCF2127_BIT_CTRL3_PWRMNG2		BIT(7)
 /* Time and date registers */
 #define PCF2127_REG_SC			0x03
 #define PCF2127_BIT_SC_OSF			BIT(7)
@@ -484,10 +487,22 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	/*
 	 * Disable battery low/switch-over timestamp and interrupts.
 	 * Clear battery interrupt flags which can block new trigger events.
+	 * Power management configuration:
+	 * - Battery switch-over function is operating in standard mode.
+	 *   Hardware has to ensure VDD drops slower than 0.7 V/ms otherwise
+	 *   oscillator stop can occur. Since switch-over threshold is typical
+	 *   2.5 V and sampled every 1 ms with a power management operating
+	 *   limit of 1.8 V. See NXP AN11186 for more info.
+	 * - Battery low detection function is enabled.
+	 * - Extra power fail detection function is enabled.
+	 *
 	 * Note: This is the default chip behaviour but added to ensure
 	 * correct tamper timestamp and interrupt function.
 	 */
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 PCF2127_BIT_CTRL3_PWRMNG2 |
+				 PCF2127_BIT_CTRL3_PWRMNG1 |
+				 PCF2127_BIT_CTRL3_PWRMNG0 |
 				 PCF2127_BIT_CTRL3_BTSE |
 				 PCF2127_BIT_CTRL3_BF |
 				 PCF2127_BIT_CTRL3_BIE |
-- 
2.21.0

