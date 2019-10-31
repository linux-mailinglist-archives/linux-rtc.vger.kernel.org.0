Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3BB1EB91E
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2019 22:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729000AbfJaVix (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 31 Oct 2019 17:38:53 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:48586 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729927AbfJaVir (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 31 Oct 2019 17:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6078DKMZWs1GaflPz0CDZPYKAw35sipsK/cxpG86dP4=; b=Of1cqvml813HxPNKtkXOv6DSmx
        JkxlLeGQVTjg0uGVf5Pm6KWZFNZMW9pl6XPrKl3qEdG6teeHHjiqZqt4g71yAef3+QxgqSoD6hjLR
        puaE5mHZgAoZ5ma38ZO6Q6Nmoi56GEBgUAiDeQl2bGqEWbj6uxAQJDpK4iRXD4qOwjoU=;
Received: from p200300ccff0b24001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:2400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iQI9V-0005m0-FN; Thu, 31 Oct 2019 22:38:45 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1iQI9V-00030D-4t; Thu, 31 Oct 2019 22:38:45 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 4/5] mfd: rn5t618: add more subdevices
Date:   Thu, 31 Oct 2019 22:38:34 +0100
Message-Id: <20191031213835.11390-5-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031213835.11390-1-andreas@kemnade.info>
References: <20191031213835.11390-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rc5t619 has a rtc which is missing in the
rn5t618. Add it as subdevice to prepare for their implementation

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/mfd/rn5t618-core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/rn5t618-core.c b/drivers/mfd/rn5t618-core.c
index 0e3ec9dafb40..b037c97e6747 100644
--- a/drivers/mfd/rn5t618-core.c
+++ b/drivers/mfd/rn5t618-core.c
@@ -21,6 +21,12 @@ static const struct mfd_cell rn5t618_cells[] = {
 	{ .name = "rn5t618-wdt" },
 };
 
+static const struct mfd_cell rc5t619_cells[] = {
+	{ .name = "rn5t618-regulator" },
+	{ .name = "rc5t619-rtc" },
+	{ .name = "rn5t618-wdt" },
+};
+
 static bool rn5t618_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -117,7 +123,11 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	ret = devm_mfd_add_devices(&i2c->dev, -1, rn5t618_cells,
+	if (priv->variant == RC5T619)
+		ret = devm_mfd_add_devices(&i2c->dev, -1, rc5t619_cells,
+				   ARRAY_SIZE(rc5t619_cells), NULL, 0, NULL);
+	else
+		ret = devm_mfd_add_devices(&i2c->dev, -1, rn5t618_cells,
 				   ARRAY_SIZE(rn5t618_cells), NULL, 0, NULL);
 	if (ret) {
 		dev_err(&i2c->dev, "failed to add sub-devices: %d\n", ret);
-- 
2.20.1

