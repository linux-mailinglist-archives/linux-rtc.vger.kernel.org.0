Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32941476DA
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2020 02:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730100AbgAXBxQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 Jan 2020 20:53:16 -0500
Received: from mail-eopbgr1370112.outbound.protection.outlook.com ([40.107.137.112]:38627
        "EHLO AUS01-SY3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728665AbgAXBxP (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 23 Jan 2020 20:53:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeCWEhx7zGBxWmDVos+AWI1ZUZUGekWt+9k2FJ8NtdpSvnpizas5JFJIZfKlqBKzmOSbstwDCykk19/v8zaFEO7QuPsC9eSqCi498iK67A13FvJswWy/xX+YB4O9ejEyhZPnKSkgF50CB1W5d1QbOPyCd6LC8xPwRKaBuPOVfhj22uxF6dE8/4/llw24kRuu4LrIS9aTfCAX6iTy79lSEWXou1yDH8erkLLr6WrylPFC25b4wXtfqnYPWyUHWD2S6Nl+Mh3LPhY6DD9golZfePMqwln14EozpsL+YxcFhNYT3XUAwX52UotJZT8OFnTI3d2Mwk/eJ7Ix94JHP7hN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPKVhGTbTdPOxt+VsxeOOzrumk6vhDid2ttPTj232ig=;
 b=hCQib0Al+Srl6liUWBJKYl9DhNGSDuLhR7SzSXwblMap2q5UXfOKEohOQ6dzsCWXqBoIxNt3CDXCOkT9/uZ+EE7LxUIN9u5/qy9lWwcYVsEveHXFEL5F0Zy/PPIwf6DmFMU+uVhebek+H2yimF5/M5DU83pqXxZ0yau8Sk0Cgz0Yfa24fuXLipKzftG9+7bmhDY/fv+k81haEWGQQQvwPojSHpZMJWUwl1aFTfrk7Gk+NbWsPHmUaQA3rRlIQSUrtgRckWdJBq5WPn7fY8mZxsITWUUXOb1dT9d6GCTFMSg8T9JPgJBg+0K8i+oNQ5nNZT5KgaaZIjBa59FQF4EDmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 111.69.51.18) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=enatel.net;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=enatel.net;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=enatel.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPKVhGTbTdPOxt+VsxeOOzrumk6vhDid2ttPTj232ig=;
 b=GrKvaIGy2pM0kjhyk8XXizGBbF8AcJshpr6wmdf13m1BYcjGDuJX9k3p1VTvuvOBL2EdrQ5xnc+So2qg7g60O39B/K5wlM09mzp/mDQU/8UopJFUK5QOMOD1nfBXfb9+tDLqL8TYbCFhUjveBcc3SOlfrv/t8Iv2gk2eGXHf6Q0=
Received: from MEXPR01CA0111.ausprd01.prod.outlook.com (2603:10c6:200:2c::20)
 by ME1PR01MB1346.ausprd01.prod.outlook.com (2603:10c6:200:26::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.19; Fri, 24 Jan
 2020 01:53:10 +0000
Received: from SY3AUS01FT017.eop-AUS01.prod.protection.outlook.com
 (2a01:111:f400:7eb5::205) by MEXPR01CA0111.outlook.office365.com
 (2603:10c6:200:2c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.21 via Frontend
 Transport; Fri, 24 Jan 2020 01:53:10 +0000
Authentication-Results: spf=pass (sender IP is 111.69.51.18)
 smtp.mailfrom=enatel.net; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=enatel.net;
Received-SPF: Pass (protection.outlook.com: domain of enatel.net designates
 111.69.51.18 as permitted sender) receiver=protection.outlook.com;
 client-ip=111.69.51.18; helo=mail.enatel.co.nz;
Received: from mail.enatel.co.nz (111.69.51.18) by
 SY3AUS01FT017.mail.protection.outlook.com (10.152.234.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2665.18 via Frontend Transport; Fri, 24 Jan 2020 01:53:09 +0000
Received: from localhost.localdomain (172.26.6.16) by mail.enatel.co.nz
 (192.168.1.8) with Microsoft SMTP Server (TLS) id 14.3.468.0; Fri, 24 Jan
 2020 14:53:06 +1300
From:   Michael McCormick <michael.mccormick@enatel.net>
CC:     Michael McCormick <michael.mccormick@enatel.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] rtc: pcf85063: Add pcf85063 clkout control to common clock framework
Date:   Fri, 24 Jan 2020 14:52:38 +1300
Message-ID: <20200124015239.24662-1-michael.mccormick@enatel.net>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.26.6.16]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:111.69.51.18;IPV:CAL;SCL:-1;CTRY:NZ;EFV:NLI;SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(376002)(39840400004)(396003)(199004)(189003)(336012)(54906003)(70586007)(70206006)(2616005)(109986005)(356004)(4326008)(81166006)(2906002)(6666004)(8936002)(81156014)(1076003)(86362001)(36756003)(8676002)(26826003)(186003)(16526019)(5660300002)(478600001)(26005)(316002)(266003);DIR:OUT;SFP:1102;SCL:1;SRVR:ME1PR01MB1346;H:mail.enatel.co.nz;FPR:;SPF:Pass;LANG:en;PTR:18.51.69.111.static.snap.net.nz;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b75c402c-f25c-479b-882f-08d7a0702a1c
X-MS-TrafficTypeDiagnostic: ME1PR01MB1346:
X-Microsoft-Antispam-PRVS: <ME1PR01MB134691214D02D9B82825A6A2890E0@ME1PR01MB1346.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-Forefront-PRVS: 02929ECF07
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WAjNoURodwAdJcKxC5g6bkYLBO1x7uFBrus0j9g5/992DVkDVqmIiRxH2oiWcadRkXcsCMGH3h2Z4gAqpMFujfyJXuP+FEQ6IFAGbOfXGAJ7PHJIgphbLUuR6UKVt6fMBSLhZBt6hL/Eh/yN6w/1Irlx5S3+fjEkySVGa+FMkBpCoXCjH/IahNqiTKI15FCbhAVjoEbRWoiH3Ra4DwgemE3GwK2AJVm4BVTWndULZZEJNV+M8MD+hFN6rpYdQzffbcMmYKTnFe9yBrH/pIxlCgPMvaRCPn4WctK5/4WalGkfXa1ill+G50gpwKc8VlePTJk0HzhQsgge9hQA0Eg5bPyoHSYd8XRlKscM57oc4RVotqtFdWccX15xQg+t6LYPeTGl4XTxHQOGeR0uCZuEIFMteEZ4wxaFI5GEFHyVl04dWUnhKZZQJbA/JASByRnVV2aQIYMNTo3707ZgBGeNZmGjYAhNZl/F1Ydp6l6mxZ4=
X-OriginatorOrg: enatel.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2020 01:53:09.6606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b75c402c-f25c-479b-882f-08d7a0702a1c
X-MS-Exchange-CrossTenant-Id: 60c5af6b-3b0c-4e87-85d7-9a81b4eb7f32
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=60c5af6b-3b0c-4e87-85d7-9a81b4eb7f32;Ip=[111.69.51.18];Helo=[mail.enatel.co.nz]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME1PR01MB1346
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Signed-off-by: Michael McCormick <michael.mccormick@enatel.net>
---
 drivers/rtc/rtc-pcf85063.c | 157 +++++++++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 1afa6d9fa9fb..62dcd5a8435f 100644
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
@@ -369,6 +377,150 @@ static int pcf85063_load_capacitance(struct pcf85063 =
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
@@ -469,6 +621,11 @@ static int pcf85063_probe(struct i2c_client *client)
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
