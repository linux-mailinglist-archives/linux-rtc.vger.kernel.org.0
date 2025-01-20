Return-Path: <linux-rtc+bounces-2945-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1AFA16560
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 03:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0413B7A2A04
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jan 2025 02:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C411465B4;
	Mon, 20 Jan 2025 02:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="A5SbAMLh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2045.outbound.protection.outlook.com [40.107.105.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311813957E;
	Mon, 20 Jan 2025 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737340003; cv=fail; b=hmUP2/3oQzQpDE22VFxbojt9W8jGFR5NscFrCtjQADx8PYYd2jekXlSU/I75YSHHw1pHA264ZVB4qmtu0o3xQKr1nF+zi/XLu6bUm8/2KpOJHHKyx3cC6jvOFkR96HPuO6l8xe/B1E/C0d7J08MCxnDRsfZpCbkeTt7z+5YzJuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737340003; c=relaxed/simple;
	bh=S3TiT74+c6cbS/0OYDBl578TfCGtZLQhnlEXJ5xPqKU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=b/JF/5hPXXQJQ/+2W0tg168b4N6aIlxuFNSUtZp+Ex6JhyldWsWJH/722g08kmo1k8qoNp4dTHgEGus7P6Zt8rzV5GFqRzthaU6nkKJplLgikJ/PxhD2kQYUQUlz/A6vW9sQQFz1iodaWjFBmn4U6rglk5TqcMc3Gs7Em64JPUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=A5SbAMLh; arc=fail smtp.client-ip=40.107.105.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJPwDu1WKYEL5NxvtLoCNez8r4qILx5JGhcTwe39u0WDTa9KWMIVPbxtqvBoHkIC53sxrlaTOq5BYm1DU1OlFylQzaEiIw48ramjeiW/LT3By0J29/Xou2MJeDUF7kyllV5wGvIyovNn8nrI3B2muDwS0JOjrVl2zpGAFzvlMjcr6u8VwZjzD1bWY8yoxmgRLmXOdXZl/GQxzksmr6AU8xy4PzRJaeJ3pn64jydmktoY4TNTgFQP9wa+XdL15EvtAAuICx3twZA8tnxqVxlXVtQ5WOWy7Us1FOhsp1J4r267WFDVGS6F+bSPywKVvowh6JNOTyzq3LIYp0bNef6SJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uS0I3mCc295EBaZyA+OocoFOODJEqDmZ8GPyzx+KJVo=;
 b=PVyMWji1zXxPBP0SYL98vZkKtDrhYmyRGaP44C4NTquGebs/M7ki/7Hk/nGnmDvodCV1vKl3m4IIGYZPeLcziwdmaBpzEoCZdIfFJ+g+fZ3k6r+KeDYkwlEUeshhPE3djoONL2TiuvPTb4aJcTh0fRW+RFfkf+/xTY2omcSCa1bI1EMR6cJF5RjwoEkq8njBwSSc7lRwo0vMBSbVfT/AXN0s2w3KrvOTYow7jte5O+xmYp++wvG98M3+OEGnZVQgn6jsZaTdROKSoRe3G58uRxZnRpHJenNXoXPll3x4bexkI3JaS++SEuwMpvKU4gDZEcI9WN0zEfe6aLIeI755hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS0I3mCc295EBaZyA+OocoFOODJEqDmZ8GPyzx+KJVo=;
 b=A5SbAMLh0A4B/Ia2/KBp/pHoS1ehNKINTceOmQdSoiy798Mz/2Dp8JuYPwebe7P2LCXlQLPy3N+pcjTfgP+dotGciUySEXPV6TAlacF3lg+M7dwTJaciqgzw4+72RVNxrxJSkV2FX+LfIKPbTy2QcX/nu83fS0CV9Pg9hSOA59KwPq6kXgYyvJ1aO8dL1ZCP9oj1/MICIP0aiZXBEc0qsM4aOkbLmy6gVuFwswg1m8B6xX89d5cT0+vmC6Fb6gXqIp+3dvSO3w5D4V1XWqOBSysi34W20Fw0iH9DdleBjFDJaj1O1WI1aESUtTwjgjGJ+xJpraBfXC4AXKN0af8Zvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8690.eurprd04.prod.outlook.com (2603:10a6:20b:429::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 02:26:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 02:26:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 10:25:35 +0800
Subject: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rtc-v1-3-08c50830bac9@nxp.com>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
In-Reply-To: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737339953; l=7539;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=bmjnxEYUzAa6HVdDVruMYsPIBr6KAocDxz9TUR0lnWI=;
 b=YcnuPCTqDzMStsGS4pHEqTuj1IjTom/OT/HPgxVwZkJWxo4DM3jgTfZWjdfblgP9K1VIVBN1t
 /NrUI4e3joICLuXCNWslFEc3vER8ti2ysxPbTUjrUj5/ysQ7YrZ+bfh
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
X-MS-Office365-Filtering-Correlation-Id: 9d2223e8-6a5b-4404-cc02-08dd38f9dda5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnRXb2ZvSGtmb3NESWNnZXVPUUQ2UlBJVFhaeFl4RENaTlpnWUxZZTRXQkVk?=
 =?utf-8?B?YU9yaTBnQVU2U1g5TjNYS0M0UVBFS3hoTEJxbTRiWW44OFNDN3k4UTFVbkFw?=
 =?utf-8?B?SE1neU1icjA3c1YvTndWNDA0eW9yV0FTek1POG51b2dBRGd0VjhPdUs5Q0FF?=
 =?utf-8?B?TmtNc2l5MGUvV0EwcEdTNlBlbmJJODAzQWpZSHp1TnQ1VXg0NmZmb2lSMEx4?=
 =?utf-8?B?bkVOT2R4NXBKRVZQMzFhdCtNWmZuaUlEUUJHRzlmVTE0clcreElhamcrNjQ1?=
 =?utf-8?B?OXE3SFpxRi9vZVlHR211TXh6bTRYVzBwMXdONzkxSnJjS3lCVVRQWjJHN3B2?=
 =?utf-8?B?c1dmWlRGS2xxTWtsTUEwbUV1SXA1QXhDUU9Cci82cG5BbmltK0M5K1dpQm5r?=
 =?utf-8?B?VktOeFY2MExFaWg2b3R5cjR0SFJXSWNSVEErWDVtRDF5NGlBQU5xbjFNbjUy?=
 =?utf-8?B?SDd2VXVHVE1XdG5UcFRWZ3g4a3NFWWxqZFk5UjZOdzZ6UGlFbnE3Q2trZ2lu?=
 =?utf-8?B?empkdUFsNXIySEp1MmJJU1R3SjBuT3JtSjlvaStxMGZIakswN1lMeFBvZDY5?=
 =?utf-8?B?WjVnMU1ySm5KZ2g3amFRdnlGcFVkVDVIbncvUE9rbmhPOVBJeDhxOXhqRXVN?=
 =?utf-8?B?ajZ1YjU1cjBJdkdrWHUycFpBSW5vUzdhN3Nna0NyNVBlMTdET1VnYmhPMU0y?=
 =?utf-8?B?ZHFxanJBWWZLVDcyQ242dnN1dHpVMzlLeFhENVVlMUxLWnVKT2JyV2RQMnZ3?=
 =?utf-8?B?Zm5RYmdKdGFWbmJ4YVlmMTN0TVdHVHl1dXJiR3o5UWs4OVo4eGRBMVZtWmFh?=
 =?utf-8?B?dDRkWncxdEFrUU5ZZ2RNNGF2d2E4Y0thbUp4OEUxZGdMbjFCdXh1Wms0NU5y?=
 =?utf-8?B?WTliY0VhdUVINWN2QlF4ckdvc2pacG5oTlNZT21mYW1EMVJJWGYrMXRQMUFR?=
 =?utf-8?B?ZEYxTW53MWNSWEhDZWxNY0gzTHRrMUhnRjc3SUt0RFhpcVdoYU1rV1NmQXBB?=
 =?utf-8?B?cms1NEhaZFJ6OUVQWXpTU2RQZDB6b2Q0SHAxZmp6d0ZLR2VXVzk1K0Ezd0JO?=
 =?utf-8?B?Q2NtSEFCRmJQekdmbURYZWlYWlFDWTliMU5hZUZDYzQzeG9kRXh2VHVHQ3Ew?=
 =?utf-8?B?WjF3MVpLclJFamxaOU9odEkvK2pjTldLUE51dVc0TDJHRXNoenkxRVlZM1kr?=
 =?utf-8?B?M01YWFB1Nk5Tb3d5YUN6MnhyczQ0bVZlVHJtVXM4QmtZMng3RWlvOG4wN1RC?=
 =?utf-8?B?REtNdHRTamdnaFc3YVhQNFN6OXNoSlVOYTdUWGZBOTY4OXhrTTN0TFo3VjRC?=
 =?utf-8?B?aVUxQmJEQ21vcjFUZmtSbFhmMFYzV3FBNVh2b0NPSUNBODdwMjdiQ2VtUmJp?=
 =?utf-8?B?MGFjOWRyUzgvQzRTL254RWdFMGRwMUlUUkszankzSytLTXBNRGlEMlBpd1pQ?=
 =?utf-8?B?VFNTWFRFZU9IOTVBb3VCSUMvOFMrUDZGTlFlWG5pT1pSSDM1d3V6bCtHTkR5?=
 =?utf-8?B?UHZ0c2JiU2ZJNFREdHdzdHdBVU42czVJWXFLSzByQityS1daSTZKMDdSTDE1?=
 =?utf-8?B?WDg2bE4wQTBMUkJlMTBhM1BqK1IzN1c4Q0VtV3k1dUVpMCtxYjd2eGE4VWlT?=
 =?utf-8?B?NGlHY1VWMnd6SVVjekd3VWIyRTA2Mkg5bDBYd1BNNHZqZUFWR3VlSkhmZlRs?=
 =?utf-8?B?S0I1djZ5ak1YWFJKNmtJUDV3S2ZGclJXcnZ1WHJuM3JSSTJyUmtVV0JMRzIx?=
 =?utf-8?B?S2s0S1prZEhBaDMxMXNXL2F0V3ZZMXFDRzJXSjlwUnJKVGRNR21mTEFDTkNp?=
 =?utf-8?B?aEtDRFFZT2NZN3g1SWVqQS9jb2RiTzRPekQ1QmFGQVhQRStsamtZa2s2by9P?=
 =?utf-8?B?dVR2cEVsQW5VZzRRVTdkaW5LTk4vME0yMHJXQVV1MEtkZ1RyR0YvNUd6dXBV?=
 =?utf-8?Q?jmdu9pcTAZ5WWg9mrfEPuKV5/oQpBHEm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0VNc2dxQ0ErNnNFUVV1aDJNWGp2S3k3UUl1ZmxXeXNMcEdJK1M5QkdOMjdX?=
 =?utf-8?B?VUNwcWhPN1VSWGRON0RqR2UxRXRqM0dNak1icU5PWFJRTk9yWXE1b1E2T2c3?=
 =?utf-8?B?VmRJdlpmNGVLZzN2M0RDa3BEcXZDdG1rYSsxUWZadnA2M0ZTdFU4UDNMZUJ4?=
 =?utf-8?B?MVJIR3JBN1ptVUJvNlRZRWg3RURtKy9nYkZQOHM5c0VxV2JIbE4rUU40Smt6?=
 =?utf-8?B?QStNN2pjZTF6eVkzWnc2ZnJFVTNTR3FkZWxOVmxNbk1LaFIwYXNJSnJBSHdY?=
 =?utf-8?B?L3BPYU9aNWdlSnN1T1Y5TkUrN0p5eVU4ZzZBN3B3VHV4ZXFYa2JZTFVrV2p0?=
 =?utf-8?B?RkYrUFFXNUIxUndZbW1yZ1BEWGZCUGQvOTUzUlVLekNGTldkdkkxcVVGZVU0?=
 =?utf-8?B?M1ozZU5pb01BR2ZjQzFabXdHSTNmOGNtQ3F3VWNQd3Y0VlZrU2Z4OWFKdGF0?=
 =?utf-8?B?MkpKMmpWVHo1aUV2L0FNQWQ2UlhQK1VQdWJibUQyWXM0UGMra21LTUJPb0RN?=
 =?utf-8?B?QWxudS9lcXlEc1BZQWRsSXJ2ZGVQWHRNSVB4OVdHbUVGTENmUWVrVVgzVnhp?=
 =?utf-8?B?TVhhbUgxMmNjMlgzVWNZWGlQZnl4NDZXY2l6dmhGbnhCbTIxdWNSNVJ1SW5v?=
 =?utf-8?B?c25NeDlQMW0vMVhEalRMS1VJUXNOL3hpMFprUXhHK2MrT1IyaytVTURwL0VZ?=
 =?utf-8?B?d0kzRG42azJ0WkxDcUQwcnl0VUlwcHhoL2dMMnRjd1JjRG8zN2g1ckRFMWho?=
 =?utf-8?B?ckVpcFpTbHZnUldhN1NmV0o3Z1hHVzE1aVg0OFBNaUlLRXZWb1V2SG03UkRq?=
 =?utf-8?B?WU51NENPK2J4U2ZBNEttZDBKYzRMbUU3ZllSN0c4RHh2NVRpV3l0VVJiVzI4?=
 =?utf-8?B?TDNVVDdrdDIrZlpaUmhOcGxZbFZEa1A4QkEySEJTejF2VG5xYVYvbWZja3kz?=
 =?utf-8?B?aEZtTXJNSDBDeUVDbDk0WUlRZmY3dDZQVVhIMUNOMkpHREEyS0h6VnhKVXhi?=
 =?utf-8?B?eTlSTDhXSWlWRUhjODBlcVRWNjVISWJYd0hpK3BTcFRWeVlEVGY3OGYzUDd3?=
 =?utf-8?B?ZFhjTFIyNVNlUHlGa29JQ0dDNFBnVUx4MnNYR2VQVkdVcktZN0NvTlVLYU5p?=
 =?utf-8?B?K3JEUUhqS1BkditFaWZDa2QwazNtRzJjSkhHZVNFcnhERUs4ZWNnNGhMc1Yw?=
 =?utf-8?B?dzZnWXFnK1JCd1lkWTFDaXB4SWRmQlNablhCRXhkK1cxVG5IajczZHlLTWlE?=
 =?utf-8?B?Nlk1VThwdEhjTkxNT1F3QVJUYnVQVVNrcVB4WGJKa01JZDRVMURXUDZ5SnhF?=
 =?utf-8?B?RGQ4SDd5ekxyWTJEaGxpNUFLbVRQdUxlMkxLNjJiYXNaSXRlMFNCMXNpM0pH?=
 =?utf-8?B?Q0EvdmdiU3ZwN2lKb2syZ1pSK2xxSjUzcXpjMEVKNWRzdm43Z2NDb0ZyRFNN?=
 =?utf-8?B?cXFDcVpuSml1OFhuaXBOWk9hc2tWcGpJSTlJZHpQM2ZBT0cxM3BqcVpQeTVa?=
 =?utf-8?B?OFVPRTFWeHlrajZDRy8wSlhRNkRHeEVMUFJhdVdQMFI2WFNYczNhV0V2WEQ3?=
 =?utf-8?B?ZWkycXorQUN5aHdweS8rRVYwNk1CNGNkTHhvNGU2TU1KcGI1TFVyZW5HSktY?=
 =?utf-8?B?V09rZ2VjcUNBclJONVZJOGNPWFcxRXp3R3ZGOFNwWkNmUGhsTWkvMTltNGZq?=
 =?utf-8?B?ZWVlK25oVUltdlZlbjB0b2JRdEhtSkIzYTRBUzhYOTBDOVUrdk1VWkRNdE4v?=
 =?utf-8?B?ejh2QVBsWkJIQXZJdFNqZlA4V01Dc3NtKzBjblgrTXllckJRaTNGR3FSejhK?=
 =?utf-8?B?K3IxOWdydGFvK2JvMzRPZEU2cGlvYWs5c2FibW92U0lQcElqbTcwb2dWa3JC?=
 =?utf-8?B?NjlYb1diMVYzNDhZbVRRL0p0WTJTbXFIRW9sOU5Sa2UxOTBTVWNodWNQeVZM?=
 =?utf-8?B?d0NzQ3lxc2tZd0xYZmkyQzB4OElKdVY4aWZIcElVQlVjbW1pbmRwK1FNVFR6?=
 =?utf-8?B?a2k1d0hibmVLZnZtdCtRazhBV0tvN2N6bzhjVUQwOFl3WHV5Tkx3MDBHVEpr?=
 =?utf-8?B?MnVrWW4wdVIyanFnU240ektwMlMrRWhlSG1OWG5RcFdkK0VGbWZKaEtTNzds?=
 =?utf-8?Q?rHMbH0BMo1ai/lvfI+iCt1ZoS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2223e8-6a5b-4404-cc02-08dd38f9dda5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 02:26:37.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFMXonDB1l9nD7gh19/vWLKx6Ltm+p3o0RpThXckuXkZz9W5RU+GK3E/pdl5jJ5lW5RAd1iRGuBLXO/aTFxbmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8690

From: Peng Fan <peng.fan@nxp.com>

Current users of rtc_class_ops->x are using 'rtc->dev.parent', so
there is no way for rtc drivers get rtc private information. Take
i.MX95 for example, i.MX95 SCMI BBM Protocol supports two RTCs
for i.MX95 EVK board. Using 'rtc->dev.parent' causing driver not
not able to know the exact RTC device. So introduce 'priv' and
devm_rtc_allocate_device_priv for driver to set rtc device private
information.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/class.c     |  9 ++++++++-
 drivers/rtc/dev.c       |  8 +++++---
 drivers/rtc/interface.c | 16 ++++++++--------
 drivers/rtc/proc.c      |  2 +-
 include/linux/rtc.h     |  2 ++
 5 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index e31fa0ad127e9545afac745a621d4ccbcd5fca28..67413600785d806fe4da441483ce1280357d8791 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -361,7 +361,7 @@ static void devm_rtc_release_device(void *res)
 	put_device(&rtc->dev);
 }
 
-struct rtc_device *devm_rtc_allocate_device(struct device *dev)
+struct rtc_device *devm_rtc_allocate_device_priv(struct device *dev, void *priv)
 {
 	struct rtc_device *rtc;
 	int id, err;
@@ -378,6 +378,7 @@ struct rtc_device *devm_rtc_allocate_device(struct device *dev)
 
 	rtc->id = id;
 	rtc->dev.parent = dev;
+	rtc->priv = priv;
 	err = devm_add_action_or_reset(dev, devm_rtc_release_device, rtc);
 	if (err)
 		return ERR_PTR(err);
@@ -388,6 +389,12 @@ struct rtc_device *devm_rtc_allocate_device(struct device *dev)
 
 	return rtc;
 }
+EXPORT_SYMBOL_GPL(devm_rtc_allocate_device_priv);
+
+struct rtc_device *devm_rtc_allocate_device(struct device *dev)
+{
+	return devm_rtc_allocate_device_priv(dev, NULL);
+}
 EXPORT_SYMBOL_GPL(devm_rtc_allocate_device);
 
 int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc)
diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d7c9453490d6cdba510cc5db5 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
 		}
 		default:
 			if (rtc->ops->param_get)
-				err = rtc->ops->param_get(rtc->dev.parent, &param);
+				err = rtc->ops->param_get(rtc->priv ?
+							  &rtc->dev : rtc->dev.parent, &param);
 			else
 				err = -EINVAL;
 		}
@@ -440,7 +441,8 @@ static long rtc_dev_ioctl(struct file *file,
 
 		default:
 			if (rtc->ops->param_set)
-				err = rtc->ops->param_set(rtc->dev.parent, &param);
+				err = rtc->ops->param_set(rtc->priv ?
+							  &rtc->dev : rtc->dev.parent, &param);
 			else
 				err = -EINVAL;
 		}
@@ -450,7 +452,7 @@ static long rtc_dev_ioctl(struct file *file,
 	default:
 		/* Finally try the driver's ioctl interface */
 		if (ops->ioctl) {
-			err = ops->ioctl(rtc->dev.parent, cmd, arg);
+			err = ops->ioctl(rtc->priv ? &rtc->dev : rtc->dev.parent, cmd, arg);
 			if (err == -ENOIOCTLCMD)
 				err = -ENOTTY;
 		} else {
diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d7d2cfd5479fc1fc892fcb5efbb6b..06d51761900ee5d6cc3916d31d907505c193c6ad 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
 		err = -EINVAL;
 	} else {
 		memset(tm, 0, sizeof(struct rtc_time));
-		err = rtc->ops->read_time(rtc->dev.parent, tm);
+		err = rtc->ops->read_time(rtc->priv ? &rtc->dev : rtc->dev.parent, tm);
 		if (err < 0) {
 			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
 				err);
@@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
 	if (!rtc->ops)
 		err = -ENODEV;
 	else if (rtc->ops->set_time)
-		err = rtc->ops->set_time(rtc->dev.parent, tm);
+		err = rtc->ops->set_time(rtc->priv ? &rtc->dev : rtc->dev.parent, tm);
 	else
 		err = -EINVAL;
 
@@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 		alarm->time.tm_wday = -1;
 		alarm->time.tm_yday = -1;
 		alarm->time.tm_isdst = -1;
-		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
+		err = rtc->ops->read_alarm(rtc->priv ? &rtc->dev : rtc->dev.parent, alarm);
 	}
 
 	mutex_unlock(&rtc->ops_lock);
@@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
 		err = -EINVAL;
 	else
-		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
+		err = rtc->ops->set_alarm(rtc->priv ? &rtc->dev : rtc->dev.parent, alarm);
 
 	trace_rtc_set_alarm(rtc_tm_to_time64(&alarm->time), err);
 	return err;
@@ -545,7 +545,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
 	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		err = -EINVAL;
 	else
-		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
+		err = rtc->ops->alarm_irq_enable(rtc->priv ? &rtc->dev : rtc->dev.parent, enabled);
 
 	mutex_unlock(&rtc->ops_lock);
 
@@ -847,7 +847,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
 	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
 		return;
 
-	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
+	rtc->ops->alarm_irq_enable(rtc->priv ? &rtc->dev : rtc->dev.parent, false);
 	trace_rtc_alarm_irq_enable(0, 0);
 }
 
@@ -1049,7 +1049,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
 		return -EINVAL;
 
 	mutex_lock(&rtc->ops_lock);
-	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
+	ret = rtc->ops->read_offset(rtc->priv ? &rtc->dev : rtc->dev.parent, offset);
 	mutex_unlock(&rtc->ops_lock);
 
 	trace_rtc_read_offset(*offset, ret);
@@ -1084,7 +1084,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
 		return -EINVAL;
 
 	mutex_lock(&rtc->ops_lock);
-	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
+	ret = rtc->ops->set_offset(rtc->priv ? &rtc->dev : rtc->dev.parent, offset);
 	mutex_unlock(&rtc->ops_lock);
 
 	trace_rtc_set_offset(offset, ret);
diff --git a/drivers/rtc/proc.c b/drivers/rtc/proc.c
index cbcdbb19d848e78e6674bd626833151a99773ef0..94cc4f9d62b7867018d876f7933468fbd1552ffc 100644
--- a/drivers/rtc/proc.c
+++ b/drivers/rtc/proc.c
@@ -73,7 +73,7 @@ static int rtc_proc_show(struct seq_file *seq, void *offset)
 	seq_printf(seq, "24hr\t\t: yes\n");
 
 	if (ops->proc)
-		ops->proc(rtc->dev.parent, seq);
+		ops->proc(rtc->priv ? &rtc->dev : rtc->dev.parent, seq);
 
 	return 0;
 }
diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 3f4d315aaec9e641e35c1c86a522f2879bec19ba..a6f3c86a08e1e214062b2a68d9a6a437afb186b3 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -110,6 +110,7 @@ struct rtc_device {
 	struct hrtimer pie_timer; /* sub second exp, so needs hrtimer */
 	int pie_enabled;
 	struct work_struct irqwork;
+	void *priv;
 
 	/*
 	 * This offset specifies the update timing of the RTC.
@@ -182,6 +183,7 @@ extern struct rtc_device *devm_rtc_device_register(struct device *dev,
 					const struct rtc_class_ops *ops,
 					struct module *owner);
 struct rtc_device *devm_rtc_allocate_device(struct device *dev);
+struct rtc_device *devm_rtc_allocate_device_priv(struct device *dev, void *priv);
 int __devm_rtc_register_device(struct module *owner, struct rtc_device *rtc);
 
 extern int rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm);

-- 
2.37.1


