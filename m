Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2395918F04B
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 08:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbgCWHdg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 03:33:36 -0400
Received: from mail-am6eur05on2071.outbound.protection.outlook.com ([40.107.22.71]:61152
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727433AbgCWHdg (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 23 Mar 2020 03:33:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6NzZogAXA/JZJgCEwbxNAKsIO6v0xTn2ayrNozxLROV+jbeJFK9KbviBBLaYamlWO9ndCklTHHxlhklcntHqnzaDfxrfr17Utd0lqp/UiWbsCD9O1TwXzVCQM5rcEzYOf1RHqnaCb0PJCJuLhBUSJsdp9WH3LUntxjcedrSUCNSGtb7BUfoUh0tUCXpzBcq3pX/bZAjkNN5Y6NH0GlnGMjPDT+KwiFjtFgG2KaQGEe+Ppok5vg+C5xV2fW2/5eHd8fowSkY+Zos83Kr4s8wYiZRsP0joCtoaWnPAPY9NS/7R/wHJuhXU54lafNRwAZPNYYf27e7gpVw9C8OYNGlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ukpq8344HJhH94SoAVhLFkZD8COyRSLaq2O+iPX+D5c=;
 b=dBFUTpQxkKFyAK3GXG/FLr6MXXwbaty8mj2d18+AxzaoiU+F60xtOFKgjMHkyUgZrgYFFl8pb1DOjyhYlQxkpnEHOOdB2F0AP0YldzI52CcUbqgTdJgun7Sg8OQ4+u4rP4HQDKwX45pZWpDXJsJsAWB43wigxL+rpFtmYCtV5f/RXEgRX5wuxbOYT38mT+aLmmrK10UeRJydtvJXKQmFwMLVWiiGd9CdLus4znkb3GT3KK3EWRKhXQZcdEo1ozWISgQwddAia1fdsi/DIVROHJutjs8SKtx4nYQA7iZMS3Sui4mtQJlxuHrdULdFbBWPrhgZyPIzfSALoVJI9we3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ukpq8344HJhH94SoAVhLFkZD8COyRSLaq2O+iPX+D5c=;
 b=gzNgs2UUrwPKVYcoCVb0FLug9rhY7Tf2ZKBl9Mo8+F66ywWtbqZgA1B74F9yVzT9J1Il4ncZ5/wqbuPZ21LNZPEcGdL4kCv7L9bsvUQS92mMLZT7xeTtfiAYU+sXFG2NgmlhSMh2l1W1sk/KW1W9I3ndkpoUKBGixntBbtDIWxs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peng.ma@nxp.com; 
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com (52.135.58.214) by
 AM7PR04MB6918.eurprd04.prod.outlook.com (10.141.174.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Mon, 23 Mar 2020 07:33:32 +0000
Received: from AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa]) by AM7PR04MB7016.eurprd04.prod.outlook.com
 ([fe80::14c2:8800:1248:ddfa%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 07:33:32 +0000
From:   Peng Ma <peng.ma@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        leoyang.li@nxp.com, ran.wang_1@nxp.com, biwen.li@nxp.com,
        Peng Ma <peng.ma@nxp.com>
Subject: [PATCH] rtc: fsl-ftm-alarm: remove the useless variable
Date:   Mon, 23 Mar 2020 15:29:56 +0800
Message-Id: <20200323072956.38263-1-peng.ma@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0177.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::33) To AM7PR04MB7016.eurprd04.prod.outlook.com
 (2603:10a6:20b:11e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2PR01CA0177.apcprd01.prod.exchangelabs.com (2603:1096:4:28::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Mon, 23 Mar 2020 07:33:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.73]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6843104e-df09-4016-7130-08d7cefc7cd1
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:|AM7PR04MB6918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB69183CD41D7AB089E7F90A74EDF00@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:248;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(199004)(69590400007)(186003)(16526019)(26005)(8936002)(36756003)(52116002)(81156014)(478600001)(8676002)(66476007)(66556008)(81166006)(66946007)(86362001)(5660300002)(44832011)(2906002)(6486002)(956004)(2616005)(6506007)(316002)(4326008)(4744005)(6512007)(6666004)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR04MB6918;H:AM7PR04MB7016.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BDJHR8sX0Ph7uavWEkYTa4V7U0cZhAaQMRGsA5m+Nq7uJBPUi5TwV6hSOKdn632KrcY0icx6Gkfw6mupW3qFCUED1hWQSpdqCij4MUVB9Aw8It8CXEqtMHTbDNUAmGfQ/FE5KCHsTZQGX/wm0UjDUq+Als9bsXAHhQPFIjTAn9cWZ7wvBqRQIvnRZfxJdFH5I4irDMlm2IlYKpuDtLNdwvkj3PaWsbJh3Gx8IM4wosYI+fpLGyI6hvy5Fj6It6iQaC7J2e5s6i/ltRiZsJHx/Gvk40Aul4QLkkpl3xS0FOqjWEbCZ27ESj1slCx4kn9iod5MogzP6I7QBLIu0cXHib306ikDRNxSbomvXRRlpP/CRgD02x+qnbsidoNGWgOoZBck1EYaUR8PH0P836SACyx3xnSVhqExutb87ZP0FF3zluWAIjzAalLWUESFtiJlSfnNCw6DJR8kUHt/TQ+lVOVaW0fLDN/IVlt4PSEUwhF4nDdcIMv0E+OsHp2a7nyI
X-MS-Exchange-AntiSpam-MessageData: Nel2OxYpGr9LI5pWn4NRPowbAsSLGNdFHPpcBj89aekBl01NlbOXHP8g5u7EsK05B5o17PglYHc1wFWTrIA17ywJElHKukxgmVL5d7LpDx+rtYPfydSCq3BXTsC5p3KpDE76J8NjA2UgSzN4cdrftA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6843104e-df09-4016-7130-08d7cefc7cd1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 07:33:32.0541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZ3ob7toETr/pnR1elrCHTtoRa7MlAWBLpbLDA5Kog2VTKAO+6+x4NrellvfobiO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Remove the useless variable to fixed the below build warning:
drivers/rtc/rtc-fsl-ftm-alarm.c: In function 'ftm_rtc_probe':
drivers/rtc/rtc-fsl-ftm-alarm.c:246:22: warning: unused variable 'np' [-Wunused-variable]
  struct device_node *np = pdev->dev.of_node;

Signed-off-by: Peng Ma <peng.ma@nxp.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index c572044..0f4142b 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -243,7 +243,6 @@ static const struct rtc_class_ops ftm_rtc_ops = {
 
 static int ftm_rtc_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int irq;
 	int ret;
 	struct ftm_rtc *rtc;
-- 
2.9.5

