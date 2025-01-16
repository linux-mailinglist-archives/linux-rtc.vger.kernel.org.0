Return-Path: <linux-rtc+bounces-2936-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5A9A13AB0
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 14:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A41F1692F3
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2025 13:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A39227584;
	Thu, 16 Jan 2025 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="iJRcb7AA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624AA22687A;
	Thu, 16 Jan 2025 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737033409; cv=fail; b=tPyfWlv4r4dSg1pyvRpsYGfY0PjixzEJ5Z2D/LxP3ZgPiJxLRedFlYy4ejbh+FZPnV+8dMq+Zl/q1MwYMarceb+MGsRXELF0inoLYRWukZvQYQDeXJh1fW/MCjNNNBjTTAhuzgNpBDk5KkPyKnCkbjJoYPRIgvhx1rPuwbZDycU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737033409; c=relaxed/simple;
	bh=T0igLe/WdMYjFLECCv0okRIHss/bNEZ41PsElK/lXC4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PlIXoGELm/9S47YLF+3qCQxyLP2ckiwe+lBGrZ3lcPRRtEkIVcu678wXTDYz7WbC1ORlBgO65O8hW1WezG1XddNbqzyk0OrrkyeC7gjIKaF3GA4RBcM5HNRFTxK0Ilxjd1ntGAtaadWv4hPx261kSl6Y596Jz1oXKxX2KpCqp88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=iJRcb7AA; arc=fail smtp.client-ip=40.107.20.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNHBVkuSeotBjRnDeb8JpHcFvP35z0X7kSqN8vqrdEKXEds0Wj7jKMZxuWZ/stOzk1UqRZGEpBeR/P8RrbtweJqzRk6nwp24EoB4aoYR0nScfCbt7MuGxT2meSQMx04j310+bGmy3rgkQXv1OVJEITnKsJXi+jN4qbhUHgacKsCgv0MnIwWO1po1Z/zodsLzr7RW1BW9yJVPtuvhzkfqeK4cn76AD5D8EFjdhOux25Ymhf7DFsLTeGMpRVIvpyvi9QAt3N+0TSR6Rd5E5S4tRww8bj0z+26JgHf+db23MJdBByx7+KSNCcDSOPgIfoE2Dty8A2neukDGJxHfoDaiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyxHY4cHAJj5jQ0cmT6vECmB64aT7TxR+aMGbq+e8jw=;
 b=dZUr58zUbmuf0lbB9/MOR/36Vy17D2QYstgLb7kPlvKDluv9n7Je8AlV4zU7ZgIblu3QvVv/Aoqrb4DCZipiWx7RBbeuKjbRRQi+bmx+BNG8t8F0r9pfZXgIseNfNy1t9aCc3tavME7gmJIVyRfxlhDHu30XER2dmtTsslw4CaJyT09M2F8hQwAcHLWuEeGm3MMJsyWSyWtAOwTui8vRHgpRhtmAfun6vQQmHcQZT/flAo5lrUJK3ZLer4BeXAy9cgdLwPHiVltN9d9h06bjMciwjo9xS0v7R7FIJYWvwOiFlJ5ikSvSGF7Kn1Rh8dOzQEHKpI2Z1fRwjRfE8MnPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyxHY4cHAJj5jQ0cmT6vECmB64aT7TxR+aMGbq+e8jw=;
 b=iJRcb7AA7hVD+xk4bjd2GXnfmmXdkLr7RDeDthhJzIZQUz604UF4Dz6UK8Gjkv3pxcaIkjnElC/ucOuzwINKVaeygPQxqM6zyhobxHNUwqKXzt05fGbkzUyte/W0gCvD5dSYA6/BFT2H705VqEXaMU30iCr2emPzqKsZKF24rbB6mUHx2Qz/2ubz5xJs5Et1cYm46rNuX3Ooj0Ex2XrYKZ0eSwbD9AtUGsRc1XvcjHU9Ia1h7IbCxciDydnABRHflq+uTGaGYHOXp6f4ssdEUcazLonje29W80uEFKydeTlkKU4tZeCu9jhcK6q8ZtwfofjAwiZWz4IXmijUP1FPnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by GVXPR03MB10213.eurprd03.prod.outlook.com (2603:10a6:150:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 13:16:44 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:16:44 +0000
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
Subject: [PATCH v2 4/5] rtc-rv8803: extend sysfs to trigger internal ts-event
Date: Thu, 16 Jan 2025 14:15:31 +0100
Message-Id: <20250116131532.471040-5-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116131532.471040-1-markus.burri@mt.com>
References: <20250116131532.471040-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0440.namprd03.prod.outlook.com
 (2603:10b6:610:10e::29) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|GVXPR03MB10213:EE_
X-MS-Office365-Filtering-Correlation-Id: 09cfb58e-b815-4cd6-5c66-08dd3630062f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wzmnq9lyfRHPyKEZsApDiTMIFles2rIPO7rUKqFtYvRUiuksdyL2XQB/amIP?=
 =?us-ascii?Q?6/uFx2YCGc2XpqRmCbHXns8USeXiZK1iYtMcIj5wCueJW8JJaWWlyMrZaXli?=
 =?us-ascii?Q?cluQu9pj2SODhn8Zb2q8qRKgzi6+hzUZQbA/26juF+i8IxQ9tvypNYnIVNkd?=
 =?us-ascii?Q?sfiK2RcJTXnt3VwpyRq86gTUEFOnRCjTLADdbqeW0Kl2RSaCjY0/EJDU5XEk?=
 =?us-ascii?Q?wMTwDqmTNQAWc04vh31Z47pZ/2huQ5B9e0ib0KXRNDw/1Mbn6h27Nkgc68oU?=
 =?us-ascii?Q?GFtOfHY8CV8hGqHgEsqlgyk0XH8pvntzYN1wdCsWQ/dw8w7C+JBpcr3yGWAm?=
 =?us-ascii?Q?q1VbBQRdUMgJzLoLtG4VOorSJDiSJ9OXkdDD3rouK3TeKFiZ4gtUp7285Ipe?=
 =?us-ascii?Q?i4oH0Bq8LggTQe3XMpTWbB/jdSLCWnIWtiDgEYXl+NDNpPidc1E+LlwMdqxw?=
 =?us-ascii?Q?wSzbpJEkP0E3X/OSfQrDZBK21WoJtejrV//WXnOeHSWF26HBZrG0zMP5zlv7?=
 =?us-ascii?Q?89J316lFOdvk8gwvc9x20Bu+DpGPgUpKzSQO8RtUGIoy+hVB+JQtJd1qkpfp?=
 =?us-ascii?Q?ULcvOedxfezInS7lSQWfIzkYbCTXTyoyRMV6TvJLPIaUxKwPK5OfhB6SnHWC?=
 =?us-ascii?Q?Q0mX38mr0LCtsNzLKrZ7uMP3ak+G8nhbiEOXu3/y0u5QcihoQ4eVvMhM17sK?=
 =?us-ascii?Q?uIJi92NYpFdVbd0vf8HSrVROf12vyMQEbZ8/gj9iC24nhM+YEQO3UdM3tBQ+?=
 =?us-ascii?Q?JU+1Y6jkfXGB7nrXXsGdcE59ZEUtB/92KD0gFGXuW5N0TRXWiHiuW16yB23h?=
 =?us-ascii?Q?OqXddS5OGjBxM0R13iAjL2m8gyDXqN7nqjtCLOZvvYkN3U96p+wM2nTyQCAx?=
 =?us-ascii?Q?vcguFt0U2C836Y7jgZ058esvVF8q1bRAMlbb4C2IWIR/dLkkSxYmxCT3a6k9?=
 =?us-ascii?Q?2gOUXRd/6ABxjRRUQPYISvATi+OWYJ7aVnNUChzAzl+HiCRB7hOI6PkQpB2Z?=
 =?us-ascii?Q?v0fcts64zeeNA98yDWZ8/Pz8rk8syXG+1OSRDDk2h9vtHW1Pal1Ymb18w+rC?=
 =?us-ascii?Q?eflF1WjWlxCTDQ/K1B2g7iw9q2nCHjxdw77MvEDvDq4aYia+Mepxr931QcVV?=
 =?us-ascii?Q?o3APf05iNCfFlxtWaAeHqChjLQhZ+C8YsXY67yF1PXIJmL6BA9W64QMcHzjh?=
 =?us-ascii?Q?plFU/bTOeJPz/Snu6c+SAoiHTAf5pdMEP4Te11HHoogqcIJb1SiotoP6wF16?=
 =?us-ascii?Q?y3SvmNqx4gk4/BmBOekrUwdmoC7NvzknXYzdGoOq1oijcTRQHViziRejiLSt?=
 =?us-ascii?Q?XVMA2k3ab4EveanuKBPbI+1ZQl9Lk6NvRPV9gIXXFC19yyTdgVoePF/ftsv1?=
 =?us-ascii?Q?sSUAOHThbFqJs/zUSAix1g8CeqXYASsGQZLbx6R+7pqW0K9Y9mG2xW6lGcJI?=
 =?us-ascii?Q?D3VrTvqcrCUOgKGWTytEh9Mk/BlyyjWE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mzfilpGHJqXCNZ/r34CltHEXis0EpO1j+g9KpvZl7yvc7pp8qs6gz1ivywhB?=
 =?us-ascii?Q?rBthHJfRjeVeviimurDMXwYf2/Nt9e5PAKGD0mjtNp+bKVuWtgGQcFaq+mqG?=
 =?us-ascii?Q?rkBP1DxFJ/0oRiXEcyRxl5vyZ8xy2SkfGDjruxpYS4ur1hfxL4gNYR8UL2nn?=
 =?us-ascii?Q?q2t4dlgJkpBpJ5ObVin4Y4d0cUIyKpzb3RU6hsU9rjGKgWLDGnQ+RdTQACcx?=
 =?us-ascii?Q?/P8mDFjmj6nKyB/VFCGdaTwRfszPdddwlBbEevU9BA+OXWjMBn5BEgPkzo1E?=
 =?us-ascii?Q?GiF9INiyGfjnRNNTiXRhp+ZYQCGcrZkNWHkZU15FqCVxH9o1lUIiE0U0k0kk?=
 =?us-ascii?Q?DcF2+lEovkcOzyMflggVTkwGueXS2+vVWuH/iLLFnwK0RK1z2BddQrCxwTGt?=
 =?us-ascii?Q?YHUe33jukHCn4oF2rMJ1LXLGraXRHQ7mF7iO0ISAMHZfqPdIfRzETJN5WOiu?=
 =?us-ascii?Q?nh9A776bgp6JinXkvOje3VKcmgfIwtpOJ7QhouO0o2HXTVYU9vEb8SH937J2?=
 =?us-ascii?Q?C4ZWYBt3i90VgAkLwKD54aLgXdkKHkI7tzr4hhof6FFg5GAu4D61G32AhzP/?=
 =?us-ascii?Q?M9xBFwsj3SC4M/ebkidg8UC59DBKKldvnueuEiZxF9nKQYLrU403AEk10ZmQ?=
 =?us-ascii?Q?A4THrbzraY2AoaNHHMnLy/Jk7ZQ+6WURYupvJLNNHLjz5ZjsazCxtpSxijG3?=
 =?us-ascii?Q?jyOYvylU7ldr6p7FjQNYKFXGmi4zpn/fUcODaqP1gX/xaOm3CGYpAk3n3ALF?=
 =?us-ascii?Q?P+pxCHv7YZoc9dGpVLTVRYkOow4DQbhrm8v4dpCQhTWzu9ikCxpwaHjbOvBW?=
 =?us-ascii?Q?CLhuLGrRffXRga8Mqg35sPUK7Cbo+qHFIQXTG6URHWVzfnlWdetbfTM4s9Lm?=
 =?us-ascii?Q?7Wu9xoXSl5tpo5lJMmVgTyjO0uWFtu70yKAGrNzCrt+Ctym8vlv5fmX3MyRT?=
 =?us-ascii?Q?DeMDtXfl7oZqraVqF8HFEC0odLOhgmS6Lbfc/Rrtyre0FuRKFHPmStJQP2Cl?=
 =?us-ascii?Q?Jxh39pLHyu7yPLU2l9BuR9AeZfASUL8HOU4Br9qIY8IOLak2Ey5mFIhiS05k?=
 =?us-ascii?Q?HdDnWlwRmpYwFz67T5r74fu+8/rIJAQPW+Xw9/tFKnt3V2rgxvsIaN7h26li?=
 =?us-ascii?Q?9+5fefq7UfXXpQvwp9JUJ4Lq4kf/u3r1RSOpnfeLHPhHyTOdxwRmoKcvW45U?=
 =?us-ascii?Q?EOvxiGvUm6fYJ58AORm7eBV37V5F+yQfVm9PwTLiulbs2yoF+FufAJyZLkhw?=
 =?us-ascii?Q?GvDqFXI958h9g59dV52asIU7Semi6yALf2AVvCmzfQ+L4Uz+SHHG2YYba6Ub?=
 =?us-ascii?Q?+R7lfknldAGN5mX8kEwSIY7BLy34Ch5ueH1D+mmEAtOLHFwVWtDtv0v5uAN9?=
 =?us-ascii?Q?Wc+2xM8g7QwWCfdGcUhx+xx8ujFSRyrOzMq/tu+vKckgF9q1NVvzIjEYCMXX?=
 =?us-ascii?Q?YVY+S4ktLlS0RhzDG65Q+078yyexNkTXw2Rs9WesRii4Ni5t5dh8g1j9Hi6T?=
 =?us-ascii?Q?247+gZQViQCzVjOHDaqhiAXs78ZmZyA0IvL3/qAmafnAGVlCmHurWmW5IFKX?=
 =?us-ascii?Q?MSLaEUDBkmUez/JKEbqwXOtRMe0Od+1yfGyhKjVq?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cfb58e-b815-4cd6-5c66-08dd3630062f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:16:44.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jq52PhLBTvCQoi9uZbWAwmsFY1wRhyF/UpqWnVFkWF2r2f1DeVbtnALwptLl5amNNkUL24Di0tno0q09FfDHYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10213

Extend sysfs to trigger an internal time-stamp event.

The trigger function can be used from an application to trigger an
internal time-stamp event.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 .../ABI/testing/sysfs-class-rtc-tamper        |  7 ++++
 drivers/rtc/rtc-rv8803.c                      | 33 +++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-rtc-tamper b/Documentation/ABI/testing/sysfs-class-rtc-tamper
index f035d0fa5..2fd6578a6 100644
--- a/Documentation/ABI/testing/sysfs-class-rtc-tamper
+++ b/Documentation/ABI/testing/sysfs-class-rtc-tamper
@@ -18,4 +18,11 @@ Description:	(RO) Attribute to read the stored timestamps form buffer FIFO.
 		- "1234.567 EVIN1=1" for a trigger from EVIN1 changed from low to high
 		- "1234.567 EVIN1=0 EVIN2=1 for a simultaneous trigger of EVIN1 changed to low and
 		  EVIN2 changed to high.
+		- "1234.567 CMD=0" for a internal trigger
 
+What:		/sys/class/rtc/rtcX/tamper/trigger
+Date:		January 2025
+KernelVersion:	6.13
+Contact:	Markus Burri <markus.burri@mt.com>
+Description:	(WO) Attribute to trigger an internal timestamp event
+		Write a '1' to trigger an internal event and store a timestamp.
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 764e654c2..ca3a19162 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -904,12 +904,45 @@ static ssize_t read_show(struct device *dev, struct device_attribute *attr, char
 	return offset;
 }
 
+static ssize_t trigger_store(struct device *dev, struct device_attribute *attr, const char *buf,
+			     size_t count)
+{
+	struct rv8803_data *rv8803 = dev_get_drvdata(dev->parent);
+	struct i2c_client *client = rv8803->client;
+	int ret;
+	unsigned long tmo;
+
+	guard(mutex)(&rv8803->flags_lock);
+
+	/* CMDTRGEN */
+	ret = rv8803_write_reg(client, RX8901_WRCMD_CFG, BIT(0));
+	if (ret < 0)
+		return ret;
+	ret = rv8803_write_reg(client, RX8901_WRCMD_TRG, 0xFF);
+	if (ret < 0)
+		return ret;
+
+	tmo = jiffies + msecs_to_jiffies(100); /* timeout 100ms */
+	do {
+		usleep_range(10, 2000);
+		ret = rv8803_read_reg(client, RX8901_WRCMD_TRG);
+		if (ret < 0)
+			return ret;
+		if (time_after(jiffies, tmo))
+			return -EBUSY;
+	} while (ret);
+
+	return count;
+}
+
 static DEVICE_ATTR_WO(enable);
 static DEVICE_ATTR_RO(read);
+static DEVICE_ATTR_WO(trigger);
 
 static struct attribute *rv8803_rtc_event_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_read.attr,
+	&dev_attr_trigger.attr,
 	NULL
 };
 
-- 
2.39.5


