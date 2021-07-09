Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51B13C1E96
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jul 2021 06:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhGIEsU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 00:48:20 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56789 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229576AbhGIEsT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 00:48:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 16BAE320089C;
        Fri,  9 Jul 2021 00:45:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 09 Jul 2021 00:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=eK0WV/zEHFtuR
        FWHm0jzOm68Jx13N9BURcSUN1+ytBY=; b=eq1X736/Jpuowq4gl+4cDFHj9lK5r
        jk8T1TzdMHIoqV1zb9yFFA01XdS387s8+W7/YbcfruH9Wb4LFEctDSre6u/Q90LS
        hXOYkmaIHXncTDAVPQRC5BFpmCdiZxYErgCsxNA6sTd33feDJCxi8hYnB6nSqNWD
        mSr2ZSTBw3bbSwfuMiQdO4PN64k9cojChzUoFaY+RQXOCBmSLMSSr/gbKzHPX19u
        0EtdzzXMP47rauHCH43WzteRkQEhBax1288zlsAmg1T1+HIDoByhXAv80CIKgJKN
        HB44/EQ+muuMCGcahcz9op5rr3xFeA1XgOB4DEFthmif8PaDpAzNaBkrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=eK0WV/zEHFtuRFWHm0jzOm68Jx13N9BURcSUN1+ytBY=; b=b2lfUqaC
        KPizEX7O4VMo61y7nL5mh6IsRWCl5u1q8FNsNDkOxMX8k7BwUIhlLmadP9kIkqhl
        7oPrsMt9WD19WsEr6+6VrgaHzpaPS7XtaXHpvpUq2njecfMurQuuDZn/AVFXXmm+
        44kjc53c7FwUfFzp9CHm7qXWFeWzNX+VB91ws7YS/qAjsJyg1h5cmmY/Ttpv5z0b
        vKSJKBMg/iaMPtE8pds/x0sjV5Obj4QnkBBYt6wC1wBFQlj03zQj1nxcyHQ1MmqO
        0txefcp++T2IfdqemJJ0NzOa4Nk7mYdLj5HXSbeXSlg6P1iZq7LNzWNwRQR0QX6h
        lIcC/ttZpymcTg==
X-ME-Sender: <xms:b9TnYP6cvzkbiTCAsqG3ASMLG2CGplhm1KGIY8y2FFPwaCKYwX-45A>
    <xme:b9TnYE4owAMu-n9RgCYwPVs_wtmqL_3VnA3Iixos3Y3l1_3skv1rb32FTKp2cwq73
    qWFti2UUcgxjzIzciQ>
X-ME-Received: <xmr:b9TnYGeVTwDObGppO0oYiiuBiicElj_bPSolsWjORt-wGG47xyV1LMCytUhuG3JkA8XC2sKq1BSS_VC_NA4A5PDDkX4877z65gaMsvj9VcdN1ug3Q6AValf3853a30o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrthhhvgif
    ucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghuqeenucggtf
    frrghtthgvrhhnpeekleevteelvdduheetgfdvfeelueekffeggeethedtteeljeeivedv
    gfehjeejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruh
X-ME-Proxy: <xmx:b9TnYAKT9PP655roMmfF1EOPEo05Wz8cnDXS054fYgAvpMktUcUWtw>
    <xmx:b9TnYDIoUhlMgrbbXYX7XU3XetrlzP7rZX8fuxG3jizXsr4Py52IhA>
    <xmx:b9TnYJylFoO_oA9Ta0K3bR3zcKFgNLqldclWWxkvntwpyJge9ov0zw>
    <xmx:b9TnYAG4KccIdSQU7KRI4b3Z2XVkSOILl93M81GM7bSPOFB80y6q5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 00:45:33 -0400 (EDT)
From:   Mathew McBride <matt@traverse.com.au>
To:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2 1/2] rtc: rx8025: implement RX-8035 support
Date:   Fri,  9 Jul 2021 04:45:17 +0000
Message-Id: <20210709044518.28769-2-matt@traverse.com.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210709044518.28769-1-matt@traverse.com.au>
References: <20210709044518.28769-1-matt@traverse.com.au>
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
 drivers/rtc/rtc-rx8025.c | 58 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index c914091819ba..7a0258fe4b8e 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -60,14 +60,23 @@
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
 MODULE_DEVICE_TABLE(i2c, rx8025_id);
 
 struct rx8025_data {
 	struct rtc_device *rtc;
+	enum rx_model model;
 	u8 ctrl1;
 };
 
@@ -100,10 +109,26 @@ static s32 rx8025_write_regs(const struct i2c_client *client,
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
@@ -117,7 +142,8 @@ static int rx8025_check_validity(struct device *dev)
 		return -EINVAL;
 	}
 
-	if (!(ctrl2 & RX8025_BIT_CTRL2_XST)) {
+	xstp = rx8025_is_osc_stopped(drvdata->model, ctrl2);
+	if (xstp) {
 		dev_warn(dev, "crystal stopped, date is invalid\n");
 		return -EINVAL;
 	}
@@ -127,6 +153,7 @@ static int rx8025_check_validity(struct device *dev)
 
 static int rx8025_reset_validity(struct i2c_client *client)
 {
+	struct rx8025_data *drvdata = i2c_get_clientdata(client);
 	int ctrl2 = rx8025_read_reg(client, RX8025_REG_CTRL2);
 
 	if (ctrl2 < 0)
@@ -134,22 +161,28 @@ static int rx8025_reset_validity(struct i2c_client *client)
 
 	ctrl2 &= ~(RX8025_BIT_CTRL2_PON | RX8025_BIT_CTRL2_VDET);
 
+	if (drvdata->model == model_rx_8025)
+		ctrl2 |= RX8025_BIT_CTRL2_XST;
+	else
+		ctrl2 &= ~(RX8025_BIT_CTRL2_XST);
+
 	return rx8025_write_reg(client, RX8025_REG_CTRL2,
-				ctrl2 | RX8025_BIT_CTRL2_XST);
+				ctrl2);
 }
 
 static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
 {
 	struct i2c_client *client = dev_id;
 	struct rx8025_data *rx8025 = i2c_get_clientdata(client);
-	int status;
+	int status, xstp;
 
 	rtc_lock(rx8025->rtc);
 	status = rx8025_read_reg(client, RX8025_REG_CTRL2);
 	if (status < 0)
 		goto out;
 
-	if (!(status & RX8025_BIT_CTRL2_XST))
+	xstp = rx8025_is_osc_stopped(rx8025->model, status);
+	if (xstp)
 		dev_warn(&client->dev, "Oscillation stop was detected,"
 			 "you may have to readjust the clock\n");
 
@@ -519,6 +552,21 @@ static int rx8025_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, rx8025);
 
+	if (id) {
+		rx8025->model = id->driver_data;
+		switch (rx8025->model) {
+		case model_rx_8025:
+			dev_info(&client->dev, "Model RX-8025");
+			break;
+		case model_rx_8035:
+			dev_info(&client->dev, "Model RX-8035");
+			break;
+		default:
+			dev_warn(&client->dev, "Unknown model: %d\n", rx8025->model);
+			break;
+		}
+	}
+
 	err = rx8025_init_client(client);
 	if (err)
 		return err;
-- 
2.30.1

