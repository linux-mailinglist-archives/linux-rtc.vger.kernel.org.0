Return-Path: <linux-rtc+bounces-1704-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A37DF95C8A0
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 10:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C82AB1C2324E
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2024 08:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634E2183CC8;
	Fri, 23 Aug 2024 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v2bDBJom"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2010E1802AB;
	Fri, 23 Aug 2024 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403441; cv=fail; b=e/ST4zERl6bSGlqyNoR6BzE6up6BtrcCA9J6s+1F11I+yY/rhEvT89loXNcFQFLpWvLorNtKAIAm7b4cYvuZcKEs1NVh4JLTW5Hg0bog3vtvH5zGTIES7DvqHzI9qfbMFpuJDJE9eZgr7RHrLGUwJwXoXklRoq247ptTz1DYqNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403441; c=relaxed/simple;
	bh=NUOF7J33SNo0WE5FvoAYCztsP3E+EVDnUROpA/hQ67c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=naRAPITpTjvwbLqOfjqaLNfZgvIWmBg5hEyD2LgvDwHL8F4YUIQey0YsbWyy3JOXsE0HBk3h7YJy2pF2NbouHbqhiMhb5cauBtLyNpn+HBD6nAF7EMRh4bjLhJxB++AowFmzxa1Z4Ace7tkdUfa78Eqy5N6VUAsxVw1kj5JSVi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v2bDBJom; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUUhXaSptVKNDre5NUJUjzb8Gn10VdFlVrx1HDZWMBnYzAaFSXfZE4gaPDeKy7dKEnGBzfe1JsYGqikXZPjeRp1jalMm4T3r07vipfXnGPzyed7LAW/Zk+T2RhQwnaU5VkCbrJLN9Hl2I6Uom7tph2ASpQ1JDCW1DJmxfx6MopyJ7ZVudSurxOZGqXUpPirlf4wY7b+F6pM1yvPCcmS+lb/B97AzIZ/s2/ndDhG0pEQMQJnnHSThCUFmOA2w9esSURz030cpXYqMOpmUrEYdacYooXyQ+PorcN59zy81sYvp6MiVSoDVxgPcPeURPL66DEtB89HBmmKNTAuPIT2IUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MApvW3b6HF5krhWAKtG9pIQgpnnDtvNLy3JI/M1wEEg=;
 b=N8tGnU1ZxRGIvrdS7IA62y3RewvomTSAztjwyXIduZ/q1XiSDBnOiOxBoG5Z8QXyV2WTRi0hMhMnrRlhFWtTSd3ESW87/KfUJcYO3dt+krRMiDLaxClJkFz2yjxpYIMLOOVTg43nIlomBAxUX2cRsh0tcHBkHHqnACG4EGt+XRk0mKdMEbfA4zrSncqsEdeNxUenTExB1LzqY4FyKcQeA38lbbMJD/oLBX20UUPQbo5tzlr9pmY5qG3SkYoZizQkRSMs03lqXIpnU9a398hI2ISlaocAPYw8t6J5TRFPJbrkPr7Ge/ddXkNqJUqX60yI3g5j7BF84ZyD+3shN4W2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MApvW3b6HF5krhWAKtG9pIQgpnnDtvNLy3JI/M1wEEg=;
 b=v2bDBJom0jzQb+ds1WE048L0l5EKlu0uwywTy8L87CcgzoCzo4b3Oc8yplLVcdGKMWiadYxdEh97Q6OdNW+xIK5qsGH74wtJAO8HtUltCEr2Sf8BBwHeM2re4bZdc3Kkmw8DhEAYpRGUNSjmwNNE+mo8O2wXSz3puoBnr49D9tm+wXrv3Hyh8tyJwOgCOt02ECPwGWHbedaSOjDXD1lAgOG/HEyGbHvbe4+qBjt89oy8E+tg3ZYQMAqJIAV2n02yghWK9jTqYq5NKoFON0vkhGpgNzO4ipQ9XnQcZWIJnLYggY8jUbqq82g3mhODK4ZWPQnL3s3MnCosrM5rnm+jTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBAPR04MB7271.eurprd04.prod.outlook.com (2603:10a6:10:1a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 08:57:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:57:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 23 Aug 2024 17:05:22 +0800
Subject: [PATCH v8 6/7] rtc: support i.MX95 BBM RTC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-imx95-bbm-misc-v2-v8-6-e600ed9e9271@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724403944; l=6360;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ipvnuf27dki3nO9pw5HIbOzHnHeM3TfS1+lCPTW3Gr4=;
 b=L+uoU8QWjKkQ5+bYjVE7wTz6p1zamPRg84KpvfOqpxuEH6yA25EHKLSpsMjwANrtlCgmUJo9H
 uv9zYQeyD8KCQPUFx6qLDUL5e+kklm2M6GCYuBIkKLGK/XF8CbOXml1
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
X-MS-Office365-Filtering-Correlation-Id: 6cd11d93-247c-4006-6ca8-08dcc351962e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmlwWldwM0xaaWExMEVwejJKUDlpcHJlRmpwYmxGU1pOS016b1F2TC9tOUZR?=
 =?utf-8?B?eUlJVTJjc3BsSm1TajFML25aNERWOGVtU1EzTFE1OERpMUxhUVpJTThCWjgw?=
 =?utf-8?B?WDVMTGZ2aWRPcVVTSURpeFVuL3VFZWozZnhhMCtZd1d2WTJERlZQZTM2U3Q3?=
 =?utf-8?B?aDBERG1oN1BXVW85MEFzQ09HMlJnS2tOMnZ3NGo4SStPSFpTaDRLVThXeTRR?=
 =?utf-8?B?c1YrS0EvUlErS1dPNlpQZGpoOEFaU0lob1E5azM4N1l6ZHBqcjdEOUVkUGc2?=
 =?utf-8?B?ZFNpd0o0TVZmV1BXa2xoVWRyWWRqK2lwN0FnMG1tM0k1SDliNFNWQ09JWFZE?=
 =?utf-8?B?RWxhU0ltOGN0TkhGbkF6ZEd5bFZlMWlUQjlURTZjVW96VWJrcXppUmVWRUow?=
 =?utf-8?B?cFpKMmhubWhEVUFndjR4SWJXNlFWYmJHdW41VTM1UU9NRkFVWU00VUJ6SGRZ?=
 =?utf-8?B?QTloV3FnM0g2bXNmWlBFNkVYOVRpNkVPVDZyVE8vcFh3OWNKWm1STWh6RWxL?=
 =?utf-8?B?UDJzdzBTa0NPN3VJY2hlSGdtSzNGcDhrMkgrM2doY256eTJHRFBYZ251eGlI?=
 =?utf-8?B?MGtLRlhZUHUzMjZUc1M4VEZ0VHJmaldNVXQrTnNzMFlRbEFlRHFZZzZIWHBF?=
 =?utf-8?B?eHRzRGl2VFhQZm92dENUNzVad3ZmSVBmTmRUZ3h5a1BORElyVjludVErY0pp?=
 =?utf-8?B?UzIzUXJEcGdzZlVaU29vcUUybmRWaWRBdlpPMUVWaWxUU3BRd0tmaklmcW9S?=
 =?utf-8?B?Y1JxRGZ6Z295U3JrWm5xdm1XUTE1dU5CdlU1UUJzVXoza2Q0d2s1NWlCM0Zt?=
 =?utf-8?B?V2pzWGxZTFZCSDViWm1FajhQOTFsVitRdDdyT3JxazA0VjJoNVhpd1pYcjdO?=
 =?utf-8?B?ZkhNOXhvYXlQR1ZtbDVpeUJXblZrK3ZIMWJCWDRFc2dIWC9FbzV2citKWHFp?=
 =?utf-8?B?a0dvRUppdEszNlJrWExUdkFMSDV4WCtYT0kvc3Z5ZVhHYkx3d3I1SStDczVw?=
 =?utf-8?B?R1oxWkVFSXQ4MzBHZ1AvdTkwWDAxbHdZejVScWdNVFBuZmQ3TVJMT0Q4SmNC?=
 =?utf-8?B?Y3ZPS3ZsYkhOTzUxUDJDcG9QaTcrR1h3ZVQ5VXk2SUE0STZCWnpwb2Iyd3R4?=
 =?utf-8?B?RXZNSEVDZ0M2QzRMdGpoWEM1aTZ4V0RzcUtlTWszUlhKbGtDK3BoZFFDTUlX?=
 =?utf-8?B?Wm1aQVg1OVVPdE1TejFRR01vSW9PWmZjZlI5aXlyZjc4MUp0N3JrMldaTFNh?=
 =?utf-8?B?TTEzZGUrK2lsczliZlVtZWdlbi9aUnNOMG8rUkgzZ1VoVEFTUnN6aWNPbTNi?=
 =?utf-8?B?Q3FBemtUWjh0cDhvYWlNTWExNE14eWJ1SERNY0tBbnVzL3A5YlRpQVEraFVo?=
 =?utf-8?B?ZEZSOUdEZytGUnZNWmFpQnRySjVHNXNDY0tKQmI2ZFUrdmI5SGJMVEdOd1Ru?=
 =?utf-8?B?YWJxR2Fud2dJc3haalQ4ZjJOdytiRUxZSE5wRkdzV05TM29xOVlJTVg5RXBi?=
 =?utf-8?B?WGZLSkJXNFAzSk5POXdYcUJaZkc1MWY3SkN1eXloMWJvZG1PK0l6SjhHT1lD?=
 =?utf-8?B?RmYybXRaZ1RCL0lKL0dpYkN6UW52NUI4eCtnMldiRUhBdE8xeHN2bEM2aFFG?=
 =?utf-8?B?LysvWVEvSDRKczVEOGFzMTNzbzk2VzdGRE1TMHNFNXV0eW11WUsya3VmbU9V?=
 =?utf-8?B?UUpjcUFXeUxPaU81YkJCL28yeFZVOFlVcmNEVzFMT0J5MklIZ2xyNkFJOGVn?=
 =?utf-8?B?ZG9jajhMdGJmZ3pmbkdoaTAvNlpZV2VDNlhKV3JlQ2x6VDBGQnk5R1IwaE42?=
 =?utf-8?B?VlJTejh1d3ZNK2l1UTZvWS9oODFPY0ZrR3pBQ00wbjRTY3h3dkNhcEhkRzlk?=
 =?utf-8?B?RFZKeUpPb1hEL0hxVVRNSGxlVUZ6OTF0bk5NMXg4R0U3UEtIM0lGdG9UK2tS?=
 =?utf-8?Q?nnXK0Yi5qxo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnIrL3ZiU09wMEJsalo3UGpZUHVqemZEVWlCNGNHNGZRTWc3MXE4WFBZT0hO?=
 =?utf-8?B?d2gvNU51cjVNeVlVb3pHSFVjdDVMZlphVjdzRXM0Z1E4S2pYR3UwQzZHaHBX?=
 =?utf-8?B?Rit0Vjd6S0RYQXJtUGVlSVJWOVQ1d2l5bnNaMUpuaGkzVk5nUkdzT2VqYmNR?=
 =?utf-8?B?Z2VZTytPYVhrTzErK3RDenZpNE9Idys2aFRaNG0wR0NGMHR3am44WGNjRGtV?=
 =?utf-8?B?dnFJYjQvYndkcHJNdlh3dUNNTlgvUU5DcGNPbWYwV0gvSG14T3E3SFlSVmtK?=
 =?utf-8?B?eWF6VkduRzYxQWxBTDkxdkJZNzVtVHN0a1NoYTBMbGdFNWhwTzlzN0prako0?=
 =?utf-8?B?dEw2b2kreENrb28zMFJvSWRKczd3bGhBR2o0VmQrSEpLRW92NW1xMGhwZTNz?=
 =?utf-8?B?RjI0anJsT1BEQjVlSEJuYTl3anNHK3VFMkIyVzBYTnVEaFQyeTFVRjIyT2Ux?=
 =?utf-8?B?RDVRMXFvcXZNMURPOGNmaWFxYmVQSm9EeVJqWDVud016WndNdyt5Rk9yRmJi?=
 =?utf-8?B?bDl5KzlQdmxxU3JuUjhPTEc2enBuZ0tMWWpVd2xvamlTdGtZY1V1am1PWUFF?=
 =?utf-8?B?NmgwYmdYNDhtdFJrTHd0MHM3VXFHOXNBWGFXdzltTkJWK0ZTYUlua2VmcWpH?=
 =?utf-8?B?T2xpMXVkaStRbkwyclpvcnlCQkY4ZG5qdG9XbU5VQlFOM0ZvajNLODk1VnZM?=
 =?utf-8?B?SkdNL3ZlSzNqUDJxTnovNTFZVys0REt6Zm5KVW4weE80YkF2V0ZUVWQ3VEln?=
 =?utf-8?B?K0J6UjV4RFJaYXk2MEQ4NjBOUDZobnBZbFc3ZkswTHpzSkVzYjZ3V3JBSmN6?=
 =?utf-8?B?UU93a2RRQXMzSDBVaVFEeUJYV25BTlg5RTlnRHgwQnVwajdCTjVLWjFNLzlG?=
 =?utf-8?B?TGdOY2M0K3N1OTRuL081VFV0ZXNFTFNFY0M0TWZPcUJkNGd2ajBkQnVYaTBT?=
 =?utf-8?B?bm15NmxNSXB0dVErY2VLTXNFUjBGRWFvR1VPd2JqWG5YUkVFUG04b1hXV01y?=
 =?utf-8?B?YStIODFFNW1iUjlmazlrVUpGZHRFMVNEcE5GdU9URTFLZEZhcVF6eWlVY0E0?=
 =?utf-8?B?VDhOQXBjbzloWHA5QTIvYzN1Rlk0N3dVdVBKbG1pRXJRREJwdmlWTTNrOXhx?=
 =?utf-8?B?eDZ1SmQvRlpvWXVESEhFVDJMZDJicVJzQTcwdzBWY3ZRWjhGYXhZUkZTZlpR?=
 =?utf-8?B?NVgyWHlOd2RtQTdaZklZZHNRVjZ6OHBpOXMraXVUdk1CSXNXOG1KL2RtdXpX?=
 =?utf-8?B?cGI4cGlGakZuaVRWeEpjNkxJNjVBcFpmS0h3Mm1OUGxJa1JveWZZdjE3Mm5n?=
 =?utf-8?B?cEVIM1NSMGg0VWFZZHNHN0wyV2N2MDFnQzJpWFJPc3Jhd0ZOekdydm1xZlp5?=
 =?utf-8?B?ZGZ1dTZxczRqamdvek5XaWk5czhObm5RdEpzR3gvMlVFOFhIY2J3c1dKYWNZ?=
 =?utf-8?B?Z2dFcW9wK1piVE52NC9LN0FJTUY3ZHZHVDA2MkcyT2ZER1dTa2tpeFNLdUpw?=
 =?utf-8?B?dUtPeVV6ZGFpSFNEV3YzeFJhaHhMczhtN25HOGdIbU9SOUxUZi9IWVg3Um1i?=
 =?utf-8?B?VW1Gb01BRTMzWGpnVExQbG5Oci8vYWdvRVBHSllaYkhydUJuS29LbndZVDUw?=
 =?utf-8?B?VDBhS2t2ejVBVXNlS2tVMWN6SmlHcmRVcmJMdTVkMUR4VnVzNEFoaTBHT2JO?=
 =?utf-8?B?MU56SG50b3Rtd3VOL1lvWlNsVW9Nb3F5WUZiT0x3TVlmZmV1Y255RFdtREpF?=
 =?utf-8?B?MThxamtodmhKZGJJRlUvWjUxSTNUODgyeFVKeG5QWkFNNGF1bk0xVElWMGJl?=
 =?utf-8?B?YU5WN3FWQzdORndZdlZYaWcyRU9Vb3VvcFpQK0laY2lzR1FrY0NWNWZpa1hP?=
 =?utf-8?B?M0hWRHVkZnlBbXozaFRJQyswbUQ2ejdHdUVkbjcwVk9wMjB5Z0xOQTB0YlFE?=
 =?utf-8?B?YkdMV0pLcHRhc2YxR0VaMm1BbjlIdDd3cy9Kc0xQUitEUmFHU1lEVW81MnRB?=
 =?utf-8?B?enVRZytlT3owLy9EdWUrc2lMTHU4bjRKZHh2enphdWtuMTlUQVI4WTRFYTVL?=
 =?utf-8?B?SzRZekNaS1JPKzNXb0pIS1FHbXBGWlhSWG00NVN5L1FpSlIzYmYrT1dBMGQ1?=
 =?utf-8?Q?IqVfwpKZML3NuMPEufiFhTCHW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd11d93-247c-4006-6ca8-08dcc351962e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:57:16.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1u2bVMBau0Mfi01SO0rc50Zc6gWdm5JIZiS0hfcYxLRlY610mifPjw+1+iUHjz7PQ1YEJjrdFY1iPxlzXr7Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7271

From: Peng Fan <peng.fan@nxp.com>

The BBM module provides RTC feature. To i.MX95, this module is managed by
System Manager and exported System Control Management Interface(SCMI).
Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.

This driver is to use SCMI interface to get/set RTC.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/Kconfig          |   8 +++
 drivers/rtc/Makefile         |   1 +
 drivers/rtc/rtc-imx-sm-bbm.c | 162 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index b3469f6986e9..ea416938ad24 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1827,6 +1827,14 @@ config RTC_DRV_BBNSM
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-bbnsm".
 
+config RTC_DRV_IMX_BBM_SCMI
+	depends on IMX_SCMI_BBM_EXT || COMPILE_TEST
+	default y if ARCH_MXC
+	tristate "NXP i.MX BBM SCMI RTC support"
+	help
+	   If you say yes here you get support for the NXP i.MX BBSM SCMI
+	   RTC module.
+
 config RTC_DRV_IMX_SC
 	depends on IMX_SCU
 	depends on HAVE_ARM_SMCCC
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..8ee79cb18322 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) += rtc-hid-sensor-time.o
 obj-$(CONFIG_RTC_DRV_HYM8563)	+= rtc-hym8563.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+= rtc-imxdi.o
 obj-$(CONFIG_RTC_DRV_IMX_SC)	+= rtc-imx-sc.o
+obj-$(CONFIG_RTC_DRV_IMX_BBM_SCMI)	+= rtc-imx-sm-bbm.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+= rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+= rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+= rtc-isl1208.o
diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
new file mode 100644
index 000000000000..daa472be7c80
--- /dev/null
+++ b/drivers/rtc/rtc-imx-sm-bbm.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP.
+ */
+
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+struct scmi_imx_bbm {
+	const struct scmi_imx_bbm_proto_ops *ops;
+	struct rtc_device *rtc_dev;
+	struct scmi_protocol_handle *ph;
+	struct notifier_block nb;
+};
+
+static int scmi_imx_bbm_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	u64 val;
+	int ret;
+
+	ret = bbnsm->ops->rtc_time_get(ph, 0, &val);
+	if (ret)
+		return ret;
+
+	rtc_time64_to_tm(val, tm);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	u64 val;
+
+	val = rtc_tm_to_time64(tm);
+
+	return bbnsm->ops->rtc_time_set(ph, 0, val);
+}
+
+static int scmi_imx_bbm_alarm_irq_enable(struct device *dev, unsigned int enable)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+
+	/* scmi_imx_bbm_set_alarm enables the irq, just handle disable here */
+	if (!enable)
+		return bbnsm->ops->rtc_alarm_set(ph, 0, false, 0);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	struct scmi_protocol_handle *ph = bbnsm->ph;
+	struct rtc_time *alrm_tm = &alrm->time;
+	u64 val;
+
+	val = rtc_tm_to_time64(alrm_tm);
+
+	return bbnsm->ops->rtc_alarm_set(ph, 0, true, val);
+}
+
+static const struct rtc_class_ops smci_imx_bbm_rtc_ops = {
+	.read_time = scmi_imx_bbm_read_time,
+	.set_time = scmi_imx_bbm_set_time,
+	.set_alarm = scmi_imx_bbm_set_alarm,
+	.alarm_irq_enable = scmi_imx_bbm_alarm_irq_enable,
+};
+
+static int scmi_imx_bbm_rtc_notifier(struct notifier_block *nb, unsigned long event, void *data)
+{
+	struct scmi_imx_bbm *bbnsm = container_of(nb, struct scmi_imx_bbm, nb);
+	struct scmi_imx_bbm_notif_report *r = data;
+
+	if (r->is_rtc)
+		rtc_update_irq(bbnsm->rtc_dev, 1, RTC_AF | RTC_IRQF);
+	else
+		pr_err("Unexpected bbm event: %s\n", __func__);
+
+	return 0;
+}
+
+static int scmi_imx_bbm_rtc_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	struct device *dev = &sdev->dev;
+	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
+	int ret;
+
+	bbnsm->rtc_dev = devm_rtc_allocate_device(dev);
+	if (IS_ERR(bbnsm->rtc_dev))
+		return PTR_ERR(bbnsm->rtc_dev);
+
+	bbnsm->rtc_dev->ops = &smci_imx_bbm_rtc_ops;
+	bbnsm->rtc_dev->range_max = U32_MAX;
+
+	bbnsm->nb.notifier_call = &scmi_imx_bbm_rtc_notifier;
+	ret = handle->notify_ops->devm_event_notifier_register(sdev, SCMI_PROTOCOL_IMX_BBM,
+							       SCMI_EVENT_IMX_BBM_RTC,
+							       NULL, &bbnsm->nb);
+	if (ret)
+		return ret;
+
+	return devm_rtc_register_device(bbnsm->rtc_dev);
+}
+
+static int scmi_imx_bbm_rtc_probe(struct scmi_device *sdev)
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
+	ret = scmi_imx_bbm_rtc_init(sdev);
+	if (ret)
+		device_init_wakeup(dev, false);
+
+	return ret;
+}
+
+static const struct scmi_device_id scmi_id_table[] = {
+	{ SCMI_PROTOCOL_IMX_BBM, "imx-bbm-rtc" },
+	{ },
+};
+MODULE_DEVICE_TABLE(scmi, scmi_id_table);
+
+static struct scmi_driver scmi_imx_bbm_rtc_driver = {
+	.name = "scmi-imx-bbm-rtc",
+	.probe = scmi_imx_bbm_rtc_probe,
+	.id_table = scmi_id_table,
+};
+module_scmi_driver(scmi_imx_bbm_rtc_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("IMX SM BBM RTC driver");
+MODULE_LICENSE("GPL");

-- 
2.37.1


