Return-Path: <linux-rtc+bounces-3121-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC53A2C903
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 17:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D0A43AB29D
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 16:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C9818DB37;
	Fri,  7 Feb 2025 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TmYSvvVt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2046.outbound.protection.outlook.com [40.107.105.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7A818DB0A;
	Fri,  7 Feb 2025 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946303; cv=fail; b=qH8qqEInSTdbwb5IdEPhBC2mMe5oqWZHt2r2TzjpDfv/JiWmk04rdF6ykPM8h5TvTH0LPS0lVcrOG8GFC1ELRKu35HBswiQML/7/yqslLMzyH5AQtYesq/uP85uvCEAkV35Q0spSa7b73saVxd+KwdTesAPzZ0S1Pt4QMUA3s2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946303; c=relaxed/simple;
	bh=p7o9XLISEYCQZ6M+sQ+6QFc2fZ6Eug58k4nZmutnaUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OVuntLUzOzyA208lS6E3iIfLo92cF6T777SIMIQmSXVUErxwfsHrQUPuoeeUm02ZV7fZ0NLMMIHaYCpnl2D6KCzd0m84K1zc2pLH3Qi1ww+B3bOFMDYiKgd9VmicZQbLqcrmikeBS7t2Zxc4XsQcJqfzyEcCbQPqUbWltjggCzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TmYSvvVt; arc=fail smtp.client-ip=40.107.105.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HETqy3aDwT96+jDJ0n/cqbfDMg8f7GF5yOi9BFTmHbUFLUwHgwDpKLuWSpErJeBshegnbIN4lD0wq2PeCc0m4bwJBkt05fVdw/8Wdsq/lB6vFSx3tgOiHG2gjEdJs5eard/1RnC0dS0eBM7dR4lgfOUVr/ZtTDUFFKjnAgGRhO9Pi5WYH34IkhSq4/T/JHYudyxk85P6gNIPIlRYxGprB+OY0pz9jquUEwUjlYttnOdQ1VB4BwXcUGHc36zoNFMqfkX3n792BpuQkZ3H0PUJisS/6DTiV7bWHDJNZkVYz1QTdwPFxsCahvmoAKmE9mhZte9DGSGWMefEXR124Qv8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzWH9WrgVxmum7Nz1/txw2y3F0EBTurhIelA89/5kWc=;
 b=SjYN2AdQ0DrUAVJUFnjjuqLzvry4EMZ6syHvR/5SGaqB364UAmCFhoFhS8A+7N0ybUUf/mK8vkxILbmf5Ko1sLYhko33QHoweVOMTHVDvMvkk6MJ+aObRcY/EnSi6r3UoBlwzS+hu0BlrKQ6ucGTsHhw3YNLzvAAYgsg4QRqe7xaEh8wqgGKaO0AqlqpBfJXY44VVr63Lm9oIioTD3svgEEu1mztHqXz/y+GVb3WLElSAVYept4MIaxnajTwyTzEDxDK/nFte/I0kY1GN89dkGtV66j6xtzSeU095zC0pHvxHF5ILt1+fMyuVF4eRGhp1/fs/SqSfV6ggJnBTGXmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzWH9WrgVxmum7Nz1/txw2y3F0EBTurhIelA89/5kWc=;
 b=TmYSvvVtmpqc2wBaU4Q/9pYVi2MZyF6O+g8SAQo6pMSFgPIBu13aTwNJW8tEMPjGcBaatIDnN0dlmXFXkfDjIC2ufrPqP74eS5Mi55PcEtqfMiUJUzB9MinpHpSbijPZSr3V/qpg6nEIhB9IC5bE5LVdYi+gdPoLiQZemLMQeMk+iFfU/ci9tIuzWi8Cj8lCpSsJeNgvCrSfWxgtGNgmNkaOYjLpRZbsCUvBCTmKAguZsWHfjMJCqVCoq5tDVXOHsiXWrKeQX2u8L7O9apoo7aY5hhOd4xZYQSRVjDLkI1aNG5iFE9INMP0+EJH5SLKwIn4Z+IvJ8u/4XUldOpi3MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU4PR04MB10840.eurprd04.prod.outlook.com (2603:10a6:10:58a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 16:38:19 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 16:38:19 +0000
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
Subject: [PATCH v7 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Fri,  7 Feb 2025 18:38:05 +0200
Message-ID: <20250207163808.1208552-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0099.eurprd03.prod.outlook.com
 (2603:10a6:208:69::40) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU4PR04MB10840:EE_
X-MS-Office365-Filtering-Correlation-Id: 50de4f21-6f18-472f-d08c-08dd4795d476
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHp4ZVVCdHlobDhXUzR4ZDhRTi82M3RidGFpWDE0UStaZEliQ1lmcHpEQ2RY?=
 =?utf-8?B?QTJhaDBEM3U1aTMwYTNWSWRydi9hbDdWM0xCSnhOVGptODZEdUZjRzBkMWZ1?=
 =?utf-8?B?VWowTjBjZWhBN0lWTXcxSGl6eEthMGxUNE13c0lwbHpmZlNvNExkaHVLRGFn?=
 =?utf-8?B?M0FuQlJtT1Q2MWVVU0NHb3pvbzcwSDhObnBYZXdCcHRaVHI5cHNaaUJsU3BM?=
 =?utf-8?B?enl0bnFmTkk2bkZyckYraEJvOWhQRkQxbWQ5UlJaU1h4WmRtR1hPeTh0Mk1V?=
 =?utf-8?B?V1k3bnRXRTBRdWhwOFIraTlLZkJ1aDZhTlFVZTFZVUVydVNuVEhHZEV3cHhX?=
 =?utf-8?B?bmFsYlJwZ214MHh0eVB1WDJVVWtEd3Z0WEhKd1FmYU9iRURkcHNtY1ZmSGpB?=
 =?utf-8?B?VWRBNWhmMVZXWmhtdkREdTFpV1N1UUdZd1pGbjhpV3hqblZ4NlJpWWtFZng0?=
 =?utf-8?B?bkJpYnZFelpBdm15a1hLeXByU3JUTzJZZVdTSWdydTFOQUFSek9vQS9KUEVa?=
 =?utf-8?B?M1BSblVmc0xjdGFKQTVFQVJMYmVvS3Q3bDZNdGwxZld2a2NrQ3BpSDZMUjVL?=
 =?utf-8?B?NkNzeEg5UXUxQzU5dmtaMUROMDFic25yTmZzdEJlK29vOW96M0tGbjhzQko1?=
 =?utf-8?B?UjdvTnYzVHRBUzdKY2l6YmNWeXVnc010QU8xNDE2RnFsZTl3VVg5RzZpaExT?=
 =?utf-8?B?MndYWDd4eE5LMkN5Tk4xTFY2b0ZnenlPUFVRL2xVQVd3OFVqTE8zTU15aGRr?=
 =?utf-8?B?bjVYTVVKMlg2MS92MTRYb2RuN1JsM2xyemhZbmZ4QjhGMy9yVk5pT0ZESHFT?=
 =?utf-8?B?bU82cDVXU2NzV0xhRmE5ZDNyVjAybnpIazNwR0haTGRVeWpLRUg1bjJkcFBS?=
 =?utf-8?B?Q1BVMDZnelpSd1ZJL044aWJZcm5VaEFHTmdoanExdWlLeUpiV3dmZWZjVkFV?=
 =?utf-8?B?L2NuMkZIelc2N2laRjArYXBBd011TzJBYkoyazd3QTV2VUs5NXpyUVUyZSs3?=
 =?utf-8?B?V3BWSXp0cWcyUVJqTWdFNitYd0djalhvYldES3lyVFd3UWd6TXYvcHNEN3Y0?=
 =?utf-8?B?VSszaXBlTVh3Y2FVZHd3aGNZWXAzcm83eHZGNkxsSythRHhYL2NZUjdwcTB0?=
 =?utf-8?B?M1dvRmphL21XdEFBUG1oWkk0Q202cWQ4ZFFoNjNTVzAyWm03TVRGQlhsckto?=
 =?utf-8?B?T0lNbUtrS2ZuWkVrS1pKNGoyUkd6TDZjV3lHbjhXVmt3NTZPSUhMdnFTM0Q3?=
 =?utf-8?B?TmZYUVdJUUxnL1kyM2hiMGZtbUpKeHFQN1ZmOTZnTFEycUNLUW9xU25TRUlO?=
 =?utf-8?B?a2JRWktYY1crYVNqOWJmNVhQODBPeGN6NVRaU2lTQmxUNE5Sc1NRekZNNS9C?=
 =?utf-8?B?dTlhSklwT2M3b3cxK2gzc2VDaEI5Vi9LZFRlTmZKWmNEZzFXS2tZaEJTd0NO?=
 =?utf-8?B?K2gva281Y2NKNzJ6aUZ6cEtiZ1R2QWtDRFdVOXUxcTFta1ZDTW8yMmpUVlBR?=
 =?utf-8?B?aU1VUEJQNktvME1MYVM2MW4rU1RLVTMxUVUrWDVoK2YxYXBEYTR3QUMxT3RZ?=
 =?utf-8?B?dUtrOFA3aXcrMk44eDkycHhGMHhEbnV4NDBNcjFURXZqNGMrZHBJV1ZVK2x2?=
 =?utf-8?B?UWltMHFPM0pkMjA1a0JULzdJV1hMV2lpMmxjK0NYdVVHK3lsT1JzS1h1Wm01?=
 =?utf-8?B?RENiWXFFVWNzdzkvbkxUTkltU3BzeVZMZHhXUnJ5bkVXUEhrN0xDVExEcmtJ?=
 =?utf-8?B?K3pDeThna29RcFpkakhTcUNXVlU5L0QvbVRsVHNmNWl3eGNKbWdCMTdybUVl?=
 =?utf-8?B?T2R5VzBHdFBScU1sTzhrZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXRvRXRFVzlZbmhkMVBnb3M2STEvb3hKU0QrZEVNM1lnbTNDOGFFSmNWMDZZ?=
 =?utf-8?B?QVkvbTZIamhrSE1hK0E0V3hlVjVMd1JFRnNjcm4zNTR6Q3daYWZ3S2NvZXVO?=
 =?utf-8?B?clZpSEYzdlIwQ240Q1VyYWxaUUxmb01xR2hYRUlQOGtVcWVGbEh1Tmt4YlhY?=
 =?utf-8?B?RnY4SGFWWUlTYkhmRjc5TVlZTGl6YnBzOS9DM1EyWFhLSGNoWlM4cFFTQlkz?=
 =?utf-8?B?UkpzZDFqZG9LclV3aDYvSVVRa0EvNVFiUUhFbGJTMVlsbnF0alhyOTJ0YVVR?=
 =?utf-8?B?QTZkUVhLU1g1ZjRoYmh3czhuWEljaWlMb1BBelhlTXEwc0lFb1lMOWtSai9H?=
 =?utf-8?B?ZlliSGEvZHVGRWF3K2lxazd0ZkN4bFR2bUtteENJbFVkeUlTV2VIeHVndjlJ?=
 =?utf-8?B?ZlhHY3VSV1k1R2laZEtvYUtiTkhDd1l0MG82NFdyMEFIeE9kK2VwZWl1c0VQ?=
 =?utf-8?B?QnFvaWd3Q3UvNk1FbVV5NkxKcGFWblhHcHFPK2k2a0ZCSlBna0JuK0ZsUzNo?=
 =?utf-8?B?VGxuQlg4K3pWOEl1TmR0OTlyZDJBNWg1U3BWSUZPV3ByekEvN2luWFVpUC9k?=
 =?utf-8?B?RTFDcTJBSDNJSHNTbzNSZWVuUHhEUG1taUNaZGFwUHNPR21vRHFDREVrWnJr?=
 =?utf-8?B?MWJpMFQ2bW41NHdLOVZwLzg3VVBzaDhEbGdJTUlyZzJOS1diNi9FMGR1TVdH?=
 =?utf-8?B?RVhGRndlMHpsOGpLZVZVWlYrbmRNVE9hYkxsV0VqQVpPbzczKzNiRjhKTlRQ?=
 =?utf-8?B?MkF4WjJlMURoRzNpZldNL3RhTkt4ckx1ajJhbE9jeVRVenlQak1GSmIyVnhN?=
 =?utf-8?B?NWVXelhkMUFGYjZNbzFxRFlqempuYlBxVTlkakpHVU9zTXlHdFBjSEJlZDcv?=
 =?utf-8?B?UEJSOTIxaDhHVkNrSTJaM05rU2Q5NytBYnFjWTliVEtVcnRyN0Q4TFNIcGJl?=
 =?utf-8?B?TTBqVnc1ZzFsZGlGWnBBcHUyRjVkRkk1TzRmRi84aWF0ZHd5ZWpJQUhCYkpV?=
 =?utf-8?B?TTFVSEZSSWw3amJLZEovdWlkZVJFZ3Y5RVg5a2RZRFVJaFNRZ0p4b3dGZ3ZO?=
 =?utf-8?B?OHN3ODdReDdoRUpFcmViU3RFclBDbjlZakY1Qm5oeml1dFdub0lIQXVqRmhM?=
 =?utf-8?B?bjQ1UnJSajI0VWptZnlRMUEvSXllOG1vUnNJdHgxM0FrbnFobXR4WmZvd25X?=
 =?utf-8?B?Yk5XNk9TL2dlWmYzMVdwZFZzRXFPOVE3cktwdFQ2WmxwTVJGWVNrMngwSCsx?=
 =?utf-8?B?emhlMGJoeDA2Z0M0Um1rK3FEYkh3M09mUzN5OUc4RUk2N3J3VE1ESExFZ0FG?=
 =?utf-8?B?NTEzdDY3b3ZuM2phaVdWMFgyelBxcnI1cDhCOFBFakg4STdwNnY5Qk5MT2dM?=
 =?utf-8?B?d2F4eGRFMDF0a0pEZzB2VnpGZmlWTDU0UHZwNmg1S3ZqSDZERCtLL0x0RVg3?=
 =?utf-8?B?YTlmaWF6NE9jeVQvNnk2YlJ5bDNpcURLNitrbUdEeXYwY0V4NS9HNmpFeUVp?=
 =?utf-8?B?K1lGTHkyM280TGZHV0p5QjFBOWR0UGFJWHlsZXk1ajk2QytmMC9kV2Z1allX?=
 =?utf-8?B?djllWU0vYmxFN1FqdWhrdFVJTit0K3ZmT2JUcnZRTGQzWkwxVWJJNUtRYzN6?=
 =?utf-8?B?eDhrNEp0elN6dnpBLzFyUURsMU1PVld3SitwSkNnaVFIVm4xMDFCS0YwS011?=
 =?utf-8?B?S3BoT2UveUZ1VXhSSTBjRi9rcWFocjZybzNzM1BZTGZ0UkZLQUp1TG9udzBn?=
 =?utf-8?B?NjhJdW5JTkJmeksvUEo2Sk80Tms2NmNUZVg5dW52QmMramVqT1BkSWIwV0tY?=
 =?utf-8?B?cmpYV2IxdWwyY2EzZi9oQ0M0eHo1T01paENGTWFuY3JJOGl1N09FU3JjQkhp?=
 =?utf-8?B?NkFvWjFheFlRU3dOMWdpS205S1lWM1NaTzdoaVVaSW9Zc0NjSjZ2Q1JWRzFG?=
 =?utf-8?B?cnlLSkUzWnAvUXgzYXQ2Y25sSUtwQWtxVElFbXc5RURscTdDb1FTWWR5MlYz?=
 =?utf-8?B?ZlRvWnloZUNudXJYNXdGNnBNTlZmNDRyYjBERmdnNkdCWnpKY1ppSUNXSnY1?=
 =?utf-8?B?ZUZhUzg5Zm5VQnEvNUlDYUdrYTRNQ0Y1aGJkZFZ1VjVkdEpGZWU5QXNLZmF4?=
 =?utf-8?B?S1A5NmJaUUkxdTJiQWdGRUFkVnluUEo1ejBrYlFYRGU5alF3Zmg2S3FtRkYy?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50de4f21-6f18-472f-d08c-08dd4795d476
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:38:19.7767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FphQtsOc8IrcN9H8c8AlmuDq/PuG+jHimkHq78BkZzrD4CXmILHQuRNfX+jTsIrqe3f25tIg36Dx6UJ/6ETIUJ0s8hHqBdQcyxVATxwdgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10840

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


