Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 685963BE376
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 09:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhGGHUE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 03:20:04 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51451 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230340AbhGGHUE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 03:20:04 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 4267D5C0148;
        Wed,  7 Jul 2021 03:17:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 07 Jul 2021 03:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=MktD/xXCqcqj8
        q7cUFe+PwgxPjObZLIa/Eh89OVde9Q=; b=sYLNoiuHXpQLaFI3cW0h6VQDKYDCm
        5g+QsxN8MyIjx85AQjUl3nsMQVwKGabRgJqvdIYgiXPTaimRtSxoi11xh8woWlyb
        ciEgZUSc+kaXWewa0iND9WUSv+cpoGtn66RTbRu0Ziodazx6R5w3OKiLXORC9zag
        BqydI15MeJxCsxt0jSCJePaBLEoAnjP+TZxoKuLEets8R4Pwhll8VRdJyO8TMeF0
        K338pc4DvE0t09wUgv+sH8adVYU3C3fbFST2CZqkEUygY3YKw5J75NZi8cDDykw5
        C7T9D7A5vYawSixN4T79S+na6OUalJDPmHkqqhE42OzFPpK3NnX8DK8fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=MktD/xXCqcqj8q7cUFe+PwgxPjObZLIa/Eh89OVde9Q=; b=mGOq4beE
        cJZfyQNqCxJl3LBLjekddmL0guoJHp5xm+0gQ8JPN5TDcVv37B05w1s8UrYpCSHz
        Psm29xnmcfkdFDu2vxj7QwK1lzLaYJnUGiZEroNXxZyMcpm/L5hEhcOm6P49rlP5
        NCK7uaVXcMq0gKernbF3sAv5nvHKgSjSRZ0VBLoNn/7uFpq3KOVgha28tTJBWEVd
        SzLOomCbhGzVnFfl3Hhper2GUCQB5wf2nR5bpZaNcRwqRE+9CyaBVqDoIrX+CJ9d
        HU5uHHo7bIoGIuAKadvCDLECaiaycofieIm649GUaTqt/JBldo4A2l1x2ZeXYIcS
        D9F5aFo7NXzmqw==
X-ME-Sender: <xms:BFXlYIPj-3--K6WZKgJ-5mWLxo_TA4SDB5zlAy9wFxL8SunX6cp4og>
    <xme:BFXlYO-sYWvv67Lz_Nn5TWHZPcplomAlM5Hiua7-aLQ9j_Y-y0qNftiI53MQQ9nRG
    3L1kSkUXcoeX8_D658>
X-ME-Received: <xmr:BFXlYPSzqR8DUx54CfTL3FFis3TYXbIzbRa2tJ49o0XOo_u7Nu1fpJz5hMencTyDl0nafwS0hgxt4ebOLkyX8i6fW21pAukh10Ky9j9QbyqMmDTAdu_2OBRIJd90MEY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrthhhvgif
    ucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtf
    frrghtthgvrhhnpeekleevteelvdduheetgfdvfeelueekffeggeethedtteeljeeivedv
    gfehjeejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruh
X-ME-Proxy: <xmx:BFXlYAtDwrQ2lANj-uyCJlwSPsq7QurEwJ-jtlHzbhzcN_rAziz7PA>
    <xmx:BFXlYAcyWhMKmWXFjL9prQlgxu8r7FM8fLS22FAIfKXiOIXB-MpepQ>
    <xmx:BFXlYE0ztPcErdC_T27vSWkaHogCk2x79DLI_f3GxGxRF8_Z6b9aWw>
    <xmx:BFXlYP4gFIdT6iJ9lfW-toYR097wTbtrR5KovEi39Z2PSiO5obdG3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 03:17:22 -0400 (EDT)
From:   Mathew McBride <matt@traverse.com.au>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Mathew McBride <matt@traverse.com.au>
Subject: [PATCH 1/2] rtc: rx8025: implement RX-8035 support
Date:   Wed,  7 Jul 2021 07:16:15 +0000
Message-Id: <20210707071616.28976-2-matt@traverse.com.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210707071616.28976-1-matt@traverse.com.au>
References: <20210707071616.28976-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RX-8035 is a newer RTC from EPSON that is very
similar to the RX-8025.

The key difference is in the oscillation stop (XSTP)
bit which is inverted on the RX-8035.

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 drivers/rtc/rtc-rx8025.c | 59 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index c914091819ba..1a33ec402f4a 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -60,14 +60,24 @@
 #define RX8025_ADJ_DATA_MAX	62
 #define RX8025_ADJ_DATA_MIN	-62
 
+enum rx_model {
+	model_rx_unknown,
+	model_rx_8025,
+	model_rx_8035,
+	model_last
+};
+
 static const struct i2c_device_id rx8025_id[] = {
-	{ "rx8025", 0 },
+	{ "rx8025", model_rx_8025 },
+	{ "rx8035", model_rx_8035 },
 	{ }
 };
+
 MODULE_DEVICE_TABLE(i2c, rx8025_id);
 
 struct rx8025_data {
 	struct rtc_device *rtc;
+	enum rx_model type;
 	u8 ctrl1;
 };
 
@@ -100,10 +110,26 @@ static s32 rx8025_write_regs(const struct i2c_client *client,
 					      length, values);
 }
 
+static int rx8025_is_osc_stopped(enum rx_model model, int ctrl2)
+{
+	int xstp = ctrl2 & RX8025_BIT_CTRL2_XST;
+	/* XSTP bit has different polarity on RX-8025 vs RX-8035.
+	 * RX-8025: 0 == oscillator stopped
+	 * RX-8035: 1 == oscillator stopped
+	 */
+
+	if (model == model_rx_8025)
+		xstp = !xstp;
+
+	return xstp;
+}
+
 static int rx8025_check_validity(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct rx8025_data *drvdata = dev_get_drvdata(dev);
 	int ctrl2;
+	int xstp;
 
 	ctrl2 = rx8025_read_reg(client, RX8025_REG_CTRL2);
 	if (ctrl2 < 0)
@@ -117,7 +143,8 @@ static int rx8025_check_validity(struct device *dev)
 		return -EINVAL;
 	}
 
-	if (!(ctrl2 & RX8025_BIT_CTRL2_XST)) {
+	xstp = rx8025_is_osc_stopped(drvdata->type, ctrl2);
+	if (xstp) {
 		dev_warn(dev, "crystal stopped, date is invalid\n");
 		return -EINVAL;
 	}
@@ -125,7 +152,7 @@ static int rx8025_check_validity(struct device *dev)
 	return 0;
 }
 
-static int rx8025_reset_validity(struct i2c_client *client)
+static int rx8025_reset_validity(enum rx_model model, struct i2c_client *client)
 {
 	int ctrl2 = rx8025_read_reg(client, RX8025_REG_CTRL2);
 
@@ -134,8 +161,13 @@ static int rx8025_reset_validity(struct i2c_client *client)
 
 	ctrl2 &= ~(RX8025_BIT_CTRL2_PON | RX8025_BIT_CTRL2_VDET);
 
+	if (model == model_rx_8025)
+		ctrl2 |= RX8025_BIT_CTRL2_XST;
+	else
+		ctrl2 &= ~(RX8025_BIT_CTRL2_XST);
+
 	return rx8025_write_reg(client, RX8025_REG_CTRL2,
-				ctrl2 | RX8025_BIT_CTRL2_XST);
+				ctrl2);
 }
 
 static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
@@ -149,7 +181,7 @@ static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
 	if (status < 0)
 		goto out;
 
-	if (!(status & RX8025_BIT_CTRL2_XST))
+	if (rx8025_is_osc_stopped(rx8025->type, status))
 		dev_warn(&client->dev, "Oscillation stop was detected,"
 			 "you may have to readjust the clock\n");
 
@@ -241,7 +273,7 @@ static int rx8025_set_time(struct device *dev, struct rtc_time *dt)
 	if (ret < 0)
 		return ret;
 
-	return rx8025_reset_validity(client);
+	return rx8025_reset_validity(rx8025->type, client);
 }
 
 static int rx8025_init_client(struct i2c_client *client)
@@ -519,6 +551,21 @@ static int rx8025_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, rx8025);
 
+	if (id) {
+		rx8025->type = id->driver_data;
+		switch (rx8025->type) {
+		case model_rx_8025:
+			dev_info(&client->dev, "Type RX-8025");
+		break;
+		case model_rx_8035:
+			dev_info(&client->dev, "Type RX-8035");
+			break;
+		default:
+			dev_warn(&client->dev, "Unknown type: %d\n", rx8025->type);
+		break;
+		}
+	}
+
 	err = rx8025_init_client(client);
 	if (err)
 		return err;
-- 
2.30.1

