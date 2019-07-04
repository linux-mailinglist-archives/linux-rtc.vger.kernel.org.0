Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7A15F169
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jul 2019 04:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfGDCYr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Jul 2019 22:24:47 -0400
Received: from mail-eopbgr1360114.outbound.protection.outlook.com ([40.107.136.114]:38064
        "EHLO AUS01-ME1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726736AbfGDCYr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 3 Jul 2019 22:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=enatel.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMIo1SZa+eynOSYX5aVd8+q17JR7nB5+wh4yTJ8VGdo=;
 b=c7utuNKrTi7vTa6NHSg8tCg7ufOFJjUUPh7HFODl/5P2eZnJ/fgV3BE9SvjIhy0ry9HF7+AuUSz/WsXzSVB+C7j6vRxEDsoJMdtQTKVrsQPa+Ju6G9gcFVZOimQoX0nn9GdUUK8IyFvatKxCZ2uEKm3bTn0mQuQz/Z9wNyWrvJ0=
Received: from SYCPR01CA0011.ausprd01.prod.outlook.com (2603:10c6:10:31::23)
 by ME2PR01MB4132.ausprd01.prod.outlook.com (2603:10c6:220:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.16; Thu, 4 Jul
 2019 02:24:42 +0000
Received: from SY3AUS01FT004.eop-AUS01.prod.protection.outlook.com
 (2a01:111:f400:7eb5::200) by SYCPR01CA0011.outlook.office365.com
 (2603:10c6:10:31::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2032.18 via Frontend
 Transport; Thu, 4 Jul 2019 02:24:42 +0000
Authentication-Results: spf=pass (sender IP is 111.69.51.18)
 smtp.mailfrom=enatel.net; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=enatel.net;
Received-SPF: Pass (protection.outlook.com: domain of enatel.net designates
 111.69.51.18 as permitted sender) receiver=protection.outlook.com;
 client-ip=111.69.51.18; helo=mail.enatel.co.nz;
Received: from mail.enatel.co.nz (111.69.51.18) by
 SY3AUS01FT004.mail.protection.outlook.com (10.152.234.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 4 Jul 2019 02:24:41 +0000
Received: from michael-Latitude-5590 (172.26.6.16) by mail.enatel.co.nz
 (192.168.1.8) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 4 Jul 2019
 14:24:38 +1200
Date:   Thu, 4 Jul 2019 14:24:39 +1200
From:   Michael McCormick <michael.mccormick@enatel.net>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] rtc: pcf85063: Add support for specifying the clkout
 frequency from device tree node.
Message-ID: <20190704022439.GA13102@michael-Latitude-5590>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.26.6.16]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:111.69.51.18;IPV:CAL;SCL:-1;CTRY:NZ;EFV:NLI;SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(39830400003)(136003)(396003)(2980300002)(374574003)(199004)(189003)(2906002)(26826003)(356004)(70586007)(86362001)(486006)(72206003)(5660300002)(70206006)(2201001)(1076003)(126002)(14444005)(33716001)(69596002)(476003)(478600001)(336012)(186003)(7736002)(16526019)(9686003)(55016002)(8936002)(3846002)(97756001)(33656002)(6116002)(23726003)(8676002)(305945005)(106002)(26005)(77096007)(8746002)(81156014)(76130400001)(50466002)(47776003)(46406003)(316002)(81166006)(58126008)(110136005)(2101003);DIR:OUT;SFP:1102;SCL:1;SRVR:ME2PR01MB4132;H:mail.enatel.co.nz;FPR:;SPF:Pass;LANG:en;PTR:18.51.69.111.static.snap.net.nz;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c29f8c3a-80a6-4975-bb84-08d70026c5b9
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328)(7193020);SRVR:ME2PR01MB4132;
X-MS-TrafficTypeDiagnostic: ME2PR01MB4132:
X-Microsoft-Antispam-PRVS: <ME2PR01MB4132CA7A7D1457D1E877BF8989FA0@ME2PR01MB4132.ausprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-Forefront-PRVS: 0088C92887
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: YpyxGPr7Cqc/jrJ8p/K/uM4gdFBnGkqaZ2ez0o+F02M+6zG1ghpJ0icbSwqqBNSYw8lL/wy1wdltY2uxQ5g5aRGy3L/f3u7/Res/NJxAi6a036XNYMPDTwwfx1PSKyX/B0fcSEkeo7/I7lQT1+B1hUNkRgoG4r2MGbBxoAgs5RYIpJktIcxjMLfHVDSH7Zk9cSzTjyR8yPKsHZQtIpYmbiCToznEIJxFs2iiyEikDOrvUflLY8XN8ZWoKiMgV4aM+hoCSGn0MLEVz968DBgRRBXIocd5c6a4p+x7UpyPK6KH+wEcP9c6uSzW00YkMke5SXSmH73iB4iZrd/GyjDne3RUP8F1CNqd67BTBneGKEI7fiNxvitO8OeQI+REeggLb9nXMKWcRr2jJhE+XSVpJOOiP4G3Uy0AKFfg3Xl1/8w=
X-OriginatorOrg: enatel.net
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2019 02:24:41.4469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29f8c3a-80a6-4975-bb84-08d70026c5b9
X-MS-Exchange-CrossTenant-Id: 60c5af6b-3b0c-4e87-85d7-9a81b4eb7f32
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=60c5af6b-3b0c-4e87-85d7-9a81b4eb7f32;Ip=[111.69.51.18];Helo=[mail.enatel.co.nz]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB4132
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Primarily this allows the clkout signal to be disabled and save some
power when running off battery backup. However, all hardware implemented
values are implemented. Uses default value of 32768Hz if node is not
specified.

Signed-off-by: Michael McCormick <michael.mccormick@enatel.net>
---
 drivers/rtc/rtc-pcf85063.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 1afa6d9fa9fb..5c19381899ed 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -37,6 +37,9 @@
 #define PCF85063_REG_CTRL2             0x01
 #define PCF85063_CTRL2_AF              BIT(6)
 #define PCF85063_CTRL2_AIE             BIT(7)
+#define PCF85063_CTRL2_COF2            BIT(2)
+#define PCF85063_CTRL2_COF1            BIT(1)
+#define PCF85063_CTRL2_COF0            BIT(0)

 #define PCF85063_REG_OFFSET            0x02
 #define PCF85063_OFFSET_SIGN_BIT       6       /* 2's complement sign bit =
*/
@@ -369,6 +372,51 @@ static int pcf85063_load_capacitance(struct pcf85063 *=
pcf85063,
                                  PCF85063_REG_CTRL1_CAP_SEL, reg);
 }

+static int pcf85063_set_clkout_mode(struct pcf85063 *pcf85063,
+                                   const struct device_node *np)
+{
+       u32 load =3D 32768;
+       u8 reg =3D 0;
+
+       of_property_read_u32(np, "clockout-frequency", &load);
+       switch (load) {
+       case 0:
+               reg =3D PCF85063_CTRL2_COF2 | PCF85063_CTRL2_COF1 |
+                     PCF85063_CTRL2_COF0;
+               break;
+       case 1:
+               reg =3D PCF85063_CTRL2_COF2 | PCF85063_CTRL2_COF1;
+               break;
+       case 1024:
+               reg =3D PCF85063_CTRL2_COF2 | PCF85063_CTRL2_COF0;
+               break;
+       case 2048:
+               reg =3D PCF85063_CTRL2_COF2;
+               break;
+       case 4096:
+               reg =3D PCF85063_CTRL2_COF1 | PCF85063_CTRL2_COF0;
+               break;
+       case 8192:
+               reg =3D PCF85063_CTRL2_COF1;
+               break;
+       case 16384:
+               reg =3D PCF85063_CTRL2_COF0;
+               break;
+       case 32768:
+               reg =3D 0;
+               break;
+       default:
+               dev_warn(&pcf85063->rtc->dev,
+                       "Unknown clockout-frequency: %d. Assuming 32768", l=
oad);
+               reg =3D 0;
+               break;
+       }
+
+       return regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL2,
+                                 PCF85063_CTRL2_COF2 | PCF85063_CTRL2_COF1=
 |
+                                 PCF85063_CTRL2_COF0, reg);
+}
+
 static const struct pcf85063_config pcf85063a_config =3D {
        .regmap =3D {
                .reg_bits =3D 8,
@@ -443,6 +491,10 @@ static int pcf85063_probe(struct i2c_client *client)
                dev_warn(&client->dev, "failed to set xtal load capacitance=
: %d",
                         err);

+       err =3D pcf85063_set_clkout_mode(pcf85063, client->dev.of_node);
+       if (err < 0)
+               dev_warn(&client->dev, "failed to set clock out mode: %d", =
err);
+
        pcf85063->rtc->ops =3D &pcf85063_rtc_ops;
        pcf85063->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
        pcf85063->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
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
