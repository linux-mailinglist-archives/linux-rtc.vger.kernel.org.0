Return-Path: <linux-rtc+bounces-1373-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09AF911C2D
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B34841C23B27
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFF4167D8C;
	Fri, 21 Jun 2024 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bhLJt3dc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E28F16ABF3;
	Fri, 21 Jun 2024 06:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952951; cv=fail; b=ghFPEwxfSvNljFcD3X4IgqqmvHcY8CN5l6RnazyuiF33Bbyzds1McxqX6YhWVbKE6hQl/F8a/uv59P7+hYgpVVPvROifNpVVj3mRWEOR4+rvVTMLa8tSi2fgBBjrr7ENyVptXo6EeFIJ0sUPiNBeF2Jl5auPuLVYHHxMfOXSGWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952951; c=relaxed/simple;
	bh=3bB969yPOcno3ecKlf2KwrutqmA9MAaa51lLGASMl1U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=om82GdiKUTa5UP5CmH/vSviD6GLqEZVl+dxl091w47EYZjFLPpRbu2nhhiFoyYbEeLSOrSP6jvpDZ81M69T/VcXPwS2vil7+Ya+RdmDaLgMgO3TNfumU7HFGwy26DiJdKnMd3/Am1IlTRGHi7tEudUYTJACxJjrsi2fSQ3yQJ8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bhLJt3dc; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cY4q9Tme2fIgmoCFQ0DjD4BJVYXjp62TpQH/wTic8P5HDF4GEH4hosBZa/f0g3k1Q78ISFVX0uldC6e/yf+9/j+dRvOcdT1DNZXLdSIHjJK8drqlA1jhwhCCVHlSUwD02aylBq3uf1VWjykz1cM6UJiQhS1avVGa24qs6ziG0NJYPB0Uk9t3SibdgJ9qcySCkDSY13dxmeaoS3DtJvHW/QSIbBfdv2DKt4F50LezkIXlvj3Ehgf9lTeNZ08P1Vi6nTvIfLbCDh/sEMY/i8wXwJxQT801UitL+isPYS4vZutgtImK69T0QD5uaXZF/hIROkAeKBx4nvbw//gjEGErjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQGLNs4HQnxqPz7/aC1qwqXOzlFqEa+bgEWPkV6CXvA=;
 b=YmJn26EhmN1c7TQkvYPcUXPhsH/X8nDs+tLeuriftzrPXz6poOPMvXjWIBMp1T9J6y+mtv4rb5qxdwHZQfAN29vQHIkEI+xDA32KsZIEOGu5FZlAzC3ouNH6YHk6NPWZzUca/82PoYWbw5D/cJnkEALkeoG9+DVp6NyRtks6ccMqgMMrShALIjDmFx7fszQc2mF9ZeknVYr84sR95iwYJX8z+aSo+gskIOKrY6AgDssOUhRvgWUgjxpt1hn7XLOmCST+8bRPInw5C2VJ8PCZ7O5UwditMoEmIrEtsF7OISy7gdbLSS2xlOmmLwM8y3zzWmthKms/sOOv3FrYHBRY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQGLNs4HQnxqPz7/aC1qwqXOzlFqEa+bgEWPkV6CXvA=;
 b=bhLJt3dc4JhdZsulSRK3K9oquZDSp/OTROUYnDn0A+IIJgzrjVOFo11pec82qmuzUgoN8QA0N0RCzfhHmzNYuk5OHhuH1CNsQfBPZWBoUoFn9WwQFruGpXFp+fUmS7RlqRNxakzCN8EUGX81+CQ/WHwYN7g4h28WMNYJXj4vQZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:55:43 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 06:55:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 21 Jun 2024 15:04:36 +0800
Subject: [PATCH v5 1/7] Documentation: firmware-guide: add NXP i.MX95 SCMI
 documentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718953487; l=56444;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ilYt43w3dYjk0YVi2cKAhfSqVWMt8gQT2yqQJN+Lc+8=;
 b=n+EtoWnQ3X9P9yGTEqGHEPCgzd+McAVU7MRmYaJojZxYQeNbCc+XnW7R87NoQfFIr+88poPdX
 q1mb0NofSSKAZkV4148v+VJ9sJXH2dd38X//+NHbtoMqSujAGb7ME2H
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
X-MS-Office365-Filtering-Correlation-Id: 8d2ec44b-1632-4eee-f5f0-08dc91bf2b67
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|921017|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0tOUGFtVEZuMG5qYkUyMmJJZzNKb2I5U085dzlJOWZRbExqS3Q3SDlvSmU1?=
 =?utf-8?B?SGJER3YyNWJWdGNSUWVPQXQySkJPV1dFNjI0WkhheXl2V2FDRkdHNnI5SC9X?=
 =?utf-8?B?dSs1WHBvQnA3NHlMcDdnSGxBWUp4Y0oyUVpFczhnNFhJV2tQNG1JNGwyYkhm?=
 =?utf-8?B?bnNDNW5EaGdqb2xFVi95b01qWkVuR1NFeGtMTUovbndwWTlsNkRlUnVFRDZ1?=
 =?utf-8?B?M0lpMUQrdkgzQm9jVjY5K0tzaDVzUmZUTHZBWFdqbzAveXhwZHpGNXp3eTRR?=
 =?utf-8?B?alZKUjlOcXRxemtDWEFHcmg0bkpib2psdUw0R25lNzAxcHFBYXRHdmtYK3ht?=
 =?utf-8?B?OXJaZ1E3RWo0eks3S3ZGT3JmNitKQ3lNbEgzc3ZlY1hyQ1NYVG5Kdnp1TWgv?=
 =?utf-8?B?Sm9uS0JBR1lSNmY3NTliYjhDazBmei93YjQxVHhUZHNZRXZzQmhPRGp6MjdU?=
 =?utf-8?B?ZHhLWnc1Kzl5ZkY3M1hUcG56STB5MnN4YnVLREk2aC91dkR6WHBlSmZjY2xV?=
 =?utf-8?B?ZEM3MUlNWDc0SzYyelNQb1dZdTk1YUNJWmVkZnNFb3lvWHlHWVRHRUc3U1oz?=
 =?utf-8?B?YVlRa3BGWHdZQlZEL09Rc1lmeVdMckhzNDZyNEZGWGQwNmdBOWZ5Sld6azQ1?=
 =?utf-8?B?eE5HVElwalpqZ1hDbkQxRS9UbjRVUk00N0dYRUNLNWo3YjJqZnNOVkNLbXQ1?=
 =?utf-8?B?R0xHWUFMR0pDSnhYSzlVK1I1K1VTVFY5YXFDR3pHeUpjcThjOUZqVUNUcjFj?=
 =?utf-8?B?TzJ5Q0VJS2xIVEtJTDdaQ1ZYRVRIMzNYazc4LzhwUlVvU0FVVEN2TUUrc2VL?=
 =?utf-8?B?TmRTQzJoNUxzbWZiRTg2RHdpaTdoSmE0WGo1aXVnV0pLSWRFNlZYMWdLQ3hh?=
 =?utf-8?B?cmoxMFNSQyswcFpmWnNaL1ZvazY5VnJTVVBYaHpvT2FwMW9IUDZEclBlcWlY?=
 =?utf-8?B?N0lDV2tSYk1xZUlIZXlOc1YzVU8xSEZXWWhkTnNmTXpJUlBBdjFnbCtTYzVS?=
 =?utf-8?B?dlVGaUQ5QkVPeFlSQXI2RUIvanNUQUpPQTU3RmVaSzByYzdCdlZLVWY5dnFq?=
 =?utf-8?B?alRaZ0w3eS9zQXRKbkVWdDJ2VmV0Q0pGSEo2TzFUSmtZd1hCUmw1ZVppejdw?=
 =?utf-8?B?OEllS0pZckEzVW4wdi9sdHlScEJ2ejdxZzFXUmgwRDZtekwwTGZGbUdJR21I?=
 =?utf-8?B?cVJvMngzbkNTdG4zYldkOWFMMXo1cDhqaW1DbGFGRWEzc1gvVEN6N0V4YkVw?=
 =?utf-8?B?SzZxYTBZb0JJTXgvb3FadERPQ21zeU1rOWNNcWZzakZRRmp6QnEvYmhvV1Ur?=
 =?utf-8?B?T0tQcFRsOUtqcmo5UlBCYkowcHROeXBPSFFabFNpd0JYb1g4UU55UU51VmJU?=
 =?utf-8?B?NzBxVDQvYmJuMzdTNkN6VVlSYXYzUCtueEZ3YU5KVXBoNTlhNndUQzV3dTFl?=
 =?utf-8?B?TlBQWHFaNFNpR29wcGo4bWJxR0oveC9KNm5OWlJwb1RnUW5qR3ZPOVQ0bGVn?=
 =?utf-8?B?M09uc0gxMEM4OE9mYnZxTitwMldHN3h4NG1SMDMzQnlXSU9hU0x6a0pqeVha?=
 =?utf-8?B?TExJNm5BS1MxeTIvTm05UnNwbTFwU0JPOVZZVjVjZnNKVURoKzZhMFdiSUR2?=
 =?utf-8?B?TFdheGxJWiswTGJIQ1NsTEhGdkdobzdZSTlQb3ZRcnRXU0lzQnovdjhwN3Rn?=
 =?utf-8?B?QlZBNkVYWGFEMFJJQUVaUzJKQ2szK1cyTWtPZGMrWWdQc25HSVkvTml2V1E3?=
 =?utf-8?B?bjA1M1ROK3M5cDFKUGQ2K1hma0Jjbm9SS1dmSDNNOUs0V3RQZEwwR2Y5RlhY?=
 =?utf-8?B?VXpiUFBUeHZ2YWZ6d1Bic1RTcWlYbG51c3JVbkN0aGU1Zm5rV3cvcWo4RWFL?=
 =?utf-8?Q?d2n0iP71sLDAF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(921017)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXFOZlBXNDVDUG8raUlwMHFsMU8yZ25ONStTU0lidzZtbU5mUk9TWEZMakxG?=
 =?utf-8?B?OXRIN1orL2JQY2R5ellDZUVLNEhUYmhWVjA1TTUwanVXOXE1MVovNXQrSW1D?=
 =?utf-8?B?TFlqa1JjN3RsZnQvaytxYmQzMnhiVHBuWDRPMUxtYUR4ZHlrVi9LdHNZVmkw?=
 =?utf-8?B?WnRmR1NvbWNjVkhoem82NFk5eXBTR01Rd251RkZCbXRUS3NQSmovOUh0di9E?=
 =?utf-8?B?UjE3VXJ6Y0g5T0FKQU1mMzM2cUV0VjE0bW9IWU12ZjBUOStvaG5UeEV4M3U1?=
 =?utf-8?B?MncyU3Z6VW9LRHVzM2ZWWHFSYjVCeWRjOXFuemJrbjQxa0YxT3BLTTJTa0ta?=
 =?utf-8?B?eENNRTM2V3dMNENUV1RsM0JuVFdIZWppYzhvS3ZPUW9rb21LWGxDNkczdEdJ?=
 =?utf-8?B?bU1jSUdnRDF5NjJaRTg1RVFOTVY5enE4MDBuWGpTSUhhOHVTMXlyQ1psT2lQ?=
 =?utf-8?B?bjFyQXRSNnJJSmxNN1BzajNVQ2xDWXFXRXVzdHdjSkJFaFZWZzFDcW1JV1Z1?=
 =?utf-8?B?dVRCdjJrajdRZnNaT3lZVGNyL1doNTNqSkRJMHQyRXVjUGJubXRuK1cwMk9s?=
 =?utf-8?B?WWVLWExldmY4S1Z2bUZrY25ZVlIyZmpxOVpkeHNJcDg2QWNXSTNkRVNsN1Jr?=
 =?utf-8?B?WFdvVHk5TlY2VEZkRjFZTnQ2aDJZNXpPNUQ4VC9uUWFGYWpxTVdSS1BVNGtC?=
 =?utf-8?B?ODZvOGtJWXVkdTdaUGZGdkE1czFFaEErdVEzbm5lRnc4WTNjZWxHa3lENUdR?=
 =?utf-8?B?R0docG9RZEU3MFhFU1ZhaDN3c2g5M09zM0Y3WVFkdHVYU0VtcGhhdXJoM1No?=
 =?utf-8?B?MWxQdzZCYlIvdWhGR1R6WkFxNVZ1a20vd3JyYk1tTkV6U3JSbEdlSWdSclE1?=
 =?utf-8?B?bHIrWjFxa2lyZVowR1EyNmxmcUR6ZUU0TXJPUXV0YlpjempQUHFnTjl4VHNO?=
 =?utf-8?B?WWhmaWRndHB4b1RFeWRUMkUvMER6NGJCS0pybG1BVHZ4c2R1b2dUNUh1NEhw?=
 =?utf-8?B?VjR3RU92cFdCVmpnMEwxRnlWUjlOd00yYjloQjRNQ3pGc2NwZFNudjByUmMv?=
 =?utf-8?B?eTBpeElIOGp3Q21abVh3RTFLbk8rMXhhN1FERHhQMThMRUpNaEJnMGYrVTFP?=
 =?utf-8?B?VFZPbmxFZ2hKdEpNMTJ5SzBpYTBXQXgwTFpXMXNraDQzbWhiVWJYOHBjK1k1?=
 =?utf-8?B?Z01oVFU5YmxOWHVoa0ZwUkN3aS9lZ1pEQzgwejVYa3psaCs3V2xIL2tBUEN1?=
 =?utf-8?B?VW52eUx0ZHljQnMzTUQ4TTljanQ4eHIrTHhrNTR3QWQ3cXF2THQ0T0hXSWNX?=
 =?utf-8?B?dHU3U2ViaDhTWEZleDRpTHkvdk1RYnFiVGhxdEM5bzM4RkZSQ0NmdEFoRFI1?=
 =?utf-8?B?ckJ2ME9YWXE4MXRoOHB2UDJWNHg1RmZOQkd6Vmp4MFIxcS9WUmg3emJWOG1E?=
 =?utf-8?B?bnJrZTVLVDh0THZyeHRLbXNiNGlXZWpLc0V0V2g1ZFdETmtvQVVMQ0pNRldt?=
 =?utf-8?B?dS9pWlRyWDFtY0FZTjhwVnd4eEo2dFRGc09lTGowMzRKOCszakhTS2hoUGZ2?=
 =?utf-8?B?TmpvcVNzOFBUOGRvOVMrWDN3UkwzSE8zY0toeWdORURNcVZDNjNtRFFiZi93?=
 =?utf-8?B?QU1uYyswTEhZNE9sK1FScjJ4RmVwZHhUWVZzQitraEk2UWRIeHIyOVJzVmww?=
 =?utf-8?B?MWkrQ0dFM2ZFdDF0cGFDVC9nOWx3RHBXb05hMzB4a0N0d0VVendFNXUzQmRD?=
 =?utf-8?B?QmorVC9PeXZWYVNJZVJITDNQMHRrZzBhRjcwZGRGcDZSRWpXUE1aVVNLdFBT?=
 =?utf-8?B?TVRsN0V1NzVWaXFEU043c1pnUGRoSDNzamgzd0NkdW1lUnFPMHZKQUFhM2w5?=
 =?utf-8?B?V1FJQXdXRlI5WWpUMGNzTEJTaHhia3RtOHdnZFRaUUdrdWhUMCt6ekQ5T05Y?=
 =?utf-8?B?d0ZvSlRuU21yWGVZRHRXQ3BXeGRNUXBBUEtKY0hhbmJzbHU1RFpwaGo3N1dt?=
 =?utf-8?B?c293aGRUZkRDSjZTRlc5RUgzTi8vcHFuL2lNN0w1M3ppQ0NLd1ZTOHNWdG5a?=
 =?utf-8?B?OXhaZ0x3S0lYeWN4WStuNE1JMmd5WFhhTWs0cTBPVG9XNUdCNElmSXRoT1Vs?=
 =?utf-8?Q?T79xn/giG2LBOakk86i2srKS3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2ec44b-1632-4eee-f5f0-08dc91bf2b67
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:55:43.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNkic7TaWjIGcwYkaip2z9r28NnZNMY6XzdqWpeiesFtLhqGTpQ5IP4XwgnX9kWDPiPQ+NoOs1QP7L6E83hFow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

From: Peng Fan <peng.fan@nxp.com>

Add NXP i.MX95 System Control Management Interface(SCMI) vendor
extensions protocol documentation.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/firmware-guide/index.rst          |  10 +
 Documentation/firmware-guide/nxp/imx95-scmi.rst | 887 ++++++++++++++++++++++++
 Documentation/firmware-guide/nxp/index.rst      |  10 +
 3 files changed, 907 insertions(+)

diff --git a/Documentation/firmware-guide/index.rst b/Documentation/firmware-guide/index.rst
index 5355784ca0a2..8f66ae31337e 100644
--- a/Documentation/firmware-guide/index.rst
+++ b/Documentation/firmware-guide/index.rst
@@ -4,6 +4,9 @@
 The Linux kernel firmware guide
 ===============================
 
+ACPI subsystem
+==============
+
 This section describes the ACPI subsystem in Linux from firmware perspective.
 
 .. toctree::
@@ -11,3 +14,10 @@ This section describes the ACPI subsystem in Linux from firmware perspective.
 
    acpi/index
 
+NXP firmware
+============
+
+.. toctree::
+   :maxdepth: 1
+
+   nxp/index
diff --git a/Documentation/firmware-guide/nxp/imx95-scmi.rst b/Documentation/firmware-guide/nxp/imx95-scmi.rst
new file mode 100644
index 000000000000..03ee81978f65
--- /dev/null
+++ b/Documentation/firmware-guide/nxp/imx95-scmi.rst
@@ -0,0 +1,887 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+===============================================================================
+i.MX95 System Control and Management Interface(SCMI) Vendor Protocols Extension
+===============================================================================
+
+:Copyright: |copy| 2024 NXP
+
+:Author: Peng Fan <peng.fan@nxp.com>
+
+The System Manager (SM) is a low-level system function which runs on a System
+Control Processor (SCP) to support isolation and management of power domains,
+clocks, resets, sensors, pins, etc. on complex application processors. It often
+runs on a Cortex-M processor and provides an abstraction to many of the
+underlying features of the hardware. The primary purpose of the SM is to allow
+isolation between software running on different cores in the SoC. It does this
+by having exclusive access to critical resources such as those controlling
+power, clocks, reset, PMIC, etc. and then providing an RPC interface to those
+clients. This allows the SM to provide access control, arbitration, and
+aggregation policies for those shared critical resources.
+
+SM introduces a concept Logic Machine(LM) which is analogous to VM and each has
+its own instance of SCMI. All normal SCMI calls only apply to that LM. That
+includes boot, shutdown, reset, suspend, wake, etc. Each LM (e.g. A55 and M7)
+are completely isolated from the others and each LM has its own communication
+channels talking to the same SCMI server.
+
+This document covers all the information necessary to understand, maintain,
+port, and deploy the SM on supported processors.
+
+The SM implements an interface compliant with the Arm SCMI Specification
+with additional vendor specific extensions.
+
+SCMI_BBM: System Control and Management BBM Vendor Protocol
+==============================================================
+
+This protocol is intended provide access to the battery-backed module. This
+contains persistent storage (GPR), an RTC, and the ON/OFF button. The protocol
+can also provide access to similar functions implemented via external board
+components. The BBM protocol provides functions to:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Read/write GPR
+- Discover the RTCs available in the system.
+- Read/write the RTC time in seconds and ticks
+- Set an alarm (per LM) in seconds
+- Get notifications on RTC update, alarm, or rollover.
+- Get notification on ON/OFF button activity.
+
+For most SoC, there is one on-chip RTC (e.g. in BBNSM) and this is RTC ID 0.
+Board code can add additional GPR and RTC.
+
+GPR are not aggregated. The RTC time is also not aggregated. Setting these
+sets for all so normally exclusive access would be granted to one agent for
+each. However, RTC alarms are maintained for each LM and the hardware is
+programmed with the next nearest alarm time. So only one agent in an LM should
+be given access rights to set an RTC alarm.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes | Bits[31:8] Number of RTCs.                                |
+|                  | Bits[15:0] Number of persistent storage (GPR) words.      |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x81
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific function in the  |
+|                  |protocol. For all functions in this protocol, this         |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+BBM_GPR_SET
+~~~~~~~~~~~
+
+message_id: 0x3
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of GPR to write                                      |
++------------------+-----------------------------------------------------------+
+|uint32 value      |32-bit value to write to the GPR                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the GPR was successfully written.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to write     |
+|                  |the specified GPR                                          |
++------------------+-----------------------------------------------------------+
+
+BBM_GPR_GET
+~~~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of GPR to read                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the GPR was successfully read.                 |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to read      |
+|                  |the specified GPR.                                         |
++------------------+-----------------------------------------------------------+
+|uint32 value      |32-bit value read from the GPR                             |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: returned the attributes.                          |
+|                  |NOT_FOUND: Index is invalid.                               |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bit[31:24] Bit width of RTC seconds.                       |
+|                  |Bit[23:16] Bit width of RTC ticks.                         |
+|                  |Bits[15:0] RTC ticks per second                            |
++------------------+-----------------------------------------------------------+
+|uint8 name[16]    |Null-terminated ASCII string of up to 16 bytes in length   |
+|                  |describing the RTC name                                    |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_TIME_SET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x6
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC time format:                                    |
+|                  |Set to 1 if the time is in ticks.                          |
+|                  |Set to 0 if the time is in seconds                         |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds/ticks.    |
+|                  |Upper word: Upper 32 bits of the time in seconds/ticks.    |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully set.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |INVALID_PARAMETERS: time is not valid                      |
+|                  |(beyond the range of the RTC).                             |
+|                  |DENIED: the agent does not have permission to set the RTC. |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_TIME_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x7
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC time format:                                    |
+|                  |Set to 1 if the time is in ticks.                          |
+|                  |Set to 0 if the time is in seconds                         |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully get.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds/ticks.    |
+|                  |Upper word: Upper 32 bits of the time in seconds/ticks.    |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_ALARM_SET
+~~~~~~~~~~~~~~~~~
+
+message_id: 0x8
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] RTC enable flag:                                    |
+|                  |Set to 1 if the RTC alarm should be enabled.               |
+|                  |Set to 0 if the RTC alarm should be disabled               |
++------------------+-----------------------------------------------------------+
+|uint32 time[2]    |Lower word: Lower 32 bits of the time in seconds.          |
+|                  |Upper word: Upper 32 bits of the time in seconds.          |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: RTC time was successfully set.                    |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |INVALID_PARAMETERS: time is not valid                      |
+|                  |(beyond the range of the RTC).                             |
+|                  |DENIED: the agent does not have permission to set the RTC  |
+|                  |alarm                                                      |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_GET
+~~~~~~~~~~~~~~
+
+message_id: 0x9
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the button status was read.                    |
+|                  |Other value: ARM SCMI Specification status code definitions|
++------------------+-----------------------------------------------------------+
+|uint32 state      |State of the ON/OFF button. 1: ON, 0: OFF                  |
++------------------+-----------------------------------------------------------+
+
+BBM_RTC_NOTIFY
+~~~~~~~~~~~~~~
+
+message_id: 0xA
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of RTC                                               |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags                                         |
+|                  |Bits[31:3] Reserved, must be zero.                         |
+|                  |Bit[2] Update enable:                                      |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[1] Rollover enable:                                    |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification.                               |
+|                  |Bit[0] Alarm enable:                                       |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification                                |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |NOT_FOUND: rtcId pertains to a non-existent RTC.           |
+|                  |DENIED: the agent does not have permission to request RTC  |
+|                  |notifications.                                             |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_NOTIFY
+~~~~~~~~~~~~~~~~~
+
+message_id: 0xB
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags                                         |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Enable button:                                      |
+|                  |Set to 1 to send notification.                             |
+|                  |Set to 0 if no notification                                |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |DENIED: the agent does not have permission to request      |
+|                  |button notifications.                                      |
++------------------+-----------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x81
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
+Notifications
+_____________
+
+BBM_RTC_EVENT
+~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |RTC events:                                                |
+|                  |Bits[31:2] Reserved, must be zero.                         |
+|                  |Bit[1] RTC rollover notification:                          |
+|                  |1 RTC rollover detected.                                   |
+|                  |0 no RTC rollover detected.                                |
+|                  |Bit[0] RTC alarm notification:                             |
+|                  |1 RTC alarm generated.                                     |
+|                  |0 no RTC alarm generated.                                  |
++------------------+-----------------------------------------------------------+
+
+BBM_BUTTON_EVENT
+~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |RTC events:                                                |
++------------------+-----------------------------------------------------------+
+|                  |Button events:                                             |
+|                  |Bits[31:1] Reserved, must be zero.                         |
+|                  |Bit[0] Button notification:                                |
+|                  |1 button change detected.                                  |
+|                  |0 no button change detected.                               |
++------------------+-----------------------------------------------------------+
+
+SCMI_MISC: System Control and Management MISC Vendor Protocol
+================================================================
+
+Provides miscellaneous functions. This includes controls that are miscellaneous
+settings/actions that must be exposed from the SM to agents. They are device
+specific and are usually define to access bit fields in various mix block
+control modules, IOMUX_GPR, and other GPR/CSR owned by the SM. This protocol
+supports the following functions:
+
+- Describe the protocol version.
+- Discover implementation attributes.
+- Set/Get a control.
+- Initiate an action on a control.
+- Obtain platform (i.e. SM) build information.
+- Obtain ROM passover data.
+- Read boot/shutdown/reset information for the LM or the system.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x84
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   | See ARM SCMI Specification for status code definitions.      |
++---------------+--------------------------------------------------------------+
+|uint32 version | For this revision of the specification, this value must be   |
+|               | 0x10000.                                                     |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      | See ARM SCMI Specification for status code definitions.   |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Protocol attributes:                                       |
+|                  |Bits[31:24] Reserved, must be zero.                        |
+|                  |Bits[23:16] Number of reset reasons.                       |
+|                  |Bits[15:0] Number of controls                              |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: in case the message is implemented and available  |
+|                  |to use.                                                    |
+|                  |NOT_FOUND: if the message identified by message_id is      |
+|                  |invalid or not implemented                                 |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Flags that are associated with a specific function in the  |
+|                  |protocol. For all functions in this protocol, this         |
+|                  |parameter has a value of 0                                 |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_SET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x3
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the value data in words                            |
++------------------+-----------------------------------------------------------+
+|uint32 val[8]     |value data array                                           |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the control was set successfully.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to set the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0x4
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the control was get successfully.              |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to get the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the return data in words, max 8                    |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|val[0, num - 8]   |value data array                                           |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_ACTION
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x5
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of the control                                       |
++------------------+-----------------------------------------------------------+
+|uint32 action	   |Action for the control                                     |
++------------------+-----------------------------------------------------------+
+|uint32 numarg	   |Size of the argument data, max 8                           |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|arg[0, numarg -1] |Argument data array                                        |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the action was set successfully.               |
+|                  |NOT_FOUND: if the index is not valid.                      |
+|                  |DENIED: if the agent does not have permission to get the   |
+|                  |control                                                    |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the return data in words, max 8                    |
++------------------+-----------------------------------------------------------+
+|uint32            |                                                           |
+|val[0:num-1]      |value data array                                           |
++------------------+-----------------------------------------------------------+
+
+MISC_DISCOVER_BUILD_INFO
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+This function is used to obtain the build commit, data, time, number.
+
+message_id: 0x6
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the build info was got successfully.           |
+|                  |NOT_SUPPORTED: if the data is not available.               |
++------------------+-----------------------------------------------------------+
+|uint32 buildnum   |Build number                                               |
++------------------+-----------------------------------------------------------+
+|uint32 buildcommit|Most significant 32 bits of the git commit hash            |
++------------------+-----------------------------------------------------------+
+|uint8 date[16]    |Date of build. Null terminated ASCII string of up to 16    |
+|                  |bytes in length                                            |
++------------------+-----------------------------------------------------------+
+|uint8 time[16]    |Time of build. Null terminated ASCII string of up to 16    |
+|                  |bytes in length                                            |
++------------------+-----------------------------------------------------------+
+
+MISC_ROM_PASSOVER_GET
+~~~~~~~~~~~~~~~~~~~~~
+
+ROM passover data is information exported by ROM and could be used by others.
+It includes boot device, instance, type, mode and etc. This function is used
+to obtain the ROM passover data. The returned block of words is structured as
+defined in the ROM passover section in the SoC RM.
+
+message_id: 0x7
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the data was got successfully.                 |
+|                  |NOT_SUPPORTED: if the data is not available.               |
++------------------+-----------------------------------------------------------+
+|uint32 num        |Size of the passover data in words, max 13                 |
++------------------+-----------------------------------------------------------+
+|uint32_t          |                                                           |
+|data[0:num-1]     |Passover data array                                        |
++------------------+-----------------------------------------------------------+
+
+MISC_CONTROL_NOTIFY
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x8
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 index      |Index of control                                           |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Notification flags, varies by control                      |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: notification configuration was successfully       |
+|                  |updated.                                                   |
+|                  |NOT_FOUND: control id not exists.                          |
+|                  |INVALID_PARAMETERS: if the input attributes flag specifies |
+|                  |unsupported or invalid configurations..                    |
+|                  |DENIED: if the calling agent is not permitted to request   |
+|                  |the notification.                                          |
++------------------+-----------------------------------------------------------+
+
+MISC_RESET_REASON_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x9
+protocol_id: 0x84
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 reasonid   |Identifier for the reason                                  |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if valid reason attributes are returned           |
+|                  |NOT_FOUND: if reasonId pertains to a non-existent reason.  |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Reason attributes. This parameter has the following        |
+|                  |format: Bits[31:0] Reserved, must be zero                  |
+|                  |Bits[15:0] Number of persistent storage (GPR) words.       |
++------------------+-----------------------------------------------------------+
+|uint8 name[16]    |Null-terminated ASCII string of up to 16 bytes in length   |
+|                  |describing the reason                                      |
++------------------+-----------------------------------------------------------+
+
+MISC_RESET_REASON_GET
+~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0xA
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 flags        |Reason flags. This parameter has the following format:   |
+|                    |Bits[31:1] Reserved, must be zero.                       |
+|                    |Bit[0] System:                                           |
+|                    |Set to 1 to return the system reason.                    |
+|                    |Set to 0 to return the LM reason                         |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: reset reason return                             |
++--------------------+---------------------------------------------------------+
+|uint32 bootflags    |Boot reason flags. This parameter has the format:        |
+|                    |Bits[31] Valid.                                          |
+|                    |Set to 1 if the entire reason is valid.                  |
+|                    |Set to 0 if the entire reason is not valid.              |
+|                    |Bits[30:29] Reserved, must be zero.                      |
+|                    |Bit[28] Valid origin:                                    |
+|                    |Set to 1 if the origin field is valid.                   |
+|                    |Set to 0 if the origin field is not valid.               |
+|                    |Bits[27:24] Origin.                                      |
+|                    |Bit[23] Valid err ID:                                    |
+|                    |Set to 1 if the error ID field is valid.                 |
+|                    |Set to 0 if the error ID field is not valid.             |
+|                    |Bits[22:8] Error ID.                                     |
+|                    |Bit[7:0] Reason                                          |
++--------------------+---------------------------------------------------------+
+|uint32 shutdownflags|Shutdown reason flags. This parameter has the format:    |
+|                    |Bits[31] Valid.                                          |
+|                    |Set to 1 if the entire reason is valid.                  |
+|                    |Set to 0 if the entire reason is not valid.              |
+|                    |Bits[30:29] Number of valid extended info words.         |
+|                    |Bit[28] Valid origin:                                    |
+|                    |Set to 1 if the origin field is valid.                   |
+|                    |Set to 0 if the origin field is not valid.               |
+|                    |Bits[27:24] Origin.                                      |
+|                    |Bit[23] Valid err ID:                                    |
+|                    |Set to 1 if the error ID field is valid.                 |
+|                    |Set to 0 if the error ID field is not valid.             |
+|                    |Bits[22:8] Error ID.                                     |
+|                    |Bit[7:0] Reason                                          |
++--------------------+---------------------------------------------------------+
+|uint32 extinfo[8]   |Array of extended info words                             |
++--------------------+---------------------------------------------------------+
+
+MISC_SI_INFO_GET
+~~~~~~~~~~~~~~~~
+
+message_id: 0xB
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: silicon info return                             |
++--------------------+---------------------------------------------------------+
+|uint32 deviceid     |Silicon specific device ID                               |
++--------------------+---------------------------------------------------------+
+|uint32 sirev        |Silicon specific revision                                |
++--------------------+---------------------------------------------------------+
+|uint32 partnum      |Silicon specific part number                             |
++--------------------+---------------------------------------------------------+
+|uint8 siname[16]    |Silicon name/revision. Null terminated ASCII string of up|
+|                    |to 16 bytes in length                                    |
++--------------------+---------------------------------------------------------+
+
+MISC_CFG_INFO_GET
+~~~~~~~~~~~~~~~~~
+
+message_id: 0xC
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: config name return                              |
+|                    |NOT_SUPPORTED: name not available                        |
++--------------------+---------------------------------------------------------+
+|uint32 msel         |Mode selector value                                      |
++--------------------+---------------------------------------------------------+
+|uint8 cfgname[16]   |config file basename. Null terminated ASCII string of up |
+|                    |to 16 bytes in length                                    |
++--------------------+---------------------------------------------------------+
+
+MISC_SYSLOG_GET
+~~~~~~~~~~~~~~~
+
+message_id: 0xD
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 flags        |Device specific flags that might impact the data returned|
+|                    |or clearing of the data                                  |
++--------------------+---------------------------------------------------------+
+|uint32 logindex     |Index to the first log word. Will be the first element in|
+|                    |the return array                                         |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: system log return                               |
++--------------------+---------------------------------------------------------+
+|uint32 numLogflags  |Descriptor for the log data returned by this call.       |
+|                    |Bits[31:20] Number of remaining log words.               |
+|                    |Bits[15:12] Reserved, must be zero.                      |
+|                    |Bits[11:0] Number of log words that are returned by this |
+|                    |call                                                     |
++--------------------+---------------------------------------------------------+
+|uint32 syslog[N]    |Log data array, N is defined in bits[11:0] of numLogflags|
++--------------------+---------------------------------------------------------+
+
+NEGOTIATE_PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x84
+
++--------------------+---------------------------------------------------------+
+|Parameters                                                                    |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|uint32 version      |The negotiated protocol version the agent intends to use |
++--------------------+---------------------------------------------------------+
+|Return values                                                                 |
++--------------------+---------------------------------------------------------+
+|Name                |Description                                              |
++--------------------+---------------------------------------------------------+
+|int32 status        |SUCCESS: if the negotiated protocol version is supported |
+|                    |by the platform. All commands, responses, and            |
+|                    |notifications post successful return of this command must|
+|                    |comply with the negotiated version.                      |
+|                    |NOT_SUPPORTED: if the protocol version is not supported. |
++--------------------+---------------------------------------------------------+
+
+Notifications
+_____________
+
+MISC_CONTROL_EVENT
+~~~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x81
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ctrlid     |Identifier for the control that caused the event.          |
++------------------+-----------------------------------------------------------+
+|uint32 flags      |Event flags, varies by control.                            |
++------------------+-----------------------------------------------------------+
+
diff --git a/Documentation/firmware-guide/nxp/index.rst b/Documentation/firmware-guide/nxp/index.rst
new file mode 100644
index 000000000000..b38c980a50c6
--- /dev/null
+++ b/Documentation/firmware-guide/nxp/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================
+NXP Firmware Support
+====================
+
+.. toctree::
+   :maxdepth: 1
+
+   imx95-scmi

-- 
2.37.1


