Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D58A2A9219
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Nov 2020 10:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgKFJGl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 6 Nov 2020 04:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgKFJGk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 6 Nov 2020 04:06:40 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77674C0613CF;
        Fri,  6 Nov 2020 01:06:40 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 7CFBB1F467A1
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH v2] rtc: hym8563: enable wakeup when applicable
Date:   Fri,  6 Nov 2020 09:06:31 +0000
Message-Id: <1ea023e2ba50a4dab6e39be93d7de3146af71a60.1604653374.git.guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Enable wakeup in the hym8563 driver if the IRQ was successfully
requested or if wakeup-source is set in the devicetree.

As per the description of device_init_wakeup(), it should be enabled
for "devices that everyone expects to be wakeup sources".  One would
expect this to be the case with a real-time clock.

Tested on rk3288-rock2-square, which has an IRQ configured for the
RTC.  As a result, wakeup was enabled during driver initialisation.

Fixes: dcaf03849352 ("rtc: add hym8563 rtc-driver")
Reported-by: kernelci.org bot <bot@kernelci.org>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---

Notes:
    v2: enable wakeup if irq or wakeup-source

 drivers/rtc/rtc-hym8563.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 0fb79c4afb46..24e0095be058 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -527,8 +527,6 @@ static int hym8563_probe(struct i2c_client *client,
 	hym8563->client = client;
 	i2c_set_clientdata(client, hym8563);
 
-	device_set_wakeup_capable(&client->dev, true);
-
 	ret = hym8563_init_device(client);
 	if (ret) {
 		dev_err(&client->dev, "could not init device, %d\n", ret);
@@ -547,6 +545,11 @@ static int hym8563_probe(struct i2c_client *client,
 		}
 	}
 
+	if (client->irq > 0 ||
+	    device_property_read_bool(&client->dev, "wakeup-source")) {
+		device_init_wakeup(&client->dev, true);
+	}
+
 	/* check state of calendar information */
 	ret = i2c_smbus_read_byte_data(client, HYM8563_SEC);
 	if (ret < 0)
-- 
2.20.1

