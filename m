Return-Path: <linux-rtc+bounces-483-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F578266F5
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jan 2024 01:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06456281B1C
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jan 2024 00:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1591A625;
	Mon,  8 Jan 2024 00:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NoV7PuyY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DE8AD2C;
	Mon,  8 Jan 2024 00:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB7FAE0002;
	Mon,  8 Jan 2024 00:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704674648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o0aHdR8lER2O5mtTdzH0rhyo8wdieG48QTmFj+EH8TI=;
	b=NoV7PuyY1ZWCGXGTFb7LIAc87qnIk6w8DeUo+xZJ473zjTcKpXQql7u7VbkY/CDnD0+yhS
	T5vAfLYRlS4JfO/Dqd0VPHWtAfqfOJoPV4M576nNAvnTN89SiTMCzE6uDSXlhhwnQvxx3s
	3AESPnfw3VUIHdcLXLghnHagZEGTWoCJqUrZvMSvHAiqgDjsEg8EpHPeGsgMDB5S1I5tJX
	bu4ccziAKEVI/BQ2rGt86sYuLMHx1c+1wtanljJDmLu5wycLhP5ADgEjpPwhgQsfAAXfqj
	IahK2TfPTnmV9jSyyizRqSBiwZfpdIVPmWLMnXHuAhQpBPlXJn1Cits1XWFIZg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rtc: rv8803: add wakeup-source support
Date: Mon,  8 Jan 2024 01:43:57 +0100
Message-ID: <20240108004357.602918-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The RV8803 can be wired directly to a PMIC that can wake up an SoC without
the CPU getting interrupts.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml | 2 ++
 drivers/rtc/rtc-rv8803.c                                | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index 1df7c45d95c1..b770149c5fd6 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -29,6 +29,8 @@ properties:
 
   trickle-diode-disable: true
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 11e6b0d31f5d..1327251e527c 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -712,9 +712,12 @@ static int rv8803_probe(struct i2c_client *client)
 			if (err)
 				dev_err(&client->dev, "failed to set wake IRQ\n");
 		}
+	} else {
+		if (device_property_read_bool(&client->dev, "wakeup-source"))
+			device_init_wakeup(&client->dev, true);
+		else
+			clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
 	}
-	if (!client->irq)
-		clear_bit(RTC_FEATURE_ALARM, rv8803->rtc->features);
 
 	if (of_property_read_bool(client->dev.of_node, "epson,vdet-disable"))
 		rv8803->backup |= RX8900_FLAG_VDETOFF;
-- 
2.43.0


