Return-Path: <linux-rtc+bounces-3123-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67170A2C90B
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 17:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBBC8188B0A6
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 16:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45259192B8A;
	Fri,  7 Feb 2025 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WgbqFmSr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2042.outbound.protection.outlook.com [40.107.105.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF10192B6D;
	Fri,  7 Feb 2025 16:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946316; cv=fail; b=jvmAghMf4NUijq5luGGLeA/duDUdGdsEqrUmlYhseKihcwaynDrxSujfvM7FedvAEseHZgb2Eo1m+PnxIDRW4eRls2LggwPs8TrWAVY4jXeOqUKtNP34FVs1i9s4PLlhQWz8V+ElPE6jD3EACcxGvTLg7IliiXWoivtuZ2AoK9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946316; c=relaxed/simple;
	bh=fcwD5zWKrpfyZYW0beyldDG4XBC0M8gdrxKTLUpaOjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JmRXqdsmkrAYWM07gG037PaQJRuA2O2ZjI0rC9oLymU72pLdsg751w34gEM7q+4+NistjsEndXAJptyA+GX78NJVpBSneAKY7fco0e5F80hOQIHe2yu/1aGrozB5JhdhENb2K0dTF+DUW7jr3jSaMQkpsQwxtSdkervG5iD0fIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WgbqFmSr; arc=fail smtp.client-ip=40.107.105.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/gtDSobUd0sG6mtnfju8rpY7PbZmjxYyI0MrXtRpceW8eGVSyr2xbLTHH6gGZnxdDO7lq8RoP5uWKKNc44NGiYfzqt8FRY0beZz6V0lxXZ+YHDB27CdJ16RZZwOQ7hX8pHLepv/+XxLD9ANcJe3CGtOWbZs9NqdBRN1Z4doFSteg/SabfWmI+Jrd6afcpk5XpwsVQTAxoofskr9IxBUtvnrY8pM1YGVfHNB6RF/HBOQyuBDxmWssEZ/SnL4OnZS6axgGnCnTOqYzwfx6MJ4a0ypGayO5XIGkX6+0tMDklqlFuWP+w0eVOLUKWPbfAWd+1zwjkqztQPbaZgF6/YwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDzHChIZASs/2o8/PGtaK4obI9bnYE+zAI0tToZUQRI=;
 b=T0h2//NTzXAgY5P+Cs9SWEJe+lVe91wO2lIq/4sx8uu2UE2qdEI3ahWvvHEJM0PaNJgOM6kPdwwHH3ZFPxt4A5+t+bA3i30r+U6Ni18m65DgUqPf/DRXBFCqv4AU7d4YCi7xU11q/A4rrUYBy8M6BbS3luNsyUcSAJVoMt56mvc2edh2oQGt0L/etjrazpnWh+A0kMsmXmkSm8By1j/0JPVSTJ9HRymLH8yJuk4QvXViRLCh9sguxENdXBdQsPMYajcJb1ZGGM3smbSLIibaY/TAUMOIABEvilv5pxTVF8bptJJqFbxCFdcV1dyJRmhYqNXYxG/2A7qHg1d3Oq1TfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDzHChIZASs/2o8/PGtaK4obI9bnYE+zAI0tToZUQRI=;
 b=WgbqFmSrYHoniA7nrOUMSje9SPWQq4VkWGq35EmUK8tCZtfNKZG7R5Fg6KrXJbomS+mZdp9V7VqG7DlglWOXcFcaFwvNSHu1eFwEtsJwiLR74bxxwQUGxZ1bWYPascECKXTPLIaYl43R/B9H3APuQHr0veG4mnyie6jlAFmWrnDUdLacH6Z0NvfsaaRKf69b4yTQ5ywGBY3sOmJz39w/MQlyicYb5O9XrVc1rCWkej9BGSvNzY8XHQZD3+Q8/9ldFrr52DJJjEgJq82bpcI6CRZvZkrBFa8Tm2c/gerr3uI9p4tB8cFZJ+joX5c3wCUt4vPBzvXOf9wNRWYT2jWyBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU4PR04MB10840.eurprd04.prod.outlook.com (2603:10a6:10:58a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 16:38:29 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 16:38:29 +0000
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
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v7 3/4] arm64: defconfig: add S32G RTC module support
Date: Fri,  7 Feb 2025 18:38:07 +0200
Message-ID: <20250207163808.1208552-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0092.eurprd03.prod.outlook.com
 (2603:10a6:208:69::33) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU4PR04MB10840:EE_
X-MS-Office365-Filtering-Correlation-Id: 984bc5f6-3fb5-4c17-455c-08dd4795d9da
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGs3cFlKVVdlQ2FrNDVCV2ZQNTNDU2hXQ0VxMlVCVXNwMFFsQ1FxeUhxY0Vy?=
 =?utf-8?B?Z3NzOXduc2gwZStlbjBhdkMyRXNwc3daaThmcFNaVGgxNlV2eGVpaXR4Y3dl?=
 =?utf-8?B?RWxSalVsMk54eVhTSnRtbnNsTkxCcnk4N2l6N0hNRE1lUlNxU1lzUjZVZHlW?=
 =?utf-8?B?a2MrbHM1WjM2ejJRenlvNXZtemFxVHpuejIreFRtUm1pZFMyRnQ4dmtZWjlM?=
 =?utf-8?B?VURkS3k4aUVsL0Z6eThBN1JQTWF3dU83S01WRjdHZGtKc1RWdEpjVlNCaU1X?=
 =?utf-8?B?OFV0enZkLzZjdkxmejduMWp1SDVWQXZvcUw5R1pubGZkTk1JWUVLTFh1eC8x?=
 =?utf-8?B?ZldkVC9mL2hHenhrVGhwN1d2cEtjSVBHTWZjdzJVMFcycVhFRm9ickkzL3k3?=
 =?utf-8?B?UG0vMjNwbEZwc1BjZmZoKy9qRXVvUGJjdnJ2cWRoM1EzclV6RGlvTGFrc2I4?=
 =?utf-8?B?RE9RSzZSdXNaZExzbFZmb0kyTkdlM0R0a0pxK0hHL203YXRjQzBZMVNQcVVC?=
 =?utf-8?B?VW1CWXl3Ym81MFNSOGJwS0IzMjZ1TWdBUEZHeEQwazF2M1NzZG4rOEtEUWti?=
 =?utf-8?B?eGc4SGthbFhZeWF6KzFWL1diZ2NhenRWNUljQllFcDhPMkh6dlZQSkdaOUU2?=
 =?utf-8?B?Y1JCNDc1QlRPazdFak5QL0JmUjBsNjA1UklrcmZJQnVSeTJJUjFtcElGOGo4?=
 =?utf-8?B?Vi95eDYxc21FVitwV1ZUVStPTFIxMGZ6V0lYK3hiVXhMYUh5Z0piWk1sazlO?=
 =?utf-8?B?ZWIySVZIZFRMRWhTbTJGSTVjTWtoR1dkV1FmK1NGeTJ2dnM1Z1d3ek0zY2Qw?=
 =?utf-8?B?Ym50MWRIK25iZ0V3aVlvaEovcVQ5Y0hzMUd5Uy9ZcmV1ZUJjQXlRVUF6aENM?=
 =?utf-8?B?VVFIam1WY1hlb3I0eXRNMTVKL2s1U0lDb2ZPOXpGSjFnR2hoWjByOWtMRGkv?=
 =?utf-8?B?YTMwelJxelkrM2poeVlBMUZKcmpnNFJlS3ZEMGl4VXJOYTZybVZKa1Btbm82?=
 =?utf-8?B?SmtDVW5zMGsvWGJ1MEF3Rjl0aG9LQkFiRjljMllQSTFFYy82eFIwdXJXWDdQ?=
 =?utf-8?B?QmdKMDV5VGpqOFM1NkhOdUs4ajVpbHhoWnQzdmZnUXhzcUVkK01Yb25ZQVVP?=
 =?utf-8?B?K3h2bmcwZzR4K3ZyVVdIZkluaVhoT3lWdTZTeDBLV25CalNLaHo0bVc0dHVl?=
 =?utf-8?B?YlhZcEhpMStIWGdDeUNMam9MMHYwRXNsVnhvVitPek9PTFhMVVIvRE01WG1Z?=
 =?utf-8?B?aTBFWlVVV0k1WkxhMG1UVUl3MWF4WWVrNVkzbVVBcDB5Z0RoakgvaEh3MnNM?=
 =?utf-8?B?Z05DbzIzQjJBVDNseXdKUy9KQ2dTUzRoSTJXa3c4SVZ6WGxaR2FicUdEWG53?=
 =?utf-8?B?WCt1L3AzcnlFQitNZjcvVnRLTDZYTTNVTmt2VXgya0MweXRnMFY3RXkvQnpI?=
 =?utf-8?B?bUpmRUxydGVITS96RDRScVByVXBKY2lNYzlXT2ZJL0piZ0RMdzhlVkQ1dlRS?=
 =?utf-8?B?djdkMW5leGJmK3U1SWRlT3N4a3RIaDRpL25adlc3NzhibWZxN1ZPS04wNUpy?=
 =?utf-8?B?aytrdGRBN09vRHVFWmNHNytEV1NjMFVuS1pITk9YdzhpRDdJMkI3ck9WNFFq?=
 =?utf-8?B?S09jYWpSQVVVQkI4d3pKZElsUzhKZGJBNHpsRlZubDQ5NkRvNXpYSWRtbm11?=
 =?utf-8?B?Y2syMXhQSUQyYVpNMThOaDdRQVNXZ29FYVBlTjhtcElpN3QwS1ptb1dGSWs4?=
 =?utf-8?B?ZUxHTWlnSEZrc0N6bkJaNVo3dFM4WnJ2Unp3N2YxUUdiM0QwYXRHeFdBNkRs?=
 =?utf-8?B?MkEwL3dtWnI3UlpYVU1lOVZyVndMQnd0RllMb2lIeXAwYnZ3SFRwWnhrMnZt?=
 =?utf-8?Q?k+CPS3wFwk1FC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVArcm5mS1lGdlNXM3pYa0M5Q3lETUY5Nk1CdEdTVW1aVXF0VU1jaVJPK3VT?=
 =?utf-8?B?NVV4dURDS1ZjaGIrQTJxVEdVendIQ0hFMThvNzVRY1lhanVTekNpL1lnVStW?=
 =?utf-8?B?a1FzQUtMUDVhVkRMbDRsL2VmOXJyQm92UHBlTmRWS2c1bkloQ1pNL1dWTWlp?=
 =?utf-8?B?eWo4WUFiMXFhY2tzcnZuK2hzN3Rta1pIcXpDRzMwbVUrZUZhbjEvNUhNZlZV?=
 =?utf-8?B?aW5rQURDWWhwTDVpRDhndTJCcHk5MnRGWUlJQ1lsZlBMSzBjRUtJVHlWR0tM?=
 =?utf-8?B?NGxVN0E5M2p6Tlh4VlJqbVlBWjRJVUlhUjRtMjZDSGdjeXBkUWlzYkNKcnFP?=
 =?utf-8?B?b1pIYVFhbUpnNDNBYm15Nlh5aE1aN2hhVjdIZWpTd01WMnBzcnVLa290cFNz?=
 =?utf-8?B?eWJpYjBjcTJFNkd2WEpuSGFWNGZyWkF5dWN6RDVSN3lFR1podHB4UDZtZUxJ?=
 =?utf-8?B?OWhyMEN1MHFrQ0FPd2lrcmFrUW1DeWlkV1Iyd3Bzb1N2Y053WGxFbEp0SS9N?=
 =?utf-8?B?NnVUdk5ja1JXTUpWNTdVdER4RVVFR1dPZjZ5THJsWkUyMU96L01RR3JVZ3dS?=
 =?utf-8?B?Q0ZaeUR1WFBQSVBtV0hLUGNOVkdLblZJSjE1a2VYUC9rZGs5K2FZUDZ0OUpq?=
 =?utf-8?B?Tjh3NWdrT3VQNEFnclZUYkYycFd0TUVhd2xmcEhnTDlKNVd2QS9reVpaZElM?=
 =?utf-8?B?S0JWbnVDMURIWHhGRUFQYVA2cHYvVTJkLzdvM2kwZytMQkRkcUY3eGtYSHZB?=
 =?utf-8?B?Mi96YUtZeDFDN09jbnJpSHp3UTRzS25NejRGdkZlazNSWlFFQmhCaUZUakQ1?=
 =?utf-8?B?TDFNN2pXNlVCdFhybHREb1lHMmkwdmFRQTB2VnAwYVVMaDJzbW9uaGVVZVlB?=
 =?utf-8?B?L1JLbk84dWRFYUZybU82Y2ZSa1BVd1RHOVNHZlFqQjdibmo1bksxTkdPM0Jh?=
 =?utf-8?B?dVplSnZlb1NXaUs0U3V4RGhRSDkxL2d5WHFwYThGbW9JQ2YzeDJDbU91YmxG?=
 =?utf-8?B?YWthelhFOGJuejRZRlN1U21QRzlBa016TmRSN1JFaDdtRjVtNzZhWjkwMWIv?=
 =?utf-8?B?clN3UzVPeTB4RVdwaGsrUi9LZitwOHdVOU9yVTIvVmtzSVFnWjVXZzZBWDB1?=
 =?utf-8?B?V0RSU0JkZFVlWlVhdi9LODV6M2U1d3Y3YVZFK1czRUdteFlnKzRobS9uYS9Y?=
 =?utf-8?B?R2srSjdUYTViWWVMcTU0YWRldDB3cWlsY2NlaXdTbk1GRTB1Q21udGx5MFIx?=
 =?utf-8?B?Uk14NVBBMHNwWStkSzM1dDZaaWZDVmJ1ekhCTVoyR3paaXRST0I1d2U0TytU?=
 =?utf-8?B?dCtQcHZ1ZU9STWtsa01pZzhGWG9EcVhBNmFLcVNsM3ZrU0dDZmdkWVQzNzNr?=
 =?utf-8?B?ZlNCb2o1eDlWek5hQWxaNHVDelZrVU54dC80QVMvWGNDTEhvUnpPRXNqRllV?=
 =?utf-8?B?bHc1QURjM08zblN3NDVmdVZ0MXQ5YjgxMEpCdTJ1T0VPalU1ZXRQSk1FYWxs?=
 =?utf-8?B?eDF2Mm1ySHBXUU8wN3FYbVFFSk14THk5MmFtaTdRQ0JiRDU1empSbGpIUUVP?=
 =?utf-8?B?VC84REswQkpjcmNoRTRubjJmOFM1V2Y5RUFtNGxFdmxSWGQ5QS90SndqTTds?=
 =?utf-8?B?QmVZNTBQZlNWS01rMGVXNWRLSStaOFROZUZMSURiQ2ZXb1psSVZ4QSs1b3gv?=
 =?utf-8?B?YlFSYnlCbHFTMDNjOTA1dGpPYlZLN2NsN0ZWV3RiOWFocEZRbkEyemtycTdu?=
 =?utf-8?B?TWxXNnIrRENsVWhraHdGdGtUZ3dRM09kR09SMklCa0tDNWcrSXlEenIwOGpF?=
 =?utf-8?B?TTI4cysvSWFjeG1pZ2p2elRVS2pnTG5sOFVXamhTSDVOaE9XL1ZvRHo1Q00x?=
 =?utf-8?B?emNMZkgvTFIwNWlGQjkrRXBZZFlFL01rbXRmRFN3Y0xseG54ZU02b3pwNnky?=
 =?utf-8?B?ZjlNUFZnanJaV2s3aVRFeGtXL1VvRmRxekk3aElKYmx5THZFcGlQSUxHbzhL?=
 =?utf-8?B?bGV2MWt1aEM0czZJWDlGbFFVTmdqN0w1V0hNZ29laG96R1d2VHcxbjVkZzBq?=
 =?utf-8?B?UnFrMmNoNSs1aUFnK3V3anBsT3E5TE54ZHgwZitSS2tBTVVzWXNRemo2bXpz?=
 =?utf-8?B?RFhVR3pxTlVKbjRtMTZjSURuMzluWkMvWUN1UGxtY2RZK2N5SVludXBuVGQz?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984bc5f6-3fb5-4c17-455c-08dd4795d9da
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:38:29.0615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2IsawnYqKlFndg6/EtAqkyQrGamKdbsgabnlS6x/wVIMoOlnwCz47tZlJIPpA4cpCrTnGTH/ZlyuC7tnPvcdDLSIWy76Bo4CZyKUJqRDjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10840

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC hardware module present on S32G based SoCs tracks clock time
during system suspend and it is used as a wakeup source on S32G2/S32G3
architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..c24b88b0206e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1227,6 +1227,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


