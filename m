Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40FAE1476CE
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2020 02:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgAXBq1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Jan 2020 20:46:27 -0500
Received: from mail-eopbgr1360120.outbound.protection.outlook.com ([40.107.136.120]:31552
        "EHLO AUS01-ME1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728665AbgAXBq1 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Jan 2020 20:46:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ8x058YVIAQtyvGkgh+jKp6mcTyB/RXK3ekM6Bd8TUUs4LB4U4S1fVrjJdpk4Ld/i+NIexwp8gQfY+zFGSWF5d5V1qYMF04i7/4+shTaqR/lSucQnlpLIY+BQGZ0To85gUqn2YtzJxsBybJZxVrRzQYUVTsr+7FNlCUiPUeV2MWDuBeLja932vJ6iOCaeRK8jQuOz8sutqHZyBfqVTd+WWF9s51zPtUq6JwoIWD6XHFbWVsmZKIsvcuiMRWaYP2L8EGzC+cD9rjDC/gxN6eiIm88fbYhQ8BdoQu7TDhNQzFV1cRm95MmnpMzYk3+dNxzno2egiS+T5r0U/wXYzhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXkL3NSR5uC0SO1BgxkgEZnGbkpxTrKGzDQAi2gkcqs=;
 b=DMpWSDHaEMV2kCvE17bu85nMowbbwxAXWWwGVti8rSr4aq7griqGgbJWP2MOcJfwDsB/j/5X1oYX1Dbzt7SIzJsZFmqtSWbg5KPupFyA7pdHzyLEnn2eN9xFZ/v96TACwgojDyO3szM5TmBqIWu0Hss9kdS3sRjOtwpWt2Sai08KstWdslp2uaO4lPLz6qHUt/fkvSrd8BC/0T6tHua77xazO6pbWL4r+A/LBHHDCNF22lxH9TZESYm5xK6NEKsO3eqj1wO+lGN/7TnQB1IwmwQI0BWmBbDOvbV/lzTqLVGj+8jR8qYSBqScRktWn4lb0bnJHAITB2l6+ZMSnRfRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 111.69.51.18) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=enatel.net;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=enatel.net;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=enatel.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXkL3NSR5uC0SO1BgxkgEZnGbkpxTrKGzDQAi2gkcqs=;
 b=PbSsrZ2+l38w0LJLs6ypKSBLDM7yx1JJo0v9pqIHYle9V2KmIKnOn4wsbhkhah/DbIzHMQi/NbemSVP3TUU73MdkbD/tnL7oCWdBNARcIX3nwGQ8LtTcR/TOOltxT/l+9u4lQshe8hAFMpqB7zHugn+D8CYPcbtpfqtw9Cwcha8=
Received: from ME2PR01CA0129.ausprd01.prod.outlook.com (2603:10c6:201:2e::21)
 by ME1PR01MB1667.ausprd01.prod.outlook.com (2603:10c6:200:1e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.21; Fri, 24 Jan
 2020 01:46:21 +0000
Received: from SY3AUS01FT017.eop-AUS01.prod.protection.outlook.com
 (2a01:111:f400:7eb5::201) by ME2PR01CA0129.outlook.office365.com
 (2603:10c6:201:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.20 via Frontend
 Transport; Fri, 24 Jan 2020 01:46:21 +0000
Authentication-Results: spf=pass (sender IP is 111.69.51.18)
 smtp.mailfrom=enatel.net; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=enatel.net;
Received-SPF: Pass (protection.outlook.com: domain of enatel.net designates
 111.69.51.18 as permitted sender) receiver=protection.outlook.com;
 client-ip=111.69.51.18; helo=mail.enatel.co.nz;
Received: from mail.enatel.co.nz (111.69.51.18) by
 SY3AUS01FT017.mail.protection.outlook.com (10.152.234.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2665.18 via Frontend Transport; Fri, 24 Jan 2020 01:46:20 +0000
Received: from localhost.localdomain (172.26.6.16) by mail.enatel.co.nz
 (192.168.1.8) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 24 Jan
 2020 14:46:16 +1300
From:   Michael McCormick <michael.mccormick@enatel.net>
CC:     Michael McCormick <michael.mccormick@enatel.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] rtc: pcf85063: Add pcf85063 clkout control to common clock framework
Date:   Fri, 24 Jan 2020 14:46:00 +1300
Message-ID: <20200124014600.5283-1-michael.mccormick@enatel.net>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.26.6.16]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:111.69.51.18;IPV:CAL;SCL:-1;CTRY:NZ;EFV:NLI;SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(39830400003)(396003)(136003)(189003)(199004)(36756003)(5660300002)(186003)(4326008)(2906002)(26005)(336012)(2616005)(109986005)(356004)(16526019)(6666004)(1076003)(26826003)(478600001)(70206006)(86362001)(316002)(8676002)(70586007)(81166006)(8936002)(54906003)(81156014)(266003);DIR:OUT;SFP:1102;SCL:1;SRVR:ME1PR01MB1667;H:mail.enatel.co.nz;FPR:;SPF:Pass;LANG:en;PTR:18.51.69.111.static.snap.net.nz;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ae946ec-876f-4004-1b9e-08d7a06f3646
X-MS-TrafficTypeDiagnostic: ME1PR01MB1667:
X-Microsoft-Antispam-PRVS: <ME1PR01MB1667389C0C97AB5A5A21F494890E0@ME1PR01MB1667.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-Forefront-PRVS: 02929ECF07
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sILJJHJQCT5kX4SGPprSrLTwG08lkFo8Q2k4gWUq8/edOUeS/jEGpF+oDCTWbsvPETqSSTm1OTVTES4ZjgkxC4XhyVivR+4IZzADmP4KedQvuawlMR7N1XEpJKYVlKJwwgOkDksWx6Uznunw/rK9fVM+XR9/+0rOGY/vUjE81SixrTqeFLOsqB9KmvfPRnrktLBLSv5wKOUUfs+KuaMLxQr0i67SD+p0dfx1hO6JpsSyrAJc/SygGBrGAYGT5vm47p1aA7PY6TUib+L/I/hFUdFSky+m+4q0Wup4l1HkLiBD9l2PG1/PC52iwsBHHJkhH64cWAOkReKSKokoXRbc7ev65MYCxuYC4D63ktQ2ZzqBpmC/8s/+B27F71dy0mgxT2hxBeL5oUaFylqVj6v/xCT9QK0YF1m7Du5ra+Y2v5W9h7j8ALY5LH80TbPOaYXEh1louzanOntDMHu0NzfjHAlbqaIZhW2/sAzk5ISBD5U=
X-OriginatorOrg: enatel.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2020 01:46:20.5580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae946ec-876f-4004-1b9e-08d7a06f3646
X-MS-Exchange-CrossTenant-Id: 60c5af6b-3b0c-4e87-85d7-9a81b4eb7f32
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=60c5af6b-3b0c-4e87-85d7-9a81b4eb7f32;Ip=[111.69.51.18];Helo=[mail.enatel.co.nz]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME1PR01MB1667
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Signed-off-by: Michael McCormick <michael.mccormick@enatel.net>
---
 drivers/rtc/rtc-pcf85063.c | 158 +++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 1afa6d9fa9fb..782207289e29 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -9,6 +9,7 @@
  * Copyright (C) 2019 Micro Crystal AG
  * Author: Alexandre Belloni <alexandre.belloni@bootlin.com>
  */
+#include <linux/clk-provider.h>
 #include <linux/i2c.h>
 #include <linux/bcd.h>
 #include <linux/rtc.h>
@@ -44,6 +45,10 @@
 #define PCF85063_OFFSET_STEP0          4340
 #define PCF85063_OFFSET_STEP1          4069

+#define PCF85063_REG_CLKO_F_MASK       0x07 /* frequency mask */
+#define PCF85063_REG_CLKO_F_32768HZ    0x00
+#define PCF85063_REG_CLKO_F_OFF                0x07
+
 #define PCF85063_REG_RAM               0x03

 #define PCF85063_REG_SC                        0x04 /* datetime */
@@ -61,6 +66,9 @@ struct pcf85063_config {
 struct pcf85063 {
        struct rtc_device       *rtc;
        struct regmap           *regmap;
+#ifdef CONFIG_COMMON_CLK
+       struct clk_hw           clkout_hw;
+#endif
 };

 static int pcf85063_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -369,6 +377,151 @@ static int pcf85063_load_capacitance(struct pcf85063 =
*pcf85063,
                                  PCF85063_REG_CTRL1_CAP_SEL, reg);
 }

+#ifdef CONFIG_COMMON_CLK
+/*
+ * Handling of the clkout
+ */
+
+#define clkout_hw_to_pcf85063(_hw) container_of(_hw, struct pcf85063, clko=
ut_hw)
+
+static int clkout_rates[] =3D {
+       32768,
+       16384,
+       8192,
+       4096,
+       2048,
+       1024,
+       1,
+       0
+};
+
+static unsigned long pcf85063_clkout_recalc_rate(struct clk_hw *hw,
+                                                unsigned long parent_rate)
+{
+       struct pcf85063 *pcf85063 =3D clkout_hw_to_pcf85063(hw);
+       unsigned int buf;
+       int ret =3D regmap_read(pcf85063->regmap, PCF85063_REG_CTRL2, &buf)=
;
+
+       if (ret < 0)
+               return 0;
+
+       buf &=3D PCF85063_REG_CLKO_F_MASK;
+       return clkout_rates[buf];
+}
+
+static long pcf85063_clkout_round_rate(struct clk_hw *hw, unsigned long ra=
te,
+                                      unsigned long *prate)
+{
+       int i;
+
+       for (i =3D 0; i < ARRAY_SIZE(clkout_rates); i++)
+               if (clkout_rates[i] <=3D rate)
+                       return clkout_rates[i];
+
+       return 0;
+}
+
+static int pcf85063_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
+                                   unsigned long parent_rate)
+{
+       struct pcf85063 *pcf85063 =3D clkout_hw_to_pcf85063(hw);
+       int i;
+
+       for (i =3D 0; i < ARRAY_SIZE(clkout_rates); i++)
+               if (clkout_rates[i] =3D=3D rate)
+                       return regmap_update_bits(pcf85063->regmap,
+                               PCF85063_REG_CTRL2,
+                               PCF85063_REG_CLKO_F_MASK, i);
+
+       return -EINVAL;
+}
+
+static int pcf85063_clkout_control(struct clk_hw *hw, bool enable)
+{
+       struct pcf85063 *pcf85063 =3D clkout_hw_to_pcf85063(hw);
+       unsigned int buf;
+       int ret;
+
+       ret =3D regmap_read(pcf85063->regmap, PCF85063_REG_OFFSET, &buf);
+       if (ret < 0)
+               return ret;
+       buf &=3D PCF85063_REG_CLKO_F_MASK;
+
+       if (enable) {
+               if (buf =3D=3D PCF85063_REG_CLKO_F_OFF)
+                       buf =3D PCF85063_REG_CLKO_F_32768HZ;
+               else
+                       return 0;
+       } else {
+               if (buf !=3D PCF85063_REG_CLKO_F_OFF)
+                       buf =3D PCF85063_REG_CLKO_F_OFF;
+               else
+                       return 0;
+       }
+
+       return regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL2,
+                                       PCF85063_REG_CLKO_F_MASK, buf);
+}
+
+static int pcf85063_clkout_prepare(struct clk_hw *hw)
+{
+       return pcf85063_clkout_control(hw, 1);
+}
+
+static void pcf85063_clkout_unprepare(struct clk_hw *hw)
+{
+       pcf85063_clkout_control(hw, 0);
+}
+
+static int pcf85063_clkout_is_prepared(struct clk_hw *hw)
+{
+       struct pcf85063 *pcf85063 =3D clkout_hw_to_pcf85063(hw);
+       unsigned int buf;
+       int ret =3D regmap_read(pcf85063->regmap, PCF85063_REG_CTRL2, &buf)=
;
+
+       if (ret < 0)
+               return 0;
+
+       return (buf & PCF85063_REG_CLKO_F_MASK) !=3D PCF85063_REG_CLKO_F_OF=
F;
+}
+
+static const struct clk_ops pcf85063_clkout_ops =3D {
+       .prepare =3D pcf85063_clkout_prepare,
+       .unprepare =3D pcf85063_clkout_unprepare,
+       .is_prepared =3D pcf85063_clkout_is_prepared,
+       .recalc_rate =3D pcf85063_clkout_recalc_rate,
+       .round_rate =3D pcf85063_clkout_round_rate,
+       .set_rate =3D pcf85063_clkout_set_rate,
+};
+
+static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
+{
+       struct clk *clk;
+       struct clk_init_data init;
+       int ret;
+
+       init.name =3D "pcf85063-clkout";
+       init.ops =3D &pcf85063_clkout_ops;
+       init.flags =3D 0;
+       init.parent_names =3D NULL;
+       init.num_parents =3D 0;
+       pcf85063->clkout_hw.init =3D &init;
+
+       /* optional override of the clockname */
+       of_property_read_string(pcf85063->rtc->dev.of_node,
+                               "clock-output-names", &init.name);
+
+       /* register the clock */
+       clk =3D devm_clk_register(&pcf85063->rtc->dev, &pcf85063->clkout_hw=
);
+
+       if (!IS_ERR(clk))
+               of_clk_add_provider(pcf85063->rtc->dev.of_node,
+                                       of_clk_src_simple_get, clk);
+
+       return clk;
+}
+#endif
+
 static const struct pcf85063_config pcf85063a_config =3D {
        .regmap =3D {
                .reg_bits =3D 8,
@@ -469,6 +622,11 @@ static int pcf85063_probe(struct i2c_client *client)
        nvmem_cfg.priv =3D pcf85063->regmap;
        rtc_nvmem_register(pcf85063->rtc, &nvmem_cfg);

+#ifdef CONFIG_COMMON_CLK
+       /* register clk in common clk framework */
+       pcf85063_clkout_register_clk(pcf85063);
+#endif
+
        return rtc_register_device(pcf85063->rtc);
 }

--
2.17.1



**CONFIDENTIALITY STATEMENT**
This message is intended for the sole use of the individual(s) and/or entit=
y to whom it is addressed, and may contain information that is legally priv=
ileged, confidential, and exempt from disclosure under applicable law. If y=
ou are not the intended addressee, nor authorized to receive for the intend=
ed addressee, you are hereby notified that dissemination, distribution, cop=
ying or disclosure of this message is strictly prohibited. If you have rece=
ived this message in error please immediately advise the sender by reply em=
ail, and delete the message.
