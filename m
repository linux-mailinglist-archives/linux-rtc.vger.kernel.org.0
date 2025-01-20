Return-Path: <linux-rtc+bounces-2942-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E6AA1655A
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 03:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814C7163F78
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 02:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064A129415;
	Mon, 20 Jan 2025 02:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WTLHWuCX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2061.outbound.protection.outlook.com [40.107.241.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF5D2033A;
	Mon, 20 Jan 2025 02:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737339991; cv=fail; b=FIjgRGHmTA6ZxQAfqPV08f/4+MVq5ZhOTVlc+A8gg69lBEW+2d4bwhOQr0GliEgq/r+gdDKoEpfK88lTDUNKrQD9RKGDwUUZEZCt7owtMj0pjpUfoKYk9Bs3mIxjKw3qonnmzTvf1L1dbQ85UjAJ/FlOmTBARdMeePZ7yray06I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737339991; c=relaxed/simple;
	bh=uYUIvAjqkNvoZ7SYr2J7cI2jkmAHJYRr+h7tx4zRSQY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=NA6V69r7vt8v1G+V2n8Mz9DDXwIoXJzDvuWB9lGkEqMD4ARPasLdlTdGwGwWkRnGyklyVP+dkFIthxJs5b6WcYTG4+F6ePUvC4MM4K3Yl/vKJaQTBVgIPSndMlDqq+yoqJJt76fM+98NS65bxu1An1AixHYPHqQ1b2vcrKPRjhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WTLHWuCX; arc=fail smtp.client-ip=40.107.241.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/qRP8pOU6pcSkFmfd7jdy3FxRcXb9P3jPOTGEQUZ8X99G4ujNrTOVf8Dk6/rEko9pDR2IZexjztJBLIAmHHEAteakwL4c0j2jJBAmEv7N4FFMrVXTwkkOSfwzgbFI2ThcP2H39TEQXZ2eZtBkOpqmyYJZ9xTzYWDb4TLSNTN0jid8XwAYB0fdsMFnstJp872H22dk47s4XEJGYMEyXnne6UFmp44O51Sdl1yAbBjV4MqD7EN60nzcg/GZcJzyzm3LelBTARHA+JPZbEW2jB5eMdN6aSpnJpjzDIpGkKwqWzcgVbaLpwxKnZVssdy9hdq5oPRixAXdbTKUf/F0GQrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF0uQNgFw5Yy34x1AZuSpDopMmpLae2IP7dLDRAH6XE=;
 b=Hmr1nSu8B4XLgKfKz1XXhMQkzr3wTuxqWrSsTv1ZmHk9w/GfH/5ZZJ8EhZ+wr/IqHW+231G95UN1n3nPNMCa58WO3f9Jqozmi0u0Lf4ZsqPMnEXQ3S0WPPd1CJzLIPIHWeBcZEjnQHRzbiY19QZD2vdlqY8vg6HnSGqCWD/YZrm1KdtSiXOyXl7uxkKDKdaWc6rvIEDA8+6TjPrxXLs5ap8MaWAHe1O9Sye0O5d7g41hXH7mWkF8FL0B74kPkyuTNsus63WCNMliT4jTZs4zuI2cmHbAEPrdhPRcJMmpftkC+ARYnnF5oKk/yeWl6li1L62fOyOzvnQWW+mHRuY1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF0uQNgFw5Yy34x1AZuSpDopMmpLae2IP7dLDRAH6XE=;
 b=WTLHWuCXLkuTQkwaK90/v4LViBDRqhYOkSy/lg0jSZpjknycOfQh1rMj7+npdSDKopvBgDvtyxU3X2i2iNXK8bcQq7gumHYjurrr6975UHeGQUD5XIO4DZDeKs5yGpmMVmRPVu+l0VFQpnbpPs1m/2zLnSDIFCC/4LY3gKOXbjHCpapKtQo7BVQUnbLq7ScMqvCl3+3yY4Kyz+kcUYkQa1876x8+ZQEHaLnEy8I7+2pTK1BKX4ObQAglyCRlGgtBJeZnzpQvNhEbWMh9BXyN1ce9LdgqXoDyzf5uZ6c86saJePUQuO5lCK+uwSir0pdyrjPrM0Cx8eOEHbhPKzVnEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8690.eurprd04.prod.outlook.com (2603:10a6:20b:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 02:26:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 02:26:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/4] rtc/scmi: Support multiple RTCs
Date: Mon, 20 Jan 2025 10:25:32 +0800
Message-Id: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABy0jWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0Mz3aKSZF1jC2OTVANDcwuzRAsloMqCotS0zAqwKdGxtbUAmXWPo1U
 AAAA=
X-Change-ID: 20250116-rtc-3834e01786a8
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737339953; l=1510;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=uYUIvAjqkNvoZ7SYr2J7cI2jkmAHJYRr+h7tx4zRSQY=;
 b=BbeN+KbmD69TsK3AjSr52fQhvFcYwRcV2RbvGdTVS0gy/CKiKSPM+Vw68TWlfqlxBaRzfIZMN
 3MABsJtZzZeAnHsHIF7Vxy0F+xwDvBBbA/BD0tCnPtB0jEQU9CExYHG
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: a72c6aee-8321-4e57-97d5-08dd38f9d66a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUVlSndCL05mZ3VQdFNDa2lIaHNsMUg3ZUIrS05xL0YwdURvZXpQNlRrTncr?=
 =?utf-8?B?bmsyRnZ0aDEwalVna2p3ajhjQUZlcW9oN3FvTVJvdmdVQkhFcE9NTjBYcVlv?=
 =?utf-8?B?bjVnNUwvY3M3aXpDeFU4QWcramhZQjdIRjlMSmV2ZDJvRVQzQklTMUtDVzdt?=
 =?utf-8?B?TFJrSytab0dRajVGSWw3N0Y5K1VjbENOZHk1emVtMEg2b2hnUG9ncnNnVWZt?=
 =?utf-8?B?MkdRVVZYa3BhbTJIMkE2U1pmZmVPdGoxWmQvN2ZvY2tXdHMzR3BzWVlJNXhs?=
 =?utf-8?B?Z3F1VFZkUkNsRDEyZ2hGd1kxQ0RydjltY2NSYUVCS2tYUWFIelRXUVRBYzBZ?=
 =?utf-8?B?VUtLYXBIZlgySFdDOHBhWlB1TVphM2R5NTZGc0dzeGEwZVJQM2Nwa3hZRFQy?=
 =?utf-8?B?RXY5ODRENGhZb0M1Yk4zUHpPcFhkNjEyZFRZcWwxVlN5bThIRUM4Z2JIeUQw?=
 =?utf-8?B?SHltSm56cVdYdmV3aXFlOUhEMEI3QndYZGoybkx4NDlKd0VzbkludzNuV0pw?=
 =?utf-8?B?aDBsUEE4ZUdPaERvbXdpdGVtNWNQWmFTSWhnMXVQbGp5dW5OR2pqZVhJL3NK?=
 =?utf-8?B?akxLZ3ZEWmJ1aDVXeERsRnhMRjFIVXBKUjEzRnBFckRUTGpYZ1BhZURxUENr?=
 =?utf-8?B?dys0Q0ViMUxEYzFMSDlpQWpOQUJSaWhWWUFqY1Z4cmxWcDJITlV5M3l0VEI2?=
 =?utf-8?B?QjBYUVFpdDNSVVlNQnZLUlZLcFkrSHRKUS9qSUplTEMwbCtNQmtGekZwU25w?=
 =?utf-8?B?aGZnWTZQdlJXM1N2QnBRMWxsck9JOVdCdXZ2MUhaZ0E0S2FiblhUSDREVVBR?=
 =?utf-8?B?anNUYlptUDloQzZSdDZ6aEFXYll4eWJ1bXcwRXpER3NzTDN1OG13eG94Z3VG?=
 =?utf-8?B?MHhheFNya1U3SkticUJzeDR2d2hXbUwwNDhzYlZrdGJPeFZpc2lST01CYWdT?=
 =?utf-8?B?czZMR0M4VCsrUzZFdllFZURZVXZoV045bVJKQ3BUQlVVeGNTdlhKWHJld3dq?=
 =?utf-8?B?dytQUXpoUVNrYzVSTnFKS2hJQWlBMTVIazhwVWMza3dLcE9aQW5GUkNjY05s?=
 =?utf-8?B?aUJpcXF4Qk0rQTl4NUt4NXJ3bTVNYUl5K1AvSE5LbzdVcHlDcUtPZ1FTRnBH?=
 =?utf-8?B?aDh5ZVBuYmt1c0tkVkk4TEJUS3V5WFdFMjBXcWJWKzhUS3EvUjRsTkRHRmZy?=
 =?utf-8?B?TnJkRVpQTndxVDhkVllsYzFRQXEyc1ZmT2dINkpmM25BSmFNUU03WmlQalBL?=
 =?utf-8?B?b3NSWmhZTXd5Yzd4cXVYWjJudk5iajZqZkhJQVRScVdueXZYZlB4WEFIbURX?=
 =?utf-8?B?OEU2Q3pZc21ab1BBQkRaRlAzNW10WGppQjdRb3BQWjhwYTM0a0hENG9uc25D?=
 =?utf-8?B?U21nZVhhcEt0Qkdtdk16U2kvNDBnRXF2TlNRNXBhQitJdnBFc1U4RHhhdFIv?=
 =?utf-8?B?anhVK3RRaU1IcXZHbTV6SU1Genl2NUpMbE9VSGxZRFpKTG5WVzE0RldQak5w?=
 =?utf-8?B?MW5jMGh5U0VwWkdRYU10NFVoaUZGWTFQc1RlNHJ5ZVVpdGY0U3NNZlFieVlp?=
 =?utf-8?B?anFGV3ZTOFhzcldTSHRQT25pTW42dndqMXRkZkpDY1F6aENrMUJPVnhaTlR3?=
 =?utf-8?B?Z1ZDUlN1TkY0RkVydW84aUhCV0loSzBRTGl3NzhIT3ZHM0M0R2JPVVhkUzFD?=
 =?utf-8?B?d29zbDBqTnB2a09Tb0JITFNkYkZ1Q2JJeU5sU0JBRUNCTU1HYVNzWk1XYWVn?=
 =?utf-8?B?K2w5WTMzWDd0b2ZmWjVuU1BkUHZXNWVRdUJDMHFMWk53YWhIdmRYVVV5SVZR?=
 =?utf-8?B?cEZoZTlacFpjRHZQRjd3ZG5iQ21Yd2lDUDEwYXIwUnFBZzJCV3UvVVUySHNO?=
 =?utf-8?B?RTY1N0M2dTFmVkc1T2g3VHZrMWkrLzBWTm5DRXZjeUV1ZjNKUk45MVlnQ1dS?=
 =?utf-8?Q?8L/SCFO0fGlBVj9P+pJgmvKMeIeu0iUR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekFUblFMVkw0OVVIM2ttdlNPRCtDc0ZnWm5CbUNrWmdtSXdObTBHOEtKOGU0?=
 =?utf-8?B?ZjJ6bGlLUGtCREgrd1ZDQ1c5OHY2cUlEeU1YdlJQbHhaRXZtbzlMVHFKM3Mw?=
 =?utf-8?B?MXhoMnVNQmFZVWZMc2tNTEdXU3FZT2NmdUU5R215ZzlNMlcyY0NKL1NBUW1C?=
 =?utf-8?B?MTdqckxOQ3YrLzVVb0lzUFhDZEdyLzExaHNZUTlnK3orL0tyRUh3bFhQbnA5?=
 =?utf-8?B?YTI1SE5iM1dwY2FkMGZKelpBYmR4T0xTVnRkdTY1QVNJUHZZajFjeGRnUnNp?=
 =?utf-8?B?NWtFd3B6UnBVNzhoM3pMeDZzeDJSVVFVZjViRTd3cWVRa2s2Znh4d2NkVlBW?=
 =?utf-8?B?WnVPRUs0Z0s0bnUyZ0htWkhDZ0tpeDQ1TGtOM09ZQUt6emFDYzg1S291ZGtS?=
 =?utf-8?B?L1BDVGM1WXFQellkU1B6dngyenh0bFd5Nm1ERU9Od0gwWTFQQjBab3pxMzlo?=
 =?utf-8?B?VHg0TmpRSTFLVEZ0Sm96MUdTV01lNjNpUEY3TU44WlpTQ3k1VHZYUVo1bDk4?=
 =?utf-8?B?Z3d3QmtRYW5FSUV3L2pzck91aVRyVGVmN00vcXhwcC9FRDB1N0E3UU9hUzdq?=
 =?utf-8?B?Nkovb2VTVkMrbWNKamVhblhxQjl0NXA4Q1Fzc1NFUjJaMjdBUngzTWUyQ3Q5?=
 =?utf-8?B?K2VBQ2JCZkVKQXFOdUp2MUlUdW5XRlVMWkRWVXZYSVpnQ28ydnlLWEdsQzlF?=
 =?utf-8?B?dkRlbnNhMUJ5aHJQcnUzeTdqWGhIbEZLKzA4WFptdjl1cWd1eWpUQjR2UDky?=
 =?utf-8?B?MHNGdzVDLytwRUFJZ3RDNXV5Nk9jeHNXczFZTlQwcC8yeTU1VDQ3dTYrUzJI?=
 =?utf-8?B?VmFwTHNXUmZvalpTMGhTNmdGV1UyWmg0dDIyd1ZIcWlWc1lNS0RSelV2c2ZU?=
 =?utf-8?B?UVBMaFc5TWVpSG84QngvVnplY0luSVRPeExwbzgrUWNCaUpVa3lnMVZvZ2dn?=
 =?utf-8?B?T1IzQUNleUtIcHJUVCt0SUNpeCs5THFnamJPdWoyZ0xmR1ZMbDA2MENSZVJZ?=
 =?utf-8?B?djhHb2hFS1NRWU1IS3k2SVNYT3JTQXdwQUZOZTB0NXJ2ZW9TbzZRN3BFNlYz?=
 =?utf-8?B?RG5ubVFJMzl3YnJSeXdrOFh3TWQ5RGx3QXRoZm9GRk9tRndsUlJTdmtpSVps?=
 =?utf-8?B?RHd4ZkYzYkFwMTl0c3lsbjlDUGdvUThqVUhhTFcxcUVzNUFnSEwzTzl4bTlJ?=
 =?utf-8?B?enZsaXZjOG1mZnRXZ3psVmVzVDkrWUtaT3BLdXVQdjRBeThjbTlIQk1MaWhV?=
 =?utf-8?B?Vk15SWVITWlqYVZwVnhua2JBRCsyTVJDZ29QY3B5TXBXWVZ3aDk5TnVBckVp?=
 =?utf-8?B?N2lLWFJuazVUOHQxU0RaQ3BLdTJlYW9XWFRMVXo0NEtMNEZyQlNUeXZSbkFn?=
 =?utf-8?B?d3oxayt2TzJUU2hiLzcwMjJGWkZOQnBvMWVsem43c0I0cFRKWFZ4NllLd3VD?=
 =?utf-8?B?U0w4blpocG1Sb0Z1SlIzbkN6d0tGNVlEU05yQ1hyVTNLY21UT3hyc1FwSnpt?=
 =?utf-8?B?b0c3SXpXNGFtTXFPOHEzZmxxY3cwTThRUUhibTh3Yzc4UjRObTlEbU1lR0tG?=
 =?utf-8?B?QmNFRnFpNDlOMm44R1piVXN3dEJzL0hpSmJMVU92ckkyeGZDWXdiVFp0L0FS?=
 =?utf-8?B?M2NaTDNPMXNYcHoyUVZtOTVESmhqNGhGY3gyblRTNk1aNnAyczJLMjBDWWtY?=
 =?utf-8?B?ak9tZnJCRFpWVnQrZEVYbk44VllKb3I0bGpqSUNQQ0VnY2xzR3U0RHJZTExn?=
 =?utf-8?B?MU5TRjgvaUZkdk95QUZJbEZYT2Z6bkFBajl4NHpKWFNVYnpZQ25waXZodlU0?=
 =?utf-8?B?S2plRUVEaFhDbkR4V2QrYkY4UUF0K25IVkxRQzQ2elZQZ3huU2QwRU55WDFS?=
 =?utf-8?B?Ti9GSnE4bkhKcStCVC9DOG8ySjdTVzFWTS9wZFhBSFZZeU5SUnAwQmVTdm5S?=
 =?utf-8?B?YnptVm1KWmdqRUNxTmhDWHZUdnFsL0pEZ2ZLV1EwRE15N3lRWkIyOVZkdlp2?=
 =?utf-8?B?LzlRR1lFZytmMm9VMWYrb2ZiNG05T3h0aXcxbHNmRzN4UTZUdmpoSGx4OVI2?=
 =?utf-8?B?ZVFFbUZUOGZFQjczaXlUNW5hU2RkN0l0cVFxZGpzRDBBMWVVYlNjK3J5aitV?=
 =?utf-8?Q?hHjhFPhBMnHe1X66eeZdzcpmo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72c6aee-8321-4e57-97d5-08dd38f9d66a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 02:26:25.3640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ngp77sjrSVJZoyG5qwTg1ZDA7OA/2Ojrwp4ZTqHTpTviSkIG+l7Pmzu2RI1qwZAe+wOuBef3r0L1uPZ8CHZK1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8690

i.MX95 System Manager(SM) BBM protocol exports two RTCs for EVK board.
one RTC is SoC internal RTC, the other is board RTC.

The current driver only use the 1st RTC. With this patchset, both RTCs
could be used in Linux. To achieve this:

1. Support more event sources for BBM protocol
2. Add bbm_info hook to let users could query the number of RTCs
3. Introduce devm_rtc_allocate_device_priv to support setting rtc device
   private information
4. Update rtc-imx-sm-bbm.c to register both RTCs

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      firmware: arm_scmi: imx: Support more event sources
      firmware: arm_scmi: imx: Introduce bbm_info hook
      rtc: Introduce devm_rtc_allocate_device_priv
      rtc: imx-sm-bbm: Support multiple RTCs

 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c | 33 ++++++++++-
 drivers/rtc/class.c                                |  9 ++-
 drivers/rtc/dev.c                                  |  8 ++-
 drivers/rtc/interface.c                            | 16 ++---
 drivers/rtc/proc.c                                 |  2 +-
 drivers/rtc/rtc-imx-sm-bbm.c                       | 69 ++++++++++++++--------
 include/linux/rtc.h                                |  2 +
 include/linux/scmi_imx_protocol.h                  |  2 +
 8 files changed, 100 insertions(+), 41 deletions(-)
---
base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
change-id: 20250116-rtc-3834e01786a8

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


