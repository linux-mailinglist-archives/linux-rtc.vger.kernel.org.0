Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52762DE0C2
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Dec 2020 11:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733164AbgLRKL5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Dec 2020 05:11:57 -0500
Received: from mail-eopbgr130133.outbound.protection.outlook.com ([40.107.13.133]:4321
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732938AbgLRKLw (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 18 Dec 2020 05:11:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfFHDdSzCS1oRwDaHfKJdAXIAiALAm3w5cUXgqlLj4rL6Qoz9V9BHyu1ifI7idIQ7xnViat6wX3uUlHKlFec26Z2KEGjaLkvzptRfIEvwi/kFxGQ2Spto6ghO81u1hq4F1VWr5YW0Xoossw5vmLskw0dNcGlx/kU+VUUTRvyjoMz1+RKF+3jSDoIbGU0q5B3UCGJriR1M9iPLCnhVanRDb+yyYiPd9mkZszvi1bS2UGyYlQpK52FNLfryzZG4UhvmsL4PeD227CyAbiZI1H5d5Mo0jN8gQsALLPxhFez+7BXDZ1GZIhC+KoaqKifpzLv4mJLq25qn036bScXvid/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRs+mQk8DNC8Y8r5t9/py11tIvb0dG2/A71Hg3Ng8Pg=;
 b=A5Od9yKH8SOYHup/bNBk6ka1vnCsl6X2Y2vwEVihrL0Y0I63tKuljg7vJo1xNcNEb7LD4UcWr0++r2gaAEhGg0BNZ1+33P2rl5sd/erBVpFK4LnzOSyE7ZRfghGnBPWN/VOE0Waltrk6kMYVeONw3nXcmAxqWfHnbjUK3cHySRpz4oHTkm+GiBOnqviHbO9pDV08XuN4QDJ31ZsrYOI3zKWFTCMSiohzGyPCn6JB2xqSu8wH4PIeUSBHHvmRBbemUhiF47ekjShYUjkkt82q1MYKMgvREb6JfixD252411vG2oU/h/nsQNv9ZJuZlulR882GhjZ9vF82dlc2NetHTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRs+mQk8DNC8Y8r5t9/py11tIvb0dG2/A71Hg3Ng8Pg=;
 b=faF78xSoLyCpwtRw3bPMgFyZIc9NwpzyRuMEopSrmmwV3cTxWPtMnuPbgBOHOzc6bhTL66BUutBMjxvXrnFklDloU01GTD1+JkVEz3YoC3aQrEDMlm1N1RF9ovjAq79XNpYTQhpyg8KgBUimP16V9VNKCeNFx58HNmUVW3rf9gk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3172.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Fri, 18 Dec
 2020 10:11:03 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 10:11:03 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v3 2/2] rtc: pcf2127: only use watchdog when explicitly available
Date:   Fri, 18 Dec 2020 11:10:54 +0100
Message-Id: <20201218101054.25416-3-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201218101054.25416-1-rasmus.villemoes@prevas.dk>
References: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
 <20201218101054.25416-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::20) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by AM6PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:20b:6e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 10:11:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c77465e-ef0f-4ba3-d45a-08d8a33d3a20
X-MS-TrafficTypeDiagnostic: AM0PR10MB3172:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB3172544F447948F03A64992493C30@AM0PR10MB3172.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnVkGGDQV8M7txAW9tIsunLakkMLEr2QOCW43o+WnNHT1YdVglR9Cr6XuUy8GIio9oF18rql6O+Y45eujB1jc6YbL2dLzFSMJMzIKQBkYXGo7ECyB8f5TLlQcIQ98hgBhIQntzFM5VIlbeHohXenHqiX3BrVLjtu9RlYR7m/4CYJVYNOvOBfD7F00VvwexCvC4ow4j2KNQyO2uriqKsW6qDxaO+SZPbMfXrShf7Z/urkXzOrRIpNQCBZRxgeZVgXIXOnUI+CSeeL3ZqYk9m/Cup4PydNtb/MGhhRnWz+QU50JeXw2B0XMcpLDsXI+EBkR3/KR79SDMiLuBf/vEpBSP4RIZMPgwfQi8nUCkyF4sibCNTnZQF45yUXiBTyzvVFgGniuMa3BUGc8bix/wMj9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(39840400004)(136003)(376002)(6666004)(8976002)(66946007)(54906003)(186003)(478600001)(16526019)(8936002)(2906002)(86362001)(52116002)(66476007)(66556008)(6486002)(44832011)(83380400001)(26005)(4326008)(8676002)(2616005)(6506007)(1076003)(6512007)(36756003)(66574015)(6916009)(107886003)(956004)(5660300002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T1pLbVpLZjQvZGY2OUxYRUNMbGdtb0FsRHJWVGFYL0paNnlDZW5VSHlYOHRB?=
 =?utf-8?B?OFNMRkJZRzVVWWtxK1M4UTk2QlRDSUZBcnRYUitlWUZQdzhsRzRUelFsOEwy?=
 =?utf-8?B?K0k1SDV4ci8wbHNld083QVNXTDRpbWgzMzZuR2hhRjBjSFcyUmpYUm4yZEFD?=
 =?utf-8?B?ME1EUko0M0dmNWRhdjJtdHl6T2l0U2JwTS9YdmlZdUkwRFBJSUlNWVRCR01N?=
 =?utf-8?B?U092Y1RwWXUrYk5tZVZXMG9HZGRqbXQyOGdJZHkrSHNDdDZiZVdhYWNZTkNC?=
 =?utf-8?B?ZW9mdEJmcFJJNW9ZeTJGNS9KR1BRZTFrQ0M5L2ZIYkJKMG5JbytjSUtmekNn?=
 =?utf-8?B?RVIrYVI3ZFhNa2NFSk90R0pTY09Hbi9tQktadk5wUi9lWDNlb3IwV3FnelpS?=
 =?utf-8?B?cTd4Z0dTRTFCNDV1YmE0bHRHL2lRZk1HUm51NUl0d3FNdnJ5RE9Uc2ErMUt5?=
 =?utf-8?B?WHl3emJRM3FpL3pjZVAzOXVYM1Fla2k4NVhCdTAwbGdEL3AxVFdiUUxVbzdt?=
 =?utf-8?B?bGdtM2xzSEVxd2pnY1Z4ZmhVZUNhZEJ0b2hPT082VjNGN2Z4RWt1QUpHWTRp?=
 =?utf-8?B?aVdBSnBtcHpYQlEzOHpWOE9ZUzlUcGxiWTVKd1pRQ2t2ejFOM1IwTDJZK2Fl?=
 =?utf-8?B?ZDVlaldxNFRURWJBbmpzQnNzQkdwN05NdXU1c0E3b2JnNGNQdjY2ZzJVSG1l?=
 =?utf-8?B?ajdKQlRnZVk4ZTg1Snd3S1M3dWhBMVF5OU9MWU0wZ2JDMndlTEZRbDFkQVdP?=
 =?utf-8?B?VWU4Tkp1NjBCMnJwbnltVytXR2ovd3h0Y3d3NXEvSFRNSElERWFjWjlJeVVk?=
 =?utf-8?B?Zjg0Q0dJVDV3Yktvdi9aTjI0TU9zbElMWjdwZSsySkdWSUthY2ZUZFhJeU1W?=
 =?utf-8?B?Ym84RzZnNW1LS3dKWnh2OG4vMHg5ZVRxZG9GR2p6RGZaaTJXTVdzbGtXUVZR?=
 =?utf-8?B?RDVxSWRDVTNFVjlpMUpCSFBNSlVQQ0Yzd2VpbG92cXZTQi9vVytiQzJNeHhZ?=
 =?utf-8?B?QzFneFhYUHhrNUs4YlJFeGxndmxvWCszamRjNlpsczNPaGd5ZzFveUhlU0Rw?=
 =?utf-8?B?NmJCdFVHVCtvZVg3MFkxS29PV3QyUDJkRnlXQ09wbklIRVEwVkF4VUl4TmtR?=
 =?utf-8?B?Qm9VanMrYlVNZUpuVEtzWDB2MmRNVzE5K0h1NGd3MGE2d2E5bGNQc2lPSDRJ?=
 =?utf-8?B?cnVzLzNBZm93Vit4citudlRBMndwejNub082RjhCalNTVEs4UHhlUTh3R2wx?=
 =?utf-8?B?bWxnYW5WNDAzdWUwZnlQdVRQb0tKTlpHc1VxY3ZmZFhZL2hLWmpnRDhZVFpX?=
 =?utf-8?Q?JSLD6nkDHhIocQ+Xt5TrpT9eDXAlwr+/a+?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 10:11:03.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c77465e-ef0f-4ba3-d45a-08d8a33d3a20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRXram6VNRmFt9UhVP//ZiOVCX5zroXs2GOFg8JGyEwXW/jyHhmMkEDCG29I5aSuPU5YpicxObXLz/pfOHnfnJMizjm6H3hqJZ28/LwIftk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3172
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
index 33fa8b17b79c..39a7b5116aa4 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -336,7 +336,8 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
 	u32 wdd_timeout;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_WATCHDOG))
+	if (!IS_ENABLED(CONFIG_WATCHDOG) ||
+	    !device_property_read_bool(dev, "reset-source"))
 		return 0;
 
 	pcf2127->wdd.parent = dev;
-- 
2.23.0

