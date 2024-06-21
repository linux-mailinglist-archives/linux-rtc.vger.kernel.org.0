Return-Path: <linux-rtc+bounces-1374-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19D911C35
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 592BE1F24CBF
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A579016B3B5;
	Fri, 21 Jun 2024 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="flODI7lk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93611168C17;
	Fri, 21 Jun 2024 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952955; cv=fail; b=kt2MMGe0lXdLUP3SBuya1ILQXLubpfRrF3+xNTJcGn+NFzHTHNixJ5Fk0fvHyXYCBNphY9a/hXgAnJ+ZgMOPDc4jSeDYSTd7un9qXJ/JK5O/XVHsUqwdiF8bC/ivuqPNThZfcoFMM4oCWsQtL1fkZvd/CfimS2ZiPgxaswB0vFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952955; c=relaxed/simple;
	bh=G4nGSdnZXL5YrqPNc+JpT348+bi1RjrP7YsaFpTG4aY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WiVaeInFHxx3aJpb9b3zvQ+Nc4Y/yeQgPkoqRaEm38H9y1Jcayc57YeQH+g4TCkCUowPVReHv1N9E60zRuaATbEJgc+jHQmuiTEsEGJ2EndhQ6Jk+vlPsd+qW8Z/5h/wA7ipFQg8BFTzbwbhTH1RL83qnNSG3v3UjXVna5Rax4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=flODI7lk; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa+/fpXcm3iFaj6/e0BIzmblGFK6UVbAguJraf5JrOfSxaW+r2qGvbGRXI4kSNAWUyaMv51Z4QwMu7X8PHejKxekIMBSgSTx/3UJ+gZzhLTylB/rpHh1hsRn7F8Wj+4A8KL9ORJ0YBYa7964NDeM0cP9uRJE5BqQN6W2XazRaRTdOa4/iN4MSGYR32Q/Qc2N+4KtAs7yAk3+tArLf7PDtOwyKBNjkhWrSNwbnkqGyhkXm+UknZg5xWIkuBewC/THN5+C+J+rugC04OaGXuix2c59iL+x3CytmcgU8vpGUMgmDeBehqzCB8NezPVffHM8wgb2T0FHnlUf1qQYVzcLXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QoauDQxxFBenh0iSUn2b3RJUCaW1ML4tL550SXdj6g=;
 b=Je64J+fsuq38ire+7vx0AnW67M+zW5DT5Fp0ti/0vkElSValnccnsd/Oz1/TWGfifZufwF48JVTSX7lsd85zFtL0WA7r5Ql2/0+Ck3zo6/vcKnohWQVs089acw2GgjlV8a1ipkeV8G84GLRU8wlhLH9oOEkCCpO2zcLSFo2nJ/muKHeY22yH6gwf2jciWMyT6xDZ4HqSe/53L1p2xnnsn83F5eeWCczfv1Lupk3Ujfml/4Yy9LWslb4goihhCfi7lwTReWNGhMdLe7LUIZYvgcc4T0z2Ybx+TNB5Q7wbgtI/xCYKC5KBSG+2Hrewo5w3kLfQY6gEj3V9DCObPRQN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QoauDQxxFBenh0iSUn2b3RJUCaW1ML4tL550SXdj6g=;
 b=flODI7lkJaa+W4NWrIt5V1ong9RG0pl/mQRVmp72ARG/09B2sUcd6qteJlCY1i1qZlMmsV8K31DbTFzdgS2a39zUKWy8pr7+Fcz393v7V74pOZhyds6+yQpJZh2JKnYV7InnAFFiMgwiWyXc2RCDisw4ORAWb/4jqtlT0vHYU0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:55:50 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 06:55:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 21 Jun 2024 15:04:37 +0800
Subject: [PATCH v5 2/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-imx95-bbm-misc-v2-v5-2-b85a6bf778cb@nxp.com>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718953487; l=3120;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=XkeqFAGjNHOKfoWCkbUZAUkgOf7T6GEG5kbFMiWO5cE=;
 b=evh5Cwt3Yx42Ap7J/WIZLUu1fj85CvDAkAWvSR/udDvf/zZ20Lm3CYBLvW5qtnW3kJWC1Ujqk
 jLfnFUjXAJeDIblXyt+hVj1uHR2uILB2IVOVhTePO9r713BHG3vqsjd
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
X-MS-Office365-Filtering-Correlation-Id: 1e28bfc7-114a-4c27-ae9d-08dc91bf2fb3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|921017|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UngrbXBad2hOcDI4czhhMzkrbWpZc1QybGFNN201MVd1dE1kV0EvMWJHRkZs?=
 =?utf-8?B?aGdwdm5VWEJ5Q0Urc2owSFl3V1FYWGFjOFBhcGVWZVJBeUVBcHNrNVQxRFo4?=
 =?utf-8?B?bm5RdmFSR2VGMmpINktPR252MlNGcGQzR25La09qVXJOM0NXemxNa2lqaHJC?=
 =?utf-8?B?ZXorU1pWN1pWSjVHV0JYNFpYNCtBdGNaTWR3dS9GeUZUa1lkajVVakliQU4r?=
 =?utf-8?B?VWpNVERPd3N6eWR4ZCsxSlhvTXFQbElta2xSMlZMSVM3eHVCOE9lVkNMMDVs?=
 =?utf-8?B?eDVHSXlwZG5Ba2wxajB3MUlmRE1TUDlNM3Y4YkFHTU81SlUyRmNPeUVHdGhy?=
 =?utf-8?B?M0E2NEZGM3JFNmtVVjJqN2RuTFBpQnZoZFVzQk9NWkJ6NXdsZ3VoZ0RyUElV?=
 =?utf-8?B?MDVLVzFwTGFKUnZZZkh4ODVqcVA1aTVLbFlDeVdFSXVaUXl6SGZHZWRsa3Vq?=
 =?utf-8?B?MFdjVW5Ea01Kd2dQNFR3UXhlekhkMGV5alpBaVVQQ09GRC9rbzdvWHB0TFFR?=
 =?utf-8?B?Ums2SmxlcnBaTmQ2cmFlVlp1dG1CSVRzaFY3TUlqQmlBQU1IZFhUQTJZUkhr?=
 =?utf-8?B?REREYWdDdE15UVc0LzBlSmtlME5QQkNNaFdmTFBzME5Ob21KV1ArQU9JTWd2?=
 =?utf-8?B?WUI4eU9ER0ZhYTFtUFpOanRoc3YvQXZFaHlXTzZTSGpyaE5RTDg0N0pQU1hZ?=
 =?utf-8?B?amNkOTM5eXJwODU0TFJ4dXNSRHdaM0xDKzJWcEFCZ3Q1WHlvQjZORjJtTVU2?=
 =?utf-8?B?ZDBtUXRTQzJIWWltN3lpQkh4WDM5dnpXTGszc1ptNlFDMHhNd29yWUZ6R1o3?=
 =?utf-8?B?WTJDV0s2dnlRTmUyMFgzMyttVW9pajFObTY5SFpTUzd2RC9IRnppTjd3SkJ4?=
 =?utf-8?B?eWdRTWp5OHQ4eUNYWUtwdHVNbHBISWhmMFlZS2dmWnVqUzRxR1BpVjk4N3Zk?=
 =?utf-8?B?b1pNNE5NZGF2eDhCM0c0R09qNVdzRk1oRDdYY3FTQWZDZGVRbTk4dXZlMDhK?=
 =?utf-8?B?TnhDSWFBQUVYcng3dTJnc0VXT3ZyOXltYUVUZEJjR3JDV2hncUYyVWdobDYz?=
 =?utf-8?B?OFdxN0xIUTQ5OXRsM0IvZmlpSEdBL3lFdi9HdXRScm00NE05ZjFCS3VZRDF0?=
 =?utf-8?B?azJJeWplN1lPRTJlT2JZR0JWQU50V3EvdDdTZ0pqSC9qZDV5WjRGM2JlcEVK?=
 =?utf-8?B?WGcwbHdTN2pJczVmMm9WdmFxY0tpS1lCc1BqU2RYTWR0ME1RSG5OQVc3Tzlu?=
 =?utf-8?B?SS9RbXdIS2ZzMFV1M1ppOENFaWNGU1k2YlFLNlVXNVcwRmtmR0NDU3d1SEhE?=
 =?utf-8?B?K09SV2NQWUpYbnYyeWRySEpSK0lwSWFnalp4VTJaOGh1YVdlaFcyTnFTeTlY?=
 =?utf-8?B?SEdhRUgySGVYWGpTVm1CV2FvbWJHYW50OE1ZZlNvb05zTUlLTFhlT0dlUExZ?=
 =?utf-8?B?bFNEb2pHL1c4aFhRUEI3eUJuME5yZkdhVjdrSElESnhwbVNpZWdIRGh3ZDZ6?=
 =?utf-8?B?TlNjNnhCVmtUaGFSY1BYSWMyVGQ4UW1uZU8xVUhGdXdRaTJSUWQ0VUFLOWNh?=
 =?utf-8?B?OFNzSFFpTk5FQkx4ZmRxejR1eEhJUVoxZ29QUXV3N2YyeGVIWkRlQlluL3Fa?=
 =?utf-8?B?KzkzdjhiTmlWdUlQRW5DazdYZjFTMnUyOXhOUGN4WTZKWlZxcS83K0dDdVhq?=
 =?utf-8?B?SWVvWm56aU9ROWVvNDdmbEtKNGlENGROamVORWpNdmF1R1ZFSmdIdTljOTZi?=
 =?utf-8?B?cms1QzQrbTRqSkt5RitlRlJUNXIyWk5qRDlUUlNtTktISTQxc3djaEFqTkY0?=
 =?utf-8?B?NlJjQUpqUmpCcCtUeUlVdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(921017)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFp6NS9vSWJYNFk2d2xnWEJWenA1NXd1MU5ERFNERUxId093ZW1jb05rNWM1?=
 =?utf-8?B?cGVKaHA4OFVKY2xuSEp0ZjZJTE1TSnEyY28yZ0RRSlRoNk1rVTdUUktENEt2?=
 =?utf-8?B?RnNEbGFVOXY5TGx4TStOSURwanBqaUMzVU1aVEswWHQra1hHT3JjdUIvaVRy?=
 =?utf-8?B?azJRL0NrWkhwcm0rMnBxUGdYTTg1WmxZaVFFYjl0a1hTNTRSQmFYc2FFbXlS?=
 =?utf-8?B?b1pscEpGdysyS0lOc3dXbjVBaXlKNXBjWVpkZDBIMW9GSDBDRS80emU1Y1lY?=
 =?utf-8?B?SUlqUHJhMHByVElndzNTaHNpWE8zSllTb3JnL3o0Y2l6Wnl2cWE0TXc1czFp?=
 =?utf-8?B?elF6cWpWZWIyTXZWdDlXU0d5YWdYMSttb2pBQzlvWXdsOVd2TzhYRHdxQVg3?=
 =?utf-8?B?TnlRRXR0eng1NGtNRHNTYWQ5bVVxWlNBSGVHOHJUTE5sdm1Gb1JrekZYMjBl?=
 =?utf-8?B?UEZycVRYRUo2VDMxVHZBWlF6ZmUvNHRaT1lWUTM4aitSVG9vbUw4czVEMzRV?=
 =?utf-8?B?dmc3RDlubTJwenpLNXpmS1Z5YnhOQ2VjcC85WDFHaTZMeS9rS3hHOUZzWnNI?=
 =?utf-8?B?TCtkRXNJVFQ4SnBRS29vMm1kVmhvbVNQOVovRVpqa2pIeEd6SjV0MUY4U0k0?=
 =?utf-8?B?K1RiMXlOOUVzdklGTHFTemFyOHA3L0VXek1iYnZleHpoYkFia2R5bFhhWkpm?=
 =?utf-8?B?UWQwSUtsay9UTWZCTUNLVndMODVzSUs4eGNxSnh1VzUxRGFxQ3JBd3p3WEpY?=
 =?utf-8?B?Q1NQaUtSZGZtVmVuSFQxRytaUUV1TUdRakdqMERLY2h3bEt1WHFuaWUwVVZH?=
 =?utf-8?B?SjNyNmJwQXUvMStMYUJFRXN4U1MrV2ZhUkRLdCtnY1VJYmhDd2Y3Y0hSeVB0?=
 =?utf-8?B?Zi81aFdPOEhFbTNkM0YzOVNjazZUa3hzU0JXZDU4Wlg2REQ4WU53RkJDR1dX?=
 =?utf-8?B?c25UdTNWTGZsZWhPVVdKYktIV3Foa3VzUXlra0JhOHNsQ1YwSFpxTGZkZ2VO?=
 =?utf-8?B?eHRoQjVDOUNnS3lPTXYzYkZkNWlXYncydDhhZ2UwTFFUKzRld01CRnhFa0ha?=
 =?utf-8?B?UU1jVDBDV0ludkNUdzZ2RDhXQVRxZ2I4eVBJQTRVUjlNT3NKNVVnbnF5Qmx4?=
 =?utf-8?B?Q3RiMzFTMjJqYXNJN3F2ZEtieGFGbitkY3lrNnh5Y3EvQVErNCtzV3l4MWZM?=
 =?utf-8?B?VEh6QXY5WENlaEJhUXhuQjRZMzViWTBhOXNob2ZYUThOOHlCU3JudDVJT3lm?=
 =?utf-8?B?aCtsL2F4ZjRtS3FvUkphejJkUGdHTDkrYnMvKzl0dUFJNzd1U0NURzNEYTdn?=
 =?utf-8?B?aE5WSHZIYUI2YUV2U0tGRmtlTU95ZWNNSFF3Y0NTWmJTaUVva1BJQU04M2xw?=
 =?utf-8?B?MEhOVnFxdG9CZjRuNTF4YWszL244eDFsT0RvVElSMnhWRyt5QUZFMnQ1QnE3?=
 =?utf-8?B?WkJQcEZ3bmU0eGt3dFNFQWFXK2RJd2kvOEFNUGJyeWtMUE5YTFlVZ0lOdSti?=
 =?utf-8?B?dGVQZkxwM0hZaEhCZWR3bmQ3bWJmeEVXRDhiaytNajRUZnVzeVd1NTA2UTI1?=
 =?utf-8?B?b0lhYVB3WTFSYU5RcEZxcnU0WER6aGxpS2Fabm1RSTNuNVVJZXNyc3dkd0JW?=
 =?utf-8?B?UXkzT3V3UWVMMWtnb3p0Q05zSi9VcVpHOXRUdlRIWUpGU0xHc092QnVYd1Fz?=
 =?utf-8?B?Yno3eVJhWkVqVW4vbkxOOXVJMTJZbUFQMjQrblRJMjFrTVlZR3g2RCt0NGho?=
 =?utf-8?B?WUViSDlUN2RKOTRVR21PVVVFRldKS1J3QWlBbXJWUTJqZ3ZVM1ZmZjRzRUZ2?=
 =?utf-8?B?QTN5NG1PMGtlZ3R5ZG1pcXNqbnpMNXB6Z3AxbEsrRUtCbWlBMUdIa29JK2lQ?=
 =?utf-8?B?VHA5MGN5NEN4dE5laG1ocmdSQjhSNzVGb3JWbXJWQUkrSGg4c2JUaElRRnE4?=
 =?utf-8?B?YkJKdlVJUGErc09RMzVSSExzaS9kWVpvZGpldVYzT3FlaWU2NjRYY1Zjc2pt?=
 =?utf-8?B?eWN0QXk0ZVBFbWlacUg2aDhmdzNqS0YyTkh6Q2EvNTZ6dHhRZ2JlanNNdjFp?=
 =?utf-8?B?OWVXV054UnRtcG1Lemh1SUhmVC9kbDM2VEdQQ2hSN2l6eVdmWXh5Wjc1YzFp?=
 =?utf-8?Q?/dnTyYyp6J1fXNRICKnVkNjfZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e28bfc7-114a-4c27-ae9d-08dc91bf2fb3
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:55:50.6673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ij2s4Uq1Sj7fND8rw/rhQWlrNsZMGUKM5NEYKohiLuqFRo9nR+P6jwMNgllcdi11EYR2BmNC3VGOoR63gyTggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

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


