Return-Path: <linux-rtc+bounces-3120-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A8A2C902
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 17:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35C2016A0C3
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Feb 2025 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F69C18DB00;
	Fri,  7 Feb 2025 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ShK1O9eA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2046.outbound.protection.outlook.com [40.107.105.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D9E23C8DE;
	Fri,  7 Feb 2025 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946301; cv=fail; b=MI6QtX6b3Hj6D3Jph+xe8PCboH95+igKjttEHjPGzluA/9s98YUS6rWcpAYRk6pPttRT+FxMtz4LLDieF0RojPrmoCIXxfdrRIQM+geCiALShEwZlcPyPaOSG+td44eetbCM76N/MwlHr8F3d6Ets/yPZvrZPMyiJnNld77rjHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946301; c=relaxed/simple;
	bh=wS4K/S0fUFdHelsmO7qEUuMBmV70NJ0qJxImYpH2pjE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EswIfyT+8/DLPcXO2vHhHj+hiQuKpt31RpgCkuSIRpMsB4I7Z4RsyQ+GzGD4PIbs8djGgNddvj0hmrvP7WxeZBXIyLIsL6QApHNKezC7LiOsaId0O3sYj3PVgejgBDaCYVLEr1GnisMNTF+g7GlH3fdqArDDWltker/jJy1NNNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ShK1O9eA; arc=fail smtp.client-ip=40.107.105.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWAAQZGfLdzSDcAkf9PrCc3b48bjQufkQSd0pLWK3vJwmw4u2NvcLXL18smwnCGQTlIx8b5seq2cViELn4W+FPIEGPFZCQlzUDFg/Fhmrov96tGQ/jhvMtsQsWJCvfmDuua3uSd/OIxYWwS3KtyJ0LMjtT+iGR7ptjJ6rUkwhcpH1f7ulNAjz5iDJA8lsAG+CKX/dYDJkZonodNaql5wl+oiwkEhyvXoSMjw6GDrxdHnUYJh2qAsmnGNn6Gg/AH5d0loed1jsWoxO2laaUbsY8DO4RAOfBUg86v3CsHiJ1qsG6wq5WCvtvFrKKm/Q7HIzl19TzTEfysOeYO0y5zJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqVXnWGF1TWgmywzXYv9Ek6t7rHKazexFVa/d8U0OdY=;
 b=Q3gucbJqzxZSl89hT3c83C04Xd3w325WVIXXgZ/PgCmA9h7OsN4I+SiLhr1EdOg52gqX3KtM9NS/JqV/oBBFhQG9/+oonulQRH050zvqaYkPGQRKuKTDLuN4PGx05siogGS5UQbXjWomBHNAzC6hriPVXDbdOU3hw5XGScTMIPs+W7pJwNfgmWb5Tcn92ottzvIIBt8LpUbvAPduXWL1TUCVyN4OHhZrKl1eCd9ZytUTqqsOuCdzCGJ0xhyqw8kVSUFZPf2dl6dbBiaSw8VTQTLWbGAGm/jWpwzqPrSnFbkYKtJm4Ei7ZYDFZghmpbdkrqEY+ycQ7LipHAKFZr4WFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqVXnWGF1TWgmywzXYv9Ek6t7rHKazexFVa/d8U0OdY=;
 b=ShK1O9eAajFjJ5AmraUUgI7j0F8Ynw+eP8nQxKSj+M95eeXEBTrq0ifdJZMl18m5Abgs9fZfWMaPu4mcBdK9KPMVXDrf1uyzTj6qHk6Bo8KpIjdGlai+tCeKOP84xJ2TeB0HoWxtkq6kQjvKf39/lbi4g1/PsiPo9hnlY9MMAID2gDihw6NQrfm+40DI/UzXtAZnvOYGZKDsDqtI5F3vbUDC4CxsniLv1MfQbTPxGMbsECsWp5SL89KvezByIkUnk++TSKHD2Lzceb6s8iXSvBI3N1/P1t/KSja33AJ36n4EAUW5EfUP9W8k5zjPD+Qeg9Ql/m7X3HSVjsubcm2o9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU4PR04MB10840.eurprd04.prod.outlook.com (2603:10a6:10:58a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 16:38:15 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 16:38:15 +0000
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
Subject: [PATCH v7 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Fri,  7 Feb 2025 18:38:04 +0200
Message-ID: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR03CA0085.eurprd03.prod.outlook.com
 (2603:10a6:208:69::26) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 10c41b6b-a068-40df-4d4e-08dd4795d1a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnRGcHN3YU1UZVpsVjMrL21Bc1VLRnBmVlU5YXB5Q29nazZKM05Yc0NleXY1?=
 =?utf-8?B?dW1rNTlXZ2k4T3JDS3RGRU5pZHZ3NnBWSG9vYllTc3pueU51RytVdnFaOEZs?=
 =?utf-8?B?b3BNeXN6cE91UElsRm8rSlZ2YnpGTVV4NW5EVC9obkMwL2JzN3BRdWRCa3RI?=
 =?utf-8?B?TDF3b1ltU1JjcUFxMGNncC9ZUlY1WE00cVZHWmR1dWZEYUsrVUJZYXBIQjBn?=
 =?utf-8?B?Vmh4UW9IVmJhT0Y4ck1NQm5vTmExajUzN1BUc2ZQaC8zSXh5NHJDQWFkOTdI?=
 =?utf-8?B?YlFZSVhrZkhVeE05elVNZzlMRVh3a1J4Nk9CK0lmSGF3RjVVNERiZjhycDN1?=
 =?utf-8?B?UWNDS0prYjN2Z1cwUWRVenBOSjdBczFPS0VqN0ZPWHpmS1lpTWVzbzZZTGh6?=
 =?utf-8?B?dGo2Mlh0bGtpZUZycEdBTVIwaTlZOW1WaER6cDY4amFwb0JmRW5Obit5eWNk?=
 =?utf-8?B?SnpST01RZFprMDR6c05ZU2lxZHB4d3c4WmQrT0xVaGZhaWU5ci9pVU9LMkF0?=
 =?utf-8?B?UG53V1gwd1Nncmx3SGJVRnc4d1RtbGMxVXRkdllFQzk3UG5sMHgreGJxNFdh?=
 =?utf-8?B?TWg4bmRnWHAxZFdab1NtcHpITTdVUjFacG0rRkU1YWRlVWpmUGhkbHVuM0xV?=
 =?utf-8?B?OUFIeUtZc3FNcjIybVc5b2I1VHl3SDc2WVc4SmNUN0grdzJQQkI5RmlMYTdr?=
 =?utf-8?B?cW1HVUZpeXRWeFdxTDYzSllnRXdQdHZDNXBCUG9VZW9qdi9FVGFrM3E2cFZh?=
 =?utf-8?B?eTFRQXNrdFNhQStaSG9EbUhpeElXU3R4amF1UGJnUFhsT1RsdXNYRGRrVnhx?=
 =?utf-8?B?eHd5SHAwTXgreW9lUzR1UzNwZkNsZ1o4akRiTWtLU0Z5TUx6TVdOLzRybUZs?=
 =?utf-8?B?OC9Lc0pwZUhOWXdpMzNCbXhmQ0NJOGZlOHR2elJEVE1WSU0zSGVZTzAzSmlI?=
 =?utf-8?B?VFdPWTUxYTdNck0rYU1NbmxZZ2JzL3JQbmRuZnJocXRVSlhDdEZPZzhlRnl5?=
 =?utf-8?B?em1CQ3lSVjl0L1BQMXluUmg5YnB6akJBM1JkRmZjOGhZTktDQWFjSnY5eC9V?=
 =?utf-8?B?aEhUb2oxY2dscndPdDZ0STF3aEw2TGQzRmRQS1J4RXI2L0pLM3JmeU41bmhv?=
 =?utf-8?B?eEhCaWV6TWM4MFNLMW9weGI2eWgwbXNkUzlGT2pnYkU3TnlFNUwxSFBBNEp6?=
 =?utf-8?B?SUQxN3dsWUd2bldpZk5EMXkyOG1WMXRKU0NVSVdDckllQm8rZlYyQ0ZnSGpu?=
 =?utf-8?B?TnRwRGdZVXVmMTBVTmpIRUpkS2pSaU1KOFhxVHAvOVYzZUNkdVh0QkpUWjJi?=
 =?utf-8?B?eFRGbExNRlFnWnNEcXRxaGU1WldvSW1KTFc0VTdabDFHUTkwMk1Edm5xN2p2?=
 =?utf-8?B?a0dVV09OTWxSaGRoSHhqSGNzUmpKbXB3RlFPKzRiVm9UNzhibHhBTktpRHJP?=
 =?utf-8?B?dnBMeWIwcnFGRnZYaW9pUnI5QkV4RXV1SFN4YmQxMEJCckhPMzBOZzY1YXIx?=
 =?utf-8?B?VjFCZ1haSURUTFBuRVVkTUpaSndlNTdHY3VNNXN5U0M2azlmV3FYY2Q5VlY2?=
 =?utf-8?B?SmhKTUlvekIrbGJxRDN0eTZmMFNDN1FLVWV4b3hCL1FOZEUyUm1oQVNHdmpY?=
 =?utf-8?B?cDlSYVlYT3h6TkZXZ0Q4bnNzeFB3S3ZoNzlLYkk5Lzc5ektvSitVZ0Z4MkZ3?=
 =?utf-8?B?VmZWQjF5bkN6d3NmcUd2cXBZanA2OWM0MTI5NGlHdldneEt2dWNjQ3RLWGZj?=
 =?utf-8?B?cEttajBGOW1UWUdtSElSRFdTWWo2em12ODdkWlhkeU1ScUNmaEQ3RTlZTXNJ?=
 =?utf-8?B?UkdHQXJFYUl3QmJYMHFqdFZZaVZIbnhFZzMvSWV2ODExV1VqaUl6ZHk4aXpn?=
 =?utf-8?Q?hzeJzB8M3/+6m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXN0S05MdHM0enNhZ2UxWVZKSUxnMmpsazJraGNqbGVFZ2FZVDdoWGM5T3NJ?=
 =?utf-8?B?cXVLdUJ1OUpWWG0zKytjTkJxOStTYnRMWCs1TUsyam9qL2NtcktPZ0Ezb3Va?=
 =?utf-8?B?SkNiMDIvNG5CTDhuTkZWZnNOWGNVZWhjUWlyY2dIWDNxZklVMVVCa21STGp5?=
 =?utf-8?B?Q2tkN1BaaDVhV2RnU01XcEdPRjNTNEkzd2luRGpaeXVLL3RmUWY4eXMwSU13?=
 =?utf-8?B?Nk9wTGhHaTBaOGgvNUhtOXBkb0t2V0xSSzdKTEZONEE2S01VRGpOVTNqRmli?=
 =?utf-8?B?SU4rQjR3endWYWJUUFlteHkxMS9RUjFXT3ZwdUt5bm5QbWVIdDJWY2Y5Y3FZ?=
 =?utf-8?B?YklzOVNpT3l5UVVSdmZoUndaZE1zdVJFWVpJR2lraW5EWnE4enFiSE40NjlO?=
 =?utf-8?B?Rll3RC9WOUJJcW1BR1FSRkNEQTZIeTQvYmlMenlUMFZYMkFjZWtwNjRtbW51?=
 =?utf-8?B?bU5NeHdrY0crbmZSQ1NZYlF3NHJVSXZjTjZGVS9jcnUxTHpOZkZCd1ZNQlhz?=
 =?utf-8?B?aUUvb280UUk3SkF6V2JjVThsR0dTT3Ntb2ZLY2pvM1pRZ3hlWW4rWkJkSDdU?=
 =?utf-8?B?T2VyY0FWL25GektGSXU5TnNOeVBXSlVTNW4yWll6aXlRVTR5YTF2QmZXS25s?=
 =?utf-8?B?Tit5a0pxcHpKQjhqbU5PM0RYVVBCQlhUdUtNRnZHVG83bThQUnI3WUtsYkdi?=
 =?utf-8?B?UXVzK2IwQW1ndHlRSDlHbnh0Mm8rbjZwTnZ5cEwzTE1YUmdwNWxJSUdRMzVJ?=
 =?utf-8?B?VHp1VnhvZUdoVjlnOWRmd3hFaWliN2NsS0tDUEgxWHVhK08rOEttZ1hwS1ov?=
 =?utf-8?B?V0hJdVZZWFN1aENqd0IyNWtnNGI2MzhZV0NEM0szbGRjNDZVZFpIMlQxMkhF?=
 =?utf-8?B?NkJNVTJHenVzQ1Y1TFp1cWlyTHRnWGFGQm9HVm1EYVRoOFlTbURBUkM3d3A1?=
 =?utf-8?B?VUhmYWlJUXVFUHJSME9iRGxCZW9qSWFOOEpHV1BOd1U0RnM3QlA5VDlodE94?=
 =?utf-8?B?aGhaNXF1QTJQSGtMWU9ZVTE1N0VHQnVNR3NMamZIWEdQZWJvcDBSMWpUdkJK?=
 =?utf-8?B?cVNiRWNpRDRMMEp4MzM5OTRTdVM3ZjI4TG1kUllUckxmUnA2Ti8xcVJSUE03?=
 =?utf-8?B?THQ2Q09ZdVU2b0JSMy9sWlY4Q2djbjZ4c01yMWNXeE1Ub3BIOTRMK1ZIalZV?=
 =?utf-8?B?SVl4NG8wNlFnY3A3bTAvMmU4UXgraXMzaHR0T25STUxSR2xjemdHRlU0dEIw?=
 =?utf-8?B?RWxJUmZ5QUp2WFdSWEhNQjNvTG9hQ0RHOWpuYTNkUDl4UkxkeHZua29LaitH?=
 =?utf-8?B?SkQ2bUc1Z3FOckp4WVRCNzU0MTFLQ3N0RzBseVU3RWlxSVJQZ1EzTzJRNS9S?=
 =?utf-8?B?S2M5SEpPdkJWenFROVhmelZyRVJyZFJKelZVV0lWcm9Ickd5UDVJWW1qdG1G?=
 =?utf-8?B?Tnd5ZVJqZjNnNkxldVYzR2NjUWNKb3VqTlI5dXJId044NGRjSU94SUlZMGVP?=
 =?utf-8?B?cnBMODIwRmNDTkJWSlIzVjhtOFMxb1NldlU5Q1hCc0tPanVtQmpwaFFmMTBG?=
 =?utf-8?B?d1R4OUlhaDl4NDRCWktNQVgxSk5MNXppVnRTUUNOWFFoa1ZGY2VnMTJHZHIw?=
 =?utf-8?B?ZU5FL3Joa2N6c2JYOHUzeTd0WVAwUW1qRG1NV0FWRXBYUm5nVE5FRlMrcDg5?=
 =?utf-8?B?d21yd3BoMk1XWks1MDZpbWU3VVdOSmtwWGZUb1lvSlhiT3FSaUp2Y2dDaHhW?=
 =?utf-8?B?eWFmOXA2OWczbHVyaWR0aitlcWV2Y1BHNWhqVTlvc29iYXNTaDREeHREeGJ5?=
 =?utf-8?B?MHJzTERxU3E5V25KNVljWjBieStIUnZ5M1JRWG5SamMvSm02VENMNkZMR2dT?=
 =?utf-8?B?UW1mTExOMDhsNkR2b1VNMkVJS25qWDZSUnk3QnNUdVVwQXhLYVZEL2YvbnE1?=
 =?utf-8?B?di9VdXZQMExuNXdBazhUSFZudlFmMG54aVY2UUJ4SnJBNzNPemtjeEQ0ekF4?=
 =?utf-8?B?UXpHanNzeUZNVlAzSFk4aGVGUGsvUlNwNmsvZStPRHR0UGRwRUI1ZHZQZXc1?=
 =?utf-8?B?Q2paTmgxR1FOK3pjMWEyTStwV0NjQllUL3ZKcTV5cGRXUkpXNjZWbnNPQ0Fn?=
 =?utf-8?B?MFMrdGpoUWpla0xqVXcyR3NjY3dLSGRnUkxiUm4yWE9VakR4dmd2ZjlybnNq?=
 =?utf-8?B?VFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c41b6b-a068-40df-4d4e-08dd4795d1a5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:38:15.1573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNtqwtrcy4+XJMkpqNqH5tbJQ+oKK3t8Rk5YDLd378Dgm8xkTeHUHYUPK2YDmpp1iyf/mcdjUROQCi6bXYwk+tXjzT5fOz7KrIAmIAQJyYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10840

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP RTC hardware module present on
S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It is used as a time-based
wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during system reset.

Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
using userspace tools such as rtcwake:
# rtcwake -s 120 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V7:
- Changed 'ioread32/iowrite32' calls to more common 'readl/writel'.
- Removed calculations performed in 'suspend' and 'resume' routines by
  using RTC API ('APIVAL') functionality instead of relying on setting
  'RTCVAL'.
- Simplified 'set_alarm' and 'read_time/read_alarm' by usage of
  RTC APIVAL functionality and relying on kernel system time.
- Added comment about the available RTC hardware frequency divisors in the
  RTC driver.
- Used both available frequency divisors to increase the RTC rollover
  time.
- Removed a redundant error check on 'priv->irq'.

Changes in V6:
- Fixed a coding style issue regarding kernel doc reported by kernel test robot
- Refactored small sections from the S32G RTC driver without impacting
  functionality
- Fixed an error probe path issue on S32G RTC driver.
- Added 'rtc' schema in S32G-RTC bindings

Changes in V5:
- Removed rollover support.
- Removed clock switching support between Runtime and Suspend. A clock source
  which is always available has been used instead.
- Enabled 512 value RTC hardware frequency divisor to achieve higher rollover
  time
- Removed unneeded 'remove' callback.
- Decreased driver print verbosity on error paths.
- Provided 'clock-names' actual names in bindings documentation
- Remove __maybe_unused notations. Used the DEFINE_SIMPLE_DEV_PM_OPS() and
  pm_sleep_ptr() macros to handle the .suspend/.resume callbacks.
- Fixed some alignment issues.

Changes in V4:
- Dropped 'assigned-*' clock management approach. Simplified RTC Runtime
  and Suspend/Standby clock configuration.
- Simplified error paths on probe function
- Removed node label from bindings example
- Several cosmetic coding style fixes

Changes in V3:
- Removed 'nxp,s32g3-rtc' compatible string
- Change to 'remove' callback from 'remove_new'
- Used 'dev.parent' from 'struct rtc_device' instead of defining a
  specific 'struct device' in driver data
- Fixed several errors reported by kernel test robot
- Removed 'assigned-clocks', 'assigned-clock-parents' and
  'assigned-clock-rates' from required properties in the binding
  documentation.
- Refactored S32G RTC driver such that a default clock source and
  divisors configuration will be applied in case 'assigned-clocks' and
  'assigned-clock-parents' properties are missing.

Changes in V2:
- Removed 'clksel' support from dts bindings. Used clock parents support
  from CCF to better illustrate the RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings. Used assigned
  clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  72 ++++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 383 ++++++++++++++++++
 6 files changed, 470 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


