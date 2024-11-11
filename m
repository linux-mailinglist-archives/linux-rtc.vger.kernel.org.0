Return-Path: <linux-rtc+bounces-2505-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CA9C4277
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 17:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1471D286415
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 16:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262231A070E;
	Mon, 11 Nov 2024 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ps2xaTCS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2087.outbound.protection.outlook.com [40.107.249.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479AA19E98D;
	Mon, 11 Nov 2024 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731341928; cv=fail; b=pCVh6eSipo3wk7BuDI0AC8rVUJ3o/1yiT5dPz6ZP05WnPj2/vKhlq7PCTjYrneYMpCZuM14OhHxZYqK39J8sRMclnEP0zpK+H0gwfNCg3xdRay6OdUf7mMKQ3a9NkTx9+z8imtByT5KC88uDO5D+i3fvepQ52cVh5RpIfszR2Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731341928; c=relaxed/simple;
	bh=J63bix4aJLIraZChPtSNWW1DpYLN3nD1mzVbd4Tt1sY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PE7MOZ+IilB5bqMQ+1MVqdTI+VvwW7uxuYZ+QDQuiecpT76mbgLF/G7LGzSvG3mfcek+k92vIyyIzhObvkymQbyYdpsm+bC7JEBZ7Z7uNOd6dZkqA4WwwvO6MRaxaIAPs/C+hXCPjilFB6RTOO000QWWdhKYReGCyQbfYaSnb+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ps2xaTCS; arc=fail smtp.client-ip=40.107.249.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDKUBHKNTSP2q5Mk+hcn4/VTgK0/k5WW/TNUs0nkO1GCG1GGcQgUOxB3zR32k42kCev7MH/3szZqW2mXTpbIRenGQZEUBTjx4GjgvcrjmS13MqA7fnYqwOBEzoTU6gUksuRsLFIG42XYQvANXKml+WCH15yOkhITFTjd143Mc5Ls5WpPKm579fMADWOc1tUwSWbXFvwGIr+r/iGKYNXfHWnv0LRODQduQbDnCOSrUITlsXkSh/TF9Z64hw25PUWYlDq9u1qqFzeBqOylxaWGksIQmy4GQiFfJIWHywDc7YmebahmbZfsSiroUA6aCbpEeGeoQSgqciJDjBHgnT0mEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZifJlAW9HEyqbhv7l4m+NBinrmqkDGfulVeJvcKSTM=;
 b=ku9EINCdIUKqAAlgWwnM7okX8KOUfKBSEj7Oddd7qJJYiF+X4YwprYEbQdwKD7z9d/KNf3MPvjUX64PLQV2F3rXYzuvjXcp/2XOtCDsI8Zv998YPJdAHTc0SvT7zELtqJFVF/2zEJr1uhessFakI4uZzp2eEBArtEoeRWd1AVFpmlVVxq3IPMG7WIXKh8FqkFKx2N3rAFQ4ko9bpw0C3MxEOIC80EMa2FwGGjFmQBKbcy3MPEhrkdCNA+h4sKSSU8Sf09rgo0x/NwGRoJZhhJozOPRvm4w/fJTyLrqXZDWmDPn8xismDCb9JvHhdMytOlQhv1eTHpR1Ad/lGzGsQCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZifJlAW9HEyqbhv7l4m+NBinrmqkDGfulVeJvcKSTM=;
 b=ps2xaTCSf90oK3kXgJ7veI/HgCwoy/GHomerDRPjWhP6t1qQ1JGzAiLs5lQ0N3Xp7x5xP/G0vjP8o2hfnaoMb+LwzU78uK8AMON0pE+w49b+kW9/82mFcs/PFJ5fDuNj38m+p98zRLFXdP2q4xdekOHnm3TMU2+sXLn3Or2q+jG08D71Df5Cgk7H4MmJCc/uVZgoysoR88cobxGC91aQP4/pY54+AbsiOyyamZf0r2O1QzuYzg3iqwJUn02I0B6cDp1M50ckCzB3IpOkFs5ciZgw92I7/VskBV/MiNJpKUpiOogQwMEmf34gsEX2lrX7g3ZtyKoexXH+/4f+qIPCJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8576.eurprd04.prod.outlook.com (2603:10a6:102:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 16:18:40 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 16:18:40 +0000
Message-ID: <5675df8e-5905-4480-831f-0e2b4a94c108@oss.nxp.com>
Date: Mon, 11 Nov 2024 18:18:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, NXP S32 Linux <s32@nxp.com>,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-3-ciprianmarian.costea@oss.nxp.com>
 <ZzIruvZcLqWTWwJ2@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <ZzIruvZcLqWTWwJ2@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0130.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::47) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 753f7dd0-fec0-448b-e27a-08dd026c8133
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEFkL0E1T3p4Z2Uva1Y3a2NxR3pNY0FJai9tQkhKQWNMMmJlUEZaZW9vVXBM?=
 =?utf-8?B?VHA2WHd4ODFGQjhIaFJKMWl5eE8wYWJ6MVpQdEd5SWRFWGtIdzMxYlB4MzJO?=
 =?utf-8?B?L2Jjamh2ZWhpKytsVHlvNVc1ZFlWRkZuMmk1SXRUS05aTTV3SUN3d0x5MXIw?=
 =?utf-8?B?d01Pdkp5dWhidHNORmIzamxoTDJNVVg3cWxlMmtLblc0bnY0SHNLNkFpY3pE?=
 =?utf-8?B?TC9RaXdQOHRGM0VhSjlPaVFERlhLdkRWSU0zM3ZJL1NwZ1B2SEcrclVueUNl?=
 =?utf-8?B?N2RlNlVNa2xKWHdQbEE4Rm9xY3I0Wjc1UVR2UjkyT0d6Y0V5V2ViY2pIb3h3?=
 =?utf-8?B?cithOXJRQlAzKzZ2YzhFeStLeDdHamp6b3RVZVBGRElzYnBNdXJpY04wQmt3?=
 =?utf-8?B?MzlTK09VTU9XM2dBQjcrREdzTDNzb2hrTDdqQW5lK05yS3drY21rL2F4YjA1?=
 =?utf-8?B?bmNxM1pnZFRxK0JFcXdEOFZ6c25RL093Qi84UDFreHFrQXJqZGhEV1FaOHA1?=
 =?utf-8?B?bXdSMmJSRjV3L3hYZVRya0xCRUx6WExUOUs2RnVaclpnY2JxMU5wZHlkWjlw?=
 =?utf-8?B?OElrTWpIdW5rSmh4ZnZ2TDUzbU5ZSDU1RUY2NHVSTVJaLzQvUGVqZVk0Qk5z?=
 =?utf-8?B?bTVFUHRwU1JuL255UmtETll0TW1wNUhjTVg5S0RWdWVWWitNQTA4aUMwMUVk?=
 =?utf-8?B?VzZITll1bXF3TFRtZExweUo2bGdvVHVpb2ZDaVRRSWpZc2QrclZFTUdFQ2Z4?=
 =?utf-8?B?RXlNbGxYT0FLRDJ3b3BwVUd3eDJYUkxBcS80TDJ2aGZ1L2JJYmh5cTBERTNj?=
 =?utf-8?B?UWkrcnJpYjZWbFRES3VHNDdnRW9PamQrWjBOQmxDcStFbjVMU3h1TzYzL1Yz?=
 =?utf-8?B?WjdrbExuMzlYcFB6ZzdRYXo5MUhoYU5xdHA5Z0NHMEtPV2VCYmFtQTFEQXFy?=
 =?utf-8?B?RzFTU2pvZHdsWURYeHFDbGsxNjFyY1o5eUNKT0hmOW5NemFUM2lmZXJUeW9M?=
 =?utf-8?B?NmVyR2pLSk96MlhWUTVXSXYxSTBTQWNJY2pLT2FtZ2JKOFFveEFLK1Uyei9N?=
 =?utf-8?B?RFRzMWsyb0svb1JPT21kbC9GaGxURmZqcFRMZUIzSWxKRzNXWXptQ0V0aHEr?=
 =?utf-8?B?Mkt6STd4NzdJWnRwL3VtNVVQaVExMXdtQUVnYkpicnVFZDhGWUFZWlFTRlV1?=
 =?utf-8?B?SFdzYS94emV2aVdqaUJ6WTRsb0p1aUR4LzJaTWVFeHlneVhFamMweHhBUWd0?=
 =?utf-8?B?dTNicWlJWUVSNDFHM1NsUUdRZHNDRlFSSW5NQ3E4RkV3dGxjdjVRUVg0MEFi?=
 =?utf-8?B?eDJWRTYwR1EyZDBFa0ZRMDM4TmNvM2ZHeEJlR05IcmJBQnJTVHJlalVNM21G?=
 =?utf-8?B?WmZPODcycTRJWHZ6OHRGKzFGYnRZTFhIN0FhS1ZUdmdHUEo2cW9CNW5MaEpP?=
 =?utf-8?B?cFlERXlEcVJCUkVnK2pkb3U3TkJNSTBtYS9KVnR5RFg5TE1nQjN5RkxOeU9C?=
 =?utf-8?B?Uzd5NUxBY2cyMmNnbnlIODd4T3NkRStzQVlmS052bTlFRG1GUDN4T2oxOEhz?=
 =?utf-8?B?aEJFL0h6T2luR2FZNFB6NWtadnc1eTV6SmFCNWZqUWxqT1FoWGF3VE1GTG83?=
 =?utf-8?B?bXl0LzJnWjdTQ0hlZFZ5Ym54L3d2aFE1SDQyMS9uSG8zV0ttNFQxQVR0QUsv?=
 =?utf-8?B?OENHckkzL3NXQldMQ2hISlR4UHZSMUhzaGdmcC8wa2VlK1lyakFGNVQzQXRD?=
 =?utf-8?Q?W43xQK7OVfzn4MCyjr+oktP+5BQM7P9APg3kWHb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGJYYXl6Mmd1WEVIRTkzamRjTGNCejkyWU5xK0pyOS9yaFovTDBVY2gxT0JJ?=
 =?utf-8?B?YnZJQUJKZlJwWDk0WmZMTnp4TmorL0pYQ0dVY0RpTXkrNVRKY2FyN3Y4RWww?=
 =?utf-8?B?RWRFQzNYT3pic1NWNlkvWjF4M3Fya3JXS0NJRGRndlVTVTZPaTFiQWxvbDlz?=
 =?utf-8?B?UHpiZ3A5enlXcmtadkFRU25xc0tJMG9tNEpiNHp5cjNsWGpVblF3OVR5Z3Mw?=
 =?utf-8?B?Q2JKLzhhaTMvaDFQcGRVaFJiaWI0V1YrdXpSZ2xSdlBmUDdvZUpZM0FCcFpQ?=
 =?utf-8?B?SHdwN3B2OGdFT1VWS1FKQ0xoU1dGbXRrY0U2VTNTYzBTSmp5QkxKWU9yT1BV?=
 =?utf-8?B?ZmpTbE9DbHJJZXY0QVBjTWlaVjl4YjlBUmZ6RWJ3MFBFQmo2WnMxd25pQTlh?=
 =?utf-8?B?V1pBbUZtc3Z0Y1N6MjJ5T1dwcDMzSHdvbnNjekRkaXJCbmZZY0hFanlBeTR4?=
 =?utf-8?B?YmZiQTArek5VWUJ2M3F1dEZtWFN5bnE2OEVXbzNNSmw3L3FIdFFNRXh6MUhQ?=
 =?utf-8?B?QmhETGp3L3pmTFNjb2VXMFduZjRKZ3Yvb0lIOXZtblB3WWdXVzNJRmc2WWE1?=
 =?utf-8?B?anA5cHI4QkFtSWRvVWx2UGdDOExmM1F6ck5aWHhhR3dNVndEUzZJQUF6MDcx?=
 =?utf-8?B?WG1FTHZla1MrVWZvQTdLc0xTcFFBMmRuU29BdktnSWJDNWdqWE1ObG9kS3E2?=
 =?utf-8?B?eUU2RkxTbkw0bTZ1KzlrcHIzaVk4dzlKRjV1cHpTTjlva0VXMTRKQjErUzhF?=
 =?utf-8?B?SW8zQ0pHdmMva0hiOUxNQ0ZaVzRPRXVOTmdYa0F0QmhOV3RGcFNjOER6R1FO?=
 =?utf-8?B?cXNhTjhhWTNVY01Rc3d6QnJRUjMyc3RjWXRCUmI1czI2SHFELzluL0VrWXZm?=
 =?utf-8?B?Y0FNRTVzU0toRkFsTkhHY3VZSFF0V0RpMUk4dkc2WTJqdmJCVWx0TFlRMGdE?=
 =?utf-8?B?WUU1L1RFRzlscG1LWWwyaDFlNDdzb2VXZXZGQi90SkZiaDVuZWptZ1c0eFQv?=
 =?utf-8?B?VjlqdnpJZEFVSjlGVG9iUXY5aVU2akFsWkFXb01jL2g2LzVlTWI0Ry9jblhY?=
 =?utf-8?B?eTdZdktWTEVVQjJkYUh4eW16K01INzdPQXRxSkNtdUxaUHJJQ1JJL0I5NWZw?=
 =?utf-8?B?bzhrQVZnZHJGUUFaM0FmVnE1Z0RrK1Rkcm1EaG9ncVljZzYwMTQ2VldjbG83?=
 =?utf-8?B?c21FbHpNbHVRemk5YjRaMzRZblhIOVZXQnhJNzJhZFdDamFoKy9sUFdMZzFF?=
 =?utf-8?B?TXVOSjJ6VVplQ0RYVXh5REFlMis2VVE4MXlHbHIwMDE4czFXR3VXTFFtL1F3?=
 =?utf-8?B?MkFHTHlnOGhJb2lNaGEyazcyRmNXWnhMTkZVYndTWXBXZ2dRZ01lVzVUTVFB?=
 =?utf-8?B?TndVT2FkdjF0eE9uWExNQjkzdkRTeGtOUGhOWEJ0c2dwK1Q0TC9yN1ZYV1ZX?=
 =?utf-8?B?UXBzTVVKOXNpZ2RaeE1DeWNROVhJUHFMUUU1ZyttbFFVN1FjRGJvMUphK3Fz?=
 =?utf-8?B?c3diRDFYVWs1NHRReWJYRW15akpzWklCLzJ2UnJKbFV1eWcrcTAvMERrN0xV?=
 =?utf-8?B?RjhvQ1RBMTI3d2xJMHpmTG41NlgvdHB2V1E2dFVncW9qS2FzSlBRa09XbWNy?=
 =?utf-8?B?MmlBUDQzMEJZcmI3VlhMOG5SeExhWFRXdG0vZGN1bmozd1FwbitpZW96cEVo?=
 =?utf-8?B?RWdweWdjYXBCS05kWms3UWlvdDVKbGtDQXVxS0EydVZ3MEpOQmJvL1RvcEVu?=
 =?utf-8?B?TmpOdnJyLzB0ZndWQnh6VHc2VndlVTVUcytTQVVWeldlODd5NnUzaDlWc0lB?=
 =?utf-8?B?MFI3M000NnF4M2pIU2M1OVN6dnZaSVFGdUZYSkdnU2RYY25Mc0V6RXlWdVJh?=
 =?utf-8?B?UWpLcVRVRzV5clkxb28xSVJqVVdaWU9MbHNIRmt1bkFBekQ5TUtLdXE0QnJF?=
 =?utf-8?B?dW9uZEZxS01NUGRxU1NlM2g5bi9CTnRZVjh6NUZ1cjhVeTVlV1FxR0wwbmE0?=
 =?utf-8?B?ckF4OHhTTjdsOHFDU1NlaEVBVCtBMGhwUjBGRjJsdzN3Q0lvQm54aUZnaEk0?=
 =?utf-8?B?ZEF3OXJIZTAxeFdzd0x3aVo0eGQyUjhWTkF5Snd5NzRKMEs3NEpxcXcxUWdv?=
 =?utf-8?B?a3FwYXhOQUxxMjhnMnBCak9OaGdMT3VHR05JYjBQSndCSVpvamZ4MkFWL09H?=
 =?utf-8?Q?j5bA6fEZAH081vGAWuXI7ps=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753f7dd0-fec0-448b-e27a-08dd026c8133
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 16:18:40.6207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpLzZFcuQCAoiaPvHc0aJ1DbyCs/1OicJGLONmaDRI+g4mFvZHtp6Y++gE2FgB4xO1vnA3ezGQalbSkfdDTE4d2QcZJVQzqX80Q0V+Ifri8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8576

On 11/11/2024 6:07 PM, Frank Li wrote:
> On Mon, Nov 11, 2024 at 03:59:38PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
>>
>> The RTC module is used to enable Suspend to RAM (STR) support on NXP
>> S32G2/S32G3 SoC based boards.
> 
> Why suspend to RAM related RTC module?
> 

Hello Frank,

Here I was referring to the fact that the RTC module is used as a wakeup 
source from suspend state on S32G, thus enabling easy Suspend to RAM 
testing.

I will update the commit body accordingly for this patchset to remove 
this confusion in V5.

>>
>> RTC tracks clock time during system suspend.
>>
>> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
>> during system reset.
>>
>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   drivers/rtc/Kconfig    |  11 +
>>   drivers/rtc/Makefile   |   1 +
>>   drivers/rtc/rtc-s32g.c | 692 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 704 insertions(+)
>>   create mode 100644 drivers/rtc/rtc-s32g.c
>>
>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> index e87c3d74565c..18fc3577f6cd 100644
>> --- a/drivers/rtc/Kconfig
>> +++ b/drivers/rtc/Kconfig
>> @@ -2054,4 +2054,15 @@ config RTC_DRV_SSD202D
>>   	  This driver can also be built as a module, if so, the module
>>   	  will be called "rtc-ssd20xd".
>>
>> +config RTC_DRV_S32G
>> +	tristate "RTC driver for S32G2/S32G3 SoCs"
>> +	depends on ARCH_S32 || COMPILE_TEST
>> +	depends on COMMON_CLK
>> +	help
>> +	  Say yes to enable RTC driver for platforms based on the
>> +	  S32G2/S32G3 SoC family.
>> +
>> +	  This RTC module can be used as a wakeup source.
>> +	  Please note that it is not battery-powered.
>> +
>>   endif # RTC_CLASS
>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> index 8ee79cb18322..a63d010a753c 100644
>> --- a/drivers/rtc/Makefile
>> +++ b/drivers/rtc/Makefile
>> @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
>>   obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>>   obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>>   obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
>> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>>   obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>>   obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>>   obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
>> new file mode 100644
>> index 000000000000..c3792b674a18
>> --- /dev/null
>> +++ b/drivers/rtc/rtc-s32g.c
>> @@ -0,0 +1,692 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/math64.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/rtc.h>
>> +
>> +#define RTCC_OFFSET	0x4ul
>> +#define RTCS_OFFSET	0x8ul
>> +#define RTCCNT_OFFSET	0xCul
>> +#define APIVAL_OFFSET	0x10ul
>> +#define RTCVAL_OFFSET	0x14ul
>> +
>> +/* RTCC fields */
>> +#define RTCC_CNTEN				BIT(31)
>> +#define RTCC_RTCIE_SHIFT		30
>> +#define RTCC_RTCIE				BIT(RTCC_RTCIE_SHIFT)
>> +#define RTCC_ROVREN				BIT(28)
>> +#define RTCC_APIEN				BIT(15)
>> +#define RTCC_APIIE				BIT(14)
>> +#define RTCC_CLKSEL_OFFSET		12
>> +#define RTCC_CLKSEL_MASK		GENMASK(13, 12)
>> +#define RTCC_CLKSEL(n)			(((n) << 12) & RTCC_CLKSEL_MASK)
>> +#define RTCC_DIV512EN			BIT(11)
>> +#define RTCC_DIV32EN			BIT(10)
>> +
>> +/* RTCS fields */
>> +#define RTCS_RTCF		BIT(29)
>> +#define RTCS_INV_RTC		BIT(18)
>> +#define RTCS_APIF		BIT(13)
>> +#define RTCS_ROVRF		BIT(10)
>> +
>> +#define ROLLOVER_VAL		GENMASK(31, 0)
>> +#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
>> +
>> +#define RTC_CLK_MUX_SIZE	4
>> +
>> +/*
>> + * S32G2 and S32G3 SoCs have RTC clock source 1 reserved and
>> + * should not be used.
>> + */
>> +#define RTC_QUIRK_SRC1_RESERVED			BIT(2)
>> +
>> +enum {
>> +	RTC_CLK_SRC0,
>> +	RTC_CLK_SRC1,
>> +	RTC_CLK_SRC2,
>> +	RTC_CLK_SRC3
>> +};
>> +
>> +enum {
>> +	DIV1 = 1,
>> +	DIV32 = 32,
>> +	DIV512 = 512,
>> +	DIV512_32 = 16384
>> +};
>> +
>> +static const char *rtc_clk_src[RTC_CLK_MUX_SIZE * 2] = {
>> +	"rtc_runtime_s0",
>> +	"rtc_runtime_s1",
>> +	"rtc_runtime_s2",
>> +	"rtc_runtime_s3",
>> +	"rtc_standby_s0",
>> +	"rtc_standby_s1",
>> +	"rtc_standby_s2",
>> +	"rtc_standby_s3"
>> +};
>> +
>> +struct rtc_time_base {
>> +	s64 sec;
>> +	u64 cycles;
>> +	u64 rollovers;
>> +	struct rtc_time tm;
>> +};
>> +
>> +struct rtc_priv {
>> +	struct rtc_device *rdev;
>> +	void __iomem *rtc_base;
>> +	struct clk *ipg;
>> +	struct clk *runtime_clk;
>> +	struct clk *suspend_clk;
>> +	const struct rtc_soc_data *rtc_data;
>> +	struct rtc_time_base base;
>> +	u64 rtc_hz;
>> +	u64 rollovers;
>> +	int dt_irq_id;
>> +	int runtime_src_idx;
>> +	int suspend_src_idx;
>> +};
>> +
>> +struct rtc_soc_data {
>> +	u32 runtime_div;
>> +	u32 suspend_div;
>> +	u32 quirks;
>> +};
>> +
>> +static const struct rtc_soc_data rtc_s32g2_data = {
>> +	.runtime_div = DIV512,
>> +	.suspend_div = DIV512,
>> +	.quirks = RTC_QUIRK_SRC1_RESERVED,
>> +};
>> +
>> +static int is_src1_reserved(struct rtc_priv *priv)
>> +{
>> +	return priv->rtc_data->quirks & RTC_QUIRK_SRC1_RESERVED;
>> +}
>> +
>> +static u64 cycles_to_sec(u64 hz, u64 cycles)
>> +{
>> +	return div_u64(cycles, hz);
>> +}
>> +
>> +/**
>> + * Convert a number of seconds to a value suitable for RTCVAL in our clock's
>> + * current configuration.
>> + * @rtcval: The value to go into RTCVAL[RTCVAL]
>> + * Returns: 0 for success, -EINVAL if @seconds push the counter at least
>> + *          twice the rollover interval
>> + */
>> +static int sec_to_rtcval(const struct rtc_priv *priv,
>> +			 unsigned long seconds, u32 *rtcval)
>> +{
>> +	u32 rtccnt, delta_cnt;
>> +	u32 target_cnt = 0;
>> +
>> +	/* For now, support at most one rollover of the counter */
>> +	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ROLLOVER_VAL))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * RTCCNT is read-only; we must return a value relative to the
>> +	 * current value of the counter (and hope we don't linger around
>> +	 * too much before we get to enable the interrupt)
>> +	 */
>> +	delta_cnt = seconds * priv->rtc_hz;
>> +	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +
>> +	if (~rtccnt < delta_cnt)
>> +		target_cnt = (delta_cnt - ~rtccnt);
>> +	else
>> +		target_cnt = rtccnt + delta_cnt;
>> +
>> +	/*
>> +	 * According to RTCVAL register description,
>> +	 * its minimum value should be 4.
>> +	 */
>> +	if (unlikely(target_cnt < 4))
>> +		target_cnt = 4;
>> +
>> +	*rtcval = target_cnt;
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t rtc_handler(int irq, void *dev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(dev);
>> +	u32 status;
>> +
>> +	status = ioread32(priv->rtc_base + RTCS_OFFSET);
>> +	if (status & RTCS_ROVRF) {
>> +		if (priv->rollovers == ULONG_MAX)
>> +			priv->rollovers = 0;
>> +		else
>> +			priv->rollovers++;
>> +	}
>> +
>> +	if (status & RTCS_RTCF) {
>> +		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
>> +		rtc_update_irq(priv->rdev, 1, RTC_AF);
>> +	}
>> +
>> +	if (status & RTCS_APIF)
>> +		rtc_update_irq(priv->rdev, 1, RTC_PF);
>> +
>> +	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int get_time_left(struct device *dev, struct rtc_priv *priv,
>> +			 u32 *sec)
>> +{
>> +	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	if (rtcval < rtccnt) {
>> +		dev_err(dev, "RTC timer expired before entering suspend\n");
>> +		return -EIO;
>> +	}
>> +
>> +	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
>> +
>> +	return 0;
>> +}
>> +
>> +static s64 s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
>> +				     u32 offset)
>> +{
>> +	u64 cycles, base_cycles;
>> +	u32 counter;
>> +	s64 sec;
>> +
>> +	counter = ioread32(priv->rtc_base + offset);
>> +	cycles = priv->rollovers * ROLLOVER_VAL + counter;
>> +	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
>> +
>> +	if (cycles < base_cycles)
>> +		return -EINVAL;
>> +
>> +	cycles -= base_cycles;
>> +	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
>> +
>> +	return sec;
>> +}
>> +
>> +static int s32g_rtc_read_time(struct device *dev,
>> +			      struct rtc_time *tm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	s64 sec;
>> +
>> +	if (!tm)
>> +		return -EINVAL;
>> +
>> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
>> +	if (sec < 0)
>> +		return -EINVAL;
>> +
>> +	rtc_time64_to_tm(sec, tm);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 rtcc, sec_left;
>> +	s64 sec;
>> +
>> +	if (!alrm)
>> +		return -EINVAL;
>> +
>> +	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
>> +	if (sec < 0)
>> +		return -EINVAL;
>> +
>> +	rtc_time64_to_tm(sec, &alrm->time);
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
>> +
>> +	alrm->pending = 0;
>> +	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
>> +		alrm->pending = !!sec_left;
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 rtcc;
>> +
>> +	if (!priv->dt_irq_id)
>> +		return -EIO;
>> +
>> +	/*
>> +	 * RTCIE cannot be deasserted because it will also disable the
>> +	 * rollover interrupt.
>> +	 */
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	if (enabled)
>> +		rtcc |= RTCC_RTCIE;
>> +
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	struct rtc_time time_crt;
>> +	long long t_crt, t_alrm;
>> +	u32 rtcval, rtcs;
>> +	int ret = 0;
>> +
>> +	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	t_alrm = rtc_tm_to_time64(&alrm->time);
>> +
>> +	/*
>> +	 * Assuming the alarm is being set relative to the same time
>> +	 * returned by our s32g_rtc_read_time callback
>> +	 */
>> +	ret = s32g_rtc_read_time(dev, &time_crt);
>> +	if (ret)
>> +		return ret;
>> +
>> +	t_crt = rtc_tm_to_time64(&time_crt);
>> +	if (t_alrm <= t_crt) {
>> +		dev_warn(dev, "Alarm is set in the past\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
>> +	if (ret) {
>> +		/*
>> +		 * Rollover support enables RTC alarm
>> +		 * for a maximum timespan of ~3 months.
>> +		 */
>> +		dev_warn(dev, "Alarm is set too far in the future\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
>> +				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
>> +	if (ret) {
>> +		dev_err(dev, "Synchronization failed\n");
>> +		return ret;
>> +	}
>> +
>> +	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
>> +
>> +	return 0;
>> +}
>> +
>> +static int s32g_rtc_set_time(struct device *dev,
>> +			     struct rtc_time *time)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +
>> +	if (!time)
>> +		return -EINVAL;
>> +
>> +	priv->base.rollovers = priv->rollovers;
>> +	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
>> +	priv->base.sec = rtc_tm_to_time64(time);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Disable the 32-bit free running counter.
>> + * This allows Clock Source and Divisors selection
>> + * to be performed without causing synchronization issues.
>> + */
>> +static void s32g_rtc_disable(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +
>> +	rtcc &= ~RTCC_CNTEN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static void s32g_rtc_enable(struct rtc_priv *priv)
>> +{
>> +	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +
>> +	rtcc |= RTCC_CNTEN;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static void adjust_dividers(struct rtc_priv *priv,
>> +			    u32 div_val, u32 *reg)
>> +{
>> +	switch (div_val) {
>> +	case DIV512_32:
>> +		*reg |= RTCC_DIV512EN;
>> +		*reg |= RTCC_DIV32EN;
>> +		break;
>> +	case DIV512:
>> +		*reg |= RTCC_DIV512EN;
>> +		break;
>> +	case DIV32:
>> +		*reg |= RTCC_DIV32EN;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	priv->rtc_hz /= div_val;
>> +}
>> +
>> +static int rtc_get_clk_src(struct rtc_priv *priv)
>> +{
>> +	return (ioread32(priv->rtc_base + RTCC_OFFSET) &
>> +			RTCC_CLKSEL_MASK) >> RTCC_CLKSEL_OFFSET;
>> +}
>> +
>> +static int rtc_clk_src_switch(struct rtc_priv *priv, u32 src)
>> +{
>> +	struct device *dev = priv->rdev->dev.parent;
>> +	u32 rtcc = 0;
>> +
>> +	switch (src % RTC_CLK_MUX_SIZE) {
>> +	case RTC_CLK_SRC0:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC0);
>> +		break;
>> +	case RTC_CLK_SRC1:
>> +		if (is_src1_reserved(priv))
>> +			return -EOPNOTSUPP;
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC1);
>> +		break;
>> +	case RTC_CLK_SRC2:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC2);
>> +		break;
>> +	case RTC_CLK_SRC3:
>> +		rtcc |= RTCC_CLKSEL(RTC_CLK_SRC3);
>> +		break;
>> +	default:
>> +		dev_err(dev, "Invalid clock mux parent: %d\n", src);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (src < RTC_CLK_MUX_SIZE) {
>> +		priv->rtc_hz = clk_get_rate(priv->runtime_clk);
>> +		if (!priv->rtc_hz) {
>> +			dev_err(dev, "Failed to get RTC frequency\n");
>> +			return -EINVAL;
>> +		}
>> +		adjust_dividers(priv, priv->rtc_data->runtime_div, &rtcc);
>> +	} else {
>> +		priv->rtc_hz = clk_get_rate(priv->suspend_clk);
>> +		if (!priv->rtc_hz) {
>> +			dev_err(dev, "Failed to get RTC frequency\n");
>> +			return -EINVAL;
>> +		}
>> +		adjust_dividers(priv, priv->rtc_data->suspend_div, &rtcc);
>> +	}
>> +
>> +	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
>> +	/*
>> +	 * Make sure the CNTEN is 0 before we configure
>> +	 * the clock source and dividers.
>> +	 */
>> +	s32g_rtc_disable(priv);
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +	s32g_rtc_enable(priv);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct rtc_class_ops rtc_ops = {
>> +	.read_time = s32g_rtc_read_time,
>> +	.set_time = s32g_rtc_set_time,
>> +	.read_alarm = s32g_rtc_read_alarm,
>> +	.set_alarm = s32g_rtc_set_alarm,
>> +	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
>> +};
>> +
>> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
>> +			     struct device *dev)
>> +{
>> +	int i;
>> +
>> +	priv->runtime_src_idx = -EINVAL;
>> +	priv->suspend_src_idx = -EINVAL;
>> +
>> +	priv->ipg = devm_clk_get_enabled(dev, "ipg");
> 
> binding doc need document 'ipg'
> 

Is the current documentation from 'clocks' [1] in the bindings not enough ?

clocks:
...
   items:
     - description: ipg clock drives the access to the RTC iomapped 
registers
...


[1] 
https://lore.kernel.org/all/20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com/

>> +	if (IS_ERR(priv->ipg)) {
>> +		dev_err(dev, "Failed to get 'ipg' clock\n");
>> +		return PTR_ERR(priv->ipg);
>> +	}
>> +
>> +	/* Get RTC runtime clock source */
>> +	for (i = 0; i < RTC_CLK_MUX_SIZE; i++) {
>> +		priv->runtime_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
>> +		if (!IS_ERR(priv->runtime_clk)) {
>> +			priv->runtime_src_idx = i;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (IS_ERR(priv->runtime_clk)) {
>> +		dev_err(dev, "Failed to get runtime rtc clock\n");
>> +		return PTR_ERR(priv->runtime_clk);
> 
> return  dev_err_proble()
> 
>> +	}
>> +
>> +	/* If present, get RTC suspend clock source */
>> +	for (i = RTC_CLK_MUX_SIZE; i < RTC_CLK_MUX_SIZE * 2; i++) {
>> +		priv->suspend_clk = devm_clk_get_enabled(dev, rtc_clk_src[i]);
>> +		if (!IS_ERR(priv->suspend_clk)) {
>> +			priv->suspend_src_idx = i;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rtc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct rtc_priv *priv;
>> +	int ret = 0;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	priv->rtc_data = of_device_get_match_data(dev);
>> +	if (!priv->rtc_data)
>> +		return -ENODEV;
>> +
>> +	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(priv->rtc_base))
>> +		return dev_err_probe(dev, PTR_ERR(priv->rtc_base),
>> +				"Failed to map registers\n");
>> +
>> +	device_init_wakeup(dev, true);
>> +
>> +	ret = rtc_clk_dts_setup(priv, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->rdev = devm_rtc_allocate_device(dev);
>> +	if (IS_ERR(priv->rdev))
>> +		return dev_err_probe(dev, PTR_ERR(priv->rdev),
>> +				"Failed to allocate RTC device\n");
>> +
>> +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				"Failed clk source switch, err: %d\n", ret);
>> +
>> +	platform_set_drvdata(pdev, priv);
>> +	priv->rdev->ops = &rtc_ops;
>> +
>> +	ret = devm_rtc_register_device(priv->rdev);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to register RTC device\n");
>> +		goto disable_rtc;
>> +	}
>> +
>> +	priv->dt_irq_id = platform_get_irq(pdev, 0);
>> +	if (priv->dt_irq_id < 0)
>> +		return dev_err_probe(dev, priv->dt_irq_id,
>> +				"Error reading interrupt # from dts\n");
>> +
>> +	ret = devm_request_irq(dev, priv->dt_irq_id,
>> +			       rtc_handler, 0, dev_name(dev), pdev);
>> +	if (ret) {
>> +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
>> +			priv->dt_irq_id, ret);
>> +		goto disable_rtc;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_rtc:
>> +	s32g_rtc_disable(priv);
>> +	return ret;
>> +}
>> +
>> +static void rtc_remove(struct platform_device *pdev)
>> +{
>> +	struct rtc_priv *priv = platform_get_drvdata(pdev);
>> +
>> +	s32g_rtc_disable(priv);
>> +}
>> +
>> +static void  __maybe_unused enable_api_irq(struct device *dev, unsigned int enabled)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
>> +	u32 rtcc;
>> +
>> +	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
>> +	if (enabled)
>> +		rtcc |= api_irq;
>> +	else
>> +		rtcc &= ~api_irq;
>> +	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
>> +}
>> +
>> +static int __maybe_unused rtc_suspend(struct device *dev)
>> +{
>> +	struct rtc_priv *init_priv = dev_get_drvdata(dev);
>> +	struct rtc_priv priv;
>> +	long long base_sec;
>> +	int ret = 0;
>> +	u32 rtcval;
>> +	u32 sec;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	if (init_priv->suspend_src_idx < 0)
>> +		return 0;
>> +
>> +	if (rtc_get_clk_src(init_priv) + RTC_CLK_MUX_SIZE ==
>> +			init_priv->suspend_src_idx)
>> +		return 0;
>> +
>> +	/* Save last known timestamp before we switch clocks and reinit RTC */
>> +	ret = s32g_rtc_read_time(dev, &init_priv->base.tm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Use a local copy of the RTC control block to
>> +	 * avoid restoring it on resume path.
>> +	 */
>> +	memcpy(&priv, init_priv, sizeof(priv));
>> +
>> +	ret = get_time_left(dev, init_priv, &sec);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Adjust for the number of seconds we'll be asleep */
>> +	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
>> +	base_sec += sec;
>> +	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
>> +
>> +	ret = rtc_clk_src_switch(&priv, priv.suspend_src_idx);
>> +	if (ret) {
>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = sec_to_rtcval(&priv, sec, &rtcval);
>> +	if (ret) {
>> +		dev_warn(dev, "Alarm is too far in the future\n");
>> +		return ret;
>> +	}
>> +
>> +	s32g_rtc_alarm_irq_enable(dev, 0);
>> +	enable_api_irq(dev, 1);
>> +	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
>> +	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
>> +
>> +	return ret;
>> +}
>> +
>> +static int __maybe_unused rtc_resume(struct device *dev)
>> +{
>> +	struct rtc_priv *priv = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!device_may_wakeup(dev))
>> +		return 0;
>> +
>> +	if (rtc_get_clk_src(priv) == priv->runtime_src_idx)
>> +		return 0;
>> +
>> +	/* Disable wake-up interrupts */
>> +	enable_api_irq(dev, 0);
>> +
>> +	ret = rtc_clk_src_switch(priv, priv->runtime_src_idx);
>> +	if (ret) {
>> +		dev_err(dev, "Failed clk source switch, err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
>> +	 * reapply the saved time settings
>> +	 */
>> +	return s32g_rtc_set_time(dev, &priv->base.tm);
>> +}
>> +
>> +static const struct of_device_id rtc_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
>> +	{ /* sentinel */ },
>> +};
>> +
>> +static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
>> +			 rtc_suspend, rtc_resume);
>> +
>> +static struct platform_driver rtc_driver = {
>> +	.driver		= {
>> +		.name			= "s32g-rtc",
>> +		.pm				= &rtc_pm_ops,
> 
> pm_ptr(&rtc_pm_ops),
> 

Thanks. I will update as suggested in V5.


Best Regards,
Ciprian

>> +		.of_match_table = rtc_dt_ids,
>> +	},
>> +	.probe		= rtc_probe,
>> +	.remove	= rtc_remove,
>> +};
>> +module_platform_driver(rtc_driver);
>> +
>> +MODULE_AUTHOR("NXP");
>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
>> +MODULE_LICENSE("GPL");
>> --
>> 2.45.2
>>


