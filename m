Return-Path: <linux-rtc+bounces-5031-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90031BA315D
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Sep 2025 11:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5021BC2BAD
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Sep 2025 09:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADD9288C2F;
	Fri, 26 Sep 2025 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="Dn2pQUM3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2182773FA
	for <linux-rtc@vger.kernel.org>; Fri, 26 Sep 2025 09:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878032; cv=none; b=VdLauWS7HiTs6wnc2UeYpc2JoSWOkqxfxoGIR0jA6yJ10h7G2UkIuM4D6OUCEQf8Sn2sMWtyQaT3tx9WZ8sNe6OITkp5E2Jgu8BEpwV/FnQqzcRJbE+CGKI2SLgggYyjlHVvd8fJziTWfvNXkl09xz+8oHgd2aR8nWt8xtGAjE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878032; c=relaxed/simple;
	bh=S7JgcSwdHpRzzvI7aKcqbxp1YD07m/GRY6L4F5gZFok=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E6d9gpM/feTlnvC4A74mEaOGhqioru2ufnUtYhFG3fTVPzeU5yInkIIn1o5FVciQT+aOFSZs9phhAbgWf+uPNKBlATlOtVkSmxZxsivUQ7vuXS+uK5kPG6ntwTnERHafUcsN8Th7gZ+KtafayUZEyO4LEsnNy+t7PGUfeDCVIFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=Dn2pQUM3; arc=none smtp.client-ip=62.149.158.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from polimar.homenet.telecomitalia.it ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id 24TPvsM0ploie24TPvAPUK; Fri, 26 Sep 2025 11:10:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1758877839; bh=S7JgcSwdHpRzzvI7aKcqbxp1YD07m/GRY6L4F5gZFok=;
	h=From:To:Subject:Date:MIME-Version;
	b=Dn2pQUM3QpWmPZGRjcnsVG6ZBg0lpKuJDajF6FY96VMai8O1xbKPA4mx0HYyQtoON
	 L/wapqYGT746eURROdEUmtQAG2+pGeFNWtKZABm4RAm3sX6E0XZNxoAWzjGl8ILxoX
	 gQZjpxTB3rYTRE2lR56BYYGXT7d5Q+baNoJ6+H0s//u7x4JxmSuTR1V0gU14zHptcV
	 jiIskj3dhCPBwWg0WhhpD+0iAYbSNp9Muih9UFgAnoJowyPFUaERrltSHICGc0pzWl
	 H0agEb4YV47mS2OpXTsVQjXO72/ABw641MJVVuNWlPD8Y7R9O3Q+pByfpGlQQBQoHF
	 v5Z2zFt+PyzMg==
From: Rodolfo Giometti <giometti@enneenne.com>
To: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Rodolfo Giometti <giometti@enneenne.com>
Subject: [PATCH] drivers rtc-pcf8523.c: add "clockout-disable" property
Date: Fri, 26 Sep 2025 11:10:38 +0200
Message-Id: <20250926091038.2262571-1-giometti@enneenne.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIEuJ+x7ZsYVtxm0wuNxSzQDfKMg5N5a7LqML/OksRUIgI5z9lW5W0N5/9txtlTXl2+dRI/opvJaezlPW+AHYxHffjxVQe58zZLrzbP5jysg9p5SR6S2
 JGgKSzZyQyc0bUJ7h+t+IEn4xE/m5ekamm6P+suGGtxF9xtesXrIgSYA1QmFA9aBeqqUZ3caBQqLMhQoLfMscnhdwf41j5GOVULwUT1meHklNCDcyurRWEbx
 5biKEKgg1r+qgQYVaH1Z20WoWSWnM6cNSVxtgCMkbceDuz7ffjQV7Uv2RpPzraJ5dqD6ZMIK1Yt3jFnG3fxikmAwePuww4OTgAM0Oi0cTNyOf9CuoiWIw06A
 En9lWYDHrcADWctkWN3AxRpzISbsFs1XfKDz1MGf61YMrZKBYsuZVQvnsSg4eW0V5xM5aBpR

Some systems may require disabling clock generation on the CLKOUT pin
even if there is no IRQ management.

Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
---
 .../devicetree/bindings/rtc/nxp,pcf8523.yaml        |  5 +++++
 drivers/rtc/rtc-pcf8523.c                           | 13 +++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml
index d11c8bc16bc0..d18c396c06cd 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml
@@ -25,6 +25,11 @@ properties:
     enum: [ 7000, 12500 ]
     default: 12500
 
+  clockout-disable:
+    type: boolean
+    description:
+      Disable the clock generation on CLKOUT pin.
+
 required:
   - compatible
   - reg
diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 2c63c0ffd05a..7ecbee4f9c6b 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -418,6 +418,7 @@ static int pcf8523_probe(struct i2c_client *client)
 	struct pcf8523 *pcf8523;
 	struct rtc_device *rtc;
 	bool wakeup_source = false;
+	bool clockout_disable;
 	u32 value;
 	int err;
 
@@ -467,16 +468,20 @@ static int pcf8523_probe(struct i2c_client *client)
 	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->features);
 	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
 
+	clockout_disable = of_property_read_bool(client->dev.of_node,
+							"clockout-disable");
+	if (client->irq > 0 || clockout_disable) {
+		err = regmap_write(pcf8523->regmap,
+						PCF8523_TMR_CLKOUT_CTRL, 0x38);
+		if (err < 0)
+			return err;
+	}
 	if (client->irq > 0) {
 		unsigned long irqflags = IRQF_TRIGGER_LOW;
 
 		if (dev_fwnode(&client->dev))
 			irqflags = 0;
 
-		err = regmap_write(pcf8523->regmap, PCF8523_TMR_CLKOUT_CTRL, 0x38);
-		if (err < 0)
-			return err;
-
 		err = devm_request_threaded_irq(&client->dev, client->irq,
 						NULL, pcf8523_irq,
 						IRQF_SHARED | IRQF_ONESHOT | irqflags,
-- 
2.34.1


