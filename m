Return-Path: <linux-rtc+bounces-1548-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1989348E5
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2E301C2145F
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7412B7C097;
	Thu, 18 Jul 2024 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YDZUtEfi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB37A15C;
	Thu, 18 Jul 2024 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721288004; cv=fail; b=ngZ+U5ixjERY0H5L9FXZ9a78HmKXBMy4VwNbw6vgZgK3KFtsA+6JPg1MAXhI++dZkYKZyC18G93nNfTZm4N2tFZekdH9ebuTOjPCDbB3oULoSSPGG6eRh275kMrjJBDu2Gmx9CjmK3LUvTITYnXLID4Rqj3DkuCTw2seBpi3Q8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721288004; c=relaxed/simple;
	bh=3ZrXc7dyEXDQLmXy4+anzWutGGiAYR2nUe71CkcL+bs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bKa0ZQAvT0d/9h3klhfH+3cwKj/EIk8pYtUnF2gocZotbDzwT1EcYcOHqXbCKQxyV6z8QyI2GkQ5D6GSrnfAso2+qith0rjZB9MBx3RjhgRaJWq07uWz54nIuDoWkYnZcfUTnK30a8UTzxGDu3Ug2XnmQLEz1rcyk2Gjm7K+0H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YDZUtEfi; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXnrtVlHdVSgBKT3GOT3++aOQpp8PHMDcojzmKEL2zuIF0J7G7Q3CN+edQZfTYUtjRTQ0Qy1ZGs+qQklMVMK1nbp/2D5ZBSBIPA3JM8DXPPe1I9nbX2xW0A9pTRcGqJ9wQ+2tu+6Z8zahde82uMxySs3+1usFXi6FnT6uuZfK1fDwiwdSKH7ACZp+H1PHFrJ0C9+5yhRVYFvY1evA/1SsTlL5waxp6vfMJdYjdzGQA2zCw1Lj7QS8F37PrM0UsSxQm7GeIJbvsxKbKqAbtk7XY7U3cgv+SAGy/TFEKK8WFVv9RTPPe1H+oAnX2o14f7L6QV9dHEK052o72VHjkxoew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3D20n0bAzqcjLjXnBhoWSF/wj8T59kOpyVPxkul4Tg=;
 b=B3xVe1e70fGkfDp8QIozyDqdbNV1lTUgt3ydhDn4UOylqDmT5KK2nKY4AqkG8w1Tck3n2kwnydYbCcse9KcvWaZMH980lJx6WFTFsm2T//7Nc/UlYGMcTiBps3H+2ReIjogw+quCGOLc34bNXPbgI7GAScWfp0NrrF32XEjgXJVLBck3xiVuGTTRQ/YiabQLIC5tgXQkQ2jYQj/UZkOxiCGIhWtPjESM2Xx6RYpn4B6/+AMjPfRmVDX3P3zMVVAWj8FIy7coFWM2LokI7KJX055umZjdOJNL10ljvnKrdV/8/yOZRDP33feLe9eA6eTsTez9KaWhjU6/83KfY7qHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3D20n0bAzqcjLjXnBhoWSF/wj8T59kOpyVPxkul4Tg=;
 b=YDZUtEfi4gaNHmsvQFUTOQuU/ZaUAMULfSmY2kEpv1ExzbwxnL6fH4dAPU0vKiTKqY5kZThv8tpJrY3Ve+/EbjREns14L+NL/9HYCubc46lNJCqzw9if73TSGS3laQDrY3vUgQLLUuhymtD9K8NWvhU7dxDuALi6w/iITWNLNJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10457.eurprd04.prod.outlook.com (2603:10a6:10:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:33:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 07:33:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Jul 2024 15:41:55 +0800
Subject: [PATCH v6 3/7] firmware: arm_scmi: add initial support for i.MX
 MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-imx95-bbm-misc-v2-v6-3-18f008e16e9d@nxp.com>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
In-Reply-To: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721288528; l=11462;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Yc9fGdHVGpzX3AJqC0pvTwDCGUbMJnSIzJSsTgCSQww=;
 b=m1xYcLFP+8Mm7HkSP2yFFGNj0T0uzzH021HBgwUzq/yrQmMTYpzXrxjMH42dBfbv5eNitTKZx
 kYEJ6cNzF8lC3dP7DJMlycLOIFvVRgF/dNYkab/09lpSHqNtfD6aqJm
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10457:EE_
X-MS-Office365-Filtering-Correlation-Id: c890e55e-5760-49fc-7968-08dca6fbe4c8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1Z3NkRKeVBCZEdieFFoTTNSNEJvY0N2OUNDUHBJeHZpcWpUZDdhbHl0dGtQ?=
 =?utf-8?B?b0UxckhlaC96b2JKSE4yVDBVeHk3dzhCSTBRYTBocnJDNThPK0Rad1JhUkFO?=
 =?utf-8?B?Yzd0dVUrWk9PdGVya1hhdmtVYkplNHdGWmx0eWtVN0JQeklFbHdJVmd0NEx1?=
 =?utf-8?B?d3hvUXhjSC9MN1ZNOTRtSTNkRVluNDRWdWp3Rzk2N2pYaTBveDVYMjE0NTBH?=
 =?utf-8?B?RXp0MzIzeENPNi9BMFMzQ0I3NXZrUVVqV2YydStnOEVnempiWjRJbFh1QUxY?=
 =?utf-8?B?ZHlNSFBGYUVKMDNaREtkZW80aE1KVlE4QmVnSkRKZkplZm9SbXczVzd6MUx4?=
 =?utf-8?B?WFUvblExc3BySUxoNTJnTjBZdWRJM09scytQQUx5c0VneVZaNE8yejVld0Nk?=
 =?utf-8?B?a0RMdGN6cmhDeE5JSE1DbzB0anM0U2tlTE1sdWZ5N3QyNG53SVdqcnZ4dCsz?=
 =?utf-8?B?Q0ZHMkdYcyt4MUxPeWdiR1pxV0FJbG5rUzh3Q1AvV1E3elNjK3J4aXdvQ1py?=
 =?utf-8?B?ZzhvZ1FVcUpVaGRIMHJqclNJSXZQc2liY2tKQzZGQ29mbmxMbW1rZ3J4NkFD?=
 =?utf-8?B?Ni95bHhQWGVHbmpXRkFBRUd1dzhtNWg5VTZsSCtydUJzYnhEdXBQRG8wTnBy?=
 =?utf-8?B?VGVXSmN1MEF5QWtka2gyQ1VsUmFSMnBMandnRVkrSW5JcjBHcmUvalNOaks5?=
 =?utf-8?B?TnBMU0pDdVVkOGFoWVpTNnlENGJRL3RMdzlidUduL0F6a1VZVmh4ZDU1SXZK?=
 =?utf-8?B?YXlhb3ZRcDNGbm9jR2ljS0JSRy9HTitSMTQydUlmVmxLVWtRYnFrQmwxNXNF?=
 =?utf-8?B?N1gzZmlBNVdQaDMySk15MkYyK25YYmx6c2NmUDVBUUszT24xVnY0R21ZeHlk?=
 =?utf-8?B?Q2JOejkzWDc1OUp4L1VKWTI2aGZIZWRKb1pLdURtSi9OUGRmTE5IZm53bXpF?=
 =?utf-8?B?VFc2QlVxUFBIcUl3dXZ6WFhTN1I5K3lWemJ0NEhFaWFvZStXbFk1Q1VXZFJk?=
 =?utf-8?B?SGNhc1JneHJGSDhmTWRkUmJ3M2o5NHdWdjNVUVp4S0FYcG5mRW4yaDFOaGNk?=
 =?utf-8?B?bGJuaU9PcmVTUTdQemVvMm90VkI4aGxNcE1Ha3UrdFFYRWZYeVAxbk05T05B?=
 =?utf-8?B?NklXMGhFR0ZMbjFZTll3bDV3cm02SFEwMVZsUG5iZnZNbU9hcGYyZjRzNU9w?=
 =?utf-8?B?cU50Ti9RMVFWYVg4S0ZlWUdUZ3FrelVLeGRJbDhWU2dvUTN5UVZWdzV4THU4?=
 =?utf-8?B?WHcvd3Fyd2JPRkxOSWpOa3RnSjV6V2g2Q3VxcVdRWkdYVGEwVGJEMFltaFYr?=
 =?utf-8?B?UWdYTU9iM2drN0h4UzBBd2FRcjVRV1dvd2kxbk1adHdqSERqTTF5dUFoVTBV?=
 =?utf-8?B?OVhXbm9JZk0xalorZnR6SVNqWFJxMlR5ZmlrV1k5VnMremh6Qk15N1ZuOHU3?=
 =?utf-8?B?cVA1UHhOaDVLcG5ZU1hLYzZmUWQ4amtGV01qWWZrUGRxMVF4OC9KMVFoTERy?=
 =?utf-8?B?TTMybk9uRzlvSEkra3ZlRUMvQWxudVB6Y1dJVFp5NU1oblY4NGxDTUJQc0or?=
 =?utf-8?B?RnVRWnpoUnhRZWI3VTQ1cm03RWxyUGhva0gwMXpocDNycmx5M1c5ejZqaU1Z?=
 =?utf-8?B?Tm5hSEE0bFg3MlNpbXhZTzVtVHZTTlZ0VFRXZGw3K0owNGgzZVRYV0JaUnc2?=
 =?utf-8?B?M0tqSG5td3k0Vlg3aDN3VzFJOVBOYi90YXI1L2FlZ2JuekllYUczTHRRMXZ4?=
 =?utf-8?B?U3g2OEFpVTB2MnlDWS9vbEdUVHcwOVI0SUhxS3p2Mlk0bUlIRExYeVpMdlVL?=
 =?utf-8?B?QkVpK090YytHT2htd1ZIZDY3U2xWd3R2cUJVZjd6aUxLVmVwMTBUSHlxaFJX?=
 =?utf-8?B?cFRRR2orQkJCNFN5ZC9OSHFDc2Y2aFdOMi9sc0Q2MEgzWVhIVGoxdllRWlhi?=
 =?utf-8?Q?+UPWsAQjqzg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3puTmVGays2Tk5jSkhhZXFxeGpEdnN0bTZLMlNlMVpKcVdrMXAxbVlyVXRy?=
 =?utf-8?B?RGQ4SUhnUlE5QmtxWVB2REY2VnhaaVNyN2d3M1hzRXRTYTJtSGtkT2d0ZDVP?=
 =?utf-8?B?S3RQaU9oL3M3emE2REtWR3M2K0x5dUNlQ2tnTldTZVhzRGxEa0ZSNWJUQlNr?=
 =?utf-8?B?bDlkR1czb1lOcnQrS0dlNnhFU3BOSnNSa2dTUG1NZk5qOGNaZXRTTHhuZjNV?=
 =?utf-8?B?d2hCTXZZUjBPODNiellKczVJRjdiVEhMaWJjb3JEbHVPaGN2Yzl3VFJFQmlO?=
 =?utf-8?B?S0RVUCtBK3RlMUhDam8vNmlVdFFRUWRidmtaM0tKREM0UVdVeStnNTBtSG54?=
 =?utf-8?B?S2I3blAwTzhoWjFlZjNuV0lQYmhhSTduMVN4WGNNbk9WNGpJdzZMcCszY1BY?=
 =?utf-8?B?dnBCQlk3dGZmZmtRZklySEE0QjJ2SWtHOEwzZHJDMXZGRlVIQ01HeGFJTzFX?=
 =?utf-8?B?U0o3akVPVUpYVHV6WWFjaG5wRFRQdGxCY0JCelYxQ0dQWS9WQkxpbVB3b1F3?=
 =?utf-8?B?VDdmQUVsRGNVVnVqclpQY3RPYXdmbXhKZzFEM2FJY3lYNWpLK0dKK01XT3BW?=
 =?utf-8?B?dzZrNFZ4Mlg2OWY0NldFSGdiYzdQSmdxZFFqM0tZT3FzMGFKc1VkVDZSc20y?=
 =?utf-8?B?NzVic3hTcXBxWVkwMERtL3hYMko3akRCWDdoUEZWMFFidEtRYW1iUmt3b2dx?=
 =?utf-8?B?ci9MRy9DTENIY2lEOHVLb0lnNHB6dzlFa3RVcDNpYlI2UllwUWVTQ05ublhK?=
 =?utf-8?B?T25IYXRGbnd6TVVSa0poS2oxKzdqVjdYOTA5QUVKMTRQSG5Ubko2eldDa3Ru?=
 =?utf-8?B?ZDhsZGUzRVlxeGxHVnlGb3I1S1RKNjlGbnhuK0w1clZuZnQ0N1VoWThZTDg0?=
 =?utf-8?B?ckhaSmw1a0ROS0JHOEx6OE9xNnlkZnkyamtVSDR5cjJiUmhKb1I3NHMzdnRr?=
 =?utf-8?B?dXVKTjRsRWFkY0taeHo3Wk1pWldIVCtxZGVUMk9qb0ZzUzQ0VEQvT1U1ZUVt?=
 =?utf-8?B?OGorZUQzRlNkUjlnQ0c5MElvNU9QbVBUM0NDa0FnT0FUTDU3aXRTa1VNczZt?=
 =?utf-8?B?bjZscmVYdGhmWHBDTWM3VGZFWlZSa1AvZnV6OVl0V0Y3bkh1TDhEWG9CUnRJ?=
 =?utf-8?B?REVMY3J5dmx6SnU1eElhQW5OeDBSOFN5ZU9ISW4zS0FmRWFwc2VqcVVVMS9K?=
 =?utf-8?B?L1BCU05DMTFTSmVxTkNnWExYWnJsYXl6UmFudU9iUDlYMFRkS2tSQmhybHhH?=
 =?utf-8?B?UTVacXV3Y1dhN1VHRmEzdmhTWm15azNWekZJeXdqRzBVdWdvdWhCcVdqbWUw?=
 =?utf-8?B?YXQ2OWRSMXhoeXNqQzBGb2NNeGlPNXo1dTkyaXZDeUZ0ZW9MK0RpTFhyb0Jp?=
 =?utf-8?B?ZEVPeGh0elIrT0ptNmNXSGR2bEF2RnNrZEUrbFNCaDkwckZNRnowYzVJY0c4?=
 =?utf-8?B?VVBmTm5LbzNwcXNjeEVqVnhHMjYrVmZLTHdadkI5TXpjTEI0MG1FR0VCZ1kx?=
 =?utf-8?B?NTJ3bTh0YXREdE45TFR0NXhlRUVadUhDckFvRkpnUnozN2xHalpoWHZUMk1V?=
 =?utf-8?B?aVk5bU83Yzg4b3Y3TjkvTVRKL2ZUVkhWdnhiNy9nbS9uYkdMeTk3a2xWV1Vt?=
 =?utf-8?B?U3lEenpBZVVCT1psYW9aQUJ6eFhObmJYRlVObzVMWnpNUjVLNXExeDlzUHJC?=
 =?utf-8?B?bm11QTg3b2NRNTF2S0sxdjdOd0JQdmlCaS9nUUwxZ29Db2IzVFBJL3RXVGps?=
 =?utf-8?B?M0xsN3ZWZ3pFaHp6ZnJDUXZKVHRzaTdMTEJpeVlRVExVZlliNUNUeGx0NHFP?=
 =?utf-8?B?MjNnY1N2M0V5SVZNZWJ3OWdORm5LUkxMSEJnanhyREtGU3UwZTRTZFJxblNj?=
 =?utf-8?B?bUJxbzNXZUpxWVgzWVJaZzJkMEkxc2lvNnZJTWxRV05UNytqNUFkMWtEbjBl?=
 =?utf-8?B?bTEvV1FqalZ4TDBuNVl4K0RleU5TN3ZJN3o5aW45OVB5bWczVzJjaExaaHJ5?=
 =?utf-8?B?WTV0M0h0M2RuMTBrK0tYRVN3KzhkMFhQTU9IbDEzaUpLam80WkhFWlhjTjZN?=
 =?utf-8?B?c1dPS1RiOTRNYTlyM2ZUMFNvamkwYVZMTmNMWmREaE9BdmtyYVVtSXBnOG9Q?=
 =?utf-8?Q?3v1LG57e2NQ2PPBEGUe02eijK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c890e55e-5760-49fc-7968-08dca6fbe4c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:33:18.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfUK18i/MRBDhPw7/ly87KEvlkZY7KvsazVytarZqlMW+D10d3Wo6T3IBPnpK7e+1/mRNngFLLaT+zqFHZQyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10457

From: Peng Fan <peng.fan@nxp.com>

i.MX95 System Manager(SM) firmware includes a SCMI vendor protocol, SCMI
MISC protocol which includes controls that are misc settings/actions that
must be exposed from the SM to agents. They are device specific and are
usually define to access bit fields in various mix block control modules,
IOMUX_GPR, and other General Purpose registers, Control Status Registers
owned by the SM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/imx/Kconfig       |   9 +
 drivers/firmware/arm_scmi/imx/Makefile      |   1 +
 drivers/firmware/arm_scmi/imx/imx-sm-misc.c | 315 ++++++++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h           |  17 ++
 4 files changed, 342 insertions(+)

diff --git a/drivers/firmware/arm_scmi/imx/Kconfig b/drivers/firmware/arm_scmi/imx/Kconfig
index 4b6ac7febe8f..e9d015859eaa 100644
--- a/drivers/firmware/arm_scmi/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/imx/Kconfig
@@ -11,4 +11,13 @@ config IMX_SCMI_BBM_EXT
 
 	  This driver can also be built as a module.
 
+config IMX_SCMI_MISC_EXT
+	tristate "i.MX SCMI MISC EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System MISC control logic such as gpio expander
+	  wakeup
+
+	  This driver can also be built as a module.
 endmenu
diff --git a/drivers/firmware/arm_scmi/imx/Makefile b/drivers/firmware/arm_scmi/imx/Makefile
index a7dbdd20dbb9..d3ee6d544924 100644
--- a/drivers/firmware/arm_scmi/imx/Makefile
+++ b/drivers/firmware/arm_scmi/imx/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
+obj-$(CONFIG_IMX_SCMI_MISC_EXT) += imx-sm-misc.o
diff --git a/drivers/firmware/arm_scmi/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/imx/imx-sm-misc.c
new file mode 100644
index 000000000000..ca79d86d542c
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/imx-sm-misc.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System control and Management Interface (SCMI) NXP MISC Protocol
+ *
+ * Copyright 2024 NXP
+ */
+
+#define pr_fmt(fmt) "SCMI Notifications MISC - " fmt
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+#include "../protocols.h"
+#include "../notify.h"
+
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+#define MAX_MISC_CTRL_SOURCES			GENMASK(15, 0)
+
+enum scmi_imx_misc_protocol_cmd {
+	SCMI_IMX_MISC_CTRL_SET	= 0x3,
+	SCMI_IMX_MISC_CTRL_GET	= 0x4,
+	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
+};
+
+struct scmi_imx_misc_info {
+	u32 version;
+	u32 nr_dev_ctrl;
+	u32 nr_brd_ctrl;
+	u32 nr_reason;
+};
+
+struct scmi_msg_imx_misc_protocol_attributes {
+	__le32 attributes;
+};
+
+#define GET_BRD_CTRLS_NR(x)	le32_get_bits((x), GENMASK(31, 24))
+#define GET_REASONS_NR(x)	le32_get_bits((x), GENMASK(23, 16))
+#define GET_DEV_CTRLS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
+#define BRD_CTRL_START_ID	BIT(15)
+
+struct scmi_imx_misc_ctrl_set_in {
+	__le32 id;
+	__le32 num;
+	__le32 value[];
+};
+
+struct scmi_imx_misc_ctrl_notify_in {
+	__le32 ctrl_id;
+	__le32 flags;
+};
+
+struct scmi_imx_misc_ctrl_notify_payld {
+	__le32 ctrl_id;
+	__le32 flags;
+};
+
+struct scmi_imx_misc_ctrl_get_out {
+	__le32 num;
+	__le32 val[];
+};
+
+static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
+					struct scmi_imx_misc_info *mi)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_imx_misc_protocol_attributes *attr;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
+				      sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		mi->nr_dev_ctrl = GET_DEV_CTRLS_NR(attr->attributes);
+		mi->nr_brd_ctrl = GET_BRD_CTRLS_NR(attr->attributes);
+		mi->nr_reason = GET_REASONS_NR(attr->attributes);
+		dev_info(ph->dev, "i.MX MISC NUM DEV CTRL: %d, NUM BRD CTRL: %d,NUM Reason: %d\n",
+			 mi->nr_dev_ctrl, mi->nr_brd_ctrl, mi->nr_reason);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_misc_ctrl_validate_id(const struct scmi_protocol_handle *ph,
+					  u32 ctrl_id)
+{
+	struct scmi_imx_misc_info *mi = ph->get_priv(ph);
+
+	/*
+	 * [0,      BRD_CTRL_START_ID) is for Dev Ctrl which is SOC related
+	 * [BRD_CTRL_START_ID, 0xffff) is for Board Ctrl which is board related
+	 */
+	if ((ctrl_id < BRD_CTRL_START_ID) && (ctrl_id > mi->nr_dev_ctrl))
+		return -EINVAL;
+	if (ctrl_id >= BRD_CTRL_START_ID + mi->nr_brd_ctrl)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int scmi_imx_misc_ctrl_notify(const struct scmi_protocol_handle *ph,
+				     u32 ctrl_id, u32 evt_id, u32 flags)
+{
+	struct scmi_imx_misc_ctrl_notify_in *in;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_NOTIFY,
+				      sizeof(*in), 0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->ctrl_id = cpu_to_le32(ctrl_id);
+	in->flags = cpu_to_le32(flags);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int
+scmi_imx_misc_ctrl_set_notify_enabled(const struct scmi_protocol_handle *ph,
+				      u8 evt_id, u32 src_id, bool enable)
+{
+	int ret;
+
+	/* misc_ctrl_req_notify is for enablement */
+	if (enable)
+		return 0;
+
+	ret = scmi_imx_misc_ctrl_notify(ph, src_id, evt_id, 0);
+	if (ret)
+		dev_err(ph->dev, "FAIL_ENABLED - evt[%X] src[%d] - ret:%d\n",
+			evt_id, src_id, ret);
+
+	return ret;
+}
+
+static void *
+scmi_imx_misc_ctrl_fill_custom_report(const struct scmi_protocol_handle *ph,
+				      u8 evt_id, ktime_t timestamp,
+				      const void *payld, size_t payld_sz,
+				      void *report, u32 *src_id)
+{
+	const struct scmi_imx_misc_ctrl_notify_payld *p = payld;
+	struct scmi_imx_misc_ctrl_notify_report *r = report;
+
+	if (sizeof(*p) != payld_sz)
+		return NULL;
+
+	r->timestamp = timestamp;
+	r->ctrl_id = p->ctrl_id;
+	r->flags = p->flags;
+	if (src_id)
+		*src_id = r->ctrl_id;
+	dev_dbg(ph->dev, "%s: ctrl_id: %d flags: %d\n", __func__,
+		r->ctrl_id, r->flags);
+
+	return r;
+}
+
+static const struct scmi_event_ops scmi_imx_misc_event_ops = {
+	.set_notify_enabled = scmi_imx_misc_ctrl_set_notify_enabled,
+	.fill_custom_report = scmi_imx_misc_ctrl_fill_custom_report,
+};
+
+static const struct scmi_event scmi_imx_misc_events[] = {
+	{
+		.id = SCMI_EVENT_IMX_MISC_CONTROL,
+		.max_payld_sz = sizeof(struct scmi_imx_misc_ctrl_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_misc_ctrl_notify_report),
+	},
+};
+
+static struct scmi_protocol_events scmi_imx_misc_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &scmi_imx_misc_event_ops,
+	.evts = scmi_imx_misc_events,
+	.num_events = ARRAY_SIZE(scmi_imx_misc_events),
+	.num_sources = MAX_MISC_CTRL_SOURCES,
+};
+
+static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
+				  u32 ctrl_id, u32 *num, u32 *val)
+{
+	struct scmi_imx_misc_ctrl_get_out *out;
+	struct scmi_xfer *t;
+	int ret, i;
+	int max_msg_size = ph->hops->get_max_msg_size(ph);
+	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_GET, sizeof(u32),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(ctrl_id, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		*num = le32_to_cpu(out->num);
+
+		if (*num >= max_num ||
+		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
+			ph->xops->xfer_put(ph, t);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < *num; i++)
+			val[i] = le32_to_cpu(out->val[i]);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_misc_ctrl_set(const struct scmi_protocol_handle *ph,
+				  u32 ctrl_id, u32 num, u32 *val)
+{
+	struct scmi_imx_misc_ctrl_set_in *in;
+	struct scmi_xfer *t;
+	int ret, i;
+	int max_msg_size = ph->hops->get_max_msg_size(ph);
+	int max_num = (max_msg_size - sizeof(*in)) / sizeof(__le32);
+
+	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
+	if (ret)
+		return ret;
+
+	if (num > max_num)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CTRL_SET, sizeof(*in),
+				      0, &t);
+	if (ret)
+		return ret;
+
+	in = t->tx.buf;
+	in->id = cpu_to_le32(ctrl_id);
+	in->num = cpu_to_le32(num);
+	for (i = 0; i < num; i++)
+		in->value[i] = cpu_to_le32(val[i]);
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
+	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
+	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
+	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
+};
+
+static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_imx_misc_info *minfo;
+	u32 version;
+	int ret;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM MISC Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	minfo = devm_kzalloc(ph->dev, sizeof(*minfo), GFP_KERNEL);
+	if (!minfo)
+		return -ENOMEM;
+
+	ret = scmi_imx_misc_attributes_get(ph, minfo);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, minfo, version);
+}
+
+static const struct scmi_protocol scmi_imx_misc = {
+	.id = SCMI_PROTOCOL_IMX_MISC,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_misc_protocol_init,
+	.ops = &scmi_imx_misc_proto_ops,
+	.events = &scmi_imx_misc_protocol_events,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = "NXP",
+	.sub_vendor_id = "IMX",
+};
+module_scmi_protocol(scmi_imx_misc);
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 2df2ea0f1809..066216f1357a 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -15,6 +15,7 @@
 
 enum scmi_nxp_protocol {
 	SCMI_PROTOCOL_IMX_BBM = 0x81,
+	SCMI_PROTOCOL_IMX_MISC = 0x84,
 };
 
 struct scmi_imx_bbm_proto_ops {
@@ -30,6 +31,7 @@ struct scmi_imx_bbm_proto_ops {
 enum scmi_nxp_notification_events {
 	SCMI_EVENT_IMX_BBM_RTC = 0x0,
 	SCMI_EVENT_IMX_BBM_BUTTON = 0x1,
+	SCMI_EVENT_IMX_MISC_CONTROL = 0x0,
 };
 
 struct scmi_imx_bbm_notif_report {
@@ -39,4 +41,19 @@ struct scmi_imx_bbm_notif_report {
 	unsigned int		rtc_id;
 	unsigned int		rtc_evt;
 };
+
+struct scmi_imx_misc_ctrl_notify_report {
+	ktime_t			timestamp;
+	unsigned int		ctrl_id;
+	unsigned int		flags;
+};
+
+struct scmi_imx_misc_proto_ops {
+	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
+			     u32 num, u32 *val);
+	int (*misc_ctrl_get)(const struct scmi_protocol_handle *ph, u32 id,
+			     u32 *num, u32 *val);
+	int (*misc_ctrl_req_notify)(const struct scmi_protocol_handle *ph,
+				    u32 ctrl_id, u32 evt_id, u32 flags);
+};
 #endif

-- 
2.37.1


