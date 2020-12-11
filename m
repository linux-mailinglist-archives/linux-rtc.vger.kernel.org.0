Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4B52D8167
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Dec 2020 22:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403955AbgLKV6J (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 16:58:09 -0500
Received: from mail-am6eur05on2117.outbound.protection.outlook.com ([40.107.22.117]:12449
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394236AbgLKV6A (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Dec 2020 16:58:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKucJOXkB+6syn5jKl6em2QhN+4sJlCov+Q0x6D+5hUIcWLDntDx04NCzFy0UDspTCT1+1DVzCorLR/ruueUYpu5IopZGDn5r9NJKI+zwJRsKiedb77e+W9OjTmyR7PYPSsiFwFytRQWgIyPe5W54xeRE8gtZUsp8E7coTxMAUFOS0fcXQu9NWLSYI0sob8f3Po8mWo4mAiX1+g1epSFWkTLM1B6SOLtGdHEjJvoFSFBNgV7xOOVbsF3zF1I86Rb/9+hHX33fCuWKhl7IGL89LCRokpjew74PSTtbizGxw530g/v2VPFdjvy8BouSy3HXWjysCv2m8/usRj9AqbjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IuQls83uksmdqSHXulflSP/+yulhVT2K5WCFA4WO4A=;
 b=e/P0WySE5hV9cf3Ohxthivh1jImXFYbjDRxyKZraVekNfX49XEYuEoadNCuE8c+ps9WjNnp4MBcbI3dF/JpCvIXWzHyMYjMvQfkvDg4HNZxDPNFiI35U/VGIsRnDAOxbYpDqPnhW1oogkg9LEPof7Pfvhh/CJY/KzBIUu3E5OvawsDNIkua8dFnDpjyP0lciKLl6d8Kq6VRxi1rXns1eqr42uUhYnCz9pT9DKeUpelNxVrGqFRrPfBmFMNTRNHsP9Z9OdOjV1I4uF9QfMDLaAzphMz2VW1HZ1jxx2d5wwtX+4m3uozuoHnimtAjfzkb09eNVzyLVdHj2LAS1Nv/Jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IuQls83uksmdqSHXulflSP/+yulhVT2K5WCFA4WO4A=;
 b=aCNknbCo26GPqYgFIsf3ySL9GGHg0bvXuv6QoKzE6p+pM+TTQhjUYc8O0CtFPw25T8cNarh+akR4Pz50xhJ0QN2zNctjsYn2LfSKUc49yddEnWE1ooF1DMW4LZvhM1gKB/9zcK1YlmEHwli+AzYh0+d4pC3l5T1AN/EcfO2MjsY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Fri, 11 Dec
 2020 21:56:22 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.026; Fri, 11 Dec 2020
 21:56:22 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2 3/3] rtc: pcf2127: only use watchdog when explicitly available
Date:   Fri, 11 Dec 2020 22:56:11 +0100
Message-Id: <20201211215611.24392-4-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
References: <20201204092752.GE74177@piout.net>
 <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6P192CA0068.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::45) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 21:56:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf30c89-bf9f-4f35-3b1c-08d89e1f996e
X-MS-TrafficTypeDiagnostic: AM0PR10MB2867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB28672381D19A0924F433FB2A93CA0@AM0PR10MB2867.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4A4AGJcmP0EqyB8PxYgJESK8RTskBVvp6ji7sBt1mjkgdifN4kd7IDSeLoluljsKRajE47a13klQRySpmYCfFVamgbWy8jCtu8ZZFCdvEqMdrFqxgb+tIqR2z9PROkOvRSa6UBoBULi4xrQVexaFBlDe1dDrGw0WBa/+B2Sj8QzfE8+mW41DBmCTEMaB1yMpiIDcpjp+SDqXsh1YOJkRwU5OUIeEKtHAM/Rk09t30KIoQ1XNmQDbZqKQzl0ZFx6Kh/KViI0n33hjQCT7apkPqKqkRckplvIdk4+e+NFJFni+Bjf4u7T8m0+Z4WwYUhx8yTNDc76HE8NQalOo1mDiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(136003)(376002)(39840400004)(6666004)(83380400001)(8976002)(66556008)(6916009)(2616005)(4326008)(186003)(107886003)(8936002)(52116002)(66476007)(36756003)(6506007)(54906003)(16526019)(66574015)(8676002)(478600001)(5660300002)(86362001)(66946007)(44832011)(2906002)(6486002)(6512007)(26005)(956004)(1076003)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a2JVU3R4a21zYUZZMDRna0VERzdld2xDSlAzK2dGSFlSSEIyMUFZR3BCNDdS?=
 =?utf-8?B?UThRR1lUU3Y1b0piZWFMSkx4VlVmZ2pOaWhScXRxb05CTDlDZ3NtOFBjTkQw?=
 =?utf-8?B?NWpONmFucFdrZGtOQ0x1YU0xZE53TU1rc0VwVE43N3VFcS9yTTlLSkFCeVVV?=
 =?utf-8?B?cStYZGVyeER3WUQvV2tQNXhjd0JXeGlYRHpWSFN4aUhqQzNkeHdPU3M4dGZz?=
 =?utf-8?B?YlZPMkFsdkY3TFA3c1hRNlErMTVNY1VUK0RzL3p2cE5pdzU3Zjl5SHhvRkFm?=
 =?utf-8?B?THJacTg5SGNKZXBKMmMrTjg1bkNrZ1RLYm5kWWsydnI1OGxublFvY2pYQ3NO?=
 =?utf-8?B?T1c3RGJzeXJ2dVFsRjJiYzQvelZta3dFRDRrclIzS0h6aVBBZ3prVHRmdnRv?=
 =?utf-8?B?MEltL0t2TTFKRHpkd2JEMWhTU3dUZWNJZ2hmZ2Y5RDFidmtGUEswZHp1QkJz?=
 =?utf-8?B?cENUaDhFUWkvbEt2ZEVqSFlNV3RZV0srQlpidEhwYkR1VmpXZmVKUzNLUWhS?=
 =?utf-8?B?R29CaTUzVFFQSm12Y2tZZlZrcFlxNlh2SXU3alpPeXF5dk9ZdXZEYytVQkxP?=
 =?utf-8?B?R25jbUg3bSttWDN3ait3WEJnL2t0U3Ewd0czcmtXK2lDeDZ5cHRZdGgyeWF4?=
 =?utf-8?B?OWRYRFM0bkk2LzJOVDlZR1pqeEVRMWNVZlBtSFduZmxKUVFWKytuTFgrYjNj?=
 =?utf-8?B?MytSWTU0UHAzYjhKMXB6eTBySmgwVjBSOThhcVBUSUZmbjM1eVBXNFE5OHBu?=
 =?utf-8?B?cVhBNVdiZkNMNTVSalhuZ21PT3RpWmJpSDdYZVd0WFRtZEhGMXRzS3FvN3Fu?=
 =?utf-8?B?QktqRi94eUFWbFFGeml0ZDRmcWNYZzhSdDd6YUg1OXY0Vmc5d2Q5L3hSTVpY?=
 =?utf-8?B?WjYrWmk1SVNwSXJUbFo1QzdDdkg1T2ZpZ01TRnA2ejc0QUt1YUphUlQ2a3hq?=
 =?utf-8?B?dkxRTXNYQjgwSWN4VGJrYXBab0xqUWxaYi9DNTNkeGpjeUNXMU10Yy9FeVRy?=
 =?utf-8?B?cHRlR1dMQnFMM0U2cmx6TnpLT1doWFYwSXhuRVhoczZBMnkyVGxQaTQ4cXRI?=
 =?utf-8?B?U0VRR0VQZFNLNWg1RUZ4bFNtRk45cUZJRDNBdjZJaFczcmJTQVFjWUVYbloz?=
 =?utf-8?B?U3IyTC9LaXNBMXo0RlRRWXhpTkRUcTB3eGM1MmxXYjk3cEZ3MCtPV2hMTC96?=
 =?utf-8?B?YXBXbTF3dm96ZDlPekhscWdUSWYzU2Z2N2xUZmIySHJlWm4zRmpPdWNXYUtq?=
 =?utf-8?B?R2pvTXE0eUhlWGc5UFRGZ2N0VGlPY0t1b2wxa0swc3pLYmN1K2hnTkhCVjNa?=
 =?utf-8?Q?6D5wnbQSxa+EYAF2ACHRxzOutgNrEgm2Ax?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 21:56:22.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf30c89-bf9f-4f35-3b1c-08d89e1f996e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMGQPeAedDzmBXFeoUmKvc2DtNAQ8JiRs8mepgSo7EyQTR9g8N1PYdV2vvwkfblax53LEKj2XX/NCjdTS0LZU8+Zv9ni+UEle14QEyotBYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2867
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Most boards using the pcf2127 chip (in my bubble) don't make use of the
watchdog functionality and the respective output is not connected. The
effect on such a board is that there is a watchdog device provided that
doesn't work.

So only register the watchdog if the device tree has a "reset-source"
property.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
[RV: s/has-watchdog/reset-source/]
Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 drivers/rtc/rtc-pcf2127.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index aebf85fcc328..f3d4eac4f230 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -340,7 +340,8 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
 	u32 wdd_timeout;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_WATCHDOG))
+	if (!IS_ENABLED(CONFIG_WATCHDOG) ||
+	    !device_property_read_bool(dev, "reset-source"))
 		return 0;
 
 	pcf2127->wdd.parent = dev;
-- 
2.23.0

