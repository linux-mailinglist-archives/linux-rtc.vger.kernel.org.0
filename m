Return-Path: <linux-rtc+bounces-3761-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20168A7A10D
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 12:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 183D83B59AC
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 10:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3022B24A07F;
	Thu,  3 Apr 2025 10:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k0jCG4Zg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE1924888A;
	Thu,  3 Apr 2025 10:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676446; cv=fail; b=S4WsB6WJSEXhIP2rM4ip9GAPhVwKoD8wlzhjS/z9HirSZMSBUdU160lgY5J7kH+y6CxqXpbpK38ws1zwq2l3l2kQaeprlyGWNMyJlKIM/ydh/ojmm7hgWiC5/xKCWnQFGzwzn6UOsPJsDmuAICoQcv/W3d41nbUGSLYHrf61UWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676446; c=relaxed/simple;
	bh=p7o9XLISEYCQZ6M+sQ+6QFc2fZ6Eug58k4nZmutnaUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X9s2i2QturVZsMhwx8/Bzw7nlNBhda1OAIiDm5paVll81ZnNkwmz4/g+AdUk9uUtAGad8OnAufC0riKOtUlK88jci5wy5w/ua60Fku/uCC5dbkUuQDzI8UoZ59E229BiNELaNvmRoKcu+iL/6ok0Xa+PzN/3P5P/5zCVRPqBFxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k0jCG4Zg; arc=fail smtp.client-ip=40.107.249.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOjxWdwlctC7pnAF193z9oWFcPqZRn7PttzR02mMQTQPgI/wrr3vmVTS4oiPk0pIlkDz86JH6Q4P1fQPhD2a31yHz6r02HdFgvjgZuKaJ75yKQrpvRwWlHLjNwAUZoL2759RMATRtsXBsvul8dce4Oll+cgnYDMz643C3nmKduRgqDci+dUjHndpnVd4vGiH+7lqqilSBONyKU++5IJ0zJRCI6W0LwsSFAs7w4O6ssn541V6s5JhpPdOZkj8wWQYMrQ5DUsE7FloogzO0aSexfp5wJ2uG3/wHNDpGbN9IjA8cKJFmkuOPw9Fy2ZrOEcBjZn9E1NcECLy/1BQPli3QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzWH9WrgVxmum7Nz1/txw2y3F0EBTurhIelA89/5kWc=;
 b=qUIjxe2ByeqYdFvc23Llyhs9fmhCGzFNE3ircZM98+LHTdm+0QEFOQHs24f5Xh4fMG1y1yCtjInHS0ASlLuzgbF3FLo+t2ZIkYbzzN2+1khKvfQgl7IBOTsBtMmXwxmIYahIQ0KPnr75uoFH0uWCsh0oaxO5oxasMhS9cCkVPM8qLpufvQf0vG4skkf24mERuxXEOL15JfXyUzVBvtKQzFC/WlfS+0/ujV45BcaoQLvzVfQXiT9K6GL5VBFj9DrfZWw8PM5LFIS4KuPzUBV0xOL7VYarkwf/6MDZxbzviXOoHbeg3tCKt2yOzykSk4COsk/aH32ZeMN79X606tk9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzWH9WrgVxmum7Nz1/txw2y3F0EBTurhIelA89/5kWc=;
 b=k0jCG4Zge3m++T355L/7QQEetnI/GDxYTuUQSLZH1D0LerivgpDoMUCQOsjzH+f8KKpBQjqIJbC4KrWqp0R4U5WOf0AUOxaw2pcX7Pf957I6f80Gtkl3GQITQfwYRhaHs9J8fIpteJ+CnQQpGVGsedhSx8p35k9snRzww+WC6j+NxDh2KtuuaNtz/sJFlNpBnIAWih/oVmsJ+2LdZoJ80gX4NtoN5thFWeJxjOLpApjDrHkZXNLUovuSRjU2tx7aBz2KWqj4tHMp9sTbVt7xrC0XUYoAV7mYGTMQ65/T6cpcg1bLmbUThF8C7ufTfS6rXpxOEHgZmN4OfoBsik7z0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Thu, 3 Apr
 2025 10:33:57 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 10:33:57 +0000
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
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v9 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Thu,  3 Apr 2025 13:33:43 +0300
Message-ID: <20250403103346.3064895-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::18) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a682ea9-0a0b-4d61-d896-08dd729b078a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGplbXlUT2d5cXo5ODdWUjVSZUhBa2NWNVplNjY5QVdmYmp0SE5mVEVpZFFp?=
 =?utf-8?B?a1A2bGl5NEs3Z1pQUlF0MXlydlI1dnZyK2V4SXZjYjV4YnBpL3B0YW5YWmMr?=
 =?utf-8?B?VUs5NnZmN2FKbGkyMkhiQUFIa2tRbnJicDYwVFpqa2pPaUJvdytWNkFrUzZj?=
 =?utf-8?B?U2UrS1BuVk9abG4xMW5vVlA1QUx4OVNKaXZOakVDTVJPSi9HVGVVOUNWMVFQ?=
 =?utf-8?B?akd5Q3JTVGlVVExDa3NtbkZNTGtvZStFWVI4czVQZ0hyVjlNWTVHaEgwMVNN?=
 =?utf-8?B?cG56TTNLTjk2c0xhaWQzYVVSWW5VK0VlLy91QWpnL2F3UUR4c0loK2QyQitU?=
 =?utf-8?B?NTlJRjBlMzNWeDcwZVNWbXVFYTB1cFZWRVpwS0Y4WExGd0JKbmsxSlBmcVMv?=
 =?utf-8?B?b1pNS3N0ZnRhT3RueUZzaExscFJYaWxzSjA0dWRWcVIwL3NzMFZPMDgzL1c4?=
 =?utf-8?B?QnVvbW9rLzRzREZsa1JNRXVLMCs1VlVsMWxiTmwxcndpU1FyK0d2cm1FdUdF?=
 =?utf-8?B?MUxuUEVSVHNxWWhNY1grWFMxZUt1dDY5bEU4WFRpeVhPQXNPaG5RSi81SG5D?=
 =?utf-8?B?MVdsaVloSUN6dU5uN0VzdXh1ZXh0MmIxNEYwemZZNkcveXF2UDlSbDlVeHMx?=
 =?utf-8?B?d1hVWFViNGVmVmN6eXBPR1BuSWlyd2xBemg3MWxtYmlLTG5ZZmZSV0hEUjc5?=
 =?utf-8?B?MytCQ2hsSzJ1N0dxeWRCZUR6RWdsOVB2QUVGd3ZIVXpqOElqV3BPdzErY3p5?=
 =?utf-8?B?UWNEVUlYSUV1MDNKOXYyc2c0SFBpdHlxWFR4ZWgwanBrRjRVUDZ6ZnlOSmtL?=
 =?utf-8?B?UGJkL0JjbHBoU1Q1QjZ3QTE3VE1YL2xWcnNzbjRvc1VXRzFFbDdMK3lQdXJ2?=
 =?utf-8?B?NWc3cnJaOE1UaUprK25wNnNDak9kVjA3TXBBUkE2VkovVVk5d2duSG9LN3NZ?=
 =?utf-8?B?TnJwR1l2eGR0WU9tME51Z0JtUVU3bGxIeW50ZmZTelZDTWNHSjhRWWNXWFRn?=
 =?utf-8?B?eTdyQlQ3d2pldEU4RHZPdHdrVWdHd2thQjBLclpndGxqSGViRlA5QkdkMmxP?=
 =?utf-8?B?RjNaa0lWTUloMmNvVVZhVllFMklUWmRERkFrd1JwZnNGbnpFUXN0Z2xXVzNP?=
 =?utf-8?B?R3FKZktYdDloYUlGWjNFbkZucWpPZVdQNmFCdHU4cFJ0Yi8wZmlJUW01RlI2?=
 =?utf-8?B?YmprS2Eyb1dEUUM4aUh0K1ZxbDUwWFp3RWE4NEcxV09qVm54Q3hCSC9kbXh6?=
 =?utf-8?B?V1RBVytuRTNWakRvU21DN3RWOUJCNmxsSzMyNVJzY3E5Tjh6VC9qaXlhVm1F?=
 =?utf-8?B?MEhQNzQ5YU05aElNaTZTaGVRb2h1TTVlUnp6aERqaWNCb0tBMGo0UWNWRFJT?=
 =?utf-8?B?eHZPYU5hdDJzT0FQdktsczJGR3FlVTJ4SlF0VFAybDdBYjk1UE0vMHNXOVU3?=
 =?utf-8?B?ZWZNRnZaQVZScUFRVXN1UkhiWVB6UlB4QmdrSCtmbVVEZ0xYbjM5Qzl3R1Bl?=
 =?utf-8?B?OXpQRTN5VUNLNEU2TXJlVy9uY2NaVjQyQVQ4RytxVXRJUXlCd3NlTXFsOW9w?=
 =?utf-8?B?ZEYwV0lnejhlSE5FSzNMUk9UTk5tOVNxQ0FYck1QK3hjNGhYVG5uTmFaT1lZ?=
 =?utf-8?B?Vi9pVHR0eXZhYUE0by9OTWh6ZHk2U0FZMHk5UDRUWkNwU01UMjJCbHdmNFpy?=
 =?utf-8?B?cDM3NE41anpHblRtY1hiV2xDRWdPTm5HeUsrd0JXS1pJY1kydFNHNHNvcFNR?=
 =?utf-8?B?ZWZTTTIvODI5RXM1Z1h1bEFDU3RBL1NUWnR3amZzckxQU0xnYUdtY0l5TjA5?=
 =?utf-8?B?bXhOMURKS2p1ZFl3aU9DblhQSEJCQUpGQ3VLZXNhM0dSekp5ZS9HT0RFNDJ3?=
 =?utf-8?Q?3VFRQLItQPY3p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWtpTktRMmdSbVBoT0Y3MkNuQjVwc3FJTmMzb29jbEZvMDVaUmV5N1VEN3J1?=
 =?utf-8?B?UFlZZnUvdmlTcTdHeDFlcWlsMDdjYVptOVBPQVQyVmdwS0dtZkQzWWVoeU1r?=
 =?utf-8?B?OEgrRnNIMmdBbDFBS1NWWS96aThxaWVZclBPTlFrdmlzZXBUWU9BRlk1c0Iy?=
 =?utf-8?B?cklyQ00xd3ZBeGxwVXdVUlBwT2ZHam41SENwUm15UEZ2VTdSS1BqYm14Y283?=
 =?utf-8?B?SHpGVjdNWk43bW1qcng1OXFLc2xmZGRPemxjWmg3LzhFU3NZeE5NL1IwZHh5?=
 =?utf-8?B?MmY4Z3V6aXF0cnR0UnhyUlI0S1JGT2xtT3l5TkhZOVdUMkxkcVRwbkRZazlY?=
 =?utf-8?B?M0tDN1NJWW5STzIvV2VSZDQ1TGJjOG5iaWMrVVA1NncvMzU1ajJtR2c2bFcx?=
 =?utf-8?B?alJoRXFYNytOcjF3YndPdDIvR0k0TFNFck8xZXV5R0hpZ0ZiMzl1WVFhbVhR?=
 =?utf-8?B?R3JWRnhHTFI0alZmSUpGTGtJemxyeUR4YUFTY1U5cVluTCt3VWJmTCtuWXI0?=
 =?utf-8?B?RFFIVHlVTDEyL2YwOWhqK2xUcnJudjZ4LzE0QXB6ZTloTC9ySW95K28rZE5a?=
 =?utf-8?B?RTZzM1g0TW83MHVvU1JKc2E1V3RUTFVkUmVHbmZLWVFzUG5BU2lDc3Fzd0pC?=
 =?utf-8?B?cWFqUlZhSGZYbGIwWTdVS2lBOFlzVUVyd2RpWTNQZXlCQ2t6RFZ6Nm96Wk9s?=
 =?utf-8?B?S2h4QXBIVXRpYVBzZTZRUHk5bnI3L2ZnQ0dEbzR0VTJTbkRNVHJrY3I3L1FW?=
 =?utf-8?B?SCtySWYvQy9UcDAyVEE2VmQ5T04ydzE1Y3lpT0RXTWQ4TWZUdGhaLzZTN2x4?=
 =?utf-8?B?Ui9RcUdQNCtKUys3QkgrcFFLTnRuVnpoTjQvWHg5VTZPQUZyREMyY3VvcjhB?=
 =?utf-8?B?ZkZlOHVIZ0REcGpGOWFIK3hTa1VTWE9hQ0VpdVpyZTVadFQzc3gyZGFxMDdT?=
 =?utf-8?B?TFRkK2IzbURCcFhHM0xadFc4SUZybUM4bzFrbDhLbXU4SE1NL0g4NnZjQjlp?=
 =?utf-8?B?UkpxbUVvaERUbGZnRGNsQXVONk1yck1WTmQ1SjZ3TS80QnJxNlZXUWtWT1lW?=
 =?utf-8?B?Qi9zRnlaeEE3TzZuR05wL1VBRXMyRS9uNkRnaHpJRUlWQkIwNVMvOU5kT2d1?=
 =?utf-8?B?QWJNeHdwU2JYeGFRUVkyM21MbGRPR0wxQmE3RU96d3RjWXp0ZWxndDcwenQ1?=
 =?utf-8?B?R0U4UU5aQW9paDF0ZW5QSjlvSzhoS2FjcDE3elA3OTZLSEREUC9oNEIzdnJ1?=
 =?utf-8?B?S0ZMQkZqYmpHQXVPZVEzSXRaditCWGxXWElJcmpvN3YwWHBNVVpzbk9CV1hq?=
 =?utf-8?B?RVNKcXM5MmlXOCtlTGRHeVBYSWR4YkYrcXhRNHI1TDltMHh0VjNVZkVXcFp3?=
 =?utf-8?B?ZTBZL3hycWtFemp3NUJ2N2pXaVZ2RmhCa01BaGJoMDIxYWxBa2tyS1BreUxF?=
 =?utf-8?B?cDRnM1o1d3V6WlBNSFVPdDBHWEY4dkhHYURIb3l6ZnFYYkZ0SVZHWmFZeWI3?=
 =?utf-8?B?NFdvVTRmMkd5dHV6ZzJCOTljd2VEVElNRk43aHEvb25KTWVuS0d4NWNXbHlu?=
 =?utf-8?B?MFNXVFRzK2liUG1QckZuTUlrSENMVFp1bGtKT0ZNRmQzOWNQN0pyY3hDaGFk?=
 =?utf-8?B?NUdBUEkrNmhGd3NXYmUzNGJaK2RjekxkZzRETHE4amNnbVp4MnFpZmtsNGV2?=
 =?utf-8?B?YXMwQWE2Q2VVb2xFRCtocXNremc1Z05pcWVLTDh0YVVMMTdJeVliWWZIZzcw?=
 =?utf-8?B?U2VqTFBjZExPcjgwNXN1c3BKeTNXZGpvVUNEUzNvNUVEaFdTWmRSVW84K3Nm?=
 =?utf-8?B?cUdZMmJRaWIwdjNham9RUElzcTI5Yk5SeWNORUZzSGZvUERTZHRKTWI4dXJD?=
 =?utf-8?B?Q0ZsSlV3cm51bXZOZ2FFRVBaUS9USVNXYjgwcEdKNGdBakNNUFBUc1k5Ykxl?=
 =?utf-8?B?Wm9WUFNoc0hHZ1oxd3NLNEVLSkRyR2pPM2ZWZEUvTUdOMjNwdnQyTFdmajRo?=
 =?utf-8?B?bkY0TDRJeW4xdWhabDRzZUppWS9sSUFmR1d2bncrWkpTYndmOEpBQTlhdTFl?=
 =?utf-8?B?enB5NlA5ek4rZ1JRY1o3K2NYdnIrd2hCc25SVVVLbDJvUTh2N3pnMStHbVVq?=
 =?utf-8?B?bFNuKytSODJmeENxdlJ2MW1tdE9Beng5NE5zUEdzN25wNUoxRUZHM09POTU2?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a682ea9-0a0b-4d61-d896-08dd729b078a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 10:33:52.9947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aC23jrkjbufoZCz3vEVnBTlYgEIq2jMtHGPrdB+X2EsaG5G9BppGjWVhfiFK+FeYe60LuOTELGq+fecSiqmnmBcnkley/NulA5UFX3Zlp18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216

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


