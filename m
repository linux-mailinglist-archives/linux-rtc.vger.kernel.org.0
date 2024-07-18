Return-Path: <linux-rtc+bounces-1546-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFB59348DB
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 09:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71C0C283246
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jul 2024 07:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71342770FA;
	Thu, 18 Jul 2024 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fMIT9oYy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C8C77117;
	Thu, 18 Jul 2024 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721287996; cv=fail; b=WCAsYlcrDe/xx+lbHs1MtIu+VopWWEjC80vrQEQFN/ZzeC49ZUQbY9l/9r+OHTJbyohSKQA75cqcfp+f++nz9fRpa4laa6W0O5b4dth/JNk+IK1phD9zp8AV2XimsJRUYXSJL57XQ1m9fYhPUUhpyYWFk3NB1Lfun5tl5KFSv6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721287996; c=relaxed/simple;
	bh=nNOjZw+khu8c5s4XQAVlK36rzOOvIUHpg0lJKlJ0tI0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t1At67C10XEzYRkJbhHhE/eXQWD+8XLpw3u4lze+HjQ1DAIjgMfvmVP0XPDjURGC/GG74wJ4U1jyASYWObg/jd11Nl3pwRFrLS5/dYQp2Ky/2661SFDyzfHnsqjhFnACl+uWGdAQEA9aPpcLP1s1+jgroLIx2ePYWF+1J+WiZug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fMIT9oYy; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRN3c5HSdyVywPI/362tK5fIw2SiayA0/AtmmEeTcT2Cwi5SNjXv1T2sun4srHf8fOsBmaLid5t+rPgLWtpjv1KA82mb+xI0TGfZ+7IflJ3th/bpGIsShKAM7m52pXc5Il7oc2IqCoy066qbkDnfjPsRz8J7Dwls8cdKVUgIb4WbS74VoQkS+qqqQCWhGDb5wRtqYyYQPurfTbi522CucUYdUB4GNQvqhWdfSB4DuXpeROoAo+fjN9WZlmHxxRxXYtKFMG3reJOxZlDYPT2Ivmbzj/BIVuD31VT+s5i69/7HaApVA+KBGiE8WYY1qWvB+eXxJtrV/EyM3wsTvYaoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USxdF/Fa9alunxDt01m0bd9NBcF0HOL4/7JSuw6JnBE=;
 b=OVKZgmOIhb95K8F3vKR1cxtSUObT21QJKbYcIhXoXHqG7HqjKsIhYx9mSJJV5tHm4FUjHt+NcacflGvQcEw9pCJFx/67ngnuAaJRgE/BEd/4FDuVaLjXX1ZfO/ZSTCmSPa5CHc6SM9pWLx+8TqZb8Kbie5F7PoRZxslKAgZwHMJ9+dCQLIky1eXrnVvjCyLHFZFnEdUK6xy2id4U4lmbUc9MI+kyydZOcnFAEtX8t6b/ahYko1WNW2HRSpzKTvrxEoXjbkZT3p1mbzvOcw0kjL9pCaJh1OaPucpWJMod1enbP8bvO4Lq7+lKDsq0wUsHcDFFZQvBdXstwZfdEdep0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USxdF/Fa9alunxDt01m0bd9NBcF0HOL4/7JSuw6JnBE=;
 b=fMIT9oYyz5PkcD5qxCdERh8/aNGihnlVacWHr/6ZMyDZ4DZ4f4upDospl9bGktO5jnn9UwVTsFQrMUsTwMJfhY7EXphG21gH1kKV4iAJ9shF/l5NtDFiuPGhXSvdtQBMapaTt7htcjKTNV++HJFjQH1CsplAX3FvqZsM1pT80H0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10457.eurprd04.prod.outlook.com (2603:10a6:10:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 07:33:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Thu, 18 Jul 2024
 07:33:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 18 Jul 2024 15:41:53 +0800
Subject: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240718-imx95-bbm-misc-v2-v6-1-18f008e16e9d@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721288528; l=3178;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=SaWHFK6ZVOWEyaRZy4LYIlOUlB7Iolddy0RrUcTK3VQ=;
 b=dM55gc+27hAnACrwQaDH/fKW9/FdaZY5zyF5BSCeHJirO8UPsHNt1iXQZOAEqoN0+fnSbKvTQ
 1U3iEI7Vx63AvK5jAyduDPAeuKk5FaFHcGA2UKD+Ep4rAyT89s2S5sJ
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
X-MS-Office365-Filtering-Correlation-Id: f1a0e4b4-d3f9-47fd-4fa4-08dca6fbde17
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUNHKzlmL0NQSnZib3BjK3MzdVE3VUh2ZG9la2tnOEZYY3RxU1g5UjRKQ09I?=
 =?utf-8?B?ZzNOSUhWOVB3VmlqRWxFNVI2VGNCeDlOUzNhZlR3NXBrVTlqTldHRGh1QWJ6?=
 =?utf-8?B?cWtTcmprMUkyUmt4K1Fza0I1OU5ZQzV4Q0hoZVF0SUpTWklVWUx0L0gyYy9k?=
 =?utf-8?B?a0dPK3RQY0ZBd2I1MGZDamNwcjhwQ1VLcC9OaGM0aU9yWk12cVFHWVU1VzA0?=
 =?utf-8?B?SEZnK0M2aElGbXl3eDk2V3UwV2F2ZzZ1RjRpa0E3UVRPL3RIVnFQTFVaVjFH?=
 =?utf-8?B?cThYd0FycTJUc1hHbWVJaVdTWHVSOGhIZitsUUU3UTl0T2VodFlNRmVyK2xy?=
 =?utf-8?B?cTJ2K3EvODc5Mit1bE1aNjJFVnBndlJUWk82NUJzSzhCOUtVZUJ4UXMvTU8z?=
 =?utf-8?B?Y0hLSjdyWDFrVlJuZ1MxcHNlRkhORVBOcEYveW1aL3JGa3QvVkZieURRcXNN?=
 =?utf-8?B?U2s1QXQxK2JPbWN6anduVWxIcTc4R09JNG9qeUpMdDlMUHN6QVprQ2w2VE91?=
 =?utf-8?B?dHNvdmRqTmhzRTQxUDMyUDlMb0x5Uk1kKzQzT00vN0tmSjNxNDVsa2MrQzJk?=
 =?utf-8?B?ajlMNWRKbnI0ZkRxTTZqeVcvN01DVk1JWkp2Y1AzYjkwM29wVFl2MjhRNU1P?=
 =?utf-8?B?TjJPbFhxeCtoUUV0aHhOZGdZaEJpSDlPSVR0T21IeUVlak5iV3hsckttakpu?=
 =?utf-8?B?MVppY1h5VHpNM2JLaW1GVEdCeTVvUHZ2aTdRTkt3ZXo2M1NjUWZjV3F3YXgw?=
 =?utf-8?B?UkcwTFMwTDc1eUhrdkd0WTNPdGJLQmFSdnhGNDhEWFRsZUpBMG9UcVBsZnhx?=
 =?utf-8?B?ZHJvb0RnWTZhWEhCQUtlZ1RrUDdqY1NqTEtpOUJjUzI1ZDVtaW9YUEhWRVRw?=
 =?utf-8?B?SEkxQ01Sbzl6c0RWeHBEN0lZeWtsL3hyVlFZYy9hLzhsRHQ4MjZqMTU5R01r?=
 =?utf-8?B?T3RZd3pZYXJhUG5GT09YNTRsOVZWY0xSSHl0NktOSUFtTVRndXJnK29UQklv?=
 =?utf-8?B?aGlaZVJrSnd1SXlMam1iVkVWb2syaDdkYnJtb1ZWVVd1cUVxM2lBV0xJalhv?=
 =?utf-8?B?NllhRFIrL3pHTDJhREpMWnE4UytDS3hNWHdiZi9TblB5cW05NnR4N3lvYWZX?=
 =?utf-8?B?VEFvM3ltT2FNazI4ZjF5TXVKdkFWbUQ2U2NUVnNWT3J2bnZzODVrQ2NvdEtv?=
 =?utf-8?B?OGlUdzZOVzBycE40SzRUWXM3b2RQMG5yLzJYS3RDVXZGSU9kVERHVXJMVUxL?=
 =?utf-8?B?OG45QXlDblp3STEwTlpkSzZkRHpuWXpaT0ZjM2M2L2JEckQ1emtDUmdyY0NB?=
 =?utf-8?B?c2hFVzV3bjh2aW5zYTVsY0htRzYrbmpTc1JkOTQ2ZWhROGJPKzg2THkzc1Z6?=
 =?utf-8?B?WGI4ZXdVcmtIK2xIaHJ5UDIzSnoyVkxRUFVnOEFsU0NVMGF5eExXV0VWNkJy?=
 =?utf-8?B?ZUlzQTJoSjhGQUdWYmNPRFlvMVo4YjB5QUJYQ1B5NWZLR0RHWjNPWHE3UEhF?=
 =?utf-8?B?cGh6eW41L0M0N1RsMmdGOWRKMFBCckdOc0FBTlRjWWN5YXBRQnZaWkpNVSs1?=
 =?utf-8?B?L3NMWitXV1A2UWtaSmpEZ1JuWHJJRmlmRnNjbTUvSVBPaU9DKzh4MVkxYWxw?=
 =?utf-8?B?Tk4zNXArcWtzMWIwSC9HQ2YwdHN0TjRHcGRxd01jMDAyTnFEMDJXcEgwaDJ6?=
 =?utf-8?B?SzNVcnY4LzFDWThybE1yUzE0cDRJNlhOUkRlS3oxV1h4Zk0wNjBjdWdwRjFD?=
 =?utf-8?B?N2s0MGM5RTYvZTFZdTUyTTBBdFdDcUJQb3BweUFwMXZFcUQ1blRhbitMdmc2?=
 =?utf-8?B?czJFU2haNkZ4K3R4STkyeTBjdHAvbk93OEZXeUk3SUJEUmgrNWFvcUE2V3N3?=
 =?utf-8?Q?TNDJdtZfxyJXD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1g1aGwrRlErTmVTdjdxQ3Q0dWJKWTJ3Y1NyZVZlZWlEUG1QdUVRZmdWV2ZF?=
 =?utf-8?B?MFY4ZHJoUDcvczBNMXMrUDdRc1dVQXJSYlhnbWpsUUV2ampmbzdpTHU5eW12?=
 =?utf-8?B?WENpR3NMZHFpQURUTzJ5OFoxTGFmY3VTN200dzBSYThmSFBQVjhvWk5HOWtJ?=
 =?utf-8?B?VDkyWjY0cUtTYkk5eGwrNHF1Q3RKK21OL0dWd0QweHg1T2lrRjViY0JDeFg2?=
 =?utf-8?B?N2hGOE9MeGlINVhuRTNvb1JaOExzd2RwamxnQ0wvZTgxenFiZTNMVHJzQ3ls?=
 =?utf-8?B?QVVYTmtTaHFrVkF2U1hpRDFaZHNqRGtmOXBqM2FoUlVNWmp1elBQVkpkRzhY?=
 =?utf-8?B?MmpOWkhla3hDclRKaDE0ajZUOGJ4Z2s2dmc5d3l3Z09FSTFhcWVBcDJ2QVpM?=
 =?utf-8?B?bWhsZGM1alo3WE1KcGtPNndqYllJTXNvRFlWUlJLNmp3eEJ1c2VxUmRseVV6?=
 =?utf-8?B?YU1xRHB3NGRPcTJiYTZXNHFwU3dvWWZKcnRsMWdjTW9sNTBaMDdGZE1ET2NP?=
 =?utf-8?B?UFRVc3l2STdnbklqdEsxeUpVL01iNzBwRmNESnlwNy9nNHZpRDJxaWZiczVV?=
 =?utf-8?B?dVdRK2g4S2RDSEJqaDJHczFuZlZvcm5jZ2VIb1p0VWFCemRPR0Zva2VRbTFV?=
 =?utf-8?B?M2k4QXl3Vk01TURHZW1EMkM4UUNWcUo1eFF0UE93TzVSaGRvU3pIRWwzajhT?=
 =?utf-8?B?b2QyZjBzeTRBaFU0bjVsUHRaRnl6YVZOOW42RmxFWFMrU3Nod2F6RGhwN2cx?=
 =?utf-8?B?MU95NWdhMGJ4eEs1dGpOdXFOdjUrZUtlT3pVUDhkNzdXcTNKWFQ3MkNOYWMx?=
 =?utf-8?B?WUw0bDlPNFVrK0MrODdhdVgxZUs3bGo3TGZlUlVJb2RHNzBkT3RRQjZHU29t?=
 =?utf-8?B?TXFqS1FUbXNnS09la3J6YmRBTXphRVhaYVBNTkxJd3daWG9NS1IvOGJXbVRT?=
 =?utf-8?B?Q3ZsSC9WVEE5WSs2Tm5VR253d0ovRmFkd0NWcnovdDM0dXlZcEtpTy9WK2VF?=
 =?utf-8?B?bXFJOUVRK2ZaNURLblhmTXJtTHN3MDdRODNLTUg0TTVhK0tLanZ3eFlndGVY?=
 =?utf-8?B?bGNZV29FVlVoZk5LeWUvM2F2M2ZRSUZKQlB2Tk9VVHh6V2YxckhlVjcvaThs?=
 =?utf-8?B?UjMydE9laTlodkpRV0MwZUpveUgvN2k2TEVuL3BTMzRDQkhLWjM0MHhJZGQ4?=
 =?utf-8?B?VWZjR09YZUZLbnl6RFNRSUJZbk4vMnQyVVFCN0lkS2Nzckc5b1ZVcnA4K0I5?=
 =?utf-8?B?elhkUkczd29oWjdDUDNKVXlrejBhZmE2YU4yekprVktvM1hPa0lZc3RYRUEy?=
 =?utf-8?B?aTVyMXU0NjYzOER2ei9XWHB1VTNxcWRRb3FmSlFpRHJVdWxuZ01VRDNPWFRO?=
 =?utf-8?B?SDBZaTVXSG9JWDA4c0FKNXQ0cEJmNmJRaUppYm5KMlArTEN4VjFtcUpIMi9V?=
 =?utf-8?B?eitzMS9ra3N1b1lqbTNXdVVRTWJ5KytWSWkrVnVZMUtXNTNBN0VKQ0xhYmk4?=
 =?utf-8?B?WnJXMXdJN3N6dWV2bi90aHUrNlgzYmpkbUxraFZheDVxVGlWUEcvQSthUXdL?=
 =?utf-8?B?MXFQaU0vU2ZBVnVZUU9BZHZRaWIzYXBoeTJyRzdxNDQzVHVBY2tkVWhCbXFk?=
 =?utf-8?B?RmtKM3FVWVkxbGo4VGFxb2ZKRFZBZ0dIeXRwK0RvWVh4bFdMYklxekl2eDR2?=
 =?utf-8?B?MWk5LzZXTCtUT0g4RzMwQzhGem9RZ21kMndiS0ViZlFYVS90cmllMGZaY3hU?=
 =?utf-8?B?TGJvck5CQUdzVzIvb1VwazVHNkhuVHBDRW5oTHBWSFo1RHRCbUQzRCtFMUIr?=
 =?utf-8?B?TnFqNm8yQ1UvMFIrNDZlU0lZMEtXWHphcHpmRkptSnVUeFRSK1ZqbTI4Kzhp?=
 =?utf-8?B?MmxUcXA5Y1dRRmFxcWI4ME9MMGNldVR4UkZYUVFsOXQ2THE1T203Yy9lN05j?=
 =?utf-8?B?VnpqTENnUUU4clhXNkQ3TlIzY3BpYkZSWWgycVRnZHRyNm5rQW8rT1pmcWpX?=
 =?utf-8?B?NnB5WVh4eHI4U3lqeWVadXZXZ1FtSlZ6VmJZeVdnUk5UU3pJc0IrZW1weVBU?=
 =?utf-8?B?RnVscitweWl3WGJMbmxCWFdCZk1odmRRc2l1TUFCS1JQL2g5UklrQXN0ZnI5?=
 =?utf-8?Q?FbrWQPe3ha7dB14Zh22zUW/kV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a0e4b4-d3f9-47fd-4fa4-08dca6fbde17
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:33:07.3912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiISAhTdGx9oqr0NrvFai6bjJ1oTU9WsuogD1wuOWBUGrnTaJADc5rtPHQyX43y2363B2lk3MDgyTYajOAOYEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10457

From: Peng Fan <peng.fan@nxp.com>

Add i.MX SCMI Extension protocols bindings for:
- Battery Backed Module(BBM) Protocol
  This contains persistent storage (GPR), an RTC, and the ON/OFF button.
  The protocol can also provide access to similar functions implemented via
  external board components.
- MISC Protocol.
  This includes controls that are misc settings/actions that must be exposed
  from the SM to agents. They are device specific and are usually define to
  access bit fields in various mix block control modules, IOMUX_GPR, and
  other GPR/CSR owned by the SM.

Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/firmware/arm,scmi.yaml     |  5 ++-
 .../bindings/firmware/nxp,imx95-scmi.yaml          | 43 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 4d823f3b1f0e..47f0487e35de 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -22,6 +22,9 @@ description: |
 
   [0] https://developer.arm.com/documentation/den0056/latest
 
+anyOf:
+  - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
+
 properties:
   $nodename:
     const: scmi
@@ -284,7 +287,7 @@ properties:
     required:
       - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 $defs:
   protocol-node:
diff --git a/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
new file mode 100644
index 000000000000..1a95010a546b
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/nxp,imx95-scmi.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/nxp,imx95-scmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX95 System Control and Management Interface(SCMI) Vendor Protocols Extension
+
+maintainers:
+  - Peng Fan <peng.fan@nxp.com>
+
+properties:
+  protocol@81:
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x81
+
+  protocol@84:
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x84
+
+      nxp,ctrl-ids:
+        description:
+          Each entry consists of 2 integers, represents the ctrl id and the value
+        items:
+          items:
+            - description: the ctrl id index
+              enum: [0, 1, 2, 3, 4, 5, 6, 7, 0x8000, 0x8001, 0x8002, 0x8003,
+                     0x8004, 0x8005, 0x8006, 0x8007]
+            - description: the value assigned to the ctrl id
+        minItems: 1
+        maxItems: 16
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+
+additionalProperties: true

-- 
2.37.1


