Return-Path: <linux-rtc+bounces-2863-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA7A0882B
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 07:15:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38EE161A3A
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 06:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC484207A2C;
	Fri, 10 Jan 2025 06:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="lrgUz7sq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2087.outbound.protection.outlook.com [40.107.105.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE95D207DF5;
	Fri, 10 Jan 2025 06:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489690; cv=fail; b=CQlYSCszknoCR/RaymCZBHr09XtodN3cPal5kvXglEgEg+oYp2j7lPbyBcCF3Y3p4qVMtaBp1VJ/Wg5RXrQrgRkJcr+3n18qiTfB3J5xBlWPljTO2pKd7SfXDLBip+n+8IlPrwUtlq1o4GH3z5GOcIgLHx2MlaeGQ+cflY4fzRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489690; c=relaxed/simple;
	bh=j/GolNm5zEWkFV1crZS9bzC/wo6r9Gjl5mFhjFJlWdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wz8s8AllSJyhbrwn8/VEl0NlN/Kt60Vgzmghgs1vnHf4kV//gNdCsxU3LfVK6l8szyHRaa+lpxJ9SnKJP0H8DMf2jaeiBauotPn5BNRv3DmHXtZ7UFz+YMT8xnXYJNCF3L4pnEzIIqS2bE/IzKuXjwWboddhTP2oeYdAVgiWFJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=lrgUz7sq; arc=fail smtp.client-ip=40.107.105.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTRVtlE2bBSprXOyAomhwd0Gq8A4/IOdTDExVVHzenVSmxWsyn21L3hDw0amwLSuonZYgNQ/GnewFdsdvhyz0XL0ez7Q0wb9tayood4waZFxhh214RjA/Skke9z/K8vgWo3U65izjxty+0tvMmjqyzk8J3l8nqCX9eOBpnuFjQtYCWnlG0Rqvv42abBLNSwfeuoLGJWwFZRUI3ktqlR2a10AzuI2qCVp8fTXWtQkPXqFCDolE7GWsFsFpEQQfaTcKoyG9ds1YtTMeYye7+mB+/qha11ntZQLpPAW9oqbkNpKyOoaUHQKzEJ17I+t8GJsFnyACZ0Kyoh50vAw0CCGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKEY9mOx7K+izow6Pn1hlTkU2lOZNwZ2jrgU+8gj3S4=;
 b=nUEP7C3jMz2uDGwdlSwir0pdyuTJzlWeW7iT9YJLWCRrQzU/2sMcgyN4tyVVu3KZt4OZID1wAIVhDb+jVodoHNJCgmYzA6OX5NIScVY6h0+Ivz3QQYJNP9ZC1eMQqqhYgJglEZ52ofQlJn4ycvdO3Iy0ZcvT3tBeTEL06QrPPIyK67ws7BvTxctYCIoMOSPSG5uvH6hA6lUzTh+icxw8nztXyEbbf5e1sdv19xNyk8CWCSe43kwmg6+8pS2QGl7CIH+35KQxKXAf2Wbz9MTMZKZqaRt6IEAEf6XlqWrG34vWytzV7ZDWLuF0cGTV/uiHLBzdOrIHIT5MwhUeIWv0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKEY9mOx7K+izow6Pn1hlTkU2lOZNwZ2jrgU+8gj3S4=;
 b=lrgUz7sqDcKPA91oayrEp3lRdACnbMEgFB4YHy4OGSvQcRqK1UiF3VWwLFaXfQ4CQF23FojwGbx+tkbJr1LYHBfLm1fYN/LgfI/58c4w7iRcc6pn+Gn8Eo5tooj2uw6VIexX8mCwW9A6gAALHNynEyZtBXgqRaIQnFFmXma2eedxkFzgug9MivJzNkXZcx96jt/D+z0cBsPHvIMfGl+qr/VLg2J5arGYRMTWEKqhW3AyBKmZsXB+iuCoK2GuiOOJzgjbMihuvmgGQOh6xhXsKc3WMhbbebUivbOi/X+9rg1iHMqqQ1J/cldxrxXAPzeKvtEd1azdfisUm5zk3PW4nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB6776.eurprd03.prod.outlook.com (2603:10a6:20b:29c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 06:14:46 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:14:46 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v1 3/7] rtc-rv8803: add register definitions for rv8901 tamper detection
Date: Fri, 10 Jan 2025 07:13:57 +0100
Message-Id: <20250110061401.358371-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110061401.358371-1-markus.burri@mt.com>
References: <20250110061401.358371-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0073.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::6) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a92c3b-ddec-412b-35ef-08dd313e14f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+a71vJpE1bQdkhW6EiYQK0TiXh+zZKFGNuH3nQ8IGFh13sgErBa/XeXbH5qH?=
 =?us-ascii?Q?tiDhkz271yZp/hLC/9q2RPt/v/KnS6O965LsbSrDVUifJt5WguOQvmdSZKjy?=
 =?us-ascii?Q?N6tNJY6YRiYKl533+uAXVnsIQF8M1w6dIBxlCo2r/UH0CmKGT0m08akG88/V?=
 =?us-ascii?Q?pRVFkdTNlfg/aFkYkN4XEreekDJCV9OmJLu2lZD2VnTD1/nOBzi79VXOYvJp?=
 =?us-ascii?Q?8MNop4I5O7rcDdWXN60JMjnbCRh/3R50DbGYJTy/8ZT60tkeDRnOIYuAIJ32?=
 =?us-ascii?Q?oU5MpBnecV/8EE747aJ4LaeyxTGkb5WUmDjRurxuVzHeIxjt8B3RGvvQEOA0?=
 =?us-ascii?Q?huLbf9R26vcY0ODGFC2+3F0aabVVmTAR3WJ/gECA4gghd2vZnqO/ffj0qo09?=
 =?us-ascii?Q?9HtRKOFd3K4S1y8hmjkzmWC8XeS7624OoJuZGRsyIELcHP85DBzSsYVTQq97?=
 =?us-ascii?Q?OxRUNXB6/BlJg1CXFtHvQiWZHZL/yFyVt3m/fMRU2ORYgTMD3TkP5GwMWVu0?=
 =?us-ascii?Q?/vnMijaTG8fNjuhRbA7jcnkO+CTqOjd+64UHeI6ZgOiMeKL936p22Ns6rtjb?=
 =?us-ascii?Q?eit7m9kjHLlJfjSUjiUcUjGd0M0gdv61n04RcsqS8Ws9qpNzNahOnuZh3dNZ?=
 =?us-ascii?Q?eXFG3BZDgbwyN0HiOiiHjbVllzfDrlhVW/Yrh8u5RPwYPtZVF9qMSBeiw8vJ?=
 =?us-ascii?Q?Bla01QPA/D4tH7LBgz180uXFzGhcnFoeeEWeMO7pLyMOAOg6CU9NSieBY8xs?=
 =?us-ascii?Q?YzykHc0l7qvY0VtYKg5Kxu6tXsw1kzCxk7NAyEtjZkoASMtZC4NQjwL5RMN4?=
 =?us-ascii?Q?3T/Jkpcj2dVTEa3uDAPuPpTN8RICMI4GzjCAmovzp9x0120cdgL6MELPaUbQ?=
 =?us-ascii?Q?dSf4xb2G/esPxLazyPE+znvRndbDX8V00BsbpGdvdzMyv1iS51eFcbF1b5pa?=
 =?us-ascii?Q?AtMr4unLwI9LxZAlKaUxurQtHMRDFiiwKh9iYkbqnl46UmdW9UZTvQn6/Ohz?=
 =?us-ascii?Q?31y++Z9uFIQVPkbNcFbqcRuTFZoxZDZxh2Gy9LYB+n/7NnQURFA+vPsYiYzd?=
 =?us-ascii?Q?HAgEWS8SjjPUcQpFDJEs9WPaDfXzPnQBcxbacMbi+Xon6aRyUQhktfEoTyP8?=
 =?us-ascii?Q?oFghdZ8XepUAqdYwuzmVdg1CHGsC0eqEsnBMWR0ZphxUl/g1BwjyQGlxv8m/?=
 =?us-ascii?Q?nhL5BqCqtBir+SFhqoDoXjIIufc249FbENg3NutjBf7QAT2d8jNbydAOO1KU?=
 =?us-ascii?Q?s+2aAiP9cOczm7mFZd+rlSTeClllXUUKhChvjUx0j8OIH6zja1YvntB8K+UM?=
 =?us-ascii?Q?jjf3P1MouWZmYd9ny/tdieAzIAaFMAeiHA751he39Cb6h+HI2rkYbOlR9Cqq?=
 =?us-ascii?Q?RBWkSPa4u8Cj9rRR2Y22tnaRLyj+NRJFLJs+CR5PCttgVhauSyTXRx6AtMWb?=
 =?us-ascii?Q?jO9ZRZ0LHcWZe5fhFAXnUsnbLFsjTVLk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oNYykgjIQHNH8PcgPZVGpo66HX8A11tE4E6ce3RqZH3z4OCXX1mF2rxz1szp?=
 =?us-ascii?Q?40XwpkTvvaIfQJEMRwL3/cEDy80HRXk+ODSj5+wyl2jj3Ctde+ooLVJ27vj8?=
 =?us-ascii?Q?P36pQEc4uHNmvinaQrSvGuaxrKGFWYS9WwRW3w38aFnsX+PWIpwC4cJMN21n?=
 =?us-ascii?Q?ekXttegQ2DmxY+pH3KZFsy7/IYnwe1mX2B572XpR+442YmCnxWR2EKvdhk1V?=
 =?us-ascii?Q?Rp2+oX1URpxFTh3FBX9FhVmxSWAvOgBFLNK6XhuGLtkB+w4g0hpdrbYvZCxQ?=
 =?us-ascii?Q?z97Wm9SexSmO6tdLP5aYfoNP5gP/6ADNCtzauZYZmk7HAywVkfFvX7aMwetL?=
 =?us-ascii?Q?k6WR95rqfJYwmiWCMNQbbWOFyV4g/aFe8+3kklHNI5TbhvEo4xW17ov27jc4?=
 =?us-ascii?Q?rR9fP+w6JFGBuzW4QRZVlyt39CPYQjMQS0EXtA+MTYkh5CVWv9i+L8OrHoP+?=
 =?us-ascii?Q?7OdEwB2V41S/y49lT7GBdPXqPhm1u+FQsHjLniNwL0G2StwstY06viaGOaOa?=
 =?us-ascii?Q?4lfpZAFk/TJfv6I+AVfjdMmb0su9Xd+4RWM0HX+Ycvhp3eekYxtQOQp0tD7X?=
 =?us-ascii?Q?EN07cL8gNkmZ7k6FFORJR67SHDaZYuwty8/kDV4AQ/eRoFA+8/5gTPPEInLH?=
 =?us-ascii?Q?UhTY90WipsDW/Fzo844bmQC+HTeQVKRNUIln0k9k94AG4H6LltTXsG8QassO?=
 =?us-ascii?Q?wgOzloApJLxYHyYCXoPkaqDZmraWbyO/Zg85HDy9L0l5s6YMjHHq1VZHA029?=
 =?us-ascii?Q?HfBe/RsjTFdAU+oJnNiDjTb0kxWs+pNE58YFZ9cLmfoXBcQFMNpQVKfw5r6g?=
 =?us-ascii?Q?LxZgciGfzhARPEPTuTxbhNzBRvVV31TSP7hzcOKe6OhNdNQZGqBepapFF7TX?=
 =?us-ascii?Q?8hA03vDt8Xhfvx+LdOCocb/4Sx3ihQmpu0b3FrnU1ZV1nkB1QU3xwqUClvJG?=
 =?us-ascii?Q?Q+fNYWSqICMAINKfjl5e8dmBBvdcVS1YFOvhm/sbkcDaytm4/NUkCeaaIWXR?=
 =?us-ascii?Q?0sSi3ANkW+yJypioT3EeSUq52I8NiVd66Wb3ZmIF2Q8xsByAwxZUHlqIe8MV?=
 =?us-ascii?Q?aJupDt0oh447kG1b/YTkZnhk1l1SyX1EPx2VjRYICfo2fK+FB8gagHGJRE5F?=
 =?us-ascii?Q?kTrbQOshqNwBTJlDuCWXrIV/pyC42iSvTeqa/ued5MUgIHLiuzM7l7N/s/Ms?=
 =?us-ascii?Q?2TrVYfgMjpSTAV/p0FRPjA94g0ZnSppNykcEzaXuiZb/CGgCuJD0K9FQSagx?=
 =?us-ascii?Q?3EgDEtYaMXk1Csszsh8271oU33QbkH+3ewGqf1NxUpKRE3t4YoC4W2jWIg/V?=
 =?us-ascii?Q?lX6X5yccAvNRxFyH87j/Vv5qeirrXEDo3pHuSQHt9RinQ9Jh1Tsha1CIgM8L?=
 =?us-ascii?Q?aJwwreWNz7RekjQ4piEqy7UMi/sT8kNgE12AhMXSdBW2wzxj7QlKP7l0Q51r?=
 =?us-ascii?Q?uPouCRMWt5BSTnPHCpmhg2QSYe3zGW/MwIu3upWOWCVlxHcJ2/foHCgTw+ju?=
 =?us-ascii?Q?FhHVz25mCOvCdIdcw6vKCyjHo9vk7XG43ZjTbavRH/jMaK1Ryysw/G575lRJ?=
 =?us-ascii?Q?MoJhths9YvmfYeiYSGKMAPZRrorKOBWiPeEIbIDD?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a92c3b-ddec-412b-35ef-08dd313e14f3
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:14:46.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVJPuVUuh3R6ZoDbguzGmfuK+bnq4JRDRVsa2PZAO1LFxorh2t7H92vQ9/TU9hP1+6c6qqWz5v66NKsw2OKOJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6776

Add register definition and string mapping for rv8901 tamper detection.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/rtc/rtc-rv8803.c | 122 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 50fbae9..a4f2f53 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -58,6 +58,53 @@
 #define RX8900_FLAG_SWOFF		BIT(2)
 #define RX8900_FLAG_VDETOFF		BIT(3)
 
+#define RX8901_EVIN_EN			0x20
+#define RX8901_EVIN1_CFG		0x21
+#define RX8901_EVIN2_CFG		0x23
+#define RX8901_EVIN3_CFG		0x25
+#define RX8901_EVENTx_CFG_POL		GENMASK(1, 0)
+#define RX8901_EVENTx_CFG_PUPD		GENMASK(4, 2)
+
+#define RX8901_EVIN1_FLT		0x22
+#define RX8901_EVIN2_FLT		0x24
+#define RX8901_EVIN3_FLT		0x26
+
+#define RX8901_BUF1_CFG1		0x27
+#define RX8901_BUF2_CFG1		0x2A
+#define RX8901_BUF3_CFG1		0x2D
+
+#define RX8901_BUF1_STAT		0x28
+#define RX8901_BUF2_STAT		0x2B
+#define RX8901_BUF3_STAT		0x2E
+#define RX8901_BUFx_STAT_PTR		GENMASK(5, 0)
+#define RX8901_BUFx_STAT_EMPTF		BIT(6)
+#define RX8901_BUFx_STAT_FULLF		BIT(7)
+
+#define RX8901_BUF1_CFG2		0x29
+#define RX8901_BUF2_CFG2		0x2C
+#define RX8901_BUF3_CFG2		0x2F
+
+#define RX8901_WRCMD_CFG		0x41
+#define RX8901_WRCMD_TRG		0x42
+
+#define RX8901_EVNT_INTE		0x43
+#define RX8901_CAP_EN			0x44
+
+#define RX8901_BUF_INTF			0x46
+#define RX8901_BUF_INTF_BUF1F		BIT(5)
+
+#define RX8901_EVNT_INTF		0x47
+#define RX8901_EVNT_INTF_VBATLEVF	BIT(3)
+#define RX8901_EVNT_INTF_EVIN1F		BIT(5)
+
+#define RX8901_BUF_OVWF			0x4F
+
+#define NO_OF_EVIN			3
+
+#define EVIN_FILTER_FACTOR		125
+#define EVIN_FILTER_MAX			40
+#define EV_READ_MAX_LINE_SIZE		96
+
 enum rv8803_type {
 	rv_8803,
 	rx_8803,
@@ -66,6 +113,81 @@ enum rv8803_type {
 	rx_8901,
 };
 
+enum evin_pull_resistor {
+	no = 0b000,
+	pull_up_500k = 0b001,
+	pull_up_1M = 0b010,
+	pull_up_10M = 0b011,
+	pull_down_500k = 0b100,
+};
+
+enum evin_trigger {
+	falling_edge = 0b00,
+	rising_edge = 0b01,
+	both_edges = 0b10,
+};
+
+enum evin_buffer_mode {
+	inhibit = 0,
+	overwrite = 1,
+};
+
+struct cfg_val_txt {
+	char *txt;
+	u8 val;
+	bool hide;
+};
+
+const struct cfg_val_txt pull_resistor_txt[] = {
+	{ "no", no },
+	{ "PU/500k", pull_up_500k },
+	{ "PU/1M", pull_up_1M },
+	{ "PU/10M", pull_up_10M },
+	{ "PD/500k", pull_down_500k },
+	{ "no", 0b101, 1 },
+	{ "no", 0b110, 1 },
+	{ "no", 0b111, 1 },
+	{ NULL }
+};
+
+const struct cfg_val_txt trigger_txt[] = {
+	{ "falling", falling_edge },
+	{ "rising", rising_edge },
+	{ "both", both_edges },
+	{ "both", 0b11, 1 },
+	{ NULL }
+};
+
+const struct cfg_val_txt buffer_mode_txt[] = {
+	{ "inhibit", inhibit },
+	{ "overwrite", overwrite },
+	{ NULL }
+};
+
+const struct cfg_val_txt trg_status_txt[] = {
+	{ "EVIN1", BIT(5) },
+	{ "EVIN2", BIT(6) },
+	{ "EVIN3", BIT(7) },
+	{ "CMD", BIT(4) },
+	{ "VBATL", BIT(3) },
+	{ "VTMPL", BIT(2) },
+	{ "VDDL", BIT(1) },
+	{ "OSCSTP", BIT(0) },
+	{ NULL }
+};
+
+static const u8 evin_cfg_reg[] = {
+	RX8901_EVIN1_CFG,
+	RX8901_EVIN2_CFG,
+	RX8901_EVIN3_CFG
+};
+
+static const u8 evin_flt_reg[] = {
+	RX8901_EVIN1_FLT,
+	RX8901_EVIN2_FLT,
+	RX8901_EVIN3_FLT
+};
+
 struct rv8803_data {
 	struct i2c_client *client;
 	struct rtc_device *rtc;
-- 
2.39.5


