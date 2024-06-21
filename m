Return-Path: <linux-rtc+bounces-1372-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C8911C2B
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 118A61C23BB5
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2268167D83;
	Fri, 21 Jun 2024 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UHoOtlhM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1935912BEBE;
	Fri, 21 Jun 2024 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952942; cv=fail; b=U+4nKnb3fMzXQs7wE6zSSgBdRGX6zOn50QtIy/KY00XoMrv8n0N3gziW7Tf6FotuERufXz3hMZdxgmsSVZdkpXxv1/g0/m0x9ZRIZJREf+veQKvWcfGawXF9/52oGKmpcW+qGg46uowN4cdQh71k11rkCRwnGRdNhCSiYyR/Tk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952942; c=relaxed/simple;
	bh=kLVKxSbf9TRmMO8nDCghJyhgJxZSLNZBEiwkZrKmxQw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=IZADRtnAc8C8z3dcegx4k1mFiI3qeqdJTWpt2pzjmbu7UdMHBRZCC6UAZ2PfBiJcv3OrePeAMku2PYQcsRiZ/hgXuhJZcGaCfx/T8s8T+QGBMum6ghsWoNxXvD5bmpr+psuiQsLoEccI3UPK1ADcKc0odAHziIj2k31pFbjxKDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UHoOtlhM; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLL4rG+a2BYj93x6WT5kd4UgnJzW9KKc/wF2G7bfmOeQ2RVcjqQL/es84sBjGJU679+3Sr+4wstjuh/qsPgUbo1AuWZMHj4okA4dyDohsvDra22JL6s1Yb0gqpcv1H5U+iNAdiKvQJ8NYlCP1WOUAlB1nNuYctUvcQ0Ed2QAI6IDYF8CR5TN2nX/5e/+dQe9wKIJKYSiIUqhPACH2jAdK9ViABQEUYwjv4KXAaeretQ1gFZ/RUZiDwI0UgPkIYAMSXh7fr5zIdD2r9ZT7+AQJHfLARdfkPemxmxziMp0PLC7apCHMVNKOKoIV0daVWRuT9GeIDorK4U7OAluTiRFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKYOFkCb3E/fUNT0OWv7ERie3nSlNvLiukcl1rVAv38=;
 b=FNvV3Gtwwcm8ThacLqSWOGxMalY2oy8HXvAzMG5cnqTGVHWJYFW+7b4QjzPvTvTSZS4Nse4QG+/pZJvLUbZqEe4jxYhmNWWt5eY3pSlqzQJ/Tp7VMp74v8cze+LD4UJxVtsE5RKpYAMuIAtZyLUUUDzcsz9rXADpE5GtpYjyvy+dv+8N52m61TihjmTHBz1X5iV+fr/SR7KQTMlQHh/+cq/WfKQ7BAapF1e5j5chkARPWP+QKgR22q/GlnUUhdx9+1SdHFXV3lK/sUr34B7IiM3pdX5Xyri7hDBBUV0i/++Tnr1XOkzKGyCtiRnX4+BKY9QpSeUFpiSh72dKB2Ce1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKYOFkCb3E/fUNT0OWv7ERie3nSlNvLiukcl1rVAv38=;
 b=UHoOtlhMqduckA/K4vF2vNub/wt/SqogZJTIP7lgdq12oNfPs7cchtQJG+JjgJMvMSopy4qntvMJcKTfXX3h2e+6CKyT078XFW0eq5SWIGqP7P/E9wf0norb5VuX3eXlEzNq0bQGs/kcDh70baqnKuqx7exMmDoNqcNaaBCq0N4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:55:36 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 06:55:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v5 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Date: Fri, 21 Jun 2024 15:04:35 +0800
Message-Id: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMmdWYC/33PwQqDMAwG4FeRntdRY+LsTnuPsYO2dfZQlXYUh
 /juq17mQAa5/IHvD5lZMN6awK7ZzLyJNtihT4FOGVNd3T8NtzplBgJQoCBu3SSJN43jzgbFI/C
 GjNSAtVYILLnRm9ZOW+f9kXJnw2vw7+1EhHX7ry2N4LJVMq/KikoFt34az2pwbO2Kxc7ncOSL5
 LGoRI3iImQlfj1+PQEeeUw+vUKllKRJ7vyyLB/VPyWKMAEAAA==
To: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718953487; l=6938;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=kLVKxSbf9TRmMO8nDCghJyhgJxZSLNZBEiwkZrKmxQw=;
 b=DEtXfpxFZcPG6eNX39W/zOLubbr5qsD3VwnPwhyBddVfeyXydfMRLnIZQR6o+vZ/ZI2KO5506
 YEQ5HTZPfLuASvESVM6N3SlvcHjrZnMcuf9vNw8FT+l1VzTWFKBjMbE
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To AM6PR04MB5941.eurprd04.prod.outlook.com
 (2603:10a6:20b:9e::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5941:EE_|GV1PR04MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: eaae9ba7-ec45-4346-94f2-08dc91bf26dd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|921017|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1RZRHY1K2F2K1daak1HZWppMC9mY0hvdXRHWVFVQ0orSGIzSlZhRTArNjR2?=
 =?utf-8?B?V1c4dXpUUzNHVlBjZS9hTjVvRzdwNnh5cTFraGVSREdwQW0vS2NLQXNVbHl1?=
 =?utf-8?B?eThZUDNDTjN6MTUxbDRWUm9rWm0xVERNaW1XTmJTUUduQWlKS3BwWjNGOVJx?=
 =?utf-8?B?OEJGMzdxNVgvTVltVXk3YWlYUWgvdW1ZYWFNZ2V6c3A1Zkt2eHJQTm9nNGh2?=
 =?utf-8?B?YTU4NENVWk40TmJmdk5uR0tMTENSSnJqbG9BR3JNWEhzMnVUejU2bkczVXNp?=
 =?utf-8?B?Yzg4ZFQ2amJZMG9CMTdtRmRNeXRSUzRFY21IRjdPRHVLYUk1S05QVUNBeTZI?=
 =?utf-8?B?MWNPdzVGbDRhQ2dmQ2pHL283YUp2YWxtdHZmczNXbTJDYk5wTU9BbzdQcWx1?=
 =?utf-8?B?WWY4ZFlmamd4cDBDOWdrVTJjeHlGY3g5NVBwSGtoQ3d3NDQyOVEybXVRZDg0?=
 =?utf-8?B?bm9hU2YzUVV1NlVQczRlTkNRNzhXbURTOTVSZmg0SUtTQlFrMzVOT2c2Y0Qz?=
 =?utf-8?B?dUZRVGI1SWZzNk5vZTFYVUh1bmhiaXp0ZE94MWc3Q2pBRTl3eDVxK1p5VVIv?=
 =?utf-8?B?aVVYNFNUVzdPZklhRndkYWtFV083cnVqMjVwajJhTXVnaXRwcWgxTUlHczlw?=
 =?utf-8?B?SkF3ZE5tanV2QVltR2dISUhGcWUvc3d4V3FlZGlHUzN3NHFSVjlwU2x1NDRW?=
 =?utf-8?B?U2pRc2pQbkczQXR0TWVLa0ZMU2YzSjkrODdmSU05cE12NEJMbmRrYm9Rcm1U?=
 =?utf-8?B?MnlSQ3MrMUR4TVVnY1ZCU3FUMEx3NnNFSC81eGcxSEFCS0ZDZ2dKREZMZ2tS?=
 =?utf-8?B?cTNjQXZMQWx6NzdzWW1ZRTVSU280bThZbU1VZlZVMkdHY3MyTjdNMmVoSlZU?=
 =?utf-8?B?RXZmT2RsN3A1ejR3aDdCVFJ0K2VneWUzd0pxdDhhdG5qeG1mWUU0YkwvV2Yy?=
 =?utf-8?B?Y3E5VE1XMFovaVRpeWdDbWtWR2lPSGVkdkFBcy9DR3RsejhxT2xtU1lnN1Z4?=
 =?utf-8?B?cTdSSU5oTDQrbndDSFcvLzBXUUtpQUxDajRWZ0k0OXFCUHhHYVdnN2VGZHo5?=
 =?utf-8?B?WjVMZk93dmdtR3I3ZXlVay80VHE5c3c0OWhDWEZiQ0JhRk1kNzNwQjdsT0xP?=
 =?utf-8?B?TElzSjBaWmtIWS8zVEV0enV6WHpRaXM4aGc3akhoWHQwTUdNN1ptQmw3dzJJ?=
 =?utf-8?B?R21leVFCSHZ5OFFsYmRPbEFmVHBBSis1VFE3amhmRXFNbDlzMFVxUmZyaHcy?=
 =?utf-8?B?Y253L3dQN1ZuUllRL20za2dOZks1aDBSZnpIWFkwSmxLaWRsM3Z5dGt2dVVR?=
 =?utf-8?B?OStiVkFhajFDcDhkVGpMWXV4RzZRemY2QkRlR1lCTVRlays3cVZneXdjaWc5?=
 =?utf-8?B?QmZRNHB2RDVNb0VQeS94aVVQWW5RT045Nm9jRFZuR2VsZDl6ZjNIWVRtQTM1?=
 =?utf-8?B?aCtaT3pOelB3aFV5eHVKNCtYZkpxcjFrSEM2cmNEMFhTV21VUnpYQ0JSZHFT?=
 =?utf-8?B?d3VqNVlXVTBwb053eGV4MDMvQU5CbE5MdzQzYnkwTHdxbHpaeHFyRkVHZ0hQ?=
 =?utf-8?B?V0NTUTRwbnNCVkxGNnpFNFdySmhIVU80OUlvRERWTXg1ZUVSV2dSRzdYTE42?=
 =?utf-8?B?dEZRcS9MTGovYnJFOC8xaU5MbUdkOTl3ZHp5UFZlN01nRmNMRi9BZ0FTRHdO?=
 =?utf-8?B?dlNqSjFuOUZUeTRYN25MRGwxZnA2WUduMGFMN0JMNjQ0bVhjWmw5aVhhaWxr?=
 =?utf-8?B?bDRldFNzSXlJVXA0RFhSYm42RkxHR3lhYzR3S2hEYWhOTTJPdTNtMXlLUXFU?=
 =?utf-8?B?QjBwOVllMVpibHVzK1c4UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(921017)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW5zNUg2OElsbmxVTk01bXV5MVhyYytqNklTM1lCMUpLY1RCdEV3bGhYOVFi?=
 =?utf-8?B?M1BwL3lkaXdVWVovRWw1L2lESjhPK21KNUdISGlYR01abzZoL0FjOU5JR1l6?=
 =?utf-8?B?MWQ2UDRqenR5b2pLZmhSblFJUllkOTZMc0l1U1pOVzdVZWJWTEN6R0hGbUZM?=
 =?utf-8?B?VmJyT2hjYzJyVVhqOC85QzhoMjN1M2k4MWd1c1VISHVoSkZiekgyREIwTWo0?=
 =?utf-8?B?ZDJDUERVZlE3SkYyK1VBT2ZrVWJNcWpVb2gwbjVpNDg5cENjbVh0Nk9BUEUr?=
 =?utf-8?B?ZnhYckF6OUtydXc0dmViS2xXU1lCSDNEeE43NWl6WUlUWWxtWFJIR1JpWUxp?=
 =?utf-8?B?dytHSmpYTWY3NUUwQXhGKzRscW11ellwb2tCVGUzdnRQNHhiMFdYemRZTFJD?=
 =?utf-8?B?Z1lMREpjUW1SaDZqWDhSbkhQYTMvdmEzclhZNm5pVy82eTM2eXJZQUdmQUNR?=
 =?utf-8?B?bEhGSkZEUDhxaVhTOHpBT1ZRU3pnbjVITFpVOTR0T0hiVHovRjdydFRnOWI2?=
 =?utf-8?B?M2N2SWNzQmVJay9vR3BmbzYzUGdxRkRLSjdSUWZwSDNJQ0NlbUxzRmk5aFlO?=
 =?utf-8?B?NzBHazJyR1M4Y0gzV0U1djZNdUZPdnRGNUlBNERBM0R2U1RmMVpIT2w5Nncv?=
 =?utf-8?B?OTQ0TFRwdVR3cHQvSmpKTEtPc2R6N241eEp5aVU2cHd2YTJVeXVhalF5VEs2?=
 =?utf-8?B?MFdFdHU4NWNhZVQ3alFqcWlRRUQ5eE9xZzhzMGYwaTFrYlB1SlBGT1AybndD?=
 =?utf-8?B?eWx0QUZOSzRaUDlJNDgydm84bzFFNkJkVVNKS20wV0lmTXRIMmcySW9PRW1n?=
 =?utf-8?B?dWR5dUUwTnJ4MmNLdzZJZ29HeXJ0b056bVcyOXdmNHVzTTVzL0Q3em9RUGtV?=
 =?utf-8?B?bjliT3U1L0pKU3VLb3ZNdUtLUmJ0d0xjcUROY1IyM2MrR0NtZ05WOHh2RUYx?=
 =?utf-8?B?RlcvdVFqdFAvcjExT0J2Ti9KeVZHL210YjY1OWNoM1loY1pibUxKdFMxT3hQ?=
 =?utf-8?B?TnZYRENyTmpOd0xBY3pOUERzcGREMEp4L01QVmlXNGR4a0QxOTRVbjlsc0tW?=
 =?utf-8?B?V1BncVg0N0twVERFUCthbFg2TWxyOUhaWDBvWVE2aEcyR1ZoUjFTVkViVExz?=
 =?utf-8?B?eXVLL3RhVmNac3hIaklENFZ1WURIMzN1b3Z3aWxrYlcxUmNxTGM4Yk9Tc1Jy?=
 =?utf-8?B?dE1kTEZNa2dCTkJwc0dYc29ZdXlmcytxWWh3SGc0NDBnNmNDZ24vUU1WTmg2?=
 =?utf-8?B?Z0l2MEdpbFRpMFU2ejY5ZlhqWUF1dXNnWWRBYjdPV21kZlc3alBQOVdvTE9F?=
 =?utf-8?B?Ymw4Zi91MHRaTDVRbC9DTXVSNVlYV1h6bmE0YnY2T3piSjJ3YitkK2Z0ZDk2?=
 =?utf-8?B?OHhtVm9oQXVuVk0rYWM3Tk82NnZqNWRKenEzN1ZKbkpNN2U0L2VENGNCU0dG?=
 =?utf-8?B?Uk1LaTFlUStlY0Q1NHJoWlducmFrOFlrdU9veEhVV1Q4Q0ZxaXJKZ2xkbXcz?=
 =?utf-8?B?THNMM2tlMk5EN0tBcm83ZHNGeW9ETlh3SEEzTW41MlFWODFJS1Evb1IrbTBp?=
 =?utf-8?B?cHE1emloeDEvNEIwNTg4NGxZSlF6emJ0Q2NHa2dlVmFDV3ExVTdHMW9Cajl2?=
 =?utf-8?B?S3Z3MTZjazFUWTYyWU8vbS9uRmJTR3E2QVphdFdZMlluWXJWRGJZU3hBQzRD?=
 =?utf-8?B?V0p5YUNYZzl4VTgzdFZFMHJyd0hlK0NZbFNFSDJoK2p5a0lEYThZc0VqZVZW?=
 =?utf-8?B?YWFNNU9lWGkxL1dod0hFMmpQaEtKZVRnTzZWLzhINUZIR2hmK1JkVXd5b2FH?=
 =?utf-8?B?MmN4dzAxaXY5aC8rMk5PYUFSckl1WmtrcWh3ZWdCbTJiYW81NEp6U3VkN3p5?=
 =?utf-8?B?dldxc0hKMHNRd1ROUE9FeGNXUUk5OGQ2N3kwUms3bUFQZ3hVeHdENFkzQ0xW?=
 =?utf-8?B?R2NsazBEU1VVWG1mNXo3WmJ6dXJYMThlMm90SStFZXdRNXVSaHlUQlZWdWZU?=
 =?utf-8?B?cGlydkVqbEVTWWFBWWhmSXVkQlhMQ29NcDk4UWdLRjRibGJkSXg3RFdaR1lJ?=
 =?utf-8?B?bzZzMjJraG10VUI2MFFWYTJRL0hZMDQxQWNXNHBIRzdURER4NUR1K0x3QWRW?=
 =?utf-8?Q?fg39ClQc/VVcJ96Dr7gjOcH2w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaae9ba7-ec45-4346-94f2-08dc91bf26dd
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:55:36.3207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j2Kr4IJOKSmPBttr65vmysV7KRy8Qo7HehAaz3Lrn6CYH9JqvpgXRPzyS412AcDmn56pS4VNIsvmrfDor9NH8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

i.MX95 System Manager Firmware source: https://github.com/nxp-imx/imx-sm
To generate html from the repo: make html

i.MX95 System Manager Firmware support vendor extension protocol:
- Battery Backed Module(BBM) Protocol
  This protocol is intended provide access to the battery-backed module.
  This contains persistent storage (GPR), an RTC, and the ON/OFF button.
  The protocol can also provide access to similar functions implemented via
  external board components. The BBM protocol provides functions to:

  - Describe the protocol version.
  - Discover implementation attributes.
  - Read/write GPR
  - Discover the RTCs available in the system.
  - Read/write the RTC time in seconds and ticks
  - Set an alarm (per LM) in seconds
  - Get notifications on RTC update, alarm, or rollover.
  - Get notification on ON/OFF button activity.

- MISC Protocol for misc settings
  This includes controls that are misc settings/actions that must be exposed
  from the SM to agents. They are device specific and are usually define to
  access bit fields in various mix block control modules, IOMUX_GPR, and other
  GPR/CSR owned by the SM.
  This protocol supports the following functions:

  - Describe the protocol version.
  - Discover implementation attributes.
  - Set/Get a control.
  - Initiate an action on a control.
  - Obtain platform (i.e. SM) build information.
  - Obtain ROM passover data.
  - Read boot/shutdown/reset information for the LM or the system.

This patchset is to support the two protocols and users that use the
protocols. The upper protocol infomation is also included in patch 1

Signed-off-by: Peng Fan <peng.fan@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org

Changes in v5:
- Collected missing comments in v1, I not intend to miss any, and sorry
  if I make something wrong.
- Update the documentation per Cristian's comments. Not sure we need a
 new directory for firmware stuff, not firmware-guide direcotyr.
- Added R-b for patch 3 "firmware: arm_scmi: add initial support for i.MX BBM protocol"
- For patch 4, added comments in scmi_imx_misc_ctrl_validate_id, use
  num_sources in scmi_protocol_events, move scmi_imx_misc_protocol_init
  near init, use get_max_msg_size and drop MISC_MAX_VAL.
- Separate the sm-bbm.c into rtc and key drivers with
  each has its own notifiy callback, put the driver in rtc and input
  directory, handle error return, add kconfig for each driver, use
  to_delayed_work, use READ/WRITE_ONCE, still keep ops as private,
  device_init_wakeup set false if failure.
- For patch 5, Add kconfig for sm-misc.c. Only support one instance, so add a check
  ops in probe.
- Link to v4: https://lore.kernel.org/r/20240524-imx95-bbm-misc-v2-v4-0-dc456995d590@nxp.com

Changes in v4:
- Rebased to next-20240520
- Added vendor/sub-vendor, currently the sub-vendor is "i.MX95 EVK",
  this may not be proper, I will check with firmware owner on this to
  seen any update. please still help review other parts of the patchset.
- Added constrain value in binding doc, change the property name from
  nxp,wakeup-sources to nxp,ctrl-ids to match firmware definition.
- Put i.MX code under new directory imx/
- Change the misc event from three to one, the code in previous patchset
  was wrong.
- Link to v3: https://lore.kernel.org/r/20240412-imx95-bbm-misc-v2-v3-0-4380a4070980@nxp.com

Changes in v3:
- Update cover letter and patch commit log to include more information.
- Add documentation for BBM and MISC protocols under
  Documentation/firmware-guide/nxp. Not sure if this is a good place.
- Fix the bindings, hope I have addressed the issues.
  Drop imx,scmi.yaml.
  Add nxp,imx95-scmi.yaml for NXP vendor protocol properties.
  Add constraints, add nxp prefix for NXP vendor properties.
  Use anyOf in arm,scmi.yaml to ref vendor yaml.
- Use cpu_to_le32 per Cristian
- Link to v2: https://lore.kernel.org/r/20240405-imx95-bbm-misc-v2-v2-0-9fc9186856c2@nxp.com

Changes in v2:
- Sorry for late update since v1.
- Add a new patch 1
- Address imx,scmi.yaml issues
- Address comments for imx-sm-bbm.c and imx-sm-misc.c
- I not add vendor id since related patches not landed in linux-next.
- Link to v1: https://lore.kernel.org/r/20240202-imx95-bbm-misc-v1-0-3cb743020933@nxp.com

---
Peng Fan (7):
      Documentation: firmware-guide: add NXP i.MX95 SCMI documentation
      dt-bindings: firmware: add i.MX95 SCMI Extension protocol
      firmware: arm_scmi: add initial support for i.MX BBM protocol
      firmware: arm_scmi: add initial support for i.MX MISC protocol
      firmware: imx: add i.MX95 MISC driver
      rtc: support i.MX95 BBM RTC
      input: keyboard: support i.MX95 BBM module

 .../devicetree/bindings/firmware/arm,scmi.yaml     |   5 +-
 .../bindings/firmware/nxp,imx95-scmi.yaml          |  43 +
 Documentation/firmware-guide/index.rst             |  10 +
 Documentation/firmware-guide/nxp/imx95-scmi.rst    | 887 +++++++++++++++++++++
 Documentation/firmware-guide/nxp/index.rst         |  10 +
 drivers/firmware/arm_scmi/Kconfig                  |   2 +
 drivers/firmware/arm_scmi/Makefile                 |   1 +
 drivers/firmware/arm_scmi/imx/Kconfig              |  23 +
 drivers/firmware/arm_scmi/imx/Makefile             |   3 +
 drivers/firmware/arm_scmi/imx/imx-sm-bbm.c         | 379 +++++++++
 drivers/firmware/arm_scmi/imx/imx-sm-misc.c        | 315 ++++++++
 drivers/firmware/imx/Kconfig                       |  11 +
 drivers/firmware/imx/Makefile                      |   1 +
 drivers/firmware/imx/sm-misc.c                     | 119 +++
 drivers/input/keyboard/Kconfig                     |  11 +
 drivers/input/keyboard/Makefile                    |   1 +
 drivers/input/keyboard/imx-sm-bbm-key.c            | 225 ++++++
 drivers/rtc/Kconfig                                |   8 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-imx-sm-bbm.c                       | 168 ++++
 include/linux/firmware/imx/sm.h                    |  33 +
 include/linux/scmi_imx_protocol.h                  |  59 ++
 22 files changed, 2314 insertions(+), 1 deletion(-)
---
base-commit: 76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
change-id: 20240405-imx95-bbm-misc-v2-b5e9d24adc42

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


