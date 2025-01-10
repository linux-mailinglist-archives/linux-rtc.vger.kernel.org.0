Return-Path: <linux-rtc+bounces-2861-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E7A08826
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 07:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B52716A71F
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 06:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D7F207A01;
	Fri, 10 Jan 2025 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="MucdxWYT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4131206F08;
	Fri, 10 Jan 2025 06:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736489677; cv=fail; b=GzYVE7ERUpF4yFgZCLV88n++VbkhP/dNKL3G2Rf5K8PZNJJa/96bEjvf/Tv6YrsVKQ3o5meas4UTHmlPGzk/T5XaynO8xhXmNUWPE0WmdN2OMFJ1TEq3gN1gSsvZ5tx2A2BbTW+VLL80fQIudyeHF5c0+Hhypjh4GbZ6FtNL514=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736489677; c=relaxed/simple;
	bh=qvcJyj1F15jefS1wvpfjAJEaGMM8L8CYoFYSxzPF33E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CrmVcOwEBcxxt/n5D+koZoewP9PojzoXQohM5cENG/sV5oUmCpnXerNGm6AdZjnPzCoqdYEp9xQEPDzCSWhcEgvgUFos/nPNXqON8DZVyv+nBBQr1gKcNkJ68bmCTBaXUCyyeKIOoJEi2G01Sn74WcHzwZMhHwiZooq49x/IMiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=MucdxWYT; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udJwGT0wKLOqZipGUfX3JxV14xplMGJbgrhRQs2+Anh0ckeqjH3XrhdCypME9dVh7byyoNk9EsZ9mndIUpovw5QvRPXartmUuGlfzQLqJfduOC4Z8++FKKv0ZnepMn7QCm2JWDkOUvF92NBDBV5sEfjHnr+VTsbrNr9K+VsIoMQsvZ2Yh4ru1Axtf2dCOhr9QsIo1AtqYzQ/D0hsGh+YsiFIbRc9ra7ldCnRT5AUm+UlYQJptHJSUe6nvkczp9CTd9h/CS1KZb0brGDJnIvkYSd872qQi+e7Hd7/vWkSWgSJ5dYAsKhCKwDYrnUkZ6v/rrGHagXS78te/gTFTTeYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMMKLPhyIvDXMVx0uweIOSnyFJ/amAKpVzYiYyA6Khk=;
 b=CE0L1DXgAJoorPoB2N+al3cOSApP90Wr2RDxE5gn5LuYpYD4m+tIv84ALM7DlcwqHb22iYBp3n67Ab8a1h8ekcwKhygrjp3E8GO1fMN65+bGDV6X5Dpf3a4/F3SQKDhnvRwVkmFf5idvsiP7hyMwu4CEiLjUr6eEqNzgPTmKuAEiXJzP3sHrxppg3oyq2XfEVZbH/SQoCElQ6Dc7xXLzuFYbb3b08jLqMrM5/tLTvtRLnk19p5y3na5G0aJCRLkMrh5NM2KdrvATiDjyIle+buso9hOthnzvtXyFqOBuyJcHgzPUXDoNeSSZa0FxfQDvhoAgzGxOf2LVBsQPZRp9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMMKLPhyIvDXMVx0uweIOSnyFJ/amAKpVzYiYyA6Khk=;
 b=MucdxWYTYf/IqShxpnl66ysWN/A05J4D9vG1QbzgFU1i09o2GhhMi7Wf5v9Y79GhRNLgSuV4aQVll8ro3Svgy4pzF29uP0+DRCbswGSudJYk6Ak30PrGBTcsrFG812S5oNcL1fbyqywzz3pdGiYmSPQGDJdJeaPwbVsw0dSbX8VQkJABI1GDBvR3etO/WryFQBGwetZKOH7FLQMMr1cyb0cJf5kwjlgKeOapqH1iJ1u74yJsjB+ZNh9nfFWBhqKADRgqiGZMV4eyCJc0xaKxmLK2s4+AQpOnKScKE9xwWjviefFJY3lTiQ1y3AwVY9BI2Jw2JfJVviZmQC8KwFk9fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DU0PR03MB8855.eurprd03.prod.outlook.com (2603:10a6:10:40d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 06:14:29 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:14:29 +0000
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
Subject: [PATCH v1 1/7] dt-bindings: rtc: add new type for epson,rx8901
Date: Fri, 10 Jan 2025 07:13:55 +0100
Message-Id: <20250110061401.358371-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110061401.358371-1-markus.burri@mt.com>
References: <20250110061401.358371-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::14) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DU0PR03MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c352444-1794-4e5d-a896-08dd313e0ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OWq2SCcddvic7WS6ms0sYhgZA6mpf/B5ffOkNWDgRkp472og0WwVBYmhlj5+?=
 =?us-ascii?Q?4bWGdFl8bCxqiw1GtMKHKs2doCsbd8hDzAqCk3BKaziK4g5EXcjISN4qhmPL?=
 =?us-ascii?Q?lu+BGjl8wud90LtTiELsgknUnP61NEg34umYqBDbtO0P+G4Yaj964+VutS40?=
 =?us-ascii?Q?kLMclg0pXq8HreqeFf2YlPTNcTs1yIgrYdFDdkmIv9hLrmv0SCX3/YTXYRj/?=
 =?us-ascii?Q?WLonRPMaIMpF3Cz/A+b/LelIUwkWSYl7OUyJU0jbCVPiwfIZSleaULHb2+eC?=
 =?us-ascii?Q?hOzS3fw6v9xIxYAn/IdMa8ZvEdMWclBlwGT+nh91SPfHfnRgzqRBJLrfqVPl?=
 =?us-ascii?Q?Cdh8hreFyHTvyf0qdyo8f2G8VrXstt92tKNvnAMQn/YNb+hyUUvvBlNSMyxW?=
 =?us-ascii?Q?wSqgWy06J2PDT9IR+CORqy9jBqeAzECJ/GgillCmIbsh5f2BDNjkc5bPGd7p?=
 =?us-ascii?Q?jKPeA+VlppdOfNKjiCtxbSPIq+E1tr/jOOki/cD1+pGRHdCylwydNmFEbvZa?=
 =?us-ascii?Q?1qHE2447XnzcW1N5jWcneZ2v9cXQINva63a/IcSW0I4UUYoAjzplltRpeWVx?=
 =?us-ascii?Q?8/MGO3EtiEv9Uu8wI4H9nE2h5WWvgULQUcgaDfa/3evp9mceaygN8y/D9ObE?=
 =?us-ascii?Q?UXb7lo7JuyVfFaM/V4OkMNUBI4mh0/n+ek1sc2hIVjW5njO99SO09Rb7qIey?=
 =?us-ascii?Q?6h4OWBmesOmQ8HP2DIEN1IArNrgGNEX3m9d5qsuPQnCHRpOGEZOefhvHsz6H?=
 =?us-ascii?Q?DIzr9IoULJl92rBf/Ij+vj2fnE1ggs/BITb5bmOOwBMcsOi+CyKsOKRza+4z?=
 =?us-ascii?Q?Y/Ehuieo29Kz85OaQVyAmAGPHmc3LpEkbCTbmfmI1IvLDHqQJ8RHZWiyoUOU?=
 =?us-ascii?Q?35r1i2Wj+6WrhpF0xg+Uz1HZiyAC5nrmOAYTi72rbyk8k6cp6b1QdSKnCCYg?=
 =?us-ascii?Q?Zz0CnueJ6CYXhQHDqK3awet0mPRHJssBz7s6ahfB0NUDeEr4jS+wMVAjhqTV?=
 =?us-ascii?Q?Dc/O7qIbkPSILSKOy4AaaL1aZZY5XssICZkja+fUtBdue2QMRZKThYGZmmUb?=
 =?us-ascii?Q?ImXQLJpoKQI2iPQR9rgCbyaBzjC8AX1AfE0Og4Cvsbjrb/jJxvtAdXlIaIiJ?=
 =?us-ascii?Q?xqn9ZEsODWXEZeVfCGJkDhbt5rq0W11q2ehbOOxplWki2Ub5/RaxbIMRkSh6?=
 =?us-ascii?Q?tMd3inGyZBfY9WnAJNzZ9q2C5t3AkPlOQ8+oHyHsSZwSwFGxpNNlID2KW/+1?=
 =?us-ascii?Q?D5wav+iDT+JWWfnmqtbv2ZOyFETELl/gOPKONiYSaR7tjkLqLoQT804kodlV?=
 =?us-ascii?Q?ymtjqvqgmTTdjBeQeZmQdMZmBlkjXEg77VJ36XL7LrsL0zd1sPtSuQBgSqjK?=
 =?us-ascii?Q?3teAYttjJ/s4ai7GwR9dnlSLnxHXEpf24jh7E6R9oGXscKUIKikQhr8HTUUR?=
 =?us-ascii?Q?0wuU5Yf9djj3da8gDWkcS1RouE/7owot?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l22PRcl24vIkh8IYVnkC1wMQxfpoa+eYdQY467vOBkwHUzXMq4I1hBEEUveY?=
 =?us-ascii?Q?xDueZG+mxnLt764jwGjXD9tvuZgtRyYZs8YaAUN5J79S63McJ244Vpmyinqn?=
 =?us-ascii?Q?VPt6JF7CyZ2CH2IDxN09WOCZhL4erhG9A8AS39qgdAb+qMcaflk98FHEKIuU?=
 =?us-ascii?Q?OE0wp0rU6LYd0TLfybfRErMPB5NslD05MFJcdqAAzM9E4yZRuow5Xq7aX7JI?=
 =?us-ascii?Q?o0H6+1Ebwp4+x68gFI1uwtgzLAiABLKzX8oXM/Rsv+3i1bTFluXgYF6eDsaS?=
 =?us-ascii?Q?k423jo9VADboydt+Wdif31/UB9wnV5yTxLno/mnssZNrUsrCtjGOJhuqxbYn?=
 =?us-ascii?Q?RzCHqTwecIvySR5Y95iP/9FCBjacF7HCq5BWK5vMdmlGyPO/IFSsER9YjE6v?=
 =?us-ascii?Q?aAbptQhl+v25uIxE0BoC7nvYCKj8ZrB2w3Arj1LY00Z6FeexH8S24/W8ZG8R?=
 =?us-ascii?Q?W8rokQsPzJVOAyJ3I27sLoCmw2r5VOZ3BQXtVLEDFVwi2xTordi3C1uiJu15?=
 =?us-ascii?Q?NN13kJ2FHC6TrBokCk6Fb0NiyZQ866oEruT4JQPvUcQPR3wfOmjBRM74diML?=
 =?us-ascii?Q?7q37digspaRcC2nw6WQHnRAGXIWu2erKV+LqgfCu3SytgZmykAUf2ExTJ3u9?=
 =?us-ascii?Q?ImTmtQgDk3cPaYw15JyEsyHFtzjnfemf1+ClDvNpnFM+oTbkOs3AoUHmuMqN?=
 =?us-ascii?Q?8BhyGj0+SeRcvbJkz3UCx5L+tn35nPPjK/hUdjPVXbtDvIbikp+biY3wR7oX?=
 =?us-ascii?Q?4HWQAxmxXitobSae4fRNT9zX798mu/Ks9Hs0zRwY62FqnSZYC9SlWSMRb/KO?=
 =?us-ascii?Q?Sc27BZcQiZHU2BnxJq64YZegYHTCzpBlvHdNoTEZDx2+JAXjWcYv19FCIbjo?=
 =?us-ascii?Q?9j3Vh4rHFLeN2lYlWjhZoeoIiFzENpR5zij4kY0MB8lGj0mN/e57fTCfogaW?=
 =?us-ascii?Q?XnFD88D1ngrQ3AO2mRmyxFOfNwBkWoW2J0M3L9yeyYOZvZPXGV3LYvChXd8x?=
 =?us-ascii?Q?OrUC/AYtBJPZNcKvtYDgRdDj0WLFoH6wkVwdh/ynfbeCdXcNezmQB4GQKtVL?=
 =?us-ascii?Q?C8btxSFzzNUWISB80RnCmWiZodDbF9YG1mpGbFwUKcfORXW593wxv4IyNpvz?=
 =?us-ascii?Q?/0FOV2G0kfbAJZDcwbS0ulaFtcG2FaIfm5PGDynY6onFbWOfVo8GVfWhruV0?=
 =?us-ascii?Q?25kVOJ+h8drokES6d2RHnv7ihtBn7yQ12ec1SLo++8gaVxMqjKfl0MTUyfL/?=
 =?us-ascii?Q?sZoHBkeCsjfI9uw2hXV8JEQeNBCi1qE37ymPFaGMtv6m/jxskgMK9vRA3/PU?=
 =?us-ascii?Q?u8CEsToJh5n/+F927RuZyg1Un/G32/96+J0o595W+eDSLIlnurKZ104/08M3?=
 =?us-ascii?Q?NHelEDFIX7kfx7VPKYIxiu3WRysga/s+Pg736xx+WMm0dRP1+baLFNAf+/pX?=
 =?us-ascii?Q?+ZFOMpFACeE0JjrzVKKPDq1rCii/uWciUsJSE7JdqOPrcROpST58J7F8cfR+?=
 =?us-ascii?Q?7zl3d5N/KWCyeugpYzYHfqD0FSVqKGGdcrb/v2C5+9rONy4oQ8jprFSZBvPY?=
 =?us-ascii?Q?iQaOEkgEDJ4poPzpPuGT9UZdggHCm0r1Feq7gf+3?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c352444-1794-4e5d-a896-08dd313e0ac7
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:14:29.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJ1pmaBXes9oWIOUt2p5KYXK+IQkh3GAnjgIQ/UYHNkHkDPYw/RFwBPnL+YnwF6r8kloMUGBsZr+IfoZeIweTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8855

Add new compatibility string for the epson rx8901 chip.
The chip has input pins for tamper detection.
This patch add a new compatibility string for this type. This is
needed to enable the functionality for this type of chip.

The compatibility string is defined in the driver but not documented
in dt-bindings.

The patch also add compatibility string for epson,rx8803.
The type is supported by the driver but not documented.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index b770149..03af817 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -15,8 +15,10 @@ allOf:
 properties:
   compatible:
     enum:
+      - epson,rx8803
       - epson,rx8804
       - epson,rx8900
+      - epson,rx8901
       - microcrystal,rv8803
 
   reg:
-- 
2.39.5


