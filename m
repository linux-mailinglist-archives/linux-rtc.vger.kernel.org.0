Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A242D4411DB
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Nov 2021 02:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhKABm5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 31 Oct 2021 21:42:57 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:34680 "EHLO
        gw2.atmark-techno.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhKABm4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 31 Oct 2021 21:42:56 -0400
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
        by gw2.atmark-techno.com (Postfix) with ESMTP id D13BA20D5A
        for <linux-rtc@vger.kernel.org>; Mon,  1 Nov 2021 10:34:35 +0900 (JST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
        by gw2.atmark-techno.com (Postfix) with ESMTPS id 4FD9220D1A
        for <linux-rtc@vger.kernel.org>; Mon,  1 Nov 2021 10:34:34 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id jx2-20020a17090b46c200b001a62e9db321so5349450pjb.7
        for <linux-rtc@vger.kernel.org>; Sun, 31 Oct 2021 18:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ca7wg6azCq3ny4hWbrL7FZo7O/uh31XvAyJngwZlrgA=;
        b=3Ydan9zJJkEAks9q/q5+HxQYmrWY4DNi/p9zrfXiF1JkzFdW9bsybc0hOjhRXsuP/p
         eYHDKr/JgWWqFkJozof3WO4s7kEL5/qkBb25uCuFFwaSGBByqC4CLRsEucEdNgCqEJNA
         Ix1rdHAV1DCL/YdWJluNN/MD2qKCuYWKX048yJwv8KexJL6+2MWa+gAX7BoO8sewvQGu
         GEN1F0CiNtCSjwIOCCtbSNO5Ulf+uGMhgZTswrXkusxf/Z+4iyXsy5c1RJFhXR2vdMgl
         UDyVPK77y6x7RjeoGxP7uLUc1xPH1ReC4lrCzxrK+Z5M0rbmLelEUn5zmyK1Nq1ERJgt
         d1fA==
X-Gm-Message-State: AOAM533Di491GsYDAOh4PJ2RDq9YTTnTkjIcXw4HRLEEhlIWYHrKr6Mm
        /Xug0J11pq1j+5RgnsDfFoUSsfLflVdQRRH4TJLaFL1/srn8zKkx7hIhTre2DD591xCadsSv9m4
        8PZwvUrB2DWK2CvE8phFVlQ==
X-Received: by 2002:a65:5b01:: with SMTP id y1mr2801183pgq.451.1635730473398;
        Sun, 31 Oct 2021 18:34:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAr8Wl5STLCJtM9Gz8JdkYbOBmkcp5/N5mU58hqMgWrR+/H4n45yWCEgqe4Qq4nPx99PB2PQ==
X-Received: by 2002:a65:5b01:: with SMTP id y1mr2801164pgq.451.1635730473161;
        Sun, 31 Oct 2021 18:34:33 -0700 (PDT)
Received: from pc-0115 (76.125.194.35.bc.googleusercontent.com. [35.194.125.76])
        by smtp.gmail.com with ESMTPSA id np17sm17262733pjb.7.2021.10.31.18.34.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Oct 2021 18:34:32 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94.2)
        (envelope-from <martinet@pc-0115>)
        id 1mhMDX-001Mmf-Nu; Mon, 01 Nov 2021 10:34:31 +0900
From:   Dominique Martinet <dominique.martinet@atmark-techno.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [PATCH 2/2] rv8803: add irq-gpio optional dts attribute
Date:   Mon,  1 Nov 2021 10:34:00 +0900
Message-Id: <20211101013400.325855-2-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211101013400.325855-1-dominique.martinet@atmark-techno.com>
References: <20211101013400.325855-1-dominique.martinet@atmark-techno.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some device cannot be woken up from i2c signal.
Add a new irq-gpio attribute for devices which have a gpio connected to
the rv8803 INT line so the rtc can be used for suspend to mem

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---

Our board does not have an upstream dts so I cannot provide a real
example for it, but I've tested this on something close to the
imx8mp-evk.

It should not break anything for people having no alarm at all or using
the i2c irq.

 .../devicetree/bindings/rtc/epson,rx8900.yaml |  5 ++
 drivers/rtc/rtc-rv8803.c                      | 73 +++++++++++++++++--
 2 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index 29fe39bb08ad..0d7912b984c7 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -28,6 +28,10 @@ properties:
 
   trickle-diode-disable: true
 
+  irq-gpio:
+    description: |
+      gpio for INT signal. Set up gpio for irq and device wakeup.
+
 required:
   - compatible
   - reg
@@ -45,5 +49,6 @@ examples:
             reg = <0x32>;
             epson,vdet-disable;
             trickle-diode-disable;
+            irq-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
         };
     };
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 0d5ed38bf60c..1c4b96bc110e 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/rtc.h>
+#include <linux/pm_wakeirq.h>
 
 #define RV8803_I2C_TRY_COUNT		4
 
@@ -509,6 +510,61 @@ static int rx8900_trickle_charger_init(struct rv8803_data *rv8803)
 					 flags);
 }
 
+static int rv8803_setup_gpio_irq(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	int err;
+	int irq;
+	unsigned long irqflags;
+	struct gpio_desc *gpiod;
+
+
+	gpiod = devm_gpiod_get_from_of_node(dev, dev->of_node, "irq-gpio",
+					    0, GPIOD_IN, "RTC irq pin");
+	if (!gpiod || IS_ERR(gpiod)) {
+		dev_dbg(dev, "no gpio for rtc: skipping\n");
+		return -ENOENT;
+	}
+
+	irq = gpiod_to_irq(gpiod);
+	if (irq < 0) {
+		dev_err(dev, "gpio found but no irq\n");
+		err = irq;
+		goto error_gpio;
+	}
+
+	irqflags = IRQF_ONESHOT;
+	irqflags |= gpiod_is_active_low(gpiod) ?
+		    IRQF_TRIGGER_FALLING : IRQF_TRIGGER_RISING;
+
+	err = devm_request_threaded_irq(dev, irq, NULL, rv8803_handle_irq,
+					irqflags, "rtc-rv8803-gpio", client);
+	if (err) {
+		dev_warn(dev, "unable to request IRQ\n");
+		goto error_gpio;
+	}
+
+	err = device_init_wakeup(dev, true);
+	if (err) {
+		dev_warn(dev, "unable to set as wakeup source\n");
+		goto error_irq;
+	}
+
+	err = dev_pm_set_wake_irq(dev, irq);
+	if (err) {
+		dev_warn(dev, "unable to set wake irq\n");
+		goto error_irq;
+	}
+
+	return 0;
+
+error_irq:
+	devm_free_irq(dev, irq, client);
+error_gpio:
+	devm_gpiod_put(dev, gpiod);
+	return err;
+}
+
 static int rv8803_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -524,6 +580,7 @@ static int rv8803_probe(struct i2c_client *client,
 		.reg_write = rv8803_nvram_write,
 		.priv = client,
 	};
+	bool irq_setup = false;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
 				     I2C_FUNC_SMBUS_I2C_BLOCK)) {
@@ -562,17 +619,23 @@ static int rv8803_probe(struct i2c_client *client,
 	if (IS_ERR(rv8803->rtc))
 		return PTR_ERR(rv8803->rtc);
 
-	if (client->irq > 0) {
+	if (client->dev.of_node) {
+		err = rv8803_setup_gpio_irq(client);
+		if (!err)
+			irq_setup = true;
+	}
+
+	if (!irq_setup && client->irq > 0) {
 		err = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL, rv8803_handle_irq,
 						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
 						"rv8803", client);
-		if (err) {
+		if (err)
 			dev_warn(&client->dev, "unable to request IRQ, alarms disabled\n");
-			client->irq = 0;
-		}
+		else
+			irq_setup = true;
 	}
-	if (!client->irq)
+	if (!irq_setup)
 		clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
 
 	err = rv8803_write_reg(rv8803->client, RV8803_EXT, RV8803_EXT_WADA);
-- 
2.30.2

