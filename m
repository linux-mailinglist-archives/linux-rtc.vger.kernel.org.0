Return-Path: <linux-rtc+bounces-4127-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24173ABEF24
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 11:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4EE47B09FD
	for <lists+linux-rtc@lfdr.de>; Wed, 21 May 2025 09:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7632E238D57;
	Wed, 21 May 2025 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="QFwvKt9p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7B0231A23;
	Wed, 21 May 2025 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818423; cv=fail; b=NUb1VWDISR3QtZOtHtmfsx4QpQsKLNFNxuyU1pzljNPPQ9wvpE/wYCPr8OpZvI2TY/WY2aBBGpjSlg0qEWPQRUQBllKuH8RoJ4rbZjroGHTBrmZjWBnsFUHSiU0uMi3YPELJTsTMLmSrFp3u2HTWAU62GPsMlFwfvKeXsfiWnLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818423; c=relaxed/simple;
	bh=HSkdFXYU1Cv3a6briY2MOuLGWeZ3MtWgh2s6K7PmE4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o51h70mar25sj0gfFKfgahCnNJmf813G8GVhMik53DRpY98K25WxvKB/IdeN00YihVroL/UUkf7VGVDH3KG1DFN3nq6niPDUA1YPGugcgFu9wvsPkeCEgMsYsWybQesyPzdx4FKYEeq5c/qLeZfRc0ElRVms3kTAbrDgtaCe9eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=QFwvKt9p; arc=fail smtp.client-ip=40.107.104.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQNlDxar6L5r2G39+z8HPn0wvieE09hjZLVXogAmbM+dGBLMTC3p4jCoZlH78oSrUmiovnI4/YlUo71rKGy9lVw3P37lmmy/SzwPNNXWsg5x6z0lOFVU2HbMnHartmRBnDmmb7MzOoB0Evo/ftNR2iGXggtmTunF0mzLvZbUmSTkFtQEh0jOfXygPmA4fW0WrwWmHqhAZwkWrWuas2/2REo5GZTvfIaoSTQnqLPS7z6IB+y73fnyjtszghhLPLGTwVTWr3omJFJMe4Lr4m9l0mL42PIqSF/PdOqJZZJW4ryu64aQJez3VjWjpy/IWy5Jmctagk+PWbGCFUaYerg7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUoCDfR6fjnkqi8JnVtCYXzif94KGec9zo0HtoVnq9E=;
 b=IbHhUPDnWw+Ofqqk58Ae18bqXvh6yiaMu/C7S5gOd3NsStYExaUikR2dr4ulCIvBS5tTvi06JdJ+gbtkVSL7zCYEPqMvt2q6hzlmJCsbDuxrlmzdQNlux/lcKWIcgnWN0N0GUJsrsbsy3oWWpF1PQss+drsUJD+nIYrQlD28hXrfLWjzUabdQGYHEMDLKCWoIizr5bMf1SjUSvY/NMXPGzufnRwE7jlPgCJ6l85Ao8t3ophxG1cMXHBX0566YRsSzG9/29cD69v9vX/g7TRGL8DarxiQSljg8J3AVUzIv9nWR3qCUPTPZjTQtK/hAzaqFxTOTTLoMGviezyT7a/J1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUoCDfR6fjnkqi8JnVtCYXzif94KGec9zo0HtoVnq9E=;
 b=QFwvKt9pfBrMNT8aLI7n/wJKd5BRJrC8tJS3HzPkn9Tp6Y2WwZsTGRY8sspjFQkT9Aumu8nYf5Z7ZSPT9fgPkUM3mdpU10gSefvTaLdj6Mtwlw4T5MuwVmw1WeAX5hUeEFNA7FN+yGyxKCVmy1k98pQP1jaS7GsEnF7Le2TOjAu3ZfwvnurFwU47+kK1eO76sTwnM5aV0WOExNz+imQ2p5nKM3Gwri/vH+M0zTM+UE/rKMQZ/zkWp/LGCdyLhBhAdR7dpTyOWqEv8mDuzeRoJcotjRKaDSPppb1d6H7J84GKzdCvcvJUKPg/FbFevqthLiYxKtYTfYb3Kn26S61H8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com (2603:10a6:6:36::19) by
 AS8PR03MB9486.eurprd03.prod.outlook.com (2603:10a6:20b:5a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:06:58 +0000
Received: from DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b]) by DB6PR03MB3062.eurprd03.prod.outlook.com
 ([fe80::b201:e423:f29:53b%4]) with mapi id 15.20.8678.033; Wed, 21 May 2025
 09:06:57 +0000
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
Subject: [PATCH v4 5/7] rtc-rv8803: extend sysfs to read status
Date: Wed, 21 May 2025 11:05:50 +0200
Message-Id: <20250521090552.3173-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521090552.3173-1-markus.burri@mt.com>
References: <20250521090552.3173-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0116.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::13) To DB6PR03MB3062.eurprd03.prod.outlook.com
 (2603:10a6:6:36::19)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR03MB3062:EE_|AS8PR03MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: 3864fcff-63a2-421f-46c6-08dd9846d6d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pquA3FcDTBX0WvJ8jyqUW/yYWzR2D+0BYZN8TMZakOvbfVuQqFoPWYM+n0kz?=
 =?us-ascii?Q?TDAnedNWFPIfOLAMWVK63CaKity+RH5O17doFo3bzuywVcXZC5AOJzLnSWzy?=
 =?us-ascii?Q?JzNf+Dh4IVrR+4hymFIQr9QLrqilo5/3V25u6BasigdHEISm+E0U2dBRmMwK?=
 =?us-ascii?Q?JyCwTe5ugB8zYu1Q8fZwOfaAe5bvFAJMZBglzLWBbgz/ufyCVKF9uPL5EqWY?=
 =?us-ascii?Q?1obw1PepTuY1olb7IYpgfy9donRAZVo00p3luwTYUvESUrJPN1u9ppc0FRaJ?=
 =?us-ascii?Q?CIfd67P7SHpdQVreEkf1gEWhx6bg2DeipuXDsO9BWPdYWnbUXD1fmGmDtlW5?=
 =?us-ascii?Q?tYAykoNGc8aphfR561dnDjlIjha9f6A52275OZ7+GVusF4bE20Pi6XHj2vH7?=
 =?us-ascii?Q?BZEaK6T0YhwRk/YemC8tn1taGM6mTQ6qpmAK69gJNPjpYoKux2vEyDi2ZAFw?=
 =?us-ascii?Q?e4Sjrk0f0OD0tmOQxo0dhoLz/0GkjrKhsHLr38VKXRULR+xpwrML+C6HeWej?=
 =?us-ascii?Q?plWtLkWHhT+LDzOK/44rIz6hwhOKB7yNzo2xE3h0sDvo8RZ7xRI29/L9I7cT?=
 =?us-ascii?Q?l6PYWniAGFTH+ZjYq8tWPOIyacyd3oa9GW4lcyrl4ghD/GQA6mAgYaIZsMuW?=
 =?us-ascii?Q?m1mfloylFNqoekI+63v/950wXPXnSNIdEBD59IwhKHuy6qXb/wzLQ9CiZzqC?=
 =?us-ascii?Q?l9CFo6jrLDIFPCBh/BUVFB66NpALmE1F8aXGiDnOiBn2gyTTrBVotFwIwIZM?=
 =?us-ascii?Q?DNJkOs9/qzbAxk6ksQ6MSmqbByysqrNrPQlH/eH4dGD8u8YKUaANOe/aQMvm?=
 =?us-ascii?Q?ykgJnYLg8DmD9/GF8fA3m3OK8Vjoq4OF1MGYEhM5g50VKEvnL8k+u6fgne/t?=
 =?us-ascii?Q?GjgBd2lfdawbmj5QSXg9ah1J/ukNXLqod15xhk7wGakkVEIBw4r0kXEEy8d4?=
 =?us-ascii?Q?GTWhvKOYV61selnU0dnnYdok8hhV21u+QoM+O1FQw+eoaiLQC0tgNViozRE2?=
 =?us-ascii?Q?kpl3L4DlLdzOxb7YzD6iKKRXjnFNkPBGVZf3RqIAqAZeboaEJq6LQ8KIcYTW?=
 =?us-ascii?Q?PlY6nWH6kpVvimZkneyzCbgSlgsV5JxDBdfIfbr1bhCOHgrwxpB3JS64Bs5y?=
 =?us-ascii?Q?GgOxgy+HESDWbzUUkp5/HnvXlb466azOoqzEjhJ6QNREvc1dwlw6eTzo3XVt?=
 =?us-ascii?Q?FmvFmeUXYPm0iUmsEa75wxG2tmkW2IT2lv3xgkTSvkHQNBihMVqt0O1XdGyh?=
 =?us-ascii?Q?1KBfvcuDtGVzIgPZYgAa1USIt1hxjIaTwr51t2nnu7EoFIz9MjtAo/Ht+CHo?=
 =?us-ascii?Q?lvMimZ8EbNFNJV0QA0uw7zysHixGDttajvfeqeZV/4Ibo192jH+kj26VTmfb?=
 =?us-ascii?Q?74JAI3IiGHCIVGD1HScrm1c9sB/61Csqsy1n8R31FtWSgB9pyd304ziWGeuN?=
 =?us-ascii?Q?AywcBVb/Jk4bfi66rUBNQfflipZdO5C4A86j9AeXRdRYHc3k/qsAhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3062.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jMrxKoxVML5sqrkBFuQVU/oHRT2113dls1co/7qjT8L08DeYwG6E5YszfaRU?=
 =?us-ascii?Q?1yE3ly1sBk2qch/rhrlat6z3E/sPgZv1z18nl7n81uFU1gR55IiTKOhntLIc?=
 =?us-ascii?Q?H+SaZfjC0dnUvFNbNLz90CjQXS6a60R8/QUnleQ+2NzfW2ttzcC6qBHR91dN?=
 =?us-ascii?Q?WDko5RImgEwOYPEJAeSvZk54CsgPZ6NBSjj/w6HPoMcqjXIjMGFuycdnG/Sk?=
 =?us-ascii?Q?r56Ng8Kx92q1/pjf4qc9uOH+cZ6K9y8vF6QEvT2y6D94Dc5VLEjVxu+OKDJ4?=
 =?us-ascii?Q?mJRiNZ6r0CEyEvpEEqUOW0Yf87+bFfCaLAAR+lUG+XvOGSGehvSuzH2O0zx2?=
 =?us-ascii?Q?sYvjKYGGA6ajWOy4uFRRYXJoUARco68gFrWUtEJZF5Zq8L161duGLYqBF60t?=
 =?us-ascii?Q?to9ZLdmQ+vEUidPYoDTdtA/zqEQMlKRiihL0nP6U1VXU3YbNszDEi9FqhBjK?=
 =?us-ascii?Q?tkU8bHujZE73IiJ9ccU1B4UQ7Yo28y5hCK6LZMrnRK+pnqimsJ1rPdJy3Ih5?=
 =?us-ascii?Q?v5XEf6pWpiwEs4XMLXGa2p9v/i8MPrw81XFC/KRrjh2sLNqNMZ7dStLc6XD+?=
 =?us-ascii?Q?nfAVMMweWRj0zDgu7MaFaTHJWuZwPnG8jgz3w1RnESDaRuTocfRVLuP69LRR?=
 =?us-ascii?Q?v8BA2lrvKzH7WXWS+nTBty6+w+ag5zw8XcB5gQKw+WVSdio+KMbl2biWOjMk?=
 =?us-ascii?Q?Z642rI9kv7zDq1rpSn64ZoqLeLTvQDqnieSkYO2/+MNL+gBKjxHM9KukK7/n?=
 =?us-ascii?Q?FAr8AFvEfzU97fz5bQ6Gee1glR2fuYlU7rk0ApqZApX3P+6BJcCVFlrzKBl+?=
 =?us-ascii?Q?h6MzzPvK6L5xDZKV3BUfO1UTzT6J8UZWk4uhovT4RNLjp6/B8WOTUfddlszL?=
 =?us-ascii?Q?iWbsGuWA1gMVGDkoFhGJQVzKpHaEgYbVSPCy0gwTQw1gFh3OglGXGfK/CGV0?=
 =?us-ascii?Q?+qVRr4AXJBOJHGTSlMHN54cydI1mCyPLxzYtnEOyD4JsJG5nNvn/jJQiLubZ?=
 =?us-ascii?Q?6Ov9zjchRqvCH2ERIEkTQQHzG0TrbDaHcUWXTs8/6o3H5eiYiuXSIaBGHzyC?=
 =?us-ascii?Q?VhPLx6Vd1PjCFAtsu5OFbr5Yp8yZ34HICIVIYOMQcXSZoSnRT64DAhA0DDO4?=
 =?us-ascii?Q?AGhyWROkDjVy0fQTpgwIh5V3XeRbNi3waAh1W4+hi3aUimHbiAW7uVi9koDU?=
 =?us-ascii?Q?8AnBWKBYKazJUXgelxVeqcKSJLK13UxlXsjWk0QxiXxjKU1zWXv270ErRLcJ?=
 =?us-ascii?Q?V3K4vLeOBOmnuQifP7sappX3zlCwY9lu2wsaGu87uTtMZUuk17BwLJiCDwZm?=
 =?us-ascii?Q?jYzgngOPgrQkv71imdm+YOSJ8RX+CRmht9axFBhwCnAR9pmd4wm2NaHzY9se?=
 =?us-ascii?Q?wGrpXWmrjgn5OxOENyT0WT4UlFzDRZOtMS12JpcGbymhHBYbNzGk7YSq6WEO?=
 =?us-ascii?Q?lOUbkiZHQ6TFqejq5Rj2t+/3EO7OTELcb+oeADHuB8lALIaxRo27bybHT6QD?=
 =?us-ascii?Q?jaYTKIzKOafawoTA1mXSvvpjyuHPycErIiaAugSvzLYfEIljKcnUi3dbY8Wa?=
 =?us-ascii?Q?Yn8+bJ5QM4o7CXSeSuSaxHepxfkFLjRtY2FnA9Fr?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3864fcff-63a2-421f-46c6-08dd9846d6d7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3062.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:06:57.7387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmrxvVPO8LEqs2AEsQPGGpJZH3gWWbBI36C8YnyFDVaSx6cNCUXcdRvZMTSolxdMJsE8XSqyBb6brMZOK1BvWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9486

Add sysfs functionality to read the status and configuration.
The functions provide the number of stored timestamp events, the current
EVIN pin configuration and the enabled/disabled status.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |   8 ++
 drivers/rtc/rtc-rv8803.c                      | 115 ++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
index 83b2fae1fc6e..ef6d5f43abd8 100644
--- a/Documentation/ABI/testing/sysfs-class-rtc-tamper
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -26,3 +26,11 @@ KernelVersion:	6.15
 Contact:	Markus Burri <markus.burri@mt.com>
 Description:	(WO) Attribute to trigger an internal timestamp event
 		Write a '1' to trigger an internal event and store a timestamp.
+
+What:		/sys/class/rtc/rtcX/tamper/status
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(RO) Attribute to read configuration and status for EVINx and buffer.
+		Provide the number of stored timestamp events, the current EVIN pin configuration
+		and the enabled/disabled status.
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index d0aac250774a..39d5881ba261 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -85,8 +85,11 @@
 
 #define RX8901_EVNT_INTF		0x47
 
+#define RX8901_BUF_OVWF			0x4F
+
 #define NO_OF_EVIN			3
 
+#define EVIN_FILTER_FACTOR		125
 #define EVIN_FILTER_MAX			40
 
 enum rv8803_type {
@@ -117,6 +120,26 @@ struct cfg_val_txt {
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
@@ -633,6 +656,16 @@ static int rv8803_nvram_read(void *priv, unsigned int offset,
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
@@ -960,14 +993,96 @@ static ssize_t trigger_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t status_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	int evin_en;
+	int evin_cfg, evin_flt;
+	int buf1_cfg, buf1_stat, buf_ovwf;
+	int inte;
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
+		inte = rv8803_read_reg(client, RX8901_EVNT_INTE);
+		if (inte < 0)
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
+	offset += sprintf(buf + offset, "Mode: %s\n",
+			  FIELD_GET(BIT(6), evin_en) ? "direct" : "fifo");
+	offset += sprintf(buf + offset, "\nExternal Event config:\n");
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "", "EVIN1", "EVIN2", "EVIN3");
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Enable",
+			  FIELD_GET(BIT(0), evin_en), FIELD_GET(BIT(1), evin_en),
+			  FIELD_GET(BIT(2), evin_en));
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Capture",
+			  FIELD_GET(BIT(3), evin_en), FIELD_GET(BIT(4), evin_en),
+			  FIELD_GET(BIT(5), evin_en));
+	offset += sprintf(buf + offset, "  %-13s  %-7ld %-7ld %-7ld\n", "Interrupt",
+			  FIELD_GET(BIT(5), inte), FIELD_GET(BIT(6), inte),
+			  FIELD_GET(BIT(7), inte));
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Pull-resistor",
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[0]),
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[1]),
+			  cfg2txt(pull_resistor_txt, ev_pullupdown[2]));
+	offset += sprintf(buf + offset, "  %-13s  %-7s %-7s %-7s\n", "Edge",
+			  cfg2txt(trigger_txt, ev_trigger[0]),
+			  cfg2txt(trigger_txt, ev_trigger[1]),
+			  cfg2txt(trigger_txt, ev_trigger[2]));
+	offset += sprintf(buf + offset, "  %-13s  %-7d %-7d %-7d\n", "Filter [ms]",
+			  ev_filter[0], ev_filter[1], ev_filter[2]);
+
+	offset += sprintf(buf + offset, "\nBuffer config:\n");
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


