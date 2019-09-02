Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B48A4EAF
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2019 06:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbfIBEjS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 00:39:18 -0400
Received: from mail-eopbgr1360104.outbound.protection.outlook.com ([40.107.136.104]:21088
        "EHLO AUS01-ME1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726385AbfIBEjS (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 2 Sep 2019 00:39:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZX1Oxw4bHVDwrO7sGaFHtDZm9fj4YOX4jTqegmlk/4uxWWUFsjfac4s7Dnwlobpj7n8fRwDA1yMcZktLfOyMVqvUovvotnMMMVfTAoft+nnLdi9UR8z/Y6rSMLbju5PGN2liwl9vps8zkFGmwJyN/QjyK9qB3U4lzzfIc7NjIibbUR9/FbBGSIXqxJVh/xapPT/WRki0eQa+bySp1qgERjcQkamxFe+tlQUuOhEDQrM5rUahBlfRoBtjIka5JpNLog7xCUgMGjh3OWftxLh91U2c5RHSXSZaeCEd4qYvjAJwrfLt/QWe5/x1mySToDS+xM4BKrtOX+/E6pagmDcpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouDXtUXe6eqW4CSrEiL60srAiV2DR6P+a2JdfaX/Lpw=;
 b=lecWiKiqhmVwpGYbkkBmUwb9xWTpw9wVYZiZvNZMjj95weShqvmazkOlwHGQn3yAOTIq58QarV3QoJhuN+/UCGTljVsZW9sLW8zyt2NGPADSV7D+w1zhmpBi/8mgZpA/rv54586kFq5+4TtLwWcK2uiZ8qJeswTuQ1qAYARCuAKjYZKy46xe3LhixmdGB0Fm0H4YAXksTW5yj1SFmJWRxrhe5+fsKVAjDQ/KqkHQajq1Anq5Gre14wYjG6UgKk1VoIZQUBBSryB9vSKYPysmNsmV2hv6/xyuMWYMJEYe+WGbslbhsE6ubTQUNaw+OLR5hS+07Wr+DxmuBSedqRwbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 111.69.51.19) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=enatel.net;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=enatel.net;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=enatel.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouDXtUXe6eqW4CSrEiL60srAiV2DR6P+a2JdfaX/Lpw=;
 b=JF0W8KrrekKOj2sGAyxH4Jwrp7p3RhFQn5LduN/e7W9MAOH7xrOP9eUJFY1cbjOlUo7lecsY80KEpvR+gMiTfbbAbffY211eIAHO/73RdkvfsX0mi+FwH9OkYkorJP+UjSwiugmcSDNrfgfVI7Jd7E9/KixQnhq3sMs0Fe99nAU=
Received: from SYCPR01CA0025.ausprd01.prod.outlook.com (2603:10c6:10:e::13) by
 MEAPR01MB2392.ausprd01.prod.outlook.com (2603:10c6:201:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Mon, 2 Sep 2019 04:37:33 +0000
Received: from SY3AUS01FT013.eop-AUS01.prod.protection.outlook.com
 (2a01:111:f400:7eb5::207) by SYCPR01CA0025.outlook.office365.com
 (2603:10c6:10:e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.18 via Frontend
 Transport; Mon, 2 Sep 2019 04:37:33 +0000
Authentication-Results: spf=pass (sender IP is 111.69.51.19)
 smtp.mailfrom=enatel.net; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=enatel.net;
Received-SPF: Pass (protection.outlook.com: domain of enatel.net designates
 111.69.51.19 as permitted sender) receiver=protection.outlook.com;
 client-ip=111.69.51.19; helo=mail.enatel.co.nz;
Received: from mail.enatel.co.nz (111.69.51.19) by
 SY3AUS01FT013.mail.protection.outlook.com (10.152.234.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2199.13 via Frontend Transport; Mon, 2 Sep 2019 04:37:32 +0000
Received: from michael-Latitude-5590 (172.26.6.16) by mail.enatel.co.nz
 (192.168.1.8) with Microsoft SMTP Server (TLS) id 14.3.468.0; Mon, 2 Sep 2019
 16:37:17 +1200
Date:   Mon, 2 Sep 2019 16:37:27 +1200
From:   Michael McCormick <michael.mccormick@enatel.net>
To:     <a.zummo@towertech.it>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <michael.mccormick@enatel.net>
Subject: [PATCH] rtc: pcf85063: Add pcf85063 clkout control to common clock
 framework
Message-ID: <20190902043727.GA24684@michael-Latitude-5590>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.26.6.16]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:111.69.51.19;IPV:CAL;SCL:-1;CTRY:NZ;EFV:NLI;SFV:NSPM;SFS:(10019020)(4636009)(39840400004)(136003)(376002)(396003)(346002)(2980300002)(374574003)(189003)(199004)(47776003)(8676002)(97756001)(81166006)(81156014)(2201001)(50466002)(86362001)(55016002)(46406003)(14444005)(5660300002)(76130400001)(26005)(3846002)(33716001)(9686003)(16526019)(356004)(2906002)(6666004)(8936002)(8746002)(186003)(316002)(70586007)(1076003)(70206006)(7736002)(58126008)(110136005)(336012)(107886003)(4326008)(6116002)(33656002)(36906005)(106002)(26826003)(476003)(478600001)(23726003)(305945005)(486006)(126002);DIR:OUT;SFP:1102;SCL:1;SRVR:MEAPR01MB2392;H:mail.enatel.co.nz;FPR:;SPF:Pass;LANG:en;PTR:19.51.69.111.static.snap.net.nz;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f13298c-4f10-4dce-d93b-08d72f5f4559
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);SRVR:MEAPR01MB2392;
X-MS-TrafficTypeDiagnostic: MEAPR01MB2392:
X-Microsoft-Antispam-PRVS: <MEAPR01MB2392596759AD3980F37E5CC589BE0@MEAPR01MB2392.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-Forefront-PRVS: 01480965DA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BLlK8KLZFPUe11geFHZ8cgAVPJ195lfyJp4mvH5wLWo7kPA8xjY5+T+J1GLoD2AtUidIFuqNEBwOpvMTndLzdi/bg/rFNDIt2RGioFlHdjGI6xn2YXNp/nfDq0Fy5yb4lq1u0OKjW6a7CCELVqJnCSnZoWZqVbfYTWEsoDW6Kc5I26kxB3cJPktec8o6YyjPprCt8A8nzrADHvj1cn/4tNG4+tdAIvVBaIF6lF1j3DeXTWvEw6CniurxSZLaczKSqBrfN29cMNVUYuyxgI8sMFzC0FBaBQUUdXbWpsW3skkmGxqvFHCBFRTvNamD5CuFJEtzlTKLL8f3P5etism90Obvdl0WdppDjdmwBVhDN3FkfO30/jmnNtlgjn7kQMX+1DHMJWaFvV3dObOSIBNl3GaH/i1KLpsukHEmNpSVnos=
X-OriginatorOrg: enatel.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2019 04:37:32.2754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f13298c-4f10-4dce-d93b-08d72f5f4559
X-MS-Exchange-CrossTenant-Id: 60c5af6b-3b0c-4e87-85d7-9a81b4eb7f32
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=60c5af6b-3b0c-4e87-85d7-9a81b4eb7f32;Ip=[111.69.51.19];Helo=[mail.enatel.co.nz]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEAPR01MB2392
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Signed-off-by: Michael McCormick <michael.mccormick@enatel.net>
---
 drivers/rtc/rtc-pcf85063.c | 153 +++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 1afa6d9fa9fb..f47d3a6b997d 100644
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
@@ -44,6 +45,16 @@
 #define PCF85063_OFFSET_STEP0          4340
 #define PCF85063_OFFSET_STEP1          4069

+#define PCF85063_REG_CLKO_F_MASK       0x07 /* frequency mask */
+#define PCF85063_REG_CLKO_F_32768HZ    0x00
+#define PCF85063_REG_CLKO_F_16384HZ    0x01
+#define PCF85063_REG_CLKO_F_8192HZ     0x02
+#define PCF85063_REG_CLKO_F_4096HZ     0x03
+#define PCF85063_REG_CLKO_F_2048HZ     0x04
+#define PCF85063_REG_CLKO_F_1024HZ     0x05
+#define PCF85063_REG_CLKO_F_1HZ                0x06
+#define PCF85063_REG_CLKO_F_OFF                0x07
+
 #define PCF85063_REG_RAM               0x03

 #define PCF85063_REG_SC                        0x04 /* datetime */
@@ -61,6 +72,9 @@ struct pcf85063_config {
 struct pcf85063 {
        struct rtc_device       *rtc;
        struct regmap           *regmap;
+#ifdef CONFIG_COMMON_CLK
+       struct clk_hw           clkout_hw;
+#endif
 };

 static int pcf85063_rtc_read_time(struct device *dev, struct rtc_time *tm)
@@ -369,6 +383,140 @@ static int pcf85063_load_capacitance(struct pcf85063 =
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
+                       return regmap_update_bits(pcf85063->regmap, PCF8506=
3_REG_CTRL2,
+                                                 PCF85063_REG_CLKO_F_MASK,=
 i);
+
+       return -EINVAL;
+}
+
+static int pcf85063_clkout_control(struct clk_hw *hw, bool enable)
+{
+       struct pcf85063 *pcf85063 =3D clkout_hw_to_pcf85063(hw);
+       unsigned char buf;
+
+       if (enable)
+               buf =3D PCF85063_REG_CLKO_F_32768HZ;
+       else
+               buf =3D PCF85063_REG_CLKO_F_OFF;
+
+       return regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL2,
+                                 PCF85063_REG_CLKO_F_MASK, buf);
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
+       /* disable the clkout output */
+       ret =3D regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL2,
+                                PCF85063_REG_CLKO_F_MASK, PCF85063_REG_CLK=
O_F_OFF);
+       if (ret < 0)
+               return ERR_PTR(ret);
+
+       init.name =3D "pcf85063-clkout";
+       init.ops =3D &pcf85063_clkout_ops;
+       init.flags =3D 0;
+       init.parent_names =3D NULL;
+       init.num_parents =3D 0;
+       pcf85063->clkout_hw.init =3D &init;
+
+       /* optional override of the clockname */
+       of_property_read_string(pcf85063->rtc->dev.of_node, "clock-output-n=
ames", &init.name);
+
+       /* register the clock */
+       clk =3D devm_clk_register(&pcf85063->rtc->dev, &pcf85063->clkout_hw=
);
+
+       if (!IS_ERR(clk))
+               of_clk_add_provider(pcf85063->rtc->dev.of_node, of_clk_src_=
simple_get, clk);
+
+       return clk;
+}
+#endif
+
 static const struct pcf85063_config pcf85063a_config =3D {
        .regmap =3D {
                .reg_bits =3D 8,
@@ -469,6 +617,11 @@ static int pcf85063_probe(struct i2c_client *client)
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
