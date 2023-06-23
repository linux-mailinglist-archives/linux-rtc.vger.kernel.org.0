Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE4E73B97D
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jun 2023 16:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjFWOKs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Jun 2023 10:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbjFWOKn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Jun 2023 10:10:43 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2CB282695;
        Fri, 23 Jun 2023 07:10:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,152,1684767600"; 
   d="scan'208";a="165108893"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jun 2023 23:10:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.107])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 560C34270489;
        Fri, 23 Jun 2023 23:10:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-rtc@vger.kernel.org,
        Trent Piepho <tpiepho@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 10/10] rtc: isl1208: Add support for the built-in RTC on the PMIC RAA215300
Date:   Fri, 23 Jun 2023 15:09:48 +0100
Message-Id: <20230623140948.384762-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623140948.384762-1-biju.das.jz@bp.renesas.com>
References: <20230623140948.384762-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The built-in RTC found on PMIC RAA215300 is the same as ISL1208.
However, the external oscillator bit is inverted on PMIC version
0x11. The PMIC driver detects PMIC version and instantiates the
RTC device based on i2c_device_id.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Dropped Rb tag from Geert as there is new changes.
 * Dropped parsing the parent node for retrieving clk details as
   clk_dev is registered in sibling PMIC driver. So same info available
   here.
v5->v6:
 * Added Rb tag from Geert.
 * Parsing of parent node is moved from probe->isl1208_clk_present()
 * Added comment for parsing parent node for getting clock resource.
 * Replaced XOR->NOT to make the operation more clear for the inverted case.
v4->v5:
 * Updated commit description.
 * Replaced "unsigned long"->"kernel_ulong_t" in isl1208_id[].
 * -ENOENT means clock not present, so any other errors are propagated.
 * Dropped bool inverted parameter from isl1208_set_xtoscb() instead
   using xor to compute the value of xtoscb.
v3->v4:
 * Added support for internal oscillator enable/disable.
v2->v3:
 * RTC device is instantiated by PMIC driver and dropped isl1208_probe_helper().
 * Added "TYPE_RAA215300_RTC_A0" to handle inverted oscillator bit case.
RFC->v2:
 * Dropped compatible "renesas,raa215300-isl1208" and "renesas,raa215300-pmic" property.
 * Updated the comment polarity->bit for External Oscillator.
 * Added raa215300_rtc_probe_helper() for registering raa215300_rtc device and
   added the helper function isl1208_probe_helper() to share the code.
---
 drivers/rtc/rtc-isl1208.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index e9ec5675e27c..b0712b4e3648 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -74,6 +74,7 @@ struct isl1208_config {
 	unsigned int	nvmem_length;
 	unsigned	has_tamper:1;
 	unsigned	has_timestamp:1;
+	unsigned	has_inverted_osc_bit:1;
 };
 
 static const struct isl1208_config config_isl1208 = {
@@ -100,11 +101,19 @@ static const struct isl1208_config config_isl1219 = {
 	.has_timestamp = true
 };
 
+static const struct isl1208_config config_raa215300_a0 = {
+	.nvmem_length = 2,
+	.has_tamper = false,
+	.has_timestamp = false,
+	.has_inverted_osc_bit = true
+};
+
 static const struct i2c_device_id isl1208_id[] = {
 	{ "isl1208", .driver_data = (kernel_ulong_t)&config_isl1208 },
 	{ "isl1209", .driver_data = (kernel_ulong_t)&config_isl1209 },
 	{ "isl1218", .driver_data = (kernel_ulong_t)&config_isl1218 },
 	{ "isl1219", .driver_data = (kernel_ulong_t)&config_isl1219 },
+	{ "raa215300_a0", .driver_data = (kernel_ulong_t)&config_raa215300_a0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isl1208_id);
@@ -895,6 +904,9 @@ isl1208_probe(struct i2c_client *client)
 		return sr;
 	}
 
+	if (isl1208->config->has_inverted_osc_bit)
+		xtosb_val = !xtosb_val;
+
 	rc = isl1208_set_xtoscb(client, sr, xtosb_val);
 	if (rc)
 		return rc;
-- 
2.25.1

