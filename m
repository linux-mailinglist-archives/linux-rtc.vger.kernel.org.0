Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CE64108B7
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Sep 2021 23:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239644AbhIRVh3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 18 Sep 2021 17:37:29 -0400
Received: from www.zeus03.de ([194.117.254.33]:54494 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239573AbhIRVh2 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 18 Sep 2021 17:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=ARiahHC6k+NjTjrEaNx+OU5tcyN
        c1iADXpTMrPefQdg=; b=EIo8ZOkE4FYuKekk8141XXhW6SjK1Jz8IfwaYRfiO3+
        q27mRIK4Ouo8xxm8NG+Cc2RXzzwFtq+/WIsJembdaTdCIOw84174d/NW2W6hd0Gr
        1yI1Lf3grX7+hMhTe6NXWzW2rClN9nIXy6NDtdSUm2M6m14cZG/uFYGSCAlkPSYQ
        =
Received: (qmail 1967002 invoked from network); 18 Sep 2021 23:36:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Sep 2021 23:36:02 +0200
X-UD-Smtp-Session: l3s3148p1@ahQr1UvMzpMgAwDPXyF2AO3QmsoMF7XN
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH 1/2] rtc: rx6110: simplify getting the adapter of a client
Date:   Sat, 18 Sep 2021 23:35:51 +0200
Message-Id: <20210918213553.14514-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

We have a dedicated pointer for that, so use it. Much easier to read and
less computation involved.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Please apply to your subsystem tree.

 drivers/rtc/rtc-rx6110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
index f4d425002f7f..758fd6e11a15 100644
--- a/drivers/rtc/rtc-rx6110.c
+++ b/drivers/rtc/rtc-rx6110.c
@@ -422,7 +422,7 @@ static struct regmap_config regmap_i2c_config = {
 static int rx6110_i2c_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
-	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
+	struct i2c_adapter *adapter = client->adapter;
 	struct rx6110_data *rx6110;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
-- 
2.30.2

