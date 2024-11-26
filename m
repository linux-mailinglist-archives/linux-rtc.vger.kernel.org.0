Return-Path: <linux-rtc+bounces-2629-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E008A9D967B
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A137028996A
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4EF1CF2A2;
	Tue, 26 Nov 2024 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X6S6ciHD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124EA1CEE8F;
	Tue, 26 Nov 2024 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621802; cv=fail; b=t9vGhV/2uIKL7CM6sXVrvqcOtsL6Zi7wE1lppIOm/zkidqmt6JuOehuIyjEp/eVJCn+VLnKhNXlel62fhd4JS1pIeD58gUi1NoeICRb1ngijUIOuK1Lk7oVGtV/pbNtaQ5hyrGRiRce5fOBmZkoaCxT7jjjx/oaGXEQNhPGZyqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621802; c=relaxed/simple;
	bh=wVzklaZqxFnGmbOFYfFRik23OPV6ZB+ed3Afi8bLujw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=as+lOKzXeNFC6ywmNwsiDXCBjKAvm3H+MOODlZGzJS1olDnTisgX/4jFm/ChbTOL+/RlSj4zQq3rG220UQbDdaTP9HkTL6t57nJIb3G9eoA6WPaXd7d4o8Idj0+yst9DQYsKJDT/G97+HnEZrarNEKdalHDJhiLlo06pX/rwCHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X6S6ciHD; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CA5HLPcyxy7rQWxpn6Od8UotQ6VOuvpPlKhcMaeqFCyBX+vNZCunig4Gprq0GEuI8VowEypD30dDmGsgDkvxmt3hVLm3VrOIGQv9ku0u9GcqIrNg/hf6lwNfk2mANYp6zl3tZ8rUx0pMlnTlbIpdo0FFLWKuVJGZIXhQ4A91wQJaGLkV/juIYtwaUN7y2O7R+SImeSSKnySXzxs30bSjJwIYyxe1XfSy0QqT8C0FA8uh4DWhMJOCm7jsVGXgEe4lGtTw7YWzSvIm1AxI4T8W9l/ZSO+mv8z46FntP2goZaybzd7Kd7zXhKT9XzH3CL++a6gG1A8Rqr8ykjlFVsMOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+R7wP6R9b6lDW31um6QH87ONDJmf3E1rDYEj0MsL8Y=;
 b=wajVS1bcjjZaABF6burCnr2sciOlHWmxFVkn9zc8YUyWLFLe5dy1A7IOuOL2CtvrjweS1YfZrRZ1ppQH0S2rivn4zGwSdSHhjceTdTI/H3yTnlRhMcG3/GgWMQ0lvWTq22QKRjCMk2EMWuKsqRECIR6fP2GWZSRPXgosXg9TvHHX5+rJ20UC/1sAzaBmEYfQsxWjJ5Wap89BfjQpsd4Th4/aVNQVu3ZRl8NbNLiFIiVeYzjuGfGdwC/DpYunSeizKmxkMFjKqwjZO02+vFzh6r9/pOkjda8oPwdz6LpWOtCFsdsVr+wS6Qni1cPo3T3rSM5m4d5rKQcbxeJhLxADqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+R7wP6R9b6lDW31um6QH87ONDJmf3E1rDYEj0MsL8Y=;
 b=X6S6ciHD2KaaSHKUcSJkMwC4WkY1w5fbCeeS7QF9lGjAnKFxyr6DSfhz2ZJVUBeFMB+eVODFqUpMAFdm9vDBiLzDqTJVmtkZ+MJSJFP5yzHgWFfC3MP1ickGLrJNwkspD2kDw2JxjRzVhHqksyQdytAwUuNSZCXaZI8Z4n9FvJnN197o5qe+0t4YcEXHlSJqmmEX6KrvfRWiXXATdX/+vvMo3EYG3P1ZriKxzqJzIA3ejrPI6bDqdA9RJqE6UXBxIMCo/lNMK37FYL8ssrcDDFRkhJpMo9pckHr9iOy0mdVNptklcdISJ3Uac4cYFGakB2jLvW19TYlw+K2t4XUvyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:49:56 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:49:56 +0000
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
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v5 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Tue, 26 Nov 2024 13:49:37 +0200
Message-ID: <20241126114940.421143-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::11)
 To DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 77981373-6171-4a75-6dce-08dd0e10729d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2RFRHl3VUpFY2sxdTFOZ0IrTUtjY2YvNC9STDhBR1pvQ2Mwb3RmZU4vWFhK?=
 =?utf-8?B?K015NktLUXBJQ3FnKzJpWXpjclRtMjdjb3JBNElYTUVnSFlrK2lHU1F3djcw?=
 =?utf-8?B?MnlUWUxFbkdMS0lnWDZoa1ErK1dYdUdHSmFUUXZvNEdhUGZ2eVJ2QkYrTFFl?=
 =?utf-8?B?VTF3WXVYVVFUMW1QcjBJQmF6WTE0aWx4ZHF3REdlMk1FN08zbnkxZldBOFBi?=
 =?utf-8?B?TnJ5Mkt6Mm4xb0wzVjFaUWREdkRDemIvTVZhcFNlZ1NGSk5iRzlJYU96cHBM?=
 =?utf-8?B?Lyt6WjZjc3dCWDU2RkFoODI5U0Fnb3NqKzduOU9TVU9rVldUb1RKMjJQdHRm?=
 =?utf-8?B?QUxFWDVxREdDazB4YWJLSVZBRmJZS1pxM3U5S2VBRithRW9HK3hDWHo3OHZt?=
 =?utf-8?B?T1IzcWlKY3A3bHBERHc5RFh4K2lTWFByUmx1dU9NYUo1RGVtUHI0WXhZNlIz?=
 =?utf-8?B?VDQycnB5T3lEYy93L2NKOTByVXZaaENmR0wxWmtMRHhSL1IveW9Pb3l4RGU1?=
 =?utf-8?B?VUw2eHZSK0hXL282K2oyZGJLOGN1RXFqb3pwakZwUkFXdVZCWFQwRnBoQ2Zq?=
 =?utf-8?B?U1pFYUtQMFlvekRSbVZyM0dmc1BZUHphWENNWmQ3NS9ndENpc3NVN2hUQ0x5?=
 =?utf-8?B?bW10d1JqNHhsTXB6dzdLMThNei9QeW5kV2sxVTRFWUwwMXJDSzltckYzNUM1?=
 =?utf-8?B?aDBkcGRwTHE2SjhLd25YV3UyemcxNStBVnZNNy8zR0RsL29uVldIN1JkSW9Y?=
 =?utf-8?B?R21wMjV5aFhsNGJGYlBSa0JPNkdmV2c4QW9VZHVuNGoveFJOUjlDb0lVeVd1?=
 =?utf-8?B?UE9jcjZnTTd2RGxkQlhCeUlYWXZxTnhIZnJXTDFJczdqaFgxVG5jMU9DZUNB?=
 =?utf-8?B?cGRZdmpBL2NnZ0xqT1Y4MjFNNkJVdW5tOVpVbmoxM1RoSVBpeW81TmhicTAx?=
 =?utf-8?B?K0Z0MFJVQ29IZU5nMER2YjliZXpmbUlEekxrZ0RXeS95bktZekx0b3dCVVpq?=
 =?utf-8?B?N25XUE5ZRFR2bUNSS01aNG1NMnZLcUlBdEtubGlIRjUybkgvR0Nvdk5MMUdV?=
 =?utf-8?B?bFVYbm84ZEk0STN0ZThNdEI5K04zWHY1M0o0WXZHQVhaT2NkeG1vZWFnT0Y1?=
 =?utf-8?B?SVpUbWpzNjB5K1p0ZXNrS0dXQUw3VnFQdUxmNG1YWTZqWDYxOUVZQVdGc1M4?=
 =?utf-8?B?dk9mK2laQmx2MCtBQkF4MTdzWlc2ODdmUDVzdHdVYzdjVC80VCs5Ui9sWlJ4?=
 =?utf-8?B?WVNRcytHUTJuTlptSU5BQnFENFd0UXhMbDdhOTZUdG42cG8wcUlOdW45aXJQ?=
 =?utf-8?B?RmtnVkdVejcwMnBaTlNOd01IK1F5VXRNeTltS0NhUTQ1dnBxMGhCZm5tR21Z?=
 =?utf-8?B?Z3ZOL3JUaUpVbTJ6WUF0M1JoTWJ5MEZKcmoxaDAvTEd3SEFhOUNQb2hhMnhE?=
 =?utf-8?B?OEFUNm1kd05SWW5KSkZrS3RuV0VWM0kvUTNpbk1UN0hqeE5pTHo5cXp1cmdP?=
 =?utf-8?B?TktDaFQ2Q3ZmbFZvMUE3SE1BR3djVHhmSzQrMXdZT0M5aHlqaXg1RjBxcjBB?=
 =?utf-8?B?YUZucTZTclJIS3BzcnlIZ3NrejdXNlBRem9TK0F0V3NKdy9icGdpYlRzRDZk?=
 =?utf-8?B?dmh5S3VlL0hXT1ZwNEF5blpYbWdlaFU0TFoxM0dmc0g3TWNTcW1sMUN4TEJp?=
 =?utf-8?B?MGEvRHhHL1JhY2E2bmdlRzFRaERvbFdHL0tnVENBT2N3cEVmbTNMZWdWaEUr?=
 =?utf-8?Q?P74V76iPvsiMX/bXT3SCtwWRaCK8o+MPqF1gipK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUlJNXI5RFpqWE5DOFR2a1pEUjVuUGxKeWVoSXN3c2UzaEpJbnNGdnRpS1dD?=
 =?utf-8?B?OHR4Vm5MNjRsSC9lc3V2Ky9lQWJQa3loNWNYNkI2a0lmK09wTzR2REthUHly?=
 =?utf-8?B?bWhzNVVleDZPREZGQjVPMDNnM0FKaXNJV1dESlNqU1YxVmNEbUJlNTR4RnVX?=
 =?utf-8?B?cjFKTm1vdDVoQko5bjBRNXBxclhZU3ovejkrRkw1S0NDTHhFbVJ6YzlHS0hv?=
 =?utf-8?B?WnJDeG8rTFRIbzRjSHYvRTZERURVSndxS2NhQUo5VHlyVWlpaDRUbGVta2dl?=
 =?utf-8?B?eEFPb2FyUElZak5FSUJOMG5JckpDRUMwMVFnZW9WWTNWaFYxSnRkSzBBcFZv?=
 =?utf-8?B?OVdyKzF0akZvV3h6WjlXazNGKzM0VExSSk12RXEvTkpRM0xGdkZZaUUwRnRB?=
 =?utf-8?B?aVl2c1gvMkZaa0hGKzVYdXNnOFYyL2hOVUhJVmNleEhwaXIrWllSZHZoVUMy?=
 =?utf-8?B?WUlINEVYbkc5MmppbVZKZEg2Ly81SkpBcTNMbkJqaHRoZTI0VTlTb0hWNXVR?=
 =?utf-8?B?Q0hzbm9ISHl6Skx1Mm0rN21ZRE9GcU5YUjFHK1JPd0VKUWswcTh4ZTExS2lC?=
 =?utf-8?B?Ym10MStKZlJlakRoRmRYYlJLdUJiY1kvcDluZVdnc0lMaEJXQUNsTTlzNmxt?=
 =?utf-8?B?L0xvSm8vR2M0azFoNlZSR1hwWjFxTDg3L3BiVkplRnpMT2pOOGpRQ0JmOWE0?=
 =?utf-8?B?UEkzd1J4TjI4cFJzVkFJeDRGZUxOV3BZdlBpRE5mYUJqY1BYVWhTUU1vellB?=
 =?utf-8?B?QndKT1d1aGtSMXRMM3VtR1JDbjBHczhsRUxVSTExdzBJVHptSDlFUGw2SzR3?=
 =?utf-8?B?QVE1NnZYL3hkZnFWS3ZIeG93RjNUc3NnenhVeloweThQQW4yRFpvTEFUNkpH?=
 =?utf-8?B?bDNVd3psbzg2dGNYaFRFclRjbEVLbTZ6cGJia1ZhaVF0RFl0TDFPalJyc1Rz?=
 =?utf-8?B?bDBvTGRJSDFjdGt1ZGhaSjFPcWxremZoRWtkMmxMVXpWVEFpa2k0eDJtNEVW?=
 =?utf-8?B?cWZMbVg3YW9KbFI1cUNnN2ZVZjM4Y2tNNjdaTG16UjliNEtsZ1dkWHFXM2xK?=
 =?utf-8?B?US9xUWlpdVB6M0xUVTMyeVZUOUFSbjVVbDlqUTE2K0UyalFGalVFNVloUVU4?=
 =?utf-8?B?cDFzQW5ndXh6OW1FM1lEQmhnRXJodEJvU3hBR3V3Q29wTzV2dHlyeEk5clcw?=
 =?utf-8?B?OVUxQkVFZTZOd0pGZVpGM05zOEd2eGJydGFlYjJhR3pFRjlwRWtSL3VhR3JR?=
 =?utf-8?B?UEEzUGRyRGlaVmxOdExna0I2WjQxQm1YeFdFZytLTkpvUXFZd3hBdG9Pb1gz?=
 =?utf-8?B?Q2FEaEp6anBtenVKUEdGd0tSQmhQVDYyOEZsYThUODY3NTFwTHF2czIxRmdE?=
 =?utf-8?B?WlpYZ09mWW9RRTJqcXFsVEx3bnZBcnMvZkdYcG5wTUdmVTBncHpCNy9yVU1i?=
 =?utf-8?B?blpYdW5qUUlWcTVjZ1dLSHdTL05rYzNTdGlxbEZVL0ErN3lteWRqYnp0R254?=
 =?utf-8?B?SC9rVWhENkxGOG9WOWQwdGM5eSs2Z0E5dlNpS0lFVmFRY0VEalIwSURmT2VM?=
 =?utf-8?B?eFRBWTcwUkFqY0w3bmR0WlhSMjdXMjRnODY2WElOL1ZzRk8ydjJoY0ZHSW1O?=
 =?utf-8?B?bUNjQUFnYm51REpIRjZ4N3ZDdE1mSERqVTNCcThpQ0l4K1d4Y01PZXRhUjhs?=
 =?utf-8?B?SUd6aUlLdVZFQTVWamxoVUpOay9oQjEzaTQxRlkySWZCVXQ4MnpVbEJmMngy?=
 =?utf-8?B?TWlwWjVVZm4yMjJDYllDZ20rWlpWdmg2UlNYdGxoYzdnUVpUYmRxWG5JLzU0?=
 =?utf-8?B?Z0s0ekU3ejFIelVEMXNMTVJyRXFUM25UU2p1NHh4VVZwR0tWRk5KVERCSEFW?=
 =?utf-8?B?TEM0MWFocVFEbHMySjhMcTIzZDBLdWdIaE9DR3l0di9kZ1pQa0tIT1BTTDcr?=
 =?utf-8?B?OExUdEZCQmR5OFExYUN3ZlYyQTZOZEQyNWJwNDRUK3NBSGNGTUs0bGZkMVFX?=
 =?utf-8?B?aFdNc1ZHc3ExdTRXMFU5cjgzNDYyaXdEM29GaXJ1S3pTOEw5bTBoeDVNUjFa?=
 =?utf-8?B?NFpldzdQR2F0OWpLZUsza0xJNGhRTExURlNyUis5WGEzSjhWU0tqeDFQTUFj?=
 =?utf-8?B?SE5YS1h5a2FqU0x4UUZtcXFpODNuemRMS2VGc054dzN5WThJRDk4d2huNmtF?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77981373-6171-4a75-6dce-08dd0e10729d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:49:56.3595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpjtX2cagjIdW2FbRQnWRVu8E04ZXNq8rC/PJ4g7NiyE9hpMncyFaG7QLxdlw3SWIw7qXoVyLys7BV7USc3DRPnq1xzUCACHopshW3p2flw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

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
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..89414a0d926c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,69 @@
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


