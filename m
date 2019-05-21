Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4A0251FC
	for <lists+linux-rtc@lfdr.de>; Tue, 21 May 2019 16:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfEUO2Y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 21 May 2019 10:28:24 -0400
Received: from mail2.skidata.com ([91.230.2.91]:32656 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfEUO2X (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 21 May 2019 10:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1558448925; x=1589984925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gmuxsnciP4ikxSGrIDDOAU8akrXQ+WKVKFGI92grjC0=;
  b=lmNeMG5BJec8cuGqjvEhh43m7FJDLaQycTnCuzQNZEozucZH9rqH3C9Q
   YaPbE3EQUsQmzLsn7uXOFwdwW88JTd9iMEreH/XpJGJMSFDPzMU2A5m2X
   ESATS/z0cUg6ho7GFat/T7HgkdIrgL1X+MYJlW3fSOjlrDXjtsOiw0YLv
   B6+PJk6DHZb3vv5isg9q3zTttTSo6W5PwQkOn2T7Z+Ms+bZvSgazdRFCw
   XUA4tphr+fd0zKheusY1M2Y8TpOFNA0udU32jknvJy1RGzl8g17KnpDP/
   uBE3AItxpt34i4IQ19RiwvRipW1JbXwZBUUvsG0ehyJmETB4YdCYHKkHt
   Q==;
IronPort-SDR: dlpAMJo2w4oIkzEWRJ48KuiCJFkAh2wPh6GRTDGkZv1Dg78PDofcp0AmYfkDOoJCcdd8recmLW
 q/S+Km/mslE2aSPA+AWPhBWUIstG0aqA6w8TOB/xA0Lb5WvEm56G70wWWVMWQzXE97ipCOOjxi
 uR8c568rk9bcJ3LQdUFAztLUar05EbkFDkTVLJM5IQAeDuD4kLGlmsgfD70w8ZUL+hbR52PeC5
 ksGGPaY4UYizX/gyn2EqyajWxmJORTR9lIzw4wdTZz2EzeyMSC+Szx5yJXrmlCzXqbJ6Fz4IoT
 qQg=
X-IronPort-AV: E=Sophos;i="5.60,495,1549926000"; 
   d="scan'208";a="2150345"
From:   Richard Leitner <richard.leitner@skidata.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 3/3] rtc: s35390a: introduce struct device in probe
Date:   Tue, 21 May 2019 16:20:24 +0200
Message-ID: <20190521142024.25894-4-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521142024.25894-1-richard.leitner@skidata.com>
References: <20190521142024.25894-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

To simplify access and shorten code introduce a struct device pointer in
the s35390a probe function.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/rtc/rtc-s35390a.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 462407570750..5cc2d194645b 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -436,14 +436,14 @@ static int s35390a_probe(struct i2c_client *client,
 	unsigned int i;
 	struct s35390a *s35390a;
 	char buf, status1;
+	struct device *dev = &client->dev;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		err = -ENODEV;
 		goto exit;
 	}
 
-	s35390a = devm_kzalloc(&client->dev, sizeof(struct s35390a),
-				GFP_KERNEL);
+	s35390a = devm_kzalloc(dev, sizeof(struct s35390a), GFP_KERNEL);
 	if (!s35390a) {
 		err = -ENOMEM;
 		goto exit;
@@ -457,8 +457,8 @@ static int s35390a_probe(struct i2c_client *client,
 		s35390a->client[i] = i2c_new_dummy(client->adapter,
 					client->addr + i);
 		if (!s35390a->client[i]) {
-			dev_err(&client->dev, "Address %02x unavailable\n",
-						client->addr + i);
+			dev_err(dev, "Address %02x unavailable\n",
+				client->addr + i);
 			err = -EBUSY;
 			goto exit_dummy;
 		}
@@ -467,7 +467,7 @@ static int s35390a_probe(struct i2c_client *client,
 	err_read = s35390a_read_status(s35390a, &status1);
 	if (err_read < 0) {
 		err = err_read;
-		dev_err(&client->dev, "error resetting chip\n");
+		dev_err(dev, "error resetting chip\n");
 		goto exit_dummy;
 	}
 
@@ -481,22 +481,21 @@ static int s35390a_probe(struct i2c_client *client,
 		buf = 0;
 		err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &buf, 1);
 		if (err < 0) {
-			dev_err(&client->dev, "error disabling alarm");
+			dev_err(dev, "error disabling alarm");
 			goto exit_dummy;
 		}
 	} else {
 		err = s35390a_disable_test_mode(s35390a);
 		if (err < 0) {
-			dev_err(&client->dev, "error disabling test mode\n");
+			dev_err(dev, "error disabling test mode\n");
 			goto exit_dummy;
 		}
 	}
 
-	device_set_wakeup_capable(&client->dev, 1);
+	device_set_wakeup_capable(dev, 1);
 
-	s35390a->rtc = devm_rtc_device_register(&client->dev,
-					s35390a_driver.driver.name,
-					&s35390a_rtc_ops, THIS_MODULE);
+	s35390a->rtc = devm_rtc_device_register(dev, s35390a_driver.driver.name,
+						&s35390a_rtc_ops, THIS_MODULE);
 
 	if (IS_ERR(s35390a->rtc)) {
 		err = PTR_ERR(s35390a->rtc);
-- 
2.20.1

