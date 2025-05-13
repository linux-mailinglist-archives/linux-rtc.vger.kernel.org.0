Return-Path: <linux-rtc+bounces-4094-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94420AB59A7
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 18:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 185854A4836
	for <lists+linux-rtc@lfdr.de>; Tue, 13 May 2025 16:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996B22BF3CC;
	Tue, 13 May 2025 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="DTsx7kB/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D22BEC2A;
	Tue, 13 May 2025 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747153223; cv=fail; b=JrkXejcJOkoVZmZz5rmrlDyYWi1dFL8rLQLRA9kIgK7Jhg6qLxn8FylI27+idpDicoxpRAiWE/O9DiQspewIWjhCov7Pvd/kR2BT1z1SwhERbrTorzKbaQS4PpHN4czNOc9ckjzJeb0nZY6MmG1VeQdqa3aev/Nqeqnmeh7aPeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747153223; c=relaxed/simple;
	bh=RVF5ViFcozAy+CfIIu9Gua1PQr91xsgjVwm/TuHwqE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S61oIe+6qQJQICP5nozLmhRn+7Isqu/jC2TCOnE7hYBNsUkuUcTWGJlUNEF4uOS1subuS6zv28l7k6u/QOrJOKJppf5qlAeN4EAU+HFeZtUg4xl6iDF52HgfE4bqOrcjInp3XBtM4bwnP35aGGviHeloqzrB32gxV4iHPuG1sQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=DTsx7kB/; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPUxBzcxbMF+1dvJMcg8SrCjbkHScFEZ6j7cvZPPh30skQS95EhZGjMAsmUzkSh37vkn2nNTQbX3/uqkYhKyBJXvUvHPnKgjsdN1PdscMVb9NxasSWOMdoIpf7Z9BwEGzGk+ePwyC110fK/xmuS/yLiHxfDi7TDGKM6141aFRlBRSWEkS14eyNMQ57CF2M4BTTy+VIcZSijLQbRDCXTBVRMkhczcAcyPY7ZJqMLP7kSrMfy31GYXtJ5ghyvv8wTOACXILCiyUjfGlhhydOO+UrQcPxekGbmlr1QP50Zc6k/dmhNaesw8Hgew/nSTGqwwC9PDJWTI8VEqu9/Pnl5/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfYly4m1xhrA/vLI1EL5BqOEJed0LZ5VAJbT7NH/gjY=;
 b=k+Om9u4lnMiqrZW1XPQ0D9AFSkyab+4Jkb2Wr8GzNdunnmIoQ5vDw0k8JaiCnXOBtB8Zr8pJPELiwNQXG797W/Il0FxmNRqeE365uVt6ZwS5PsPnn9fdgV+0sw9Qt6b2j5m0G5FJBPQcEAsaq5tlWKZfsc2sR/ZN/RXV3zx+mWHp/EC1e5pEJzTI0uqU6ShSag6aFBKWYQUZTeoWv2Gnap9fLg4zz/q7ckJlM8tz6EdURHtXvHuDIItqExP9mij6ZBXU0R1XNNt+jAHfCjuDMaRH5z3anWAsAerzZrAfLG8NWkz4YT5pmoyutc1le0TLK/J0u9zXpo9UwxvKtW65BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfYly4m1xhrA/vLI1EL5BqOEJed0LZ5VAJbT7NH/gjY=;
 b=DTsx7kB/Rv33U87q0D/0xZq73oVJgIiIJuCR7VZ0KGtiWchqlAT4ljSyRRIe5fgHb6DkKccT9qkJGdC+8ioyvFVzrgKwvuy8txVKJ05957qL6nbZ2xpZMGvBtt7HxbVB+wTt5qs+UJh+76SzmabpE5bKDzZxt7nSibD4U0+V2uRFB0JV8FvUbVD2x/9ze/7d/HVw4DPE/MVsxEasu6wQZ4Heq0srTjp8F2RQOhMLjezDCYsCXqrLkvvfAadYyvR1jRdwE3EGegbFOGt3Ap7RECQ0svJ83nA+bypn+L+giuAzikC8293VZc/H2UoD6DpZKZObCo+DghDcl00QsvWS8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AM9PR03MB6724.eurprd03.prod.outlook.com (2603:10a6:20b:280::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:20:18 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Tue, 13 May 2025
 16:20:18 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>,
	Marek Vasut <marex@denx.de>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>
Subject: [PATCH v3 5/7] rtc-rv8803: extend sysfs to read status
Date: Tue, 13 May 2025 18:19:20 +0200
Message-Id: <20250513161922.4064-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250513161922.4064-1-markus.burri@mt.com>
References: <20250513161922.4064-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AM9PR03MB6724:EE_
X-MS-Office365-Filtering-Correlation-Id: 411e08e4-56b3-4833-65e9-08dd923a0d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nVr6Jbtg8aH5Z20LYtqyaJnLJO3JfezAYclNz0Rva56GOIeX0OxB0Im7FC4j?=
 =?us-ascii?Q?9C3o5cY+ODbAOUNVO+f5Myhfmir+TNdcWbaNu9yY6A9bSalDAvZXdv2FVwJA?=
 =?us-ascii?Q?Rvu3p77JziwjkNFHBfKxhLPP5/POwgZ62OgCm+OLhb/xjx1WGI+RksZBWELM?=
 =?us-ascii?Q?a/VeWdkDbOAdk8Lv1EwxSnRoA5la/hzPRC3DaoFKmRdzbkUWfQbP2Vw5j7gS?=
 =?us-ascii?Q?/0K+OZL3GaqU98WVXzYMw479Uufe3MPDHRFzgiavUcTk85PQhXiBTVyOtzs6?=
 =?us-ascii?Q?TeTbkNO3HwveNJGVWbSasHIQ0pcLXAljU7SgNeDU1R+V9nh+Q8cF81NFvpCN?=
 =?us-ascii?Q?217ZCe+klSsq6MBAyPTLK6ewRSOoBa50pTZ+mypBiz6QKHyIJE5uZtIwWp3Z?=
 =?us-ascii?Q?IKnD3WeDRlsEkxCiYKc6ukVzlBCTPCFzJHqfeYDA2FVJNQSg8IuOTMaUUYUX?=
 =?us-ascii?Q?uP361HfgU8lQAq8+4jvsviGi8/aeF7royztJ6EF1N9jlPcqA4jlyXmmQEfgt?=
 =?us-ascii?Q?N/VDcPsFxtC9Bnh3qluwSEOVIKAo9lPcKouGh0iFTH/pBpTIyQYfBSMdwY29?=
 =?us-ascii?Q?G1gx2/eQKLm/x25yKagkTbOBELjLdIhKykcAZw5rqsgdeiToxbgZtZeCtdU8?=
 =?us-ascii?Q?KaRl80cy7VH7NPC896Ue7vfg3Jbcu0wKz4yJQojVGgm/xfdqA0WWACThK+uU?=
 =?us-ascii?Q?atnd5BQeiBBuwWDtK2gz+mkEZ/Xwq2sA67FuDllA8pLbZJaCH1LEjUGonNCF?=
 =?us-ascii?Q?GJZBo+TBK9DynojJG1uOoOfsnTuV213gHuw5GoaBl/NLfjbUPwv8pAYtLjM7?=
 =?us-ascii?Q?QLc62zYzmght6fJxY5FoEST4R2tcxxA76s68z6x+RyZblTsH5Nqvv2LPYiSp?=
 =?us-ascii?Q?mqTwPRmr3hKRNxJar1udKrwQvi0hbmb2HFGbNswAu5g+opKcjQO/wif4k07q?=
 =?us-ascii?Q?VplWE1HlNG12gt7+9AKakaMMd+JUDp37XRe1zVwwb8UfQSKez9s9A3c6ux66?=
 =?us-ascii?Q?N3e8gK43l6pI6VCpjijAp0dCSqS6kRQVHdfKh8wrYM5vMrYJynL2S7mwUFh6?=
 =?us-ascii?Q?U4bhQTBlQrZapkMbPfpkRod4EkE/dXN446RJqXPAsgoZvgOP/b/tHJMbTjD7?=
 =?us-ascii?Q?0Qh+NP+unI7f0aQA2wAgNrUlwPz73/MEbT1KvWfHV1+MAtk3ongi2lI1JkgT?=
 =?us-ascii?Q?XWXDVOfm/Qp2w/92Kf7qQ2ERmVfVEKvTOvZnd6cPpPFIGyEzvEaFRVim0L3X?=
 =?us-ascii?Q?lKdNCB5KYhuY83OJqoCWRCPSELhfdc6RAoWwjTqwy3ErGaeYVYQuU57wYMVt?=
 =?us-ascii?Q?iz9KajYvz94G4rV68IZJqPT5iGJxSzLSwZUtrIQb0fdJ8C9Hv6MMMURrMPi/?=
 =?us-ascii?Q?6tSctwOGyM/Q8zq8m1/I3bF8d2OmlT4nncU9oBiMb8w7yJdZ20nm3OwuzFuS?=
 =?us-ascii?Q?dCnnc3nMNY0bFsiydbK08NTI0O1HqCNY6O+Km4ArnGCy47D+Xod19Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?opfNaTWlnl15YNfyNPv4nd4yDb0qSrKjjAksIfv7pSSprgZoanQPibvrK+8H?=
 =?us-ascii?Q?S0mT0VFRNdopFPf7WLXeUKok2q6ddz6vfgnYZDM7G3MpuNQtvmuq0FmAKvX7?=
 =?us-ascii?Q?/qqPIGbmrIBCI5n1Aj+4JGDyf6piiirs508obg/fbeS+GadpS1LrGTBNCE4O?=
 =?us-ascii?Q?9AMbiPdMwBo/SavsJAXtie7MSmt5XKHcY3F6ZxqzMGP9/y4SoLBxpexRdjqU?=
 =?us-ascii?Q?yfZowzbTFlOPzJASqk7WeQmrSIPeTm8OvC1DA3pOrhaSGQ/RfP/9P5v8hgcy?=
 =?us-ascii?Q?JMskg58i+AccdC9Dyr8qOqoLyUuHw7/RImoPrnQ3EG34WwzKtG4k2vRSzBnh?=
 =?us-ascii?Q?ogdkLkaP3kwOmt85/zKqDD67mS0YRfSUXoK5kDeJf3kCTncfAw409LIRcQOZ?=
 =?us-ascii?Q?FUngM36fO3Lt9BmyCk1xk/dpyvPwOINDCBF3BgsvP0OtRW73GtMQMsFn7Qf9?=
 =?us-ascii?Q?V4vYyMuourYoCK3Io5t4h5ie90oztYKaelPAJdOfDrTjL1Y0LY1L+/LaECfA?=
 =?us-ascii?Q?94ORKdoxi3whdS7/xBOconyEGKo1EPWp9bFdCWfdjR1pb8veJW1o+BJhxn8k?=
 =?us-ascii?Q?+srk+PdLg/GoAUx7KEn/0VkHwMSOy47pXd8WBaaVLnDJTfvi2yAXXQS2zDua?=
 =?us-ascii?Q?9iMiL08iDOBnYzt6+gpQnMjm4txF6P1eAdriNSW3bkV2NTaDhiRid6FAD9OJ?=
 =?us-ascii?Q?Gwk6PDwAfaYKLHsf5cqQyEiuGziDHthCi4QQpDrIsgw3LUlf7xFUjsDApu09?=
 =?us-ascii?Q?1f7utTbXFStr0hU8FUyvnXMKkWd7T/2UvL+QL2S5WeguzcJi1BKVjKgQqo4v?=
 =?us-ascii?Q?SCPFlBqwEn/61rChNOmG7B9CwGKI1HaoDPBeX7uVQ5hd9sOLFD2asnMwIkfy?=
 =?us-ascii?Q?IYFIHThvI2RWNnYvxoxcU8GQLrTXGNkRnwkVYbC6z9Vqxr6PjbuLjWqU9EGf?=
 =?us-ascii?Q?fr79HaYO85Z4dMsdSltaKTbsGXzjCFivhLKIQybo+mOQsMS1KjHReVUsJ4u+?=
 =?us-ascii?Q?OLitIy3zCTWF3YyxcCLPDHklzYKaADg09zSNltsPg5ArrGkydsG2u84kDqbo?=
 =?us-ascii?Q?pHDD24UI+ZTlz1M4g5B489LaPVPfyrblg7/paL/9DJri0Gg/61wAKwcO2Pnb?=
 =?us-ascii?Q?T273cU6fJ8Bhy74qdajwDsq4dXIxBdfKH3B1yU000X/aFYqgqa0vYH0PSUlk?=
 =?us-ascii?Q?HdFzxVgpl8MUeuPDCytQPYO5fcyOmek1V3nx6acfxCxBh97L4VSQL0DoqebN?=
 =?us-ascii?Q?pZmX6YJDEi1F/Vd9YkbqilSGqxTKzQJYAeB1YrvFoNP15iN/1bQ+t70mvkjE?=
 =?us-ascii?Q?29fBtS/pjSD6FMSXTbI7q+2oQGLl+n0jBV8l3j0yS/At24HwJf3SLbG8F8E6?=
 =?us-ascii?Q?U4CGxsbiiFl4Bv3gSL3jFf0xCVdEsFKnLCG5ugq/OuVzsZIBb3rYa9vNkLXB?=
 =?us-ascii?Q?RYgIIBUVirwxbo/Cnxp1wwLDXUCI5FXAi1YsgCkE4yBgjLS/99GEHtMq8ToH?=
 =?us-ascii?Q?XqltrBRYnvyo5Hpbj9n+HuVOPiwzAaDESvoxM8272HVxWDkYMq1TfjiFfNK7?=
 =?us-ascii?Q?bOXg5MKn+eQrE8CB7tzsGtKTosC5ZTUWgXXsnwYX?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 411e08e4-56b3-4833-65e9-08dd923a0d66
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:20:18.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFvmcTdWkNuTxYsi+SNdAVyuz+TCIv7KfNOkTk1JgFFddiGfIuBhRc+dnjhSzNSunVxYsEdEuoWznl3bDrtAWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6724

Add sysfs functionality to read the status and configuration.
The functions provide the number of stored timestamp events, the current
EVIN pin configuration and the enabled/disabled status.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |   8 ++
 drivers/rtc/rtc-rv8803.c                      | 106 ++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
index 2fd6578a6bd9..b3aa73c81c6b 100644
--- a/Documentation/ABI/testing/sysfs-class-rtc-tamper
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -26,3 +26,11 @@ KernelVersion:	6.13
 Contact:	Markus Burri <markus.burri@mt.com>
 Description:	(WO) Attribute to trigger an internal timestamp event
 		Write a '1' to trigger an internal event and store a timestamp.
+
+What:		/sys/class/rtc/rtcX/tamper/status
+Date:		January 2025
+KernelVersion:	6.13
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(RO) Attribute to read configuration and status for EVINx and buffer.
+		Provide the number of stored timestamp events, the current EVIN pin configuration
+		and the enabled/disabled status.
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 8f9bcce6351c..d4b1e04c97de 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -84,8 +84,11 @@
 
 #define RX8901_EVNT_INTF		0x47
 
+#define RX8901_BUF_OVWF			0x4F
+
 #define NO_OF_EVIN			3
 
+#define EVIN_FILTER_FACTOR		125
 #define EVIN_FILTER_MAX			40
 
 enum rv8803_type {
@@ -116,6 +119,26 @@ struct cfg_val_txt {
 	bool hide;
 };
 
+static const struct cfg_val_txt pull_resistor_txt[] = {
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
+static const struct cfg_val_txt trigger_txt[] = {
+	{ "falling", falling_edge },
+	{ "rising", rising_edge },
+	{ "both", both_edges },
+	{ "both", 0b11, 1 },
+	{ NULL }
+};
+
 static const struct cfg_val_txt trg_status_txt[] = {
 	{ "EVIN1", BIT(5) },
 	{ "EVIN2", BIT(6) },
@@ -632,6 +655,16 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
 	return 0;
 }
 
+static char *cfg2txt(const struct cfg_val_txt *cfg, u8 value)
+{
+	do {
+		if (cfg->val == value)
+			return cfg->txt;
+	} while (++cfg && cfg->txt);
+
+	return NULL;
+}
+
 static int rv8803_ts_event_write_evin(int evin, struct rv8803_data *rv8803,
 				      enum evin_pull_resistor pullup_down,
 				      enum evin_trigger trigger, int filter)
@@ -935,14 +968,87 @@ static ssize_t trigger_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t status_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	int evin_en, evin_cfg, evin_flt, buf1_cfg, buf1_stat, buf_ovwf;
+	int i;
+	int offset = 0;
+	u8 ev_pullupdown[NO_OF_EVIN];
+	u8 ev_trigger[NO_OF_EVIN];
+	int ev_filter[NO_OF_EVIN];
+
+	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+
+	scoped_guard(mutex, &rv8803->flags_lock) {
+		evin_en = rv8803_read_reg(client, RX8901_EVIN_EN);
+		if (evin_en < 0)
+			return evin_en;
+
+		for (i = 0; i < NO_OF_EVIN; ++i) {
+			evin_cfg = rv8803_read_reg(client, evin_cfg_regs[i]);
+			evin_flt = rv8803_read_reg(client, evin_flt_regs[i]);
+			if (evin_cfg < 0 || evin_flt < 0)
+				return -EIO;
+
+			ev_pullupdown[i] = FIELD_GET(RX8901_EVENTx_CFG_PUPD, evin_cfg);
+			ev_trigger[i] = FIELD_GET(RX8901_EVENTx_CFG_POL, evin_cfg);
+			ev_filter[i] = EVIN_FILTER_FACTOR * evin_flt;
+		}
+
+		buf1_cfg = rv8803_read_reg(client, RX8901_BUF1_CFG1);
+		buf1_stat = rv8803_read_reg(client, RX8901_BUF1_STAT);
+		buf_ovwf = rv8803_read_reg(client, RX8901_BUF_OVWF);
+		if (buf1_stat < 0 || buf1_stat < 0 || buf_ovwf < 0)
+			return -EIO;
+	}
+
+	offset += sprintf(buf + offset, "Mode: %s\n\n",
+			  FIELD_GET(BIT(6), evin_en) ? "direct" : "fifo");
+	offset += sprintf(buf + offset, "Event config:\n");
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "", "EVIN1", "EVIN2", "EVIN3");
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Enable",
+			  FIELD_GET(BIT(0), evin_en), FIELD_GET(BIT(1), evin_en),
+			  FIELD_GET(BIT(2), evin_en));
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Capture",
+			  FIELD_GET(BIT(3), evin_en), FIELD_GET(BIT(4), evin_en),
+			  FIELD_GET(BIT(5), evin_en));
+
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Pull-resistor",
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[0]),
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[1]),
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[2]));
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Edge",
+			  cfg2txt(trigger_txt, ev_trigger[0]),
+			  cfg2txt(trigger_txt, ev_trigger[1]),
+			  cfg2txt(trigger_txt, ev_trigger[2]));
+	offset += sprintf(buf + offset, "  %-13s  %-7d %-7d %-7d\n\n", "Filter [ms]",
+			  ev_filter[0], ev_filter[1], ev_filter[2]);
+
+	offset += sprintf(buf + offset, "Buffer config:\n");
+	offset += sprintf(buf + offset, "  %-13s  %-10s\n", "Mode",
+			  (FIELD_GET(BIT(6), buf1_cfg) ? "overwrite" : "inhibit"));
+	offset += sprintf(buf + offset, "  %-13s  %-10s\n", "Status",
+			  (FIELD_GET(BIT(7), buf1_stat) ? "full" : "free"));
+	offset += sprintf(buf + offset,  "  %-13s  %-10ld\n", "Overrun",
+			  (FIELD_GET(BIT(4), buf_ovwf)));
+	offset += sprintf(buf + offset,  "  %-13s  %-10ld\n", "No of data",
+			  (FIELD_GET(GENMASK(5, 0), buf1_stat)));
+
+	return offset;
+}
+
 static DEVICE_ATTR_WO(enable);
 static DEVICE_ATTR_ADMIN_RO(read);
 static DEVICE_ATTR_WO(trigger);
+static DEVICE_ATTR_RO(status);
 
 static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_read.attr,
 	&dev_attr_trigger.attr,
+	&dev_attr_status.attr,
 	NULL
 };
 
-- 
2.39.5


