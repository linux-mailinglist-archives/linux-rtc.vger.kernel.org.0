Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C252D337C34
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 19:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhCKSNL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 13:13:11 -0500
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:57922 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229705AbhCKSMs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 13:12:48 -0500
X-Greylist: delayed 1348 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Mar 2021 13:12:48 EST
Received: from pps.filterd (m0118790.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BHgu2V031378;
        Thu, 11 Mar 2021 12:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : content-type : mime-version;
 s=pps-02182019; bh=/T/LXFQSkoj/Tm3EcU1bWdJDUjh08BF2zwAuneBJ7+U=;
 b=FMt8KUWtc+xFNnXPv5yA6cu0WbqH84RR7z2E9JxFELopYZ+ip6Xf1VwCasBwTp5nBDXj
 qtCADUqA72rjuVZLrYszKHUqLn8TK/yrZFi4v1E6Vw1k3V6sbm3bc4Ouk7WOsTLBXG4c
 1giBRYGkZx0X8LOO2ka6AUyVSJP7+gYER6Ycpbfhj1/kqDRjALgKWZhDiOybq6sJdrHO
 s6GIbz82arT8PYKKZT6mAdIVYa4LfZG9Azf0s85h6N82/9yYhXOUKybMdiW3ciB22K4o
 fasNLZnmUD+vhHUTr2xw57F8l3XFOQmhskNXOhsWk35mx5wXHo9ESfD/F9dVcEXhaA4K SA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
        by mx0a-002ab301.pphosted.com with ESMTP id 37777prsmq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 12:50:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw07JxTlOQxoNLX5AJKV9fpMB/RiIj49h7auUq3nBf7tjon8DpdoCOaCPt+5waePxEptBAH9QKA7+9V+O7SS7PWCQ6e59lJw4+rU1USXuUeSbOq7NBRNYa60NpamsaWBs8XZBNlNibp/FisBcYErFlRmkHySpKFpQjDX8JO5h8M+LTCdQ/PvHXowfIMAfzsWEjk6GYemTGposoiTf4wIDUCJb1gYOIAvAeBblUckzrXhhLC8sMytiZLdZgxJJRoqj5hXLn1qtzqJqExAhIJrtasNzL0ozmZA4cE5trDEPgYy6pJZk6TiecI8VIc74zpy12M8qIFhirSjhPSCS0Vmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T/LXFQSkoj/Tm3EcU1bWdJDUjh08BF2zwAuneBJ7+U=;
 b=cOsh3cksuFphFj8eHRFAODKHZI+nILQsXzjAGH5QhchFQXjTZACDKRTeSNHXmm3ixCGwkWwjS1Tfm9MnfuSOPdEGQSlxjGo6Ghpq8/aSlNB+Upjfj5fAjBNzvXpQitLxHu+JeidRgAc1+X6NOoJXsVQR3iYRZmckpbGKyJdlcl3hPHIe89AvuJxKUW5pAzQ/TeM5t0F5hH+alJNhsAIojcF7CMWbfl5HjzIXjZ3MrkqM1IEB5ET5I+GPFLBkh05P6VhSPz508S/sdXVjUdQi14ytAohP0WlaXx2uK5puxES3B+s6YF8s5dO2f+pHBJLBjtHe3E8tg8UdqnpTq2yRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T/LXFQSkoj/Tm3EcU1bWdJDUjh08BF2zwAuneBJ7+U=;
 b=i8YgIkMBp/55Ljp5HViB2xk/eZo06Zq6A59DRrlWO8eoPfPxbi15yuJnHDSIeaJ3B+BJoDfbyZu5MU+QpPbUzGI7qRJx9KgCCoI6R/BIDdUu/PvEr0gRGW63f9DTt4e3yBCcN4HSbgeThwG2XBl3wKlpU1G4hgGtiEYRX9veykY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=distech-controls.com;
Received: from DM6PR01MB4265.prod.exchangelabs.com (2603:10b6:5:22::33) by
 DM6PR01MB3721.prod.exchangelabs.com (2603:10b6:5:91::17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.28; Thu, 11 Mar 2021 17:50:03 +0000
Received: from DM6PR01MB4265.prod.exchangelabs.com
 ([fe80::6061:d9d0:b3d9:42c7]) by DM6PR01MB4265.prod.exchangelabs.com
 ([fe80::6061:d9d0:b3d9:42c7%4]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 17:50:03 +0000
From:   Francois Gervais <fgervais@distech-controls.com>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michael McCormick <michael.mccormick@enatel.net>,
        linux-kernel@vger.kernel.org,
        Francois Gervais <fgervais@distech-controls.com>
Subject: [PATCH 1/1] rtc: pcf85063: add integrity check
Date:   Thu, 11 Mar 2021 12:49:40 -0500
Message-Id: <20210311174940.23072-1-fgervais@distech-controls.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [174.92.176.122]
X-ClientProxiedBy: BL0PR02CA0137.namprd02.prod.outlook.com
 (2603:10b6:208:35::42) To DM6PR01MB4265.prod.exchangelabs.com
 (2603:10b6:5:22::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (174.92.176.122) by BL0PR02CA0137.namprd02.prod.outlook.com (2603:10b6:208:35::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 17:50:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1997d6d5-adb1-4005-f323-08d8e4b61959
X-MS-TrafficTypeDiagnostic: DM6PR01MB3721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR01MB3721BE006F7864530D203CF9F3909@DM6PR01MB3721.prod.exchangelabs.com>
x-pp-identifier: acuityo365
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YklQcc31ngpcNyS6xxaomorDb6LvE+rCHm4oOgmE3MHcUiy12s89afKCnMEOUf4aRvOyJq3XplJT0/5epZKD+gxHcG0jRdFEuDxyFT8/GCrwUVtN57q4tX5yAFwq6k2cyOK4FUrbyvcEo7JkLdMZNfoWKMiA+ZEQ5RPKclAFKdgUSmMwyjbPSWNd6aSxOAg79dVkR7c9g+K+AgLg4XY8VsTWgCxwDitQjpf7woqoHL+PmdlqD3Ope2n5EzGLUVhwZcCg/2ZpSgcXgqCeOWWew4F47//ksRuCWkvx+GTlN7VNwB5Wc5pblSJ35wrV8cOkOkkRBjvHYq/j7l2fv3Q6ZKcb/ph88hQ2BylHU4mwh3cdR+ivBRxG3ZCNgohopGXYEQNyeDWB6t6A4x1vEHfcVPiC5leL2sVMUyN0ZeObswIMlxjpPXVi7JtRfXHggZ2bs0eSVqYQqrEEAs8NHM4a60Z5cejwv6LLrW+56SEwGQSuZ4k1iKvxGZ3g6RZF+jiwBB9YalyklNS0n6tUw3UGUjL2GLuRHX5CmzPSpP+G+7wEPsVl0qvgqxHpmwBc8fbpTHgG2jrMssdRUp7o7IdF/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4265.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(69590400012)(6666004)(26005)(186003)(16526019)(66556008)(66946007)(4326008)(6512007)(478600001)(956004)(2616005)(1076003)(2906002)(66476007)(83380400001)(6506007)(107886003)(5660300002)(36756003)(86362001)(8676002)(316002)(8936002)(54906003)(6916009)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?slQYLEfkZJ8w9nhBkW79GVmuSp3ybtgUwcQ5bo/Ta/Z5PLO4tLNHD1mgu3Nv?=
 =?us-ascii?Q?F3q2ymq/lTIBfDXilAVwy+b82ntgM0D43DYEdCHrxBPJN5IKiBRk8Y0LRH1H?=
 =?us-ascii?Q?JpMH7lHnq0iv9sFrvj/4sLCLmVP/sXus7ZM3R5BhAF/4FXTeug0mp+Gwosby?=
 =?us-ascii?Q?iE9j64YQU+Cu/n9WJskt3puhhHdOCGWeP23fpSMKfjeVlFJlGuK19o89iWvQ?=
 =?us-ascii?Q?GsxOGGUeueenWrUCTjGzbg9VaKTW7u9+/QvLvU5VlyH+aD+WIDP1Xjn5Os/Y?=
 =?us-ascii?Q?GQ98QR8hP4IrqS3ne3RFJT/Kbs65DGPo0SS4MTR6K2z/Wzu0d9qCOebDEW+P?=
 =?us-ascii?Q?wse43jVonVTmdK//g1euBb31D2CmHNghheiwk49JLreBkaLlkceFBS4QHRJw?=
 =?us-ascii?Q?4/6no8siE7RjpSOJk/2bj22SgsEjozkWdnD1ONxH/fdU47rQRUJNj0iQyDgD?=
 =?us-ascii?Q?wiBq0bHSKzbBLZRPr93Bw1uqOI9bgciixw1M7xEDTri8f1Tj1ljqnNnCV7SL?=
 =?us-ascii?Q?HFTGQL3c4t7HMLhOqdoGjIrSdRNb+IE91vzKQCCgIJFXajxiE+kji9pFfJX5?=
 =?us-ascii?Q?WsygzPXjJKbN3S4r0OWMpdQ0kR8s6z+1gD6GZglO5U37MddugusrZZoHunYj?=
 =?us-ascii?Q?NsUFyPSqD4n2b2O+kYpSiDiiPOMeszRHD9ZZYR2A2eohz8XP2l1QHpFx89pp?=
 =?us-ascii?Q?Me0nFU05RLJWxeL/wY4M6EB49Kn73SJtdbA0DBf9ZE/ibgzoA+mML+9PFJ/F?=
 =?us-ascii?Q?+oRBxF7VYuxRcj+9Jmu8Z/kbnfKw+DBRjRiCMLITQrWI9z0GXF1kekWCs40K?=
 =?us-ascii?Q?40XijWtt3O7RgV80ltNlElTe+1VrTHWvDPn8rTjB1Rr4bOES5W7VlQvnSYa8?=
 =?us-ascii?Q?t1SAOTwiuN7j+nqHLmW4NWQzsR6ACHTwIYrg+Q0WByzGV0Ty6TdFZCnrZxOP?=
 =?us-ascii?Q?hr9CRJkCyW8P5SUBoseRIIaFLgWr6Jr29BNdSVgmrDZzhtVZaYY6FylYMW3F?=
 =?us-ascii?Q?2gfMnWDSUYXKwH4FYdXpIEWXVGElPKuiIn/tL1WgBVeHjZ6VuVISCXG3q/YH?=
 =?us-ascii?Q?gRSthbQkEHFoYrO81nIAwskTDnvPM8r+0uHoWiOBF5RDnZwJsy61OISoE4lt?=
 =?us-ascii?Q?z69XNukhi6QjUW2CuX5AqJmiHt90C2pX0qzaxLBHoQX0RqB3wMWKoNKe9KCn?=
 =?us-ascii?Q?N1hSO/u2w473id96Ge0/cMnJCm3zRvnSp8VIKlaJu/v3dzDL3wW73twWYVUR?=
 =?us-ascii?Q?DSH2JwUw7+ajkFsGS2gycqCcFpjh3zIU6zVgy+I8jHoEESuaVnk1nqitLAlN?=
 =?us-ascii?Q?mOLfS94sTLaFaP9lInt7aXtY?=
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1997d6d5-adb1-4005-f323-08d8e4b61959
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4265.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 17:50:03.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQJ2hO9Y4PtlYi2dgtffQ3Z7DdGHPJBcQcW+AYS6Nuap+K77FgZY4pRfL8PjJ7eZfzQAe+xkYs0GM4jGOYbKyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3721
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110091
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Sometimes when the RTC battery is inserted, the voltage will bounce a
bit and we've seen that this can randomly flip configuration bits in
the RTC.

For example, we've seen COF bits flips and then the output clock
frequency would not be the expected one anymore.

To remediate this issue, this adds an optional feature where if the OS
bit it set on boot, it's possibly because the RTC lost power and again
possibly because a new battery has been inserted. In that case, it
reapplies defaults to configuration registers.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
 drivers/rtc/rtc-pcf85063.c | 54 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 463991c74fdd..774cc4cf93d8 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -57,6 +57,10 @@
 #define PCF85063_REG_ALM_S		0x0b
 #define PCF85063_AEN			BIT(7)
 
+static bool integrity_check;
+module_param(integrity_check, bool, 0444);
+MODULE_PARM_DESC(integrity_check, "Set to one to enable the integrity check.");
+
 struct pcf85063_config {
 	struct regmap_config regmap;
 	unsigned has_alarms:1;
@@ -357,6 +361,49 @@ static int pcf85063_load_capacitance(struct pcf85063 *pcf85063,
 				  PCF85063_REG_CTRL1_CAP_SEL, reg);
 }
 
+static int pcf85063_check_integrity(struct pcf85063 *pcf85063)
+{
+	int err;
+	unsigned int val;
+
+	err = regmap_read(pcf85063->regmap, PCF85063_REG_SC, &val);
+	if (err < 0) {
+		dev_warn(&pcf85063->rtc->dev, "failed to read OS bit: %d",
+			 err);
+		return err;
+	}
+
+	if (!(val & PCF85063_REG_SC_OS)) {
+		dev_dbg(&pcf85063->rtc->dev, "integrity is ok\n");
+		return 0;
+	}
+
+	dev_dbg(&pcf85063->rtc->dev, "Power loss detected, restoring defaults\n");
+	err = regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL1,
+				 (unsigned int)~PCF85063_REG_CTRL1_CAP_SEL, 0);
+	if (err < 0)
+		goto err_restore;
+
+	err = regmap_write(pcf85063->regmap, PCF85063_REG_CTRL2, 0);
+	if (err < 0)
+		goto err_restore;
+
+	err = regmap_write(pcf85063->regmap, PCF85063_REG_OFFSET, 0);
+	if (err < 0)
+		goto err_restore;
+
+	err = regmap_write(pcf85063->regmap, PCF85063_REG_RAM, 0);
+	if (err < 0)
+		goto err_restore;
+
+	return 0;
+
+
+err_restore:
+	dev_err(&pcf85063->rtc->dev, "failed to restore defaults: %d", err);
+	return err;
+}
+
 #ifdef CONFIG_COMMON_CLK
 /*
  * Handling of the clkout
@@ -558,6 +605,13 @@ static int pcf85063_probe(struct i2c_client *client)
 		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
 			 err);
 
+	if (integrity_check) {
+		err = pcf85063_check_integrity(pcf85063);
+		if (err < 0)
+			dev_warn(&client->dev, "failed to check integrity: %d",
+				 err);
+	}
+
 	pcf85063->rtc->ops = &pcf85063_rtc_ops;
 	pcf85063->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	pcf85063->rtc->range_max = RTC_TIMESTAMP_END_2099;
-- 
2.17.1

