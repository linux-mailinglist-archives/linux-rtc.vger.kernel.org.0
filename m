Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F09D2D816A
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Dec 2020 22:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394730AbgLKV6I (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Dec 2020 16:58:08 -0500
Received: from mail-am6eur05on2135.outbound.protection.outlook.com ([40.107.22.135]:29369
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391577AbgLKV5o (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 11 Dec 2020 16:57:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBzqcKbMNF85c+4fwjS0YNfbUN0PmXTgZrDFaMbXY+rkwPL6tLagNfAnVO96SZlNFp/eMqs4cK9QPb5ejRP1v1Bv0cOfRrzuIkgJten2CWT6p8Gp+i7/Oz9VWrf7BkrrPcS9w5NyYE2OuYMHia/cA0QZrdN8Bxc7M5j6sS9fyoj6i/qHip2Ae8qv45382K3io/+GGzGcertxu+7IZ9cBo2FeiX5rRPCo7n633Ako7uY0Seb7sbZQFual0FohclizEqHEPgxE4d8QrIcL6tbrJg7t0PXIu8xH1Em7iKMq3IJpnDZk3Rjok5q16VsTA2BE64LgYhmKTZfa9yUewj7kEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4es8Xp8ZWbRNQqUOLafPiQCgvpcqeW7saZRC1vVLFM=;
 b=KaGHlxtdXlfU1G2c2toHzZPkf0aKs4LxK15FNnOqwv6QNk89BiUA5anttdBXJyRf2PV/bmeeAAoJ+jyYIFjaBhL6UaUDg4YfOdKw5SegwL0t0vr36kT59t25mM730WGapwVM+gdDkqNh6QMI6w1SSG3T+KhE3SQyJkbZzpmdfyTRyZxSUNt9HnFhs0sRwRrHOM2/a62TNF6ipe3N3J5pe0vZbMaBIVbytvik2vuOlOZHFfmB5xnGUD3an5Kvzd9CCxErhQKuTB00goUQHyGggVGab5qL9z7ffEvjGk8ik1qB5GtqJMkS8BTkeInzWag3dXReGtoGDHnGTBHz6uuA6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4es8Xp8ZWbRNQqUOLafPiQCgvpcqeW7saZRC1vVLFM=;
 b=I7Is5RfoPQmHoWFnefNMGHv+TWysAcjkcmF6EtaEI9nUqmgQZDiVBjp/hKQq6BpE0pQIX6RUi/Eyure9RKmeKHocHj73RR2QOyb9InPr75LbAWLlzPWAgr6mGF6iBo+b+Dx6YtCkIVI1FeU9WkwkK0XyknkMpL5oU3CQ3PW+Z44=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Fri, 11 Dec
 2020 21:56:21 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9068:c899:48f:a8e3%6]) with mapi id 15.20.3632.026; Fri, 11 Dec 2020
 21:56:21 +0000
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Qiang Zhao <qiang.zhao@nxp.com>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH v2 1/3] dt-bindings: rtc: add reset-source property
Date:   Fri, 11 Dec 2020 22:56:09 +0100
Message-Id: <20201211215611.24392-2-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
References: <20201204092752.GE74177@piout.net>
 <20201211215611.24392-1-rasmus.villemoes@prevas.dk>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [5.186.115.188]
X-ClientProxiedBy: AM6P192CA0068.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::45) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prevas-ravi.prevas.se (5.186.115.188) by AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 21:56:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13f84574-95d9-4d3d-ce06-08d89e1f987e
X-MS-TrafficTypeDiagnostic: AM0PR10MB2867:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB2867DB317A808B508EA309E893CA0@AM0PR10MB2867.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ji/VyMKKF9WRU+rfDvrhIwpBuZi/g48Zdu+PRae/eWNwwWvg0VAUpsL/1gH/lJ+1mjWL43QgI3eY1tqTsqvlONRyzC+5nfeCzhA+2Ysn0Qu07eqeAi3wRIlB0GJxTOeJecPw5Jr3IvNKYInkMVmxcpTtQlPFcmDjuSbts1IZfLAj0LNkys6D/Aur3We0ckfEJidF26fQLpqJ1WwvRRfOzlO1RoojniKONtyMknYLzux2JWwkxUblU1vCE4U+IpI13Qa2YnA2CihfqEgeWngbsNhCAnUxyCWpgAg138ILOwq8uhHT+uuHEp8Hnt5ExHE7b3uXf8js5wbN+0y+hz7X1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(136003)(376002)(39840400004)(6666004)(8976002)(66556008)(6916009)(2616005)(4326008)(186003)(107886003)(8936002)(52116002)(66476007)(36756003)(6506007)(54906003)(16526019)(8676002)(478600001)(5660300002)(86362001)(66946007)(44832011)(2906002)(6486002)(6512007)(26005)(956004)(1076003)(316002)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ejJEMninqFRJoz6iBHjeqEWI/w8FTGyk22H9gipI/hov+MTf11KbcdPI3HyP?=
 =?us-ascii?Q?sZaykeoopcF0m1C8AVKqHQDejiwKuQLX2gwIGraGZ9HSIlcqz9xRcV6pTt/u?=
 =?us-ascii?Q?WM0YVwbOEXiAi+2VvmYmFFX76UxUw2G4eqTvP1W5eb21bMCbepQ78Gu3kqb8?=
 =?us-ascii?Q?IQhPguu/IRwY+ZcYJv1qlVmTCQ0gg0R5Werl9mTME9J+3n6wrSK7ppPxYJcx?=
 =?us-ascii?Q?9tJ3FZxeufzaEPSd4+ekzUiTXFYS6CjAqqHSKPlzYRzW2Xyfh1l90Za+NgJx?=
 =?us-ascii?Q?iGk1koj3YX+oIuMGBmQJirEYVYZ2HnzQGuZNTgQeltiM3k7aIQwW0oYWEUm8?=
 =?us-ascii?Q?Ta7jPo97O+HCU88smdKcc6fU0EIdVCeTOCMMvE0uIS4gJtGnTRXqL0TrOyXr?=
 =?us-ascii?Q?VkBHkakG+6zO9ryA2by7XiPBUVlvtCuOBM6H7zFEa0bw1AtPPQvRvb5cdnRu?=
 =?us-ascii?Q?c/5pP8eFWphU8D1XKdZLqrzjrXKXpCwlRPIhmlj/hf4k+Ko6lqLx7L/URnUW?=
 =?us-ascii?Q?MWMDndYwDBA/EUcRWmaFdgOAOqmiAZNgk8eqUduqjTtXOWIuEhcsWPo7o2ZS?=
 =?us-ascii?Q?TqsKRGfEnDOK2hTHiVCLWQt+SUJkQd613cXGWkrpT97XnHeIM15sC2ziPZGo?=
 =?us-ascii?Q?3urLWMK8COfqHbxERFQl318dWqmdfPZaw/Hpzgnbfv3fHTfXsGYVleBhwagI?=
 =?us-ascii?Q?vVUBfKJ59iWwqr+8gpu8vOzU6v3MbUrUOaOV90atDciJb4yxx4SYysfPwENA?=
 =?us-ascii?Q?L36JS+0qkXLSIZkhfPf1cAMGqwxS8PGR6hcjjCLck1N01a8DTJhdXO2Nsj6o?=
 =?us-ascii?Q?VwLK2kzw+UnxA9tdpqYbiijJ4ie9mOuE6eQV1kg8KaHBBZ5JHrTrujo+6+up?=
 =?us-ascii?Q?81f3rIC12d4mvCdmEWf7ol2tOv7Wm9kKJNFvhh6/o8ZpIeOg+vyo2Rh453Hw?=
 =?us-ascii?Q?eTEBSHkFKgGvCewweU4zbEcdFFc0128irVYvIZoqrVUBawypQ278nwAE/0eO?=
 =?us-ascii?Q?U3H8?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 21:56:21.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f84574-95d9-4d3d-ce06-08d89e1f987e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5zvHxYteHkFRgt6kC6radeE2obUbSzImnrpx0RhBgoSjF42N8ODHiAY8gkkVMOHBRuWT0sm4KEJ8kd07u78utgBlCSdiqsfxXV0cUOPjwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2867
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Some RTCs, e.g. the pcf2127, can be used as a hardware watchdog. But
if the reset pin is not actually wired up, the driver exposes a
watchdog device that doesn't actually work.

Provide a standard binding that can be used to indicate that a given
RTC can perform a reset of the machine, similar to wakeup-source.

Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 Documentation/devicetree/bindings/rtc/rtc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
index ee237b2ed66a..b5e24dc24b0b 100644
--- a/Documentation/devicetree/bindings/rtc/rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
@@ -47,4 +47,9 @@ properties:
     description:
       Enables wake up of host system on alarm.
 
+  reset-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The RTC is able to reset the machine.
+
 ...
-- 
2.23.0

