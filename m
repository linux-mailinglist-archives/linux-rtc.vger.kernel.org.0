Return-Path: <linux-rtc+bounces-2626-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6068B9D9666
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E667016847E
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404E11D47AE;
	Tue, 26 Nov 2024 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P/FCvkBT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C981D4359;
	Tue, 26 Nov 2024 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621478; cv=fail; b=svVCzXlJs86DScE+gkETW1/4J1v8z/CiYDlCSE/2NAy2OitYHfpwryN+4qXnRCWIB8k7oJohHFiX/+DsIKsqjFmMsybivRk9R9N+Zq7pBtzqH6bTl1pPtuojPC+vEAQgbS+hqV9rbpL98XxKK6kvgUd/EQDX9wwaeIEus1IF2Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621478; c=relaxed/simple;
	bh=29cp7YMCqHQRGq0isxS4uMh3P4LeDbfkrIl+b4C/9ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RF+c8MYXsJDagpTQ2qH1VvbspfI9FceslzYgkQMlkjsOgFTFlRIgh0eRikdDoDpS530lA+p/JSgbqVKtNYVYtB85d+ntAUK2S7FeJIOwimUYXoemuZN5JVnlnydsEy7NIn4BAneQW4X1g9BDB9q7ZIBlg2o3xI4iMnqICMumq74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P/FCvkBT; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3+6YZ4TRMufGOsYC5bNs5G2hFif5CmDsxeG+k5r5bWNgj6CjTh8Fh56CsttAZGgyjETlzTezr5oijTkKsYR86k33x4azO0cXZVGT9PnyoJDQE4YspDfrB3S3gQFQzuYQQ18kta5Y9C/Ak2MAEzxNQCPWQkFc5VnUXCjit021QvzZfXIhnj7ChniNRQJxVX4UREMiuxZlL8gCqTLb42My+l/2Dtgszr3b87mKYuPKwzG1Cxip/AA4pHA8wtpMYrC408WKaYrC4zgeufK9Fl7D9Tue4zvBaBvjInpH9a/L6YaU0JAwhatGpSlgszbX9lzKmGbzI9eajVw80l3xcbHZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0derk0A4gYZSIDHSeyION8Fpy0ivcixGlsvss2G4kU=;
 b=opHtRNSGipWA4fgxc0263q7wWYLE3NQYY59Dmc8gLZCHMcXLZUyZ0Z7YBoujj+KLkoVjnCq7zjHfV/+6Z++2sKpljjwEa7CHBmozmbD3KWDQojCVqSniYyEfpyDKgY5liuESHR0wvmB30PsGKlnu2HzFHvMKXsygUgENf61E+Q3NRnfm/oAMYZHLAgTM5Ny7eq0jsfzGwFGagjZlT5r3+d32Uif3wF9jlsRQ4xECt3tXOwM1rXUb85OlHK5yJe3v+2RJccr/UNEHEv2dpI0jLjUOJ7tUWU0nLHDv2UI/89VEkw4AYlDVCgD2Dp2ywFmfW00S2roBaZOhtsnlDC4mDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0derk0A4gYZSIDHSeyION8Fpy0ivcixGlsvss2G4kU=;
 b=P/FCvkBTGUK37gbogdHl3rU1GvxBKISNhgwpIT81NOvC4TMGJB9iwNxbYqzVmZIYdw0hxprnp8nTdKbOOpaYbMY65294nj6eBj1XlkE6XrPcLNyNGN/1eO/W3/PByd306+/Y0tapdNP+gJfV7ngMrWpZQ71fv0XgYWdBkBfumJGVHpLU5wh37yCyBuDgDAgAFzIWOtNWzN2fXkF7hfPu5M3vVGtPs+Dd64RQr+7O3Tkg/RscBNiU52W+BzIhIUA1RULZNeaKQxODR2dcazTwWQuZ23FinGlfk35NVTV4fdMKpMlo4VkStQS8zy6EKOBdk4/4g5a0QnYHZWlsXxoSwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PR3PR04MB7339.eurprd04.prod.outlook.com (2603:10a6:102:8b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 11:44:31 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:44:31 +0000
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
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Tue, 26 Nov 2024 13:44:14 +0200
Message-ID: <20241126114414.419469-6-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114414.419469-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::6) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PR3PR04MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e86710-012a-4dc9-326d-08dd0e0fb0c6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0N1NDhxaUVKS3lubDBWRWdJcWdyOU9sVGVQSUJLYUJHZHI4Y3pzR1VKcmI2?=
 =?utf-8?B?V1RvOU1hR25EZU8wdGszTVpOM3pmMnoycnhsZ25OR1BEMTIzTnRjWEFEbllN?=
 =?utf-8?B?RDRvbjlVZm5JcUtjdDRlVmZUcEJBd2plMEVYcFJ3RS8xOGtUejBVb3dwbXpw?=
 =?utf-8?B?Qlg1RGlpNUltU2d6cXMyTzFwSnQwWThaWlg2eFRzVWNmWUcxT2RZYm1CWXpF?=
 =?utf-8?B?WjlsSjJOVTNkWWxPWHFOK25rc1JGS1VMU3oxWFVGYm9SWnA1K1hzU2tZZnNy?=
 =?utf-8?B?WTljeC82ZGV5WldHaGFheGRsR3g3WlhxRE1YQUl5aFpRdzUyc1ZTNjVJYkhK?=
 =?utf-8?B?Y0FlZ29IdlFhOUY4azkxUXlJRzNvUmJWeThKSndKanRvNXBXdmV1cTdSSDdy?=
 =?utf-8?B?dzFEbzFLOG0xVnpBNndvZUtucHMrNFpueitsRTdCWUN4amEyNmxkVlNpaWZn?=
 =?utf-8?B?aVhaOUREZ1B6RytSMFZXSCsyODdCT1IvTDVBV2lvUStYMjFJdElrTjRwa1NC?=
 =?utf-8?B?ZGhyTjMvNlZ2cEM3R2d2d0FtRUpTUG4zWW1uN0JOelU5RkhFd0Qyd3NQWnd6?=
 =?utf-8?B?TVk4eGVUdVpmbG1PSTBrU2ExQ1NnZ3JwSDI5VlM4UEVxbTNIZDZqQWQvcHJG?=
 =?utf-8?B?L0YvTWszczNoYlgvNXJoK1UvYVE0eThLa1VROWJvV2p5b0gwdFpYY0hCbFFq?=
 =?utf-8?B?VExxMEFjVTVwNkYzU1hlVkR5a0UwZ0lLcmQ4bjFSN2psV1o1N0tHbjJPSTRE?=
 =?utf-8?B?YzF1R1R1STlMZ3VqbFlHTFoydDFTUGVNWHdZY3JRYisxTDJHNEhpc2ZudDVv?=
 =?utf-8?B?STV0WXZnSUp5WHFSQWVYUXFJbHZpK0tBVS9RaGZCMDdQbFFwL3dCM1gzSVdR?=
 =?utf-8?B?dTJhN1ZoUVpjMU5FRFBGVDVpaE83cVVkUTZ4amxLWk11anh3VUFNMGZZTHVW?=
 =?utf-8?B?NWRvWWt1ZHR6WC8wT29xcDhjMDc2R3pWdVRLM2lUSzcycUdOTFUva21sZ3hm?=
 =?utf-8?B?YXE0RTFyUTBzNWkwdGVaVmxaNXB2c2xsMS80aUphbWRIMFZDS0gxUGNkaDlP?=
 =?utf-8?B?eE1OR3pzQkVFLzZtNVRYRTQ5YzFnaWVET2lpUWpwVmNGb2QwRkFVWkNOLzkz?=
 =?utf-8?B?ZG5WbExiU1U0QkVJSmNHOXZ0SXpQQ2wrY0N0eUxDWEEwUC93RFVVUndYNEdG?=
 =?utf-8?B?TVo4bzhpYjdHVjhFQWcvR3ZYWHhGOFVmLzNWTkZyZUUzWUxGdWRpT3BhOUsy?=
 =?utf-8?B?dWlLRW1HdzRWc0ZaN1FtaWk5RXBJcU9MSnRqZHRXN1duYy9NcUxMNEhNSUlB?=
 =?utf-8?B?dXdFYWZ6YjZCckxpUGp1V2dJTEZ2YVB4bGZ4NXJoa1JLMXB4MktlWWh5MmMz?=
 =?utf-8?B?MEZicERUUno1cHN2b29PMTlKRFErVWVTZlFKZEUwQlV3VWdnN0ZFQ0xTQ1Fm?=
 =?utf-8?B?Y2lkL3ZPUnFyQktVMjRzc3FGQlpiWkQwc2xXeFJEdnlSY1Nhem01Vng3R1Mz?=
 =?utf-8?B?eHVDL1c0ZGplbGlDT2svYUFHSU00aHZpTUsrZWFzQStWZmd2ajV6TkRsWFU1?=
 =?utf-8?B?bmhRdktQNlhIZyswU2hQUFlnMVovVkxnTEpkWjRTU0VyTlJBOTJHbHMvYzcv?=
 =?utf-8?B?TDJyNTBHUFQxczhnZUxEK1dqTUpxMDY5enNnOVJiNG1LSFNaUXNibmpyS0Js?=
 =?utf-8?B?S1E2TXRmcDNMZGxpanFuaVRtbXFJVnp3UHJ1R092SnZqdndhbUVLOFBUMUdj?=
 =?utf-8?B?TTlhL2FUS2ZRRG1TVTM2MlZ6RlAvcHVQdzdLbmNQMUJxM0tqYUliVElZYnFv?=
 =?utf-8?B?UEMrRkI2VERGa3hJYzFjdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUhHL1lpZ3RCWGtXTTJuMUJaYU9HOWY3RU95TG5NNEhxMkY1TkZXUWxDcFBv?=
 =?utf-8?B?QThpeVRvVTB5T3U0SU9XTE80YmRRV3dVc2ppWWw0QkpiUDBiVzl4YUhza2Zy?=
 =?utf-8?B?WjYyMFlVS2hOcHJQYTEvUWY0ZUUwWUJsb3ptazI0VlZvSzZtZDN4ckE0UHZr?=
 =?utf-8?B?c0VBS2t3VitKM3pRMW5hTWx4RWlXZy9HVWU4eWZRYm1LY1NQUExSWGpqYXVy?=
 =?utf-8?B?QldMNnEzc0RYNGk3V3I3TjJoTVk5NGovV2U5cXdsWUtveGVnOUpnOFFXWlBO?=
 =?utf-8?B?NVUzRkc4R00zLzhGRE5MdWxFbDBCZ0hGZy9qY3kxV3R0NWh0eXZORVN4UkN5?=
 =?utf-8?B?QVIwVzdzdjNCVFo0L1kyUHlJdEQvNzQrZnRnMU9xRUV3RDdkYWphMDhmUFox?=
 =?utf-8?B?VU12SW9renRoMHkzUlZYM2M3RGpBYjlvOEo3UFJZRlRydlppRitSTUw3YkRj?=
 =?utf-8?B?bFJUOGFpVko1c3NUVmhOZ3VaV2pXR1FOdTZWQzd5ZVNoWHpqUVBPUXJVVVFt?=
 =?utf-8?B?a1ZLRkxXdndLVmVKNWFiQXJOTjZCTGFoN2cvOTBGMjVkMFM1UDJCbXAxa1B1?=
 =?utf-8?B?QkNaaE9xTXhHdjBkeG5MdGwyM3RTM0pkbmhHc21QUEVPSVFyOTdjeTVoeHBi?=
 =?utf-8?B?eVZFUVBXRUVLWlZoaUo5VjJrWnIzWW1IakdEVnRvU2NrUy9lYS9kWGRGSzNI?=
 =?utf-8?B?bUMyMStXVUE3TUtBRmR2RW1GdmYxWncrakx6eXBFZ3dOQ1hLRThXeVBZbnJ1?=
 =?utf-8?B?ZmljMmowRkx5ZUI3U0I1T3pOWWhvcm9naEhUTkRidGNEeERiSkdBVmw1WWoz?=
 =?utf-8?B?ZmVsWVFIRnl0MElHcWJ2aU5pbmZ5MzNnbU4zMmsxTXlZNk5jbGVTQUVxRHVY?=
 =?utf-8?B?UkhCeWlabjFJUm12UTNhRUhUbk9KUll3VkR6Z1l4Yk5ZRHhiRjUvSjBxMUFH?=
 =?utf-8?B?V2NXN2htdk9QRG51ZWFnZVorS0VzaTBqeitpOGloWEZrbllyRzZLcXcySVZQ?=
 =?utf-8?B?MUhrYmJJcFdWWmVJaE5EbGM3emQ5K05CZG11RnZvUU45eXhSU2YwdkxYdVNj?=
 =?utf-8?B?TStpZklpN1lsbG5TUjZ0V3NqbkVuRndNVEdTUytqZXYvUEQxRjVyRHJOTk5w?=
 =?utf-8?B?bStrelhDbElwUlRHd3JGQmxmR0lwdFVBTyt6dDk0QUo1bjhQYTlvY3Rvd01a?=
 =?utf-8?B?NGpzUXBjbUwvVzdmYmRUTzkvRmd6cUFKV01zcm5Kdjh6SXlud1lxSFdXTkUw?=
 =?utf-8?B?dG1oRE1Zb3lEbTd4a2xPTXc1Z3FLSUFzM1h5N0NCQUxvTithMWdDNFdmZjl0?=
 =?utf-8?B?NXFYMDVENGpra2prY1lKQS9iSDR0b1hPVkhsVWhsUkFBM3FQNVhJVHR4L1Q0?=
 =?utf-8?B?bEJrWDcvQ3BXUGR0aERSNkkvc3g4c0d2WEQvUnU4alQ5RlFPdUdlN2svb1FE?=
 =?utf-8?B?UHBNSVBLd1F2WEx4ZDJTVGxON3M4Z2IwbHplKzA1dUEwbm9LbndURVlPc21u?=
 =?utf-8?B?MHllT1B5bENZcnY5Q3VPbzFDOFFkYnlOOEh2RVQ1L3RkZnNVZnNlSFllNW56?=
 =?utf-8?B?blAwdXhNN3pWemxnZzV6NUtJeGFnNXJvT3czcU5PYTQ1eFhEVnVWYVpPSU9L?=
 =?utf-8?B?dHhIYUFBRFJQNDVGc0QyWGxNUm0vcHBSSW1JcXdCZnNjQVhSRXloY2tOaUw3?=
 =?utf-8?B?TjV4dnduc3RsS3dleEx5SUVSc2JaZW50TEVvOXBDcXBhdVNEeTRpQlo1eUUv?=
 =?utf-8?B?dEU3V3Rhb0l2WEMyaDZyWVFMZ2JzTXRuWmFsdTV5MEY2TFBMKzhiVEdyVHBz?=
 =?utf-8?B?TFhTQzRmcW1DTlUycWJXUTBvT0c4YzJLWEpabWQ1WUQ0ODJUSU45czNoQkNl?=
 =?utf-8?B?a0IzVllpSWh4MFpRT0IvV2lSdkNJYWhRcVJ3WDNFVHR4VEdCNU5maG9yRVRF?=
 =?utf-8?B?bTJ6STRwU0ZzUHBIcjF1a3U3dGFvWDQzWUt6T0VkclNoYXhFSG5XSG1YNHBu?=
 =?utf-8?B?MTVJSldjTHZFQ3ZhL2tiZXk2RDdDV2syR2FTSy9BLzY3KzNTeTc0dWltaUZt?=
 =?utf-8?B?NXAwRnIySyt2d2svanAyaWV6NFlmcDlMMU1HNklDNlh3WDUvUkM1VXEzcDRt?=
 =?utf-8?B?RFgrUHNsQjVJMkJBTmhBeXBBSTFsR0xUQS80Q0k3YzViaFovdmFKeDFjeTVp?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e86710-012a-4dc9-326d-08dd0e0fb0c6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:44:31.0465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzMvoqpGHx3la0OJApeLdtLT//EHWjJvir+PpmeeDtSucLvMt7n2B3J+o7rHEciBHd6jbllsfg1+uFiQFkEMgBiHYF3Lt3Hlkx01G7+UlVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7339

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7bfef98226d9..991a9df6819d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2763,8 +2763,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
 M:	Alexander Clouter <alex@digriz.org.uk>
-- 
2.45.2


