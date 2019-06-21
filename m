Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA72D4E60D
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2019 12:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbfFUKdI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 21 Jun 2019 06:33:08 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:35984 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfFUKdI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 21 Jun 2019 06:33:08 -0400
Received: from tony.xie?rock-chips.com (unknown [192.168.167.192])
        by lucky1.263xmail.com (Postfix) with ESMTP id 86781568C5;
        Fri, 21 Jun 2019 18:33:04 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 1
X-MAIL-DELIVERY: 0
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P14435T140356020590336S1561113180405822_;
        Fri, 21 Jun 2019 18:33:03 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <088971abcfd62b37d88279f7980530e4>
X-RL-SENDER: tony.xie@rock-chips.com
X-SENDER: xxx@rock-chips.com
X-LOGIN-NAME: tony.xie@rock-chips.com
X-FST-TO: heiko@sntech.de
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From:   Tony Xie <tony.xie@rock-chips.com>
To:     heiko@sntech.de
Cc:     broonie@kernel.org, lee.jones@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com, tony.xie@rock-chips.com
Subject: [PATCH v10 1/6] mfd: rk808: remove the id_table
Date:   Fri, 21 Jun 2019 06:32:53 -0400
Message-Id: <20190621103258.8154-2-tony.xie@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621103258.8154-1-tony.xie@rock-chips.com>
References: <20190621103258.8154-1-tony.xie@rock-chips.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove the id_table because it's not used.

Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
---
 drivers/mfd/rk808.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index 216fbf6adec9..94377782d208 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -568,14 +568,6 @@ static int rk808_remove(struct i2c_client *client)
 	return 0;
 }
 
-static const struct i2c_device_id rk808_ids[] = {
-	{ "rk805" },
-	{ "rk808" },
-	{ "rk818" },
-	{ },
-};
-MODULE_DEVICE_TABLE(i2c, rk808_ids);
-
 static struct i2c_driver rk808_i2c_driver = {
 	.driver = {
 		.name = "rk808",
@@ -583,7 +575,6 @@ static struct i2c_driver rk808_i2c_driver = {
 	},
 	.probe    = rk808_probe,
 	.remove   = rk808_remove,
-	.id_table = rk808_ids,
 };
 
 module_i2c_driver(rk808_i2c_driver);
-- 
2.17.1



