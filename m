Return-Path: <linux-rtc+bounces-3314-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3F7A49335
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 09:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4CC0188567D
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 08:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7762B24394C;
	Fri, 28 Feb 2025 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W6qwdd+F"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9583B243374;
	Fri, 28 Feb 2025 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730710; cv=fail; b=m6sRSjYzFVdipDITbNgxotdILFmpOcIzWNv2gW3aElI434SDjnLFBVm7UJ8InS46XCHbhsHYq6fuiJfKYgVa6FZfn1p72zZt+9Lwydym5M81ADfAW2ehLi0278eDWtJHvOQiQlEnzPDOygLCZSD4+ph9y+sl430fr7U4+6G1DbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730710; c=relaxed/simple;
	bh=p7o9XLISEYCQZ6M+sQ+6QFc2fZ6Eug58k4nZmutnaUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BskEZF39cwgDLIn/SzHTbImbVE98+lvpxup0C5lQCv445cFEDozzGbNnnQYJ/Qmk8UhhaULHn/45yVVevc5hnrUEUyL4dL/epz016QkvosVB7FyMYoVv97e1dO5tcSk9h2dLtzeR5y9N1XS4oe/l3JUyZ6kREzdn7miniujlr/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W6qwdd+F; arc=fail smtp.client-ip=40.107.22.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZ40jTAGkGAK62AnOLtLhzOE+P/8bkosivwSNZxwsLxSoEgZuIGMHcsbiCjSsQ7+FAd7cFAIMmzFIm4+y38+qW/JkMvCSawurgMGX9Vh7KLoriFzzoWmCQQKVqS/Fj7HkRKmYnQonfuHtUAXFSUbwceEcabZNgIAK3l2eJN8Vk7b6UPazH3W2xJfwRdunKlkBoR46CtKKNsXaxDjBs7O8Ak3VUIOn5qIqxNRUKvhUusG9e0ZEJvkGFOgErbwvit9Y4NqHtR5zlpdNdrBTUUJHeBY2jIaThWYFPuoDSy3w0JBbRgD5jIXbnJeGTsiRy9lRXvPT5ntL82MK1LOe0b0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzWH9WrgVxmum7Nz1/txw2y3F0EBTurhIelA89/5kWc=;
 b=p343GKr3kZavzK6k8IDlCeqiGq2I6uTcvTyWCFa7jGV9pJBjxEEQN+AhhdfH1RjQ1yKfSTjNQS9jSewfsbQ0C3PJxVD/HIqYpCN5wsqWuD4wfYieTPpatkQYIN4tEsKf9tG1tShb95rf5hyIwi7DRTSfiRcRDxvNhnQNxjcQrDynWxKcIdhZsswLHzdi/BLv45EpFyMXKNDbH9YZ9YQDQxvqyT+7+Jf6zyHLx3sbx/GKsDW4UnjmaSvdDSUvzcNv4ntsqvnaY6LF8zhYNQyDRM4VFr61RHOv1TzsUIVv9JcrvAB59PYUbXi9aLZhD/uicJjWO4HTwZ2ny4YZkrsVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzWH9WrgVxmum7Nz1/txw2y3F0EBTurhIelA89/5kWc=;
 b=W6qwdd+Fwg/49itgT886Dp97UU3m56bFNXQ8ardRpJOH0qQExlYNkjFkx1fLCqlDKFDX88uIEBW6IWtx13s2aj9WfMQfDyiVXH7dSmZRq3cdkrnbhrKTrsAgmMdxqsowlF1eXIWk8ZmNZqH4okOmROwVKFQipiyinIUDW2TmT/LA3IhLzI7f/41gJitYIse9EHNwXK9V7xGcekXnGfU3eyd2SNltZlUvg043kuV9KYIO6sOic5r0NwK3idh4pM1WY0Fa/wh5r91X/MEkhoR+Ol6kPXHmOuhSyz7DYBiIs9z4Z3NjYOC03jK+TtQy5OsHhoNba7pAPouKIiq91GxDkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI0PR04MB10688.eurprd04.prod.outlook.com (2603:10a6:800:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 08:18:24 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 08:18:24 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v8 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Fri, 28 Feb 2025 10:18:09 +0200
Message-ID: <20250228081812.3115478-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
References: <20250228081812.3115478-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0005.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::17) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI0PR04MB10688:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f45d3e-653e-4c99-56cd-08dd57d07842
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1JXSlhPazZaTzRBLys2c21MR0V5Q2V3L1Y1SVUyZHRSWDZQaEtMSG5rNDcv?=
 =?utf-8?B?RUM1Z3dxOFR3S0NhQWZGY3FIcEUxcUpqNThscTdBWmpOR0h5cVh3MjRTMTZN?=
 =?utf-8?B?bkNoZzRvZFAxdTdyNVRZSVk4M1dzNnJ0aHc1VjRueXZGbWZWaFZwbXY4aXor?=
 =?utf-8?B?ZXc5Q0JINXk4NHVXOEhqdXl1WGRwYS9RSGFGYWhEYTBURG1OdC9PNjB5Y0sy?=
 =?utf-8?B?ZnlBREZkaWp1WjI2eW9Ua1R0VXRNNjFPeXhlbTBwdXdSWklhcUJ0cStKaHVu?=
 =?utf-8?B?eDRKN0hEMkRJb1hBS0tiNDRjbGdjd1VaOW9jamN6WWQxYkxON25VdW85Yzgy?=
 =?utf-8?B?V0ZrVG5hTSs2Z2t0dnpQbWJVVFE5clZ3QmIvSE9pckxvQ1Fla1BaSEw3RXV1?=
 =?utf-8?B?MitIVGV1Sk9VRGR6QXR1YTA2UkRpbWl6c3d0WFR5ZzQxcG9XQ1o5R1RLaW9B?=
 =?utf-8?B?aXNINGpXelZmTFcxdlJpZ2o4RUMxemJqdGdBdFJpRktJZ3ArQlZvcEtlUy90?=
 =?utf-8?B?Nyt1K3pIQTJrWGVDSlpJOUFOYnJTQkhYY3VxTVFnYVZsVkp0Ym1XVFdudU1z?=
 =?utf-8?B?SHJIWGptYldZSDA3UHJvMVM1MmFrQnluT2ozOVR1M1QyNkZ4VmlKZ2o0dTNX?=
 =?utf-8?B?ck9DN0l0dUtlR0RHVGoyTExUMXhncGQ5dC9nK2VIakthVi95ZjdKQmhvK1c2?=
 =?utf-8?B?YitCWjUybzhjQjFxQjNLQjNIbXAwRWxJTHRjVmh6QXYvMW5ucWMxdWtHSEtr?=
 =?utf-8?B?aHJiVzZPQlhBY1o3cno2ZWM0RGVLSVJWRHo2NTdjUjc5TG54T1V1MDdHT2Rv?=
 =?utf-8?B?T3h1OS9Rb3BRNy9UL2hMcnZ0dFhqb2JTcXdIN1NMQktoRjFqTlorZmRxK2dp?=
 =?utf-8?B?cmNiK3YvcWFRQkpvVGg3QUpsL1lwYzJwQkIrdGgvVXAwK2dpZWg3UEtJNzdx?=
 =?utf-8?B?d0JZNStUYWZQd1IzWU8xNEl4MlF1bHE4cmNTVTN5T1FlekZHc2poN1FJQ2NG?=
 =?utf-8?B?NURtWHlNTlp3RTRCSFM5OEM2QnJxdW55dkw5N0dEQi9tUExScWVjTFhqcTVp?=
 =?utf-8?B?V3ZJV1F5Q2MvZERJVFZRS1F5ckNHLzJjT1p4OGpvQ2pobXRSZ2RDYnI5Y01z?=
 =?utf-8?B?WTYwYzFlOHRLRzlwb1dQdm9DUVZZRXQvNmJRRnRndk43VitieVlJV21CeUh3?=
 =?utf-8?B?THpNaXROMkw4cXFkOW5NZUFrWWU5NG9Ud20xdFNVUE05VlpVcFpCTjMyUnov?=
 =?utf-8?B?UFZtUW1tU2ZER2R4bVljaTNaTk9acFNzWENtL2hrNSt1aE1wSlhNMjU0cWxS?=
 =?utf-8?B?eFkweEc1V1BURkl6R0RmREErd2xadkM4U1RVSFordkV5TGhTZGpqNDgxOTBy?=
 =?utf-8?B?T3QvQVVndEg2dWZGak9HR2hrY2lxclZrbzJoZjlXa0FnRDloSXZZUGFBSFln?=
 =?utf-8?B?bUo1anFMMGcyYkg0NkxEcUdqaE43WFZ0amxtVjF4Y2wvOGszSGJvMzM1NW9s?=
 =?utf-8?B?bjZqRHVvY3RmL0Yyak1icTZjMFpCVlVuTmNpOW45cEtGMVNCUWNzNS9GcVJx?=
 =?utf-8?B?ZVpSOVRMMHRIRHA5MlNTaDVseWtRV1JyQXEwdmFkblM0OEExRjVXZFBQd2d0?=
 =?utf-8?B?RCtXMEJ6VUMzbVhQdXJGVEtIQ3JHVTd0bkt3MHUwdWtYVTB5a3V0ZnYrWjJ6?=
 =?utf-8?B?RThLR0NhUEM0c1h6Zis3NWt5T2ZHS0UzWkJBMkZnMHFqejdpendhaHQrQWZz?=
 =?utf-8?B?a3JhcExnalIxckFHb2o2bk9JSk9JSzBwVjJmdGthSktFMHVEcGdMK25ndWZW?=
 =?utf-8?B?MDFLSHhER0paOTNYc3A5UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUNZNGNuN2t3NGk1NEtyT1NrRm9icmRoMXJONzlNSkRCdE1Dd0UvOUVySjc4?=
 =?utf-8?B?cmVBbzFRU3RDME5icmdjYVNjNTVPVUVpM3NpcVEzbXV5OWpodiswUHAvTzBw?=
 =?utf-8?B?d3NjZ2htOGRlc0kzRWdqalNZNjlKNzA2RFlONENZSkpFMWV1Z1I2L3l0c1pZ?=
 =?utf-8?B?RGNZVXlYNDIwdzE4M09VQXNMTmZxTWd5M2xYemxCMEZPYS9vYUJiYXZWYTYz?=
 =?utf-8?B?RjJzN2NXVGNoUGc4Z1c0ODEzWHRRRTg0YWc5dXJGSlVSN210dnBHK3E2b1hy?=
 =?utf-8?B?Z0I2Q1YvUWpSNjY4WFdqUEtCNy8waWkxK01NeEIyS1pmK3VwRWphaHc2Z3A4?=
 =?utf-8?B?YnprUkVIY1phbWlqMUVlREtKVXcyQ2RMRC9Oay9xNVpac1lUNWkyZFQ1aUlV?=
 =?utf-8?B?eFpUNG81M0x5cldBSGJNU21laS82TzBXZGdTTDVvcVJlZkM5Z2x6Mmp6S1Zu?=
 =?utf-8?B?Zmh0MmhJUEV1S090dENjazU5MGMrZ0wxSFQ2T2Q3ZG4zMkpUOUgwMENWWW5R?=
 =?utf-8?B?Q3R1b2RMUlo0WjIxWG1aM1FWellJQ3RmWEw5bGY4UWMzdU5PalZoTExnbkdU?=
 =?utf-8?B?WnBNVHVOZ3A0dTRyNzVxd1dnRmwyYnNMS1VCcGh2QzFNbHlPb3dmbWY4ZDh3?=
 =?utf-8?B?TFNMaVFXS1gxaGJMeVV2eXhRQXJJa3hZcmpPbzBOdmtvaUZIbGtaTEc4aDFr?=
 =?utf-8?B?bGVXLzFEL2tXODVWUHhXVlVKN2xxdm5pWFBSeWQ5d29ienlNVkppWTZTMlR3?=
 =?utf-8?B?M2pnbkpEMnNXdEhWUENPZzdlc3hacUl1M1lHZ0pWZzB4VDIzYlE4OXFnUERS?=
 =?utf-8?B?U05TUU9VUEpWRnRNMGN1SFpXVzhUSTAwSjducWVpa1JyeCtGUmFuTWtOeVZl?=
 =?utf-8?B?eU9GWjREVUd6Z1JObUo2QzBVTFpWZGJ1bjR6ZW52bzFzaGNzdmdNVEZVcVBr?=
 =?utf-8?B?TlRRZW5Keld0N1gwOFRyVUpEcWUxeWdoTnJrSU1nVU5JMEpPZHBHTktZdlp4?=
 =?utf-8?B?RUV0RThYT2F1UDR3WXdrSkhjbkNWc1ppZkw4R0YrVkJzajhlNkVUdUpPdnNU?=
 =?utf-8?B?ejFLK2N3UlA1R05BS2NMZUQyT3VDeWVBaWsyRi9yT3ZObG5uaUdoMWJldzUw?=
 =?utf-8?B?MEozUHJUdTFwaDBnWmFKZDd3VXlQaGk2SzFsY09yV2UrcDcrU253OWxvTWxX?=
 =?utf-8?B?VGNkcDU5NUVJN3RNcG5pbGE5UGExTFg1MFBiTnY3YStIM2QweUl3NlByOG8z?=
 =?utf-8?B?bWRQTWVrSXRHZ0F6NzNKNUNQb0tPWWJnazBuaHQ4bW9SZkVKVUc3QlZHQWZC?=
 =?utf-8?B?UHZ3eVhPd2xVSHVGZWh6YTRqbDFxVHJ2SGNJYzNqeDR0ZnRSZTJXbDltbklN?=
 =?utf-8?B?aDA3V2NYR1NodUpWVUpKVnVDOThWSEdGSGEraDNYelo2Z3I5SHJVOFh2Y01p?=
 =?utf-8?B?OE96Tlo5S2JvOWkvT1dPZk1ielVCUUpIZzI4Nm5wTEFIV3JObmRZczNPWWFu?=
 =?utf-8?B?TXhlM1JmV2Z4QzNBbmlkZkZWcVRyb3B0ZFlmaEtDbWZBZ2U4bWpwUExrYzlD?=
 =?utf-8?B?S21WSHQ2UE8zZTltYndscHhuNmtURHYxODFldVl6dCttQ0xVcW1oNTdaQ1dL?=
 =?utf-8?B?emhpVDV3RW55enRnbXJIbnhoNDlsdGtOb2JZaW1idngxSDNGZ0RPc0JDV1hv?=
 =?utf-8?B?V0ZieGtaZlJZNDlZUWtHQVZnekJKTC9LeFZ3SlIrUnRYcWphNCtlT0FUU0Vz?=
 =?utf-8?B?a0RoVDlac0svbkMwUE5BRjhLanBiZlZOdlZiR2R2cnRjbjVIa1V4WHZMVmlI?=
 =?utf-8?B?WEJyelhoMGNUSXVyMnBwK21VSTZJOHNXaURKT3ZMVnFwUTZkT1k2bWZzVis4?=
 =?utf-8?B?SG1XWkFCVnNyYlNtVXJnbWR6czloc0Nuc2ZDUjczOGxwR2Rudi84Q3ZpSWpJ?=
 =?utf-8?B?Mm5hZUpTM0lzK2RPdEY5bkF6VTZpYnAxbkJraEZaMjhWN3k5OFJ5QmNLbWJy?=
 =?utf-8?B?Q2kxZjlaUVFYOUozc2FQVE56S2E3Z1QxbnFOdnRtVmxMckIrUjJtVmt0QTBa?=
 =?utf-8?B?dXJqUXFnbWxXY0wzWjM5QTExai9VMWdKMEc0dmVHZmJDVU9VVlM4elFoTlo0?=
 =?utf-8?B?djBaU0pIYVFYeFl1OVgzZVVXREh3SytNdHMwT0F0ZWxYQ1FGTmV5ckgxdVha?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f45d3e-653e-4c99-56cd-08dd57d07842
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 08:18:24.2570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IodLXMuVHNETiKIMeKfIrW+qDpOW0fBhCErv0MQbxHsfgqNKEJKPjUKssGRhZ/+3hUz9C+j4GSqv88IbfsJh7KKpj1qyl6Sm4bEx6bmhSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10688

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

RTC tracks clock time during system suspend and it is used as a wakeup
source on S32G2/S32G3 architecture.

RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
during system reset.

Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..40fd2fa298fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2/S32G3 Real Time Clock (RTC)
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
+
+description:
+  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup source.
+  It is not kept alive during system reset and it is not battery-powered.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-rtc
+      - items:
+          - const: nxp,s32g3-rtc
+          - const: nxp,s32g2-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ipg clock drives the access to the RTC iomapped registers
+      - description: Clock source for the RTC module. Can be selected between
+          4 different clock sources using an integrated hardware mux.
+          On S32G2/S32G3 SoCs, 'source0' is the SIRC clock (~32KHz) and it is
+          available during standby and runtime. 'source1' is reserved and cannot
+          be used. 'source2' is the FIRC clock and it is only available during
+          runtime providing a better resolution (~48MHz). 'source3' is an external
+          RTC clock source which can be additionally added in hardware.
+
+  clock-names:
+    items:
+      - const: ipg
+      - enum: [ source0, source1, source2, source3 ]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@40060000 {
+        compatible = "nxp,s32g3-rtc",
+                     "nxp,s32g2-rtc";
+        reg = <0x40060000 0x1000>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 54>, <&clks 55>;
+        clock-names = "ipg", "source0";
+    };
-- 
2.45.2


