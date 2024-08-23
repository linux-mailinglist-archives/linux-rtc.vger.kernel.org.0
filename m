Return-Path: <linux-rtc+bounces-1705-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E48AF95C8A4
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 10:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B727287954
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 08:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75E1187330;
	Fri, 23 Aug 2024 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FsEEpEbR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013006.outbound.protection.outlook.com [52.101.67.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D3185E7A;
	Fri, 23 Aug 2024 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403447; cv=fail; b=KnmFdCRXqk5sERcFYjOB8SuG2MMypa+5h2uaf6/65c156Dl6qN/pFEAIKneCdZ97+fEnFQflj+ORk8J5cXHh9mfnn2MNYQHwmtBPIucWQ3JZ8aDCjh6B9D64bT7TKHr6B0/L+D3euiPfX3ihSVPzZrpmOe+79BMjCepncOwhlfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403447; c=relaxed/simple;
	bh=kxc2eMKo0SVpN4AB/VCrof0om0KnqGLBnf+CDyaUvMI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QebUt3CUvkHryxWD1F5tlx3iDUYvkr0YRxXUFnHDb/Y/Blk+u8iwtJULMgp1IbN8LPnn9GvNLWDQ+2dhH97KNLW0o9DgIkIZYm5yfuCduiKeEzA80xFaoeDGj4DH/zsKa1Ha8DwOWl56khtAuOpfu6psf2v75nOVi/lZ527XvEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FsEEpEbR; arc=fail smtp.client-ip=52.101.67.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpij4SS1cQ54AW18dYMCid13TI+bny1rpx9XE/yAQD/tl8nj9gbufppNN3DLQya8xPbaTAckFI6/rZs9Vzp9+FcmnZXhCyPYiFuF+cIcuAj71i+/yINeiq3lVDRqudfw61BDLcB39038dQZbcZCGbCLS7RO1gLfid1bkNNBK9Ov6QXHh8wkphhFrk5DAtIlwNu6hUAOZym1lG/Jq+nHwfvLu/1oQu2NtjAuYvRXRFTjwA0csp2jPOJONeBHzUZ9z7qeEteoMzphDEi6v++0dpEiei0ApJ1zoRQaS673JW+RaQzbu33uPf+VKg0tNm/ud1/W3zf/Ce59kcdVGhj1lIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwVO40Kbuaig/BZztDwJec5em76QDLNVCraOKEbMZg0=;
 b=qALvMGGBoIc0rmpTqOxIxw37JH6YiTdyCTrWv0I40f6ZvzVn+cRE+fZMzr2gOZzYhXbjKbXlZxFi5B30+HK+Zw7eArccmQK5AsGpqqPEd7Moxu2UCnnfD0cC+7F2cT5SjtHne5VPBHQwp8jeDZTyA9YJTRLZoHgOcqjj0J/H0I2LJHcplUgkKiyRmZccpGL9bDrJ9okVov8YEXhWMZ8UpuCPfgL1JuxAIy6CUUNErec7re1OgsDVjeheOJZNsXk7ztTWVryxu4hc8pNCfx+kTdhJGsPlJ0yJYDFDGWxOGGxBSyRDhtzxTTTWBb/InH5PLtRl0LWEt9NnTsPxwdaRCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwVO40Kbuaig/BZztDwJec5em76QDLNVCraOKEbMZg0=;
 b=FsEEpEbRCaUcGGbeP9PGJ63XpVeUmMWAY8pw5Oj8fsjBZE/1CQrZzexol6YTZylmxF/yp7c58zV+Ohg54s7yvmI67aWZ8mbsMp32mPlVGPcmwsNPicyGJ7/7s8kkroRWTKvECGLWlJWuNCea9pWq5d3ItP3qMzVFdbxogkQBQsqAHIFXKWFC3RxEenRn+P3fhwA2QfWxUQuV6dY0etdFA+m34rddzIaaOmOaB1KYXd5x/84BWPhfeQY8/GdljT9j1wDSMISzGHigwefzBu7XlKSK10DoqRsv40zTtxdzMb9fzW18H7SBzYOmm15wHWVdaAj8K4/VvbedkvMEWhS7LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7271.eurprd04.prod.outlook.com (2603:10a6:10:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 08:57:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:57:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Aug 2024 17:05:23 +0800
Subject: [PATCH v8 7/7] input: keyboard: support i.MX95 BBM module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-imx95-bbm-misc-v2-v8-7-e600ed9e9271@nxp.com>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
In-Reply-To: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724403944; l=8234;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=sBgFKxgc7cdv86yg3Whp2f3mLa6n9LiELZb9Y0Qgs7w=;
 b=3W6TfSHzhGlTGIFXb/Sq/VuSvXyypK5QU2RUIMyP1lXLuhiXl3qxqa1iQzJO4cLJpppoy7wvL
 NmlVg2jAf1rBN+IVFIxDgoefBntCoOw8z4sWnCFI5MCaASTwp5Okj7P
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBAPR04MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbebbe4-0d6c-4260-a3cd-08dcc35199f5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHRwSGlEbGY4cVJheGtsZVZ1VGRXbW9acTN6Yk42VUxRREw2Skc1eU9nZmo4?=
 =?utf-8?B?QzhreDNzR2Q1a0FDaE9IWnY5S1JqNXpxTExXSmtiSGxvSFVQTTBMdHRIR3Jo?=
 =?utf-8?B?NHFFZkJBb3YzQVVLNnRObFZKTmtSclVLSEFQOXkvZHNuKzgybmhPTVhVSVNo?=
 =?utf-8?B?QWU4UzhSWUJPQkl5REJubFMzVjVBK2x0cW5IeVpwczI1Y09mWVIvWW9NOVgw?=
 =?utf-8?B?UGhXa2dYK2RKMlRydlFpdTExVlR3QjVGb2xubHZWOGcxVG8zS3N2dnY1a1Zs?=
 =?utf-8?B?UDBZVnZsMFlLOVBhNzFtaWFVUVBSTVBMV24rdDlkVGpmeGxCVndCRHZ2azV1?=
 =?utf-8?B?ZytRREU4aXJKd0xMREJTak5CSjFxem9kMkxhVW8yM2dXVWhqeVpCc2psdUt2?=
 =?utf-8?B?UTUyQXkvbVd5SXV0TVpHVklnMTFQN1E4NktVZnJwQW1iVE5RL0dPTGJjRE9X?=
 =?utf-8?B?TkNHMndFYy91b3pOUnFpZTd6ODJudVdScG84bWE5bWVlUk1XK0ticzhjbS9j?=
 =?utf-8?B?QVdIS2h5MzJWN2c1ZUhUVkR2TTJYVTVYT28zQlo1cExjWjkzWFhxQ2p3S3Q3?=
 =?utf-8?B?WGVnNEpIYXpRUjJFTkgyNjEyaXlSQms2Qy8yRUQzajNCcjliNmRaMDJkK25j?=
 =?utf-8?B?Yko5VEhxTkZGTlF3UWR0dnpSUUN3ZmpaZ2ZDUVBCR29YWU9WWS9jZkJxRno2?=
 =?utf-8?B?TGE0TEs2bTVtemFNVjJxTEkzR3lXYkZvWmJnUjFTUXV0cTFCRjRnOStwRm80?=
 =?utf-8?B?N3Y4b290djd6MDU5SnowNzhWWG1rODljTUZNUmRieGdrZjJkVnp4QUNBLzQv?=
 =?utf-8?B?K0Y2RHVmUi8xVjR4amw3VFFFaDdScThLUXhtMjVtekViNE9MUk04UW4yVDNI?=
 =?utf-8?B?aHozOXZick1zTWVvRjJGUEFMVU8yakVBTDFweEs1blhmTFFKTmVQTlZyNmpt?=
 =?utf-8?B?Ym9TN01YZUFDUU9zMDJBMDlDNE5VTUNYV3hwNE9GRlhxV2RlU1I3Y2k1d25K?=
 =?utf-8?B?cWlqSURNbFFzUVVmNG85TTBubGdGdkk2V0ZTOGFHV3Z6amtHZnBKeHNNLzl1?=
 =?utf-8?B?QTQrYjRHY3VWVERvZ3dkTk42djJ4aXArWExyQVh2ZEFDLzF4SENCV0tSWkxO?=
 =?utf-8?B?NzlheExobzhTbkd2eXE5Z2JyWDFISzZZQWF2S3pHNlZEbjRRdldBcGswbllE?=
 =?utf-8?B?MUNsbkVxWWtFZGFId1QrZDNJL2xBaTUwYzdKM0FodE9jaTh4QkRjdjlaVXBK?=
 =?utf-8?B?Ykg1YkttT3EvMVhpOHU5OFFac29VR1NvdjA2cnlaU0VuM1RUdUVWbjliS1Uv?=
 =?utf-8?B?WGxPK2dYZ0Z2biszeDFJbTl6YkQyVk4xWHNXMnVmQ3hyaGsvOGVUSXI1Smdp?=
 =?utf-8?B?Nm01SGJGOHpnY0x2cHh2K3UyUnVMU1pQM200aWk1bmdBOFdEdm5lb3Z0RmxL?=
 =?utf-8?B?Sll0dHU0TnQvSjc4b0dCWmdPK3E1UFgxY2NhbEJJdFpROHdWVXBWalVJTUsv?=
 =?utf-8?B?UFpNYytQS09MTzdrYkNwMnoxVlIvclhpZW9HeDhHaVhUcVdTV3JjZ1V5c3J3?=
 =?utf-8?B?eit4TVZRMmJQeEZBZjZDWnNNUmYzU2xmeENIbUlpL3poZXFnaXRNSnI5cEhX?=
 =?utf-8?B?N21kSEs3U2h1WC95K3ZueThkc0kvRVRldWhtcXBuY00rdXNZS2lmSXpCeFVq?=
 =?utf-8?B?emF1WkIxUUg3ejFNQ2N5SHRWa085RXJVUjFFK2JzSXI3RFUwSHJibURoc2Yr?=
 =?utf-8?B?YlorQ1pRRFBvL1RFcXpxNmJJTmNpUW9XMG9Hb2xzMHVDYnhpTlU1bmZBQ1Er?=
 =?utf-8?B?dzVxRGRrOGZ4U3lCWkYyR3k1VSsrMTd6azhjakVOdnhKTjc2eFVRSmZmSnNt?=
 =?utf-8?B?UFRaMTV4K0xzcEV1WGpjaHBGQnYxejdQYmVEUllvUFdJa1oxeGhyUzNzSjVC?=
 =?utf-8?Q?MKYbL/lnXso=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjMxQkIzc3dFd1ZJcWVXZkFqSVdkT25QcHJ3eDJSUTdCZlJGSkdkZ3c3cHBP?=
 =?utf-8?B?WUdGa1NLbVlFWjB1d3BCRXVvVk9SNXZuZjdOcVZUSmwzN2ZMeXpMMHNlancz?=
 =?utf-8?B?RkFDZndrOFc5SHBYdWNIQWdUZUU5ZEFabGpaSC9PTjFxRlY3TXFyNzFXa0Uy?=
 =?utf-8?B?Z3hrejZHemVZMy94OWZaQWQxLy9QWGRTWFI3QkNDZ0w0bmg4MzkrME9DdHc1?=
 =?utf-8?B?dHBJa1JFUjBjNHF6OHc0dzRYOUIrNE9TTXpEMDVwRlJ5MURQQnlNZi9kR0dS?=
 =?utf-8?B?VEJpTGltU2w1b21oSGZiSTZSNjZtS1huUStTMDJhcVZRenlCM21jVElUMjM4?=
 =?utf-8?B?VnlIeE5FWG92UGFlb0xCWVhHa0hlRXNtU1YrczhPcW1XZHFLS3hidlVtVkFx?=
 =?utf-8?B?WnNmcjc5SHJhMERjU1dtWnE4c01Wemdxd2F0VnZMVVIrQXh4UmdDRTBoL1h2?=
 =?utf-8?B?WTZDSEF5ZWFBY0pxRURENHBkWHUrc2JudnFjU3pOTDVYQWYzSWJaOWhIOG5Z?=
 =?utf-8?B?ZitwR0J5ZEZiUlRjTUJ5WEMyUWROcHM4MWxwT2JGZTFENnNIeHlMb05LWVVi?=
 =?utf-8?B?clRxNHM4ZlBXdUNGMUJtSFYrays0dU0wTjhHZHBEN3JFSlhyTks1d3hoMkcw?=
 =?utf-8?B?SFd3blB5Y2NiMm1mTGFGZUhPd2t4QTcvVmFkTjhmbi82RndVVU03TnV1dVR5?=
 =?utf-8?B?UjF4K295MUhETjN6QXUxVGJYR3huMTNadE1mQlNCSzFFMFlnWjR3cUExUzI3?=
 =?utf-8?B?RnpUY0NVK214MSsrMk5jU1ViQ0cyRU9mMkhmZ2lKUENXeG5Wc25MRnhndjZu?=
 =?utf-8?B?VjVOb0cvWVFrS2d4RXkzUTVIUFNDUFdmeDhwQ09DblNCOWNjRWhOZ1FPZzBl?=
 =?utf-8?B?MTRNTEx4ZXdmblJEZ1A3TTBvRmxROTVkYjg5RGExeStBcDJ4STBCZWhEbjF3?=
 =?utf-8?B?ZElLN0tNNHpJczlaZys4aHJhSFpNQ2pEdE92NFFoMjJFK3BaZlFWNkZiK3h6?=
 =?utf-8?B?eHBrYzE0UXpkQmFZNjl4Y2xDWW1Zd2ZkRXVoWkdxRDF5d2F5Z3JkMVhhbVpD?=
 =?utf-8?B?di9MMFdTeE5LaE5xcGFoOVFSWFBBU1I0MGduUW5ySWJOVHVXN0YwUWFGUms0?=
 =?utf-8?B?MTFINXp1c21tMGJUWEthQXBBM3JtZERIZ2RQeFN0OW1DWnZSNXMrM0UvMm03?=
 =?utf-8?B?WjVCSmtpeGZRc25PaUd3VjVUNE9iTEFYbVp0NTVwLzRNNnpuVGhDdVBLYjFR?=
 =?utf-8?B?ZFhxS2IyaS8wUU1oNTg1NlZQeHRKYmVGejU3OEU4bVg4UEN3aEF6K2F3d0RV?=
 =?utf-8?B?T0Z1cHA5ZXc3aEIyeTZSOTEyZVlaWGVuQmVHMG1uK3ZzdFBoS3ArSzlHWFhl?=
 =?utf-8?B?Q1BaZVdseE5DNVR4UVg2NXFBZFFUQkNwWDdWYmE4eGVPMFYxN3NPdlFNODdx?=
 =?utf-8?B?UDJFZVZBRjBVOFROZWFmVjRHRXUzRHpIWUdpcmcrOXhkKzk0czU4VVhvSUpR?=
 =?utf-8?B?b1REdDZPUGZta2JpeXoxNnI5L2ZrcXVkeDZ0Q2pMOUE1ejNBeXc2ME9LTlF3?=
 =?utf-8?B?R3BkcW5qWTNaODA0dTQ1YjVIdkpadXg4NmNSWE5uQWhUamNLYWpQNlpVanRj?=
 =?utf-8?B?aktNWHB0cDE2VnZrZTROalBWNnhiQWttT21wYm1iV2p1RHp1ek9PdVFMRU9R?=
 =?utf-8?B?RTNtNXJNdWhZenhlR0FpcmRnMTVHejYyTXY5SVM3L3FIaktvVkpWbGQ5UXlK?=
 =?utf-8?B?ZTY3RW9DYWlIMFh5Q3NTK3l3dnBXaEVVdzJSQ0pWRFhRaDBzVHVNOTl0ZW5t?=
 =?utf-8?B?VGc3VThBZEdDQUVsV0o1WUszTVFnMGFlbDRuRytITzhBbjluUE9OR3Q2T1Mv?=
 =?utf-8?B?WmZDdGdYd1pEclNXVjVNMDd2aDlpdmVTVzFRTnVyWW5lakZpSFpremdVUEFS?=
 =?utf-8?B?c0lpTG5VYnkwOWpMeXNSZEU4MjdldXVzREJWMmpaajg2d01IblVuMldyUURN?=
 =?utf-8?B?UDYzN2RUL1pTMy9URXpCVG9yY2Vuc21mSWN5L1dNclBLQ1gwUUlSWjgzYk5w?=
 =?utf-8?B?VjVSNU1pOXRJUDh1L0FKOXJOMFNSTGdhZlZtYWRPTUpOUS9nVm1GV1B1V0c1?=
 =?utf-8?Q?GBLOvLisuxhloGQyBNXSVyLRL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbebbe4-0d6c-4260-a3cd-08dcc35199f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:57:22.3720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NX6BawmhwsvRj7fCFTggvMsyyjGYapeA0GnX72h39q4sPcZbPXW4m7OgLHERFHYVpZfitbI6iNZfpmGkAultfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7271

From: Peng Fan <peng.fan@nxp.com>

The BBM module provides BUTTON feature. To i.MX95, this module
is managed by System Manager and exported using System Management
Control Interface(SCMI). Linux could use i.MX SCMI BBM Extension
protocol to use BUTTON feature.

This driver is to use SCMI interface to enable pwrkey.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/input/keyboard/Kconfig          |  11 ++
 drivers/input/keyboard/Makefile         |   1 +
 drivers/input/keyboard/imx-sm-bbm-key.c | 225 ++++++++++++++++++++++++++++++++
 3 files changed, 237 insertions(+)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 72f9552cb571..a3301239b9a6 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -454,6 +454,17 @@ config KEYBOARD_IMX
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx_keypad.
 
+config KEYBOARD_IMX_BBM_SCMI
+	tristate "IMX BBM SCMI Key Driver"
+	depends on IMX_SCMI_BBM_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	help
+	  This is the BBM key driver for NXP i.MX SoCs managed through
+	  SCMI protocol.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called scmi-imx-bbm-key.
+
 config KEYBOARD_IMX_SC_KEY
 	tristate "IMX SCU Key Driver"
 	depends on IMX_SCU
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index b8d12a0524e0..5915e52eac28 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -31,6 +31,7 @@ obj-$(CONFIG_KEYBOARD_IPAQ_MICRO)	+= ipaq-micro-keys.o
 obj-$(CONFIG_KEYBOARD_IQS62X)		+= iqs62x-keys.o
 obj-$(CONFIG_KEYBOARD_IMX)		+= imx_keypad.o
 obj-$(CONFIG_KEYBOARD_IMX_SC_KEY)	+= imx_sc_key.o
+obj-$(CONFIG_KEYBOARD_IMX_BBM_SCMI)	+= imx-sm-bbm-key.o
 obj-$(CONFIG_KEYBOARD_HP6XX)		+= jornada680_kbd.o
 obj-$(CONFIG_KEYBOARD_HP7XX)		+= jornada720_kbd.o
 obj-$(CONFIG_KEYBOARD_LKKBD)		+= lkkbd.o
diff --git a/drivers/input/keyboard/imx-sm-bbm-key.c b/drivers/input/keyboard/imx-sm-bbm-key.c
new file mode 100644
index 000000000000..96486bd23d60
--- /dev/null
+++ b/drivers/input/keyboard/imx-sm-bbm-key.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP.
+ */
+
+#include <linux/input.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+#include <linux/suspend.h>
+
+#define DEBOUNCE_TIME		30
+#define REPEAT_INTERVAL		60
+
+struct scmi_imx_bbm {
+	struct scmi_protocol_handle *ph;
+	const struct scmi_imx_bbm_proto_ops *ops;
+	struct notifier_block nb;
+	int keycode;
+	int keystate;  /* 1:pressed */
+	bool suspended;
+	struct delayed_work check_work;
+	struct input_dev *input;
+};
+
+static void scmi_imx_bbm_pwrkey_check_for_events(struct work_struct *work)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(to_delayed_work(work),
+						  struct scmi_imx_bbm, check_work);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	struct input_dev *input = bbnsm->input;
+	u32 state = 0;
+	int ret;
+
+	ret = bbnsm->ops->button_get(ph, &state);
+	if (ret) {
+		pr_err("%s: %d\n", __func__, ret);
+		return;
+	}
+
+	pr_debug("%s: state: %d, keystate %d\n", __func__, state, bbnsm->keystate);
+
+	/* only report new event if status changed */
+	if (state ^ bbnsm->keystate) {
+		bbnsm->keystate = state;
+		input_event(input, EV_KEY, bbnsm->keycode, state);
+		input_sync(input);
+		pm_relax(bbnsm->input->dev.parent);
+		pr_debug("EV_KEY: %x\n", bbnsm->keycode);
+	}
+
+	/* repeat check if pressed long */
+	if (state)
+		schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(REPEAT_INTERVAL));
+}
+
+static int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
+{
+	struct input_dev *input = bbnsm->input;
+
+	pm_wakeup_event(input->dev.parent, 0);
+
+	/*
+	 * Directly report key event after resume to make no key press
+	 * event is missed.
+	 */
+	if (READ_ONCE(bbnsm->suspended)) {
+		bbnsm->keystate = 1;
+		input_event(input, EV_KEY, bbnsm->keycode, 1);
+		input_sync(input);
+		WRITE_ONCE(bbnsm->suspended, false);
+	}
+
+	schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(DEBOUNCE_TIME));
+
+	return 0;
+}
+
+static void scmi_imx_bbm_pwrkey_act(void *pdata)
+{
+	struct scmi_imx_bbm *bbnsm = pdata;
+
+	cancel_delayed_work_sync(&bbnsm->check_work);
+}
+
+static int scmi_imx_bbm_key_notifier(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
+	struct scmi_imx_bbm_notif_report *r = data;
+
+	if (r->is_button) {
+		pr_debug("BBM Button Power key pressed\n");
+		scmi_imx_bbm_pwrkey_event(bbnsm);
+	} else {
+		/* Should never reach here */
+		pr_err("Unexpected BBM event: %s\n", __func__);
+	}
+
+	return 0;
+}
+
+static int scmi_imx_bbm_pwrkey_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct input_dev *input;
+	int ret;
+
+	if (device_property_read_u32(dev, "linux,code", &bbnsm->keycode)) {
+		bbnsm->keycode = KEY_POWER;
+		dev_warn(dev, "key code is not specified, using default KEY_POWER\n");
+	}
+
+	INIT_DELAYED_WORK(&bbnsm->check_work, scmi_imx_bbm_pwrkey_check_for_events);
+
+	input = devm_input_allocate_device(dev);
+	if (!input) {
+		dev_err(dev, "failed to allocate the input device for SCMI IMX BBM\n");
+		return -ENOMEM;
+	}
+
+	input->name = dev_name(dev);
+	input->phys = "bbnsm-pwrkey/input0";
+	input->id.bustype = BUS_HOST;
+
+	input_set_capability(input, EV_KEY, bbnsm->keycode);
+
+	ret = devm_add_action_or_reset(dev, scmi_imx_bbm_pwrkey_act, bbnsm);
+	if (ret) {
+		dev_err(dev, "failed to register remove action\n");
+		return ret;
+	}
+
+	bbnsm->input = input;
+
+	bbnsm->nb.notifier_call = &scmi_imx_bbm_key_notifier;
+	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
+							       SCMI_EVENT_IMX_BBM_BUTTON,
+							       NULL, &bbnsm->nb);
+
+	if (ret)
+		dev_err(dev, "Failed to register BBM Button Events %d:", ret);
+
+	ret = input_register_device(input);
+	if (ret) {
+		dev_err(dev, "failed to register input device\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int scmi_imx_bbm_key_probe(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_protocol_handle *ph;
+	struct scmi_imx_bbm *bbnsm;
+	int ret;
+
+	if (!handle)
+		return -ENODEV;
+
+	bbnsm = devm_kzalloc(dev, sizeof(*bbnsm), GFP_KERNEL);
+	if (!bbnsm)
+		return -ENOMEM;
+
+	bbnsm->ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_IMX_BBM, &ph);
+	if (IS_ERR(bbnsm->ops))
+		return PTR_ERR(bbnsm->ops);
+
+	bbnsm->ph = ph;
+
+	device_init_wakeup(dev, true);
+
+	dev_set_drvdata(dev, bbnsm);
+
+	ret = scmi_imx_bbm_pwrkey_init(sdev);
+	if (ret)
+		device_init_wakeup(dev, false);
+
+	return ret;
+}
+
+static int __maybe_unused scmi_imx_bbm_key_suspend(struct device *dev)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+
+	WRITE_ONCE(bbnsm->suspended, true);
+
+	return 0;
+}
+
+static int __maybe_unused scmi_imx_bbm_key_resume(struct device *dev)
+{
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(scmi_imx_bbm_pm_key_ops, scmi_imx_bbm_key_suspend,
+			 scmi_imx_bbm_key_resume);
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-key" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_bbm_key_driver = {
+	.driver = {
+		.pm = &scmi_imx_bbm_pm_key_ops,
+	},
+	.name = "scmi-imx-bbm-key",
+	.probe = scmi_imx_bbm_key_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_bbm_key_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM BBM Key driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


