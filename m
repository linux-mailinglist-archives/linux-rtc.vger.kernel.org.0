Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6C73349F8
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Mar 2021 22:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhCJVnU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Mar 2021 16:43:20 -0500
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:29602 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232058AbhCJVmy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Mar 2021 16:42:54 -0500
X-Greylist: delayed 1895 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Mar 2021 16:42:53 EST
Received: from pps.filterd (m0118794.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12AL70Sl000506;
        Wed, 10 Mar 2021 16:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : content-type : mime-version;
 s=pps-02182019; bh=eO2jkEqWaS8YS+gMdiS/gOzdsdWdvABn2hslfDIptOM=;
 b=qXw8Hd1pZYf3obg2E8ElpSLemVMKAEfPanmkUJpv0+8HGxlyEDqWGd5ZrA6OE0iKhbiT
 uk/mYcsIuAIwKhpXW6YhWrXa4StSVWFt2dvES94KoWkAZ9oIIJods0REyjAsTVeKuV4x
 n+lYgbJvKo0Fv7EGYozMxGCzPLj7CreQKAkt40vcFNfP8PAHWAwjyLW4RqpRE40US4Z4
 LlzUpmscN045R6mRYrxQIhS6ykV59BYwlSxuHF8kp8daiKQCvkBSesLYPNAHuvjfhO9m
 +/T8LhcSHyEjTaDtFLgTsLasImGk7KZoCA7fCCJTQgutbUy4Ke7skCIIbWet/mkzSl4H ow== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
        by mx0b-002ab301.pphosted.com with ESMTP id 376muy0vbd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Mar 2021 16:11:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8fiZCZaNZsV9ZC777Lol5/Bm7Hj1M4/x9cdDc3TDFKTQSDS9qh8HuEi1hfy1hAgelCT4gH5hk6hl4W6IlCOizx+BkgqItfTWhr1gtFcu+dcgSTqFnmV3YusZQh2K6bu7WvSeSN4Kxb1E5UYUJskIY3+jj8WxgwbojtfTwsVw+56a6BtzQ9RZqDfE/uJbZd/BgrxQ7RjPyGEK97g2EPYem8jzff6aGCvS66fbR8C+s3MSD3zFuf1ttloMswu3vcMnEC7oYQX9ym9k0yOaQ8S8Wfg9xxhgxct94xToSU3YK870e6a8L5ff6/NjtyeJZCHgRE4560NgoK5cI7jszmwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO2jkEqWaS8YS+gMdiS/gOzdsdWdvABn2hslfDIptOM=;
 b=Ku1SSFNeo+ppWSfJtzFab5uXCtPMt8WLnxcUlOn48XtWX8aLDsGZhJvxlTk2jioyiziCgmP14mopnrIy3mcWzo7V+N0LMV/yOm5ICRQCbw6R3/0pLLPTifibDbkjzIariv3MnKRAy6YMuE/yNypLAsuYQXFVtGDyNI7PYSTDYqL4/Hdk8WShYI3RcrhCcNf1Ts74SYzFwIL3NeXoyUj17yg6DEZdH3cHBGLj9zruG+OfNSTE2e2Wr+A8bQ9pbQmZ7Qne3joY6VFPLWIyR8gozHveX1PNhr3ki8H2iv4PUZQv6+lFKEEygXApqedD62LcsH6QQZC/CMJ3iYyPi5EIhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO2jkEqWaS8YS+gMdiS/gOzdsdWdvABn2hslfDIptOM=;
 b=VcrwN9qF/lHQBX90FOTRKdzNWqod11qoxDOZNo1j7qgLyIkiGm8vPgeV8iK7q89uo99mV4epdZur8xv4Qw0xJOVKeVn5X4PLa0JGpZnQdatU7hNCLWSuo4i1kZWgsiNRevWywwdZcucJPotcPBp5upWSU6fVj79kWa+gct+adYo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=distech-controls.com;
Received: from DM6PR01MB4265.prod.exchangelabs.com (2603:10b6:5:22::33) by
 DM5PR01MB2426.prod.exchangelabs.com (2603:10b6:3:3b::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.29; Wed, 10 Mar 2021 21:10:59 +0000
Received: from DM6PR01MB4265.prod.exchangelabs.com
 ([fe80::6061:d9d0:b3d9:42c7]) by DM6PR01MB4265.prod.exchangelabs.com
 ([fe80::6061:d9d0:b3d9:42c7%4]) with mapi id 15.20.3912.027; Wed, 10 Mar 2021
 21:10:59 +0000
From:   Francois Gervais <fgervais@distech-controls.com>
To:     linux-rtc@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Michael McCormick <michael.mccormick@enatel.net>,
        linux-kernel@vger.kernel.org,
        Francois Gervais <fgervais@distech-controls.com>
Subject: [PATCH 1/1] rtc: pcf85063: fallback to parent of_node
Date:   Wed, 10 Mar 2021 16:10:26 -0500
Message-Id: <20210310211026.27299-1-fgervais@distech-controls.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [174.92.176.122]
X-ClientProxiedBy: MN2PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:208:fc::31) To DM6PR01MB4265.prod.exchangelabs.com
 (2603:10b6:5:22::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (174.92.176.122) by MN2PR02CA0018.namprd02.prod.outlook.com (2603:10b6:208:fc::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 21:10:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f1953322-bfb9-454b-515b-08d8e40900c8
X-MS-TrafficTypeDiagnostic: DM5PR01MB2426:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR01MB2426A0199573A59D048C9026F3919@DM5PR01MB2426.prod.exchangelabs.com>
x-pp-identifier: acuityo365
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zcqCg8hSvKs0ztl6itqi551/MbR5DHJ95ytEbCqebYjGBUkdDyh17nPDqgWWkNwhaLxy2hOppfe1rFkR3C2HiAIh2Gf5dJWMRXpTzsTjiZInwoYC1K4zINS4yoTsbFfs3OXIb7bhS66WbKSGGbg/i/hvgKQFaHS0a3kaEed2h6TVYFToNOvSgZ2i+YyGvLooChzuo7CKZ4CGUk7ibtrwA8uJ0Q3awZN45Q1KR8NwaBD0ZNMc80wqQ5TIXmzlRSXzLHEdDUCyEO1hL8SeIxH7Z3/UGJq5KtzvkWjK7xR12oKaNvRsBS6lCD9TgsWep5LTwqwXeaxcV8ciFKJiCJLO9x1KROH2ETd++y4kCBUnAIzpSKt/tegwoXF+aejz7/ql8/bhvLYu9uIZaLdiiN6OP2RCHWDJeqZa4xHaq776LVlUNowfCbPMP7jm9k4LW1QgvNe9ui2Rjfl5fsff/Lo1HDoTqmMct5/XGqpplchxwMTHouUiy9j3v473jVy7mQFcgWEwvIFWQ9FLE1Ld1Dl0WKHOsyvdbUDi/B1KAfYejw+GPt5cDceDlo5iikTRB2UTJL1BStd3PCekVCiaGCLpKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4265.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(6486002)(36756003)(52116002)(316002)(8936002)(6512007)(478600001)(26005)(2906002)(66476007)(6666004)(54906003)(66556008)(4326008)(69590400012)(6506007)(2616005)(8676002)(5660300002)(83380400001)(956004)(86362001)(186003)(16526019)(107886003)(1076003)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NZYCMaWPmzJgJdjEY1VOF3TPTos5uo4HFYFP+p4zEo3xhr15Uua2Qm2dePc+?=
 =?us-ascii?Q?IUFVn8t/GDG0ckPNTjKItRFdFMG4jFESpX/6hGnKL0iDEdMYGVZaeH99Lz6L?=
 =?us-ascii?Q?DtmxVlUEm+H+6ix+sHL1Jlj31PqAnnLGGyVJdn0+Cxekdum1jjqV82R3Wfng?=
 =?us-ascii?Q?73AvCc/QF6/mwmri0N9k5bVjwel3Z1lk2RtZhLsq43AZw/ZjzB3TacUwLzIg?=
 =?us-ascii?Q?71bum5rzfbAK8PrmTtKUbaQHHHQXmorKQ6p1m6CR1qGykBC0/TPqYn/KAP8p?=
 =?us-ascii?Q?03Q9IyUQlM04qF0HZhdrSQM+UngR6U1CiW6xHpACjw/IsRGej1Ft/8Q29Hm7?=
 =?us-ascii?Q?GHYOcpJd8wKlvAwLZfdL5w5k1Gm0yhgARSvD4vgo9QspC7Y/hDwtmurIZvo8?=
 =?us-ascii?Q?aLT2R7e+hk8plev0CJilxbhiOz9dRoH+qoyvQhg+IPeFu+/FeQPz2ipNjKhy?=
 =?us-ascii?Q?5SNUYi6olvNSOW83nBmENSmofiqOvDEOFDSGQkgVnOsQZ9YJ5sVL2FhJ0IWN?=
 =?us-ascii?Q?Mu97Vjh2clG0vYWmxlNUd/q3sOi0CmVRgTDy4Dn2wkRk4zLlgALeTgpXusY4?=
 =?us-ascii?Q?KzXILK9lKF1zYIMPME7z3uNKx0sItmL5gPNvxw54TU2YEvi+HKM5KgDoe3Ls?=
 =?us-ascii?Q?Ep+Ht3/dYs0vUqVo6zgTwsUuokKCPw026HAJtanX/zbTv2VUycyODIdrKkFd?=
 =?us-ascii?Q?Qhzomtrj2yLTHom/qIm2XOVpBDqYNXs9i6ywtid7s92sWVdQx3vE4H866vDY?=
 =?us-ascii?Q?p+rB1IASVmV4SwWVhl4gw8oLSz1g4rHLDoxYindQQ2pseki8I1ord5f+bK8E?=
 =?us-ascii?Q?ur2XEcCyoThy7eaFuacQygb032m4eO07ox3KBFm5SZn5aBpFxDP6Um1tQmPP?=
 =?us-ascii?Q?skDIPHzoyu0IHJ15FY3tKh7dnV9H1lTNf0GeTh+h3uHb+ijD/BsULP16LNQu?=
 =?us-ascii?Q?YXh1k4MccRLZvBjYVVLI0J0cqwPRIM73Ui15xKuZ8KWwzObKuz1h7S8/6WI5?=
 =?us-ascii?Q?g1ByQBCAPEKajhDezSkUwAw28qWjf1mAPpURtur9fRaJsXW5jnNfg6cDtEhH?=
 =?us-ascii?Q?sPyoP9+5yabqQRzFxqwqwbjvhRDLZou9cQdUksWnySyU87KbJCjqxt8K5qju?=
 =?us-ascii?Q?qNUvhQomJd3ZscCPyDTljPykETuiM9+g4F2bHLoFvSArq9iD+iDB7jugPUO6?=
 =?us-ascii?Q?RGpNvpoHHHLGznrJ+QtNFPmsodi8gGVWJ5uwaFpHQGOYuj971Q3Ay7xbxmVZ?=
 =?us-ascii?Q?ur/RlIlt0hgRGi7mkuKw+erSIoHjBuKKs5XlNr6jZbve3lhrEN5J3kVvSSfD?=
 =?us-ascii?Q?Yw9+Cgsssv3JUC06rehjrZYP?=
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1953322-bfb9-454b-515b-08d8e40900c8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4265.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 21:10:59.4280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAhT22ajoReDEsTfNZC7ShlAZg6CNYbJIL8AfiCFRoVL14ZDbEj5pkZ6GfDG9ydiTmEz5gahMGBNDkofFwLmVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2426
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 priorityscore=1501
 mlxscore=0 malwarescore=0 clxscore=1011 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100102
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rtc device node is always or at the very least can possibly be NULL.

Since v5.12-rc1-dontuse/3c9ea42802a1fbf7ef29660ff8c6e526c58114f6 this
will lead to a NULL pointer dereference.

To fix this we fallback to using the parent node which is the i2c client
node as set by devm_rtc_allocate_device().

Using the i2c client node seems to be what other similar drivers do
e.g. rtc-pcf8563.c.

Signed-off-by: Francois Gervais <fgervais@distech-controls.com>
---
 drivers/rtc/rtc-pcf85063.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index aef6c1ee8bb0..463991c74fdd 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -478,6 +478,7 @@ static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
 {
 	struct clk *clk;
 	struct clk_init_data init;
+	struct device_node *node = pcf85063->rtc->dev.of_node;
 
 	init.name = "pcf85063-clkout";
 	init.ops = &pcf85063_clkout_ops;
@@ -486,16 +487,17 @@ static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
 	init.num_parents = 0;
 	pcf85063->clkout_hw.init = &init;
 
+	if (node == NULL)
+		node = pcf85063->rtc->dev.parent->of_node;
+
 	/* optional override of the clockname */
-	of_property_read_string(pcf85063->rtc->dev.of_node,
-				"clock-output-names", &init.name);
+	of_property_read_string(node, "clock-output-names", &init.name);
 
 	/* register the clock */
 	clk = devm_clk_register(&pcf85063->rtc->dev, &pcf85063->clkout_hw);
 
 	if (!IS_ERR(clk))
-		of_clk_add_provider(pcf85063->rtc->dev.of_node,
-				    of_clk_src_simple_get, clk);
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 
 	return clk;
 }
-- 
2.17.1

