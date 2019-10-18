Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73AC6DD2D6
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2019 00:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387696AbfJRWIV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Oct 2019 18:08:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387671AbfJRWIT (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 18 Oct 2019 18:08:19 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B4AB205F4;
        Fri, 18 Oct 2019 22:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571436499;
        bh=Z4Vr1KaooQILrkTf+O1jZFGQD7EZq+zGisiVEVxIL2I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ml7D9Tkhmi+TTFYxHgGvzoyS3P2l3J+Sx+0QQ2LjPW3DGldWxPqQ7iJpmlusqwWqp
         0vVfBaW/bi4ecnb9I8/S3Iu7Lc9pTvTpUuZqPPbXnvtqiI2Oti56GmtG763eFzxsFL
         f9TA4OC/mBDZVsmqEhX8VpjRY5TVXyPyzImT8DKU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sasha Levin <sashal@kernel.org>, linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 12/56] rtc: pcf8523: set xtal load capacitance from DT
Date:   Fri, 18 Oct 2019 18:07:09 -0400
Message-Id: <20191018220753.10002-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018220753.10002-1-sashal@kernel.org>
References: <20191018220753.10002-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Sam Ravnborg <sam@ravnborg.org>

[ Upstream commit 189927e719e36ceefbb8037f23d3849e47833aef ]

Add support for specifying the xtal load capacitance in the DT node.
The pcf8523 supports xtal load capacitance of 7pF or 12.5pF.
If the rtc has the wrong configuration the time will
drift several hours/week.

The driver use the default value 12.5pF.

The DT may specify either 7000fF or 12500fF.
(The DT uses femto Farad to avoid decimal numbers).
Other values are warned and the driver uses the default value.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/rtc-pcf8523.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 3c8c6f942e67f..a06792966ea90 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -94,8 +94,9 @@ static int pcf8523_voltage_low(struct i2c_client *client)
 	return !!(value & REG_CONTROL3_BLF);
 }
 
-static int pcf8523_select_capacitance(struct i2c_client *client, bool high)
+static int pcf8523_load_capacitance(struct i2c_client *client)
 {
+	u32 load;
 	u8 value;
 	int err;
 
@@ -103,14 +104,24 @@ static int pcf8523_select_capacitance(struct i2c_client *client, bool high)
 	if (err < 0)
 		return err;
 
-	if (!high)
-		value &= ~REG_CONTROL1_CAP_SEL;
-	else
+	load = 12500;
+	of_property_read_u32(client->dev.of_node, "quartz-load-femtofarads",
+			     &load);
+
+	switch (load) {
+	default:
+		dev_warn(&client->dev, "Unknown quartz-load-femtofarads value: %d. Assuming 12500",
+			 load);
+		/* fall through */
+	case 12500:
 		value |= REG_CONTROL1_CAP_SEL;
+		break;
+	case 7000:
+		value &= ~REG_CONTROL1_CAP_SEL;
+		break;
+	}
 
 	err = pcf8523_write(client, REG_CONTROL1, value);
-	if (err < 0)
-		return err;
 
 	return err;
 }
@@ -307,9 +318,10 @@ static int pcf8523_probe(struct i2c_client *client,
 	if (!pcf)
 		return -ENOMEM;
 
-	err = pcf8523_select_capacitance(client, true);
+	err = pcf8523_load_capacitance(client);
 	if (err < 0)
-		return err;
+		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
+			 err);
 
 	err = pcf8523_set_pm(client, 0);
 	if (err < 0)
-- 
2.20.1

