Return-Path: <linux-rtc+bounces-2197-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A88E99E48B
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 12:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B98B21F22054
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 10:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D401E5717;
	Tue, 15 Oct 2024 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SwQ353ah"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6834D1E4110;
	Tue, 15 Oct 2024 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989504; cv=fail; b=j9L5QY3SzqavaLBUn1nubch2t+nPL8+8ySzegvhUiY3rK2ZCHRpq7z1OQxKF3Kc9jWF8PZ7e06PBXc08MATTsiK+HPffTAHcP/JNvDCAn08dsHxSZ3UTgWQ0SSpvv8X+F2gB3HTM8Vshyn50ztUBUOBYgqJe5Z0MVTfGtNESxdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989504; c=relaxed/simple;
	bh=t89vEioee5U43O2Be9VDEeez7OWjfz5nbaAdwET1pnw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NNLzcgFxtmvE11Jv8A2sqqJWE7w/Qq2aquKNbg2SnhCCyuA8VT48MNULuojrTSdgdti77ckyMi8y4L8YDqqkCzUlYbXWxXTbj0YpvhOVAIYjs/s1D9T2EMBB04437p3oUm1idO+wyyeK5YfdIedm2uzc6XtrtFPWVL1Bzpn2En0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SwQ353ah; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhTF1V33Ieg2xcbdXZpz/5cPGEuXq5v6WyiiA6eVOLjKsmLmGd3kyVRmtuW+yLr5ZjOGXW12Wq0uu7Vva0/lH88TE9/iRniU/miNrFouqh+XtdifybTH/jnMvQH8SQPZuHD1tWn7pHOq7kseNS8ChHinYiGFcGP3RAYTF+BvO+ZC4uysUX30lUNMgjn9MdgU4oGXuQOKsWfGaSSBdS8sWOAwE3LtFNdULWEtvSU+afRlaP9UlXlJv90ekt6SpeOsV3r28ExDtUbWrsJI5fjxqwsZyC2CV7LG/GZLpEbmzdv0ZZuRhWpimOwDK7p9Yzy8Zsu8W0nkA5nkKDMZAgsseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAbVjfYPNH1PEbrhDLFp6S/TVH0fgKHM0kj7tscVCUM=;
 b=LXx3VflFRo1klPcfySKYLebkYTEGFuBldbNnfJ9NuLqOjLIEXVGdPgwi/dphZzRmGHE8zngbBYXw/ZbOdKz2m7qK7Pd48+SXhzGKmJ0wFH6c1OKnqbAk2GWYtXOnY1DYtbhF4RoNIFRu24TrgJJfKXBk8LT1LDiAtd0DP4YpUYa6+ogXegK3UBF9paeGOsE1lPUpE7l/QNsVZwuvgaYdMun2/3jkDiZDyE5wSjL25u6EjzmOP4/pkeACyrMJR1LGFOR4UrB171SQYK2f401K3cMPxC12qOGYhAlkfz7eORm184BWd5palX2lMB0ov0K+QsJdsefRNQ197LwcFNZtCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAbVjfYPNH1PEbrhDLFp6S/TVH0fgKHM0kj7tscVCUM=;
 b=SwQ353ah7KnBSQ4Z8cKNq4+bnZz63o+wQ5oYEr+3eVzRde0qZSxWgVoMRyUuuRw/LPlLhGUW3c9AmFNnaArhVyHMFZWKiMghSLdTly2we7KgFKxoMVTfiwq5Br5qu5AMoIJDyjBnPJO9C1xLHYV8ELsMG0oAn+qBnLvUfKg4oK2JTgJG+dcq6O3y/vUG64Q/qQ/2H9J97n2336prMMWpKcRmZTify6Dy5FB00AqQmduMdtVT2SUi5OPIpS15sla8MOZ+c/uhQh820EPpC5N7YtaHYjPuvOJvK55TJZEdx4X6mPtgobrSk4IelBe9TqEuCLxfgSfSArEmzWwrPe8kvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:51:38 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 10:51:38 +0000
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
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v2 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Tue, 15 Oct 2024 13:51:29 +0300
Message-ID: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0011.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::16) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: f21502d0-ad4b-4149-4695-08dced075806
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXdjei8vdDZ1OUhKR093ZStWNmFTZ29OZFQ3eE9zRXhkVklraGpsVlpOR3Bv?=
 =?utf-8?B?VnFCcWc2bGdTajh0R2w4VGxqR2FXcEhDbTZNMmE0V20rN3ZZR2pBWTkzV29q?=
 =?utf-8?B?b2ZodWN1eFNVemJZa1daQ2JyOHpURUFzQjQyYjBmbnMvRzBaVFZEdWJRSGRC?=
 =?utf-8?B?Y2d1MEZLdkxkdDg3cmVsM2VGdXFKVnJNbzRFL2VNMVJOTUZFdU80K083K1pK?=
 =?utf-8?B?QS93TnJwNkhVakNWOUtFUjlIL1RJMjEwLzhSa1lJSFEzTTZRTlBiZjBGYThV?=
 =?utf-8?B?U1lQR0xxLzJBS243d1VwREVIRXMyVnc4YVYvS2VvYnliVFpFVnl2WExYTzho?=
 =?utf-8?B?bDVvY0IrQ2dMcG9EYXdqTHE4Y2M1RFMwMUlmd09zYnEvRDAwYTRWbW5MUndM?=
 =?utf-8?B?V0J1dEwrNDNpSlR6TXJxdUYvalF0QkhVRjZ1RFBubSs4R1JlUnpoNUdPN3JO?=
 =?utf-8?B?UkcwdTJHK0lXbzMwcjU0bituWFVtMWNiNTk4VlFzR2Jmc25rbWJGQ090NUsw?=
 =?utf-8?B?MjR5V2c0a0ltUUY3am14eHNlaWJXQUwzc3dnbGZsOVNaMnU5YzVmOEV1RStq?=
 =?utf-8?B?UkY0TFpsckxmNjV0VDNiZExHVEMxOTVjOFZrTDlBL3N5c1BOQXpQMWtXbTdZ?=
 =?utf-8?B?Y2V3cEdZSHRad0d4Vk1ncFB6RERzZTJKUHBlL3NmQmM5ZWlBNFJ6Q2VHeFRD?=
 =?utf-8?B?cStneXVzOFNuV3pSSUMxUUgyQmovRG5vNDJaUGZLWEtZTnF5bm40K3Zsa3Vz?=
 =?utf-8?B?Tjk1aEFNZkN4eVMyRXI3VmZqdzlreUFhT3lTUkQ2UE4wWmVERDZKeTV0WFcw?=
 =?utf-8?B?SWVzcGFhay9DcW5vNGcwYm9YaW4rdllGOVBseDZvL3JPRnFIV1RDT0VUYk9w?=
 =?utf-8?B?YmRMbTlTd0pwMDJ0c0hjZUgzM3l5eS9taFlpRGJMMktDTFIzWHBvNGREYUZo?=
 =?utf-8?B?eWJDR2hzNm50SFFTbmM0bUZ5dWNjUHBtdXgwZlE3b3U1bzVoek1iQVd0VzhT?=
 =?utf-8?B?YVQrTDdGaTJiME5xUVVxSFRyeER6ZXhnUmlwRGtSS2xpV2xWemtTeW5oZldY?=
 =?utf-8?B?OU1yQW1BSEs0ZTZMS3BCSmJkS21JK1cvTlFrNXFEdHVEK3VIUU5sc3Fxc3kz?=
 =?utf-8?B?Y25nUk0ySHM5VnlQR2tOYmRBeFdHc2Fxb2F5VVE3dHZBMWEyZU0zTktUUXRo?=
 =?utf-8?B?a0NRZXZZVFhkR3d0OTMvU21tSkF5ZkdzZkw0VCsyWUQzRGxObkJsSUhyN1p1?=
 =?utf-8?B?dmU2RWlESVJKcnduK1BVNXB4VmdqOW10a0huSzBLSmRvL1UvbVZueVYvWWlm?=
 =?utf-8?B?SG4wRnpsYXRzZEZnSjVvQTI0NmxuVlRMNGhySU5qTmxNNDdFcUhGd0Z3ZDVY?=
 =?utf-8?B?cy8xUUlwVDdSNEc5VGJUWjNXV1preWVJYnNjaWhWTHZIR1lQR2FMYi8xNzkw?=
 =?utf-8?B?Q3VzZUIyN2l6T2pSTU92cWxFOE96YTNEZDk4OXhoSTkvd2ZFS0RNOFVId24z?=
 =?utf-8?B?OW5Ga2hCZC9GblFLb1F1UkxNNUcyQnhuZVd0MXpkS2toS1A5YUZCY2wxUmxR?=
 =?utf-8?B?TlgwQXU4dDB3SW95Z0tibHMzczlnWWVqdTQveEZzZkVIVWlNV05sNFN5QWFS?=
 =?utf-8?B?cVozQjdoVEJqOHZMd2N4ZWNQVk8zLzdDTTdUZXBTVGNCZWppWHdKWnBaTDNW?=
 =?utf-8?B?bHRKeGtCeDY4VE80VWNScDh1Q2NYaWFXWFVwc1ovdklNQzFEU0hjbEpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1lJMG03bitPWnZQTmlPcTl4UXN5dS9kZkswTXpFTExvckYrNkdVMDFWQ3JG?=
 =?utf-8?B?R1JWNURtcGR0MEZBUTlYRUI5elhKbDdhWnNKUWJLR3FRbjdFamJqK1I2WkdT?=
 =?utf-8?B?Rk1NNlkzb29tNHdYS0c2QzA5L0JOcGZ0VG5sY0dtUGpxMjJoaWRsQm43RGNU?=
 =?utf-8?B?RXRrT0oyY3AwSE9QZWhFSnVMa1FMMGpRY0dRdy9xM1Fqa3BQOTlHVC95UlVj?=
 =?utf-8?B?YUR0cy9MVlVKUnUvVjk2Sm82QTc3UDcrdFo0LzZXRWtIUGsvelozZ1hSUGJC?=
 =?utf-8?B?aDMwdHFFcVV2MTRrQmNPSW4xekUzZ09HTlh0YXlETlhaVmlwQ1VSVDU1WDJ5?=
 =?utf-8?B?N09HbVorQTZQU2NXdXRhVnl2WWk4QW9kYW1ML201YWlzZ2xSZEh1STVyTHg1?=
 =?utf-8?B?MWVhTlE1NXlzUlNFOWtBL1VBREtyYUg3MGJHVmpTTVFZKytpd0tKRGZEZ3Ir?=
 =?utf-8?B?T3RCS3hQakRjTlA3eHVCdUZJTmFMNzc3Vi9xMG5objJVQWR2TE9oWmpiUXg2?=
 =?utf-8?B?UVMwOFJ3QmVWUzdLUnR6VmU5bFJqaWJ0SG96TWFFNjU5NlA5eXVtZ3ErbnIx?=
 =?utf-8?B?RjZxZmVkemF6ZFRyczI4aktxU2YvSGIveFpjQTFmM2xOZy9RR2pPK0E3NFlw?=
 =?utf-8?B?c3h2TkFqV2R4ajhZdkVvWFM2dzNoeDVUWlUzaUxoYWlCS2wwcVZDOW5TSTVR?=
 =?utf-8?B?ZzMrakw5UnZmT3d3cElvTlRGUFZQdml4TXpHa3g4Sy9WenZpeEJ0a08zVXZ1?=
 =?utf-8?B?eVVxaC9ONW5CNkNLNzdVSzQ0b1ZWNGxKTWJKQzlSc0RyaHNIWjE5M1AxTkN5?=
 =?utf-8?B?VFdHMmRqM3BrclVnaFBrcmNMSnpZQUsrUVFtdFpYVVIzOUpBMndzeTgvNWVo?=
 =?utf-8?B?UktNUmpEMGRWNXJkZG15VS94cGJraG9hblVVeXlFNHBSWVN6dTJFc0FIMXF5?=
 =?utf-8?B?bVNIaGUxNEh0NkY0a2UvNGkxeC9zUkxlb2tVRkc5VmVCclZNcHdXQWhzVFZp?=
 =?utf-8?B?bUdwazVlOUJGLzFzMTl4UFBjQjg3aTJvSC8ySmI1VCtVcHhMaElBNERybi9Y?=
 =?utf-8?B?UldPY0d2ZWdHQ1FtcVZZMllMQ0dBeEFKUEU4enozOEJrVno5ajBvaThZcWlr?=
 =?utf-8?B?TllTRXEwaHhhU3MrcmFjWjZTQ2xMTjVKNHJWOUR6OVVHcHRpUjBTbmJpckZ5?=
 =?utf-8?B?RUhxVHJlSlVnUytsRkdLVUxHSkZiekJhNXFvWEcySUw1S2ZOUVJ4aHlBVmVO?=
 =?utf-8?B?VllidXVoSHRvbEVLaHdzL0MrWS9ZQnNIaTZLcjJjRXdweEgyTjVCb1pWcGNt?=
 =?utf-8?B?RSt2QjhxRjMvS2tRVFBLTGZ2Ull5TmdqVVh4bzdHZzRuWG9DNEFES2xqOGdK?=
 =?utf-8?B?eHdtb3JnUVdPeGZ3aDNtRjBveTdUelhmSEpxbzIxVFZUQ3l5d0ZpbUFrQlZT?=
 =?utf-8?B?bWkxYlBaSWpJcmhTYi9qWHhMZFRjaXZJZEV6NzJoMWZyTEhVZlI4ZVlISmlo?=
 =?utf-8?B?VlpwYk0vK2thV3YraERHZ1RsMVdqWVdhNG8yZ1RPMjVab2UxTWZCS04zZUkz?=
 =?utf-8?B?dHk3MndZenRkTWFjc2FyTjJDOXhIbGFHSUsyaWVCQzlJNU5SbTh1LzRrR0xJ?=
 =?utf-8?B?V3Brci8yQkpESXpQWGFtSDFEamFCL1piYm5ienMzdXFNaDAyTWxuckZKUFVC?=
 =?utf-8?B?V0IweHpqbDNEb3VIZnkxcncwa2srZzJ2MUQwQzZNMXZWQzNKRUdDaFZIWjRH?=
 =?utf-8?B?VWJtOVl2WXBpZ3pzd2JCcmtuSk9NaTlJbVNJSUJidlh5V3hBdkN5dU1Uem1W?=
 =?utf-8?B?YUR6RHdQclVUTjNlOTZWMjc2K1o1TFhPdkpOd0Z2V0ZLOXpGU1hZNFdnc2Yv?=
 =?utf-8?B?VGQvZEJ4TVk0dHJ4REhIQ3pUMkMwa0ZkTm85WThsZWFYUm9jYVBWNkVIRW5r?=
 =?utf-8?B?ck1vUHZORWI2KzlyaUlsZ1FUb1pvdmFIdHRCYXYrMkpJTXN3QUZYOUFvYTN1?=
 =?utf-8?B?bnR1bGs2eGNQcDNYMkYzTU5VUHRRWFZRTWtlOXFLQm8vcGg4VlBHNktMUEFY?=
 =?utf-8?B?WVU5aG9uWWoweTdiUHZBUlJwbFBYT0M2VHdiZ2RxNDM1L2FRN1ExbmxjZnlE?=
 =?utf-8?B?cXpKZGdHczRCSHhuZzV5eGdDUThjSW15ZVpFT1dDT3hwY29qVzB1TExkempN?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21502d0-ad4b-4149-4695-08dced075806
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:51:37.9885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0o5NqcS9ie8BIbanMpGq+StZ4M/RlrqAaYdwMPQ3j0RAhjyqibI7qQLNgD5/Fk70hsupbAHyKwfr3gsy23m/almZGb1PXifsha48waK3Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP
RTC hardware module present on S32G2/S32G3 SoCs.

The RTC module is used to enable Suspend to RAM (STR) support.
RTC tracks clock time during system suspend. It represents a
time-based wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during
system reset.

Following is an example of Suspend to RAM trigger on
S32G2/S32G3 SoCs, using userspace tools such as rtcwake:
# rtcwake -s 2 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V2:
- Removed 'clksel' support from dts bindings.
  Used clock parents support from CCF to better illustrate the
  RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings.
  Used assigned clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported
  by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 102 +++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 778 ++++++++++++++++++
 6 files changed, 895 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


