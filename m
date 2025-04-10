Return-Path: <linux-rtc+bounces-3904-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA13A83CCC
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 10:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BBFA4A041C
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 08:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21EF1EF371;
	Thu, 10 Apr 2025 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tJqviDXC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2051.outbound.protection.outlook.com [40.107.241.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42E51E1A17;
	Thu, 10 Apr 2025 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273558; cv=fail; b=WixD60A0sLGFgGyWz7aVDHhWXb0bTCjnUe9JTIB3lkURTh4zcxOYXQe7QzjaLPxlUzaAQguWP/F3vt2hLZsl9xzKRMpRr05DvuSWwjU7LCyExn6JyVZEOsiOYUDgbd2tz4dfOnpevqZnnOrFwgL2NhMQihiA7YtTmnDfas/MG/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273558; c=relaxed/simple;
	bh=56qw+AopLib9l444c3Qzs2ZFJYx/MgmTi+xWMkJs7v8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uf9l0mCLWr/sLba6xVE7B15dkghZySbNiP+TU6nngXpgJ+a4WpRslmighR4Z2Hrff71YwQQ2aYLrf6dumLrNcidvxzA3thEEITBEHBRi9YHtkKmQxaDhPBSXzJaUXg56eE1Og3OSDfcMRZSq1GbaSShwEMNkjc0iDR8Y5pO7gJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tJqviDXC; arc=fail smtp.client-ip=40.107.241.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=re8Ao/ycf38cSPKOQ8I4w/E687clkmxM1i7UGEsCGxRI7pi+MtTxzOiy7ZHhhVTQMd7btN96iCNPtv2m+clug8CYtF+VOxmF9djpAV5FpqD1Gx2K4hINfJapUcIg1N95YpD+gJAIsiSOYcZMCmhBKu36Og/0E+teVKaeuj+pdb5mr1MOpm9xqzoU/r875X8CiN3BL+NvvDH8fNfHNL1h9cVvtiCRa0WEyBQ6jeE61xJEQPZ2yii4PyR2gs6euQ9xGML0wjwHk+T2V45KCAwnke1Gk8o6/KaPc2FolOkxGket+/P7niP56Y7oCpYX7OfnRVaqsOXqf3ydTp9soU49qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaC1iQuCESkvIhFX7i5ofXv4q4VE0vK3BZ+DnGFmoHA=;
 b=qymrZCKjB+4BKIImWV6swJBOCTGqbhY/mWZ7uc3e7zdx/gUESjtPAPRUJmzaYcFAXMaivP9K3vhccqMz2YQEK+ugTq8LMdTNEw/zv63YX1jgzDbp+O2TAWq0Zvj89Q6vnAVWlatlPeRenG9sASOK7y/tV+sq3rwinRgcfLVHFZZdKguiVdzK0sinThdBZTOifPfeVibuteLoHKqh0xoTM+wJQt7Vcothk1u5GKIOiUQfPELHWQOe0vMi7eyyspw2Lom2ZtXJY+7KYd3DR6CqFptN5ddjLa02hYJ7AWM74bGzZ8TUbYBngwV/grj0sJNTUPh0iNxFKyVO5jbCEj2yPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaC1iQuCESkvIhFX7i5ofXv4q4VE0vK3BZ+DnGFmoHA=;
 b=tJqviDXCHoMrKHypZ1nE2ZZj5eWioWKzaCBg7MWBJkjrnzKk31VUaqmZe0qUKcdWYn2Pj99Pl6YMz0UOu34wNs4+TOYqNBHvK5Kj4PhKEXziH+QOX7SWTKMmVeHezOs77X+sZqi+9QUB7LNexTVyOv5N267j2K50eYqB/rknrJPXtBjMXPQayPWO0LLVpKRDtZ8mbzPI7VAOr+2XQvWzt0wH8//VxI5ksVU78axK+Yf8gzx0EhFYP2d9J/ZEeLZCDX+fI6wYHnQCE+qtbKEcGN5XEdhDUqZt6MjsUlMVsyC1pLTkwcxWuDQSv93kfjwcsvLq1BbhVhWukYXgaoOmAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM9PR04MB8858.eurprd04.prod.outlook.com (2603:10a6:20b:409::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 08:25:52 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 08:25:52 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH 0/2] enable PCF85063 RTC support for S32G274A-RDB2 and S32G399A-RDB3 boards
Date: Thu, 10 Apr 2025 11:25:46 +0300
Message-ID: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0218.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::25) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM9PR04MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 78a505d6-4ae9-4a78-edb9-08dd78094e12
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rm9HUkVxbFFYSFg5dGRDYkwwUGpTZ3RLbUdSYnBGVzMyOS9KVXpPcElONWNp?=
 =?utf-8?B?SEJlQ1BBSlp1Wngyb3l6ejdsZktvU296SUVrMjdiaUhXem1NazFjN0NsU2Vt?=
 =?utf-8?B?TTNOdVNOSlN2TCtxVzJ5UVVRYWg0SDhmQXp6dSt2YW9USGMzVGIzOVJCM3Bj?=
 =?utf-8?B?UTcxU0k2b0NpNEpUV29mM3cwRjdXY01ERVBGKytOMDYyM01FTEFEZFQyMDBB?=
 =?utf-8?B?RjdIL1dvenM0ZzlOWWovbCtaSWxweXFuNURzUHV1OVN1Wm1DR0I1RmJHVHJU?=
 =?utf-8?B?T2VjLzZmZGRqM1E0QXRnT0tZajl2bVh6Wk9MZklHaGJxNDRrZm84OS93RDdk?=
 =?utf-8?B?dFh6eW5WVkx3NWJyOE56RExuVVg2cUV1WkN1cnJkd0xDd0NIak5QeGFGelBi?=
 =?utf-8?B?dGlOL1BlYytCbFFNNkRDTVNmRFM3ME9ZVjJpcXVzK1R2QTVhNlFTY1FuQjBt?=
 =?utf-8?B?cExDVWRnSDh6U1Rjem5PUnh5NWtUMlR4TTZwZG1abUZyUVloeEd5dGlzWjJz?=
 =?utf-8?B?K3JPRDBTbkUzZTVjRnBCU2VjRE9La0pCcHZ3ajk5TXFKZDZiRkUxaGsyMnNz?=
 =?utf-8?B?Y1BjSitCZHpvOUZ4QVRrcENJM0NGeEMyendiTENJSWhpNk8vUk56TmxuRWJJ?=
 =?utf-8?B?Ti9qTWxnY0NPbjIxaGI3cXFFN0R1SjBVOXovQ0hLNWZXaHZOWmllYnVlcnMw?=
 =?utf-8?B?K3N6MlRLVHpMbXVhaXh2cnlNMTlzTENQd0REK0p1S3JHUHQ1bTF3NDlYRVpl?=
 =?utf-8?B?TGYyT0ZCNXNMbXlNQzF0dnlmcEd6TW45dDREMG9aRDBVYlJ0TDNVbXRpUUFE?=
 =?utf-8?B?RW9yalJiNmF6L3JGektXSHlTTG1vTHhLRGR3dWJ3RUQxUE02VFNlK1RLT05M?=
 =?utf-8?B?bkpvbUY2UVA3ZWNVUFB1YzRwTko1ejJZcVM3M1VYem1Cdy9CelN4UnFmMFZt?=
 =?utf-8?B?T1NpZzNhSFZDQUxRZmNhcVZFeGVyU0tmbEFpdnF1cTdjbDZuMFFTZFk2M25P?=
 =?utf-8?B?OCthcnhJZTgzZC9jWlJHYTVuNTBhWmxKclArWERWL2pNVklXdE95bjB3RU1P?=
 =?utf-8?B?elJFT09RMWNwRkwraDVnUmJ2L3Z4clUrQW9jTFgxSDZ0SS9KM3kxOTg3U0Jx?=
 =?utf-8?B?MDZVckdNVzhHdG5sUVNUcFAvMmRFNzBtQjBYUlo5aGYvT0RFb1AzeHpSYzQ0?=
 =?utf-8?B?TUZUQTEzcmpxOUQyVGZBbysyRktyRGY0MDdKb0p4MlZSRG93Z1VFSDJLWXd6?=
 =?utf-8?B?VFVNTkZ1UVhwMk5FbTM1aXNiM2ptVkpjV3RlWXhqMXRLMUNKUmZDMHNPRE4z?=
 =?utf-8?B?N2hQM0ZDZ1VRencwMWtwOU5nZzYwK2ZWM3lwN3kzQ3pXL0IxQWNwRzM0VlRZ?=
 =?utf-8?B?SGUyUVg3UmhNUDNDdDdxK215MHNPb1kwU1E1eW5yTkFZaVdSSnZVU2F6VXRD?=
 =?utf-8?B?NGFQdGlHc3hIMDYvbGxLaEdOakphZ3dZRXJWdVhDYlFXYUpMdUIzTHZlQUVk?=
 =?utf-8?B?S3ZTWFV4SU9iNmM1UE5nd1R4M0tGVGJxNE5RVjFnd0h0eUs2a3pVOHVENnZJ?=
 =?utf-8?B?L0l1RDlqKzM4aGIwNG5EaExOcW0rWHlyMkRjZkxUaVkwandOejF3RElsYWxj?=
 =?utf-8?B?OVFCY2gycmNpK2R3VlZZaERNOHVRckFqUURNcTdObDhNa3hsR0N5UDk2RUo4?=
 =?utf-8?B?dUlWUnBRZEFxKzlLQldGUmtXZHJVNmlXOTEyMG9lK0F4YlBZUzRtYlhVYjBZ?=
 =?utf-8?B?N0xMWjdVNWJDZjA0K2d3RmlYMm8wRllpOTNOUE04S1JLSy8wdTJHa1F0anFv?=
 =?utf-8?B?ZjdDQldBV1ZrYnRmNklWNGlWMkovRk9UVktJVXR2cGxTTVBLNHE1VlljQ3pk?=
 =?utf-8?Q?LhURkdQAythT+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aENFWUtYWllJejhyaWNFUVV3V2p4ZmQ4QVgyMktLL3gwdEd2b1Z4RUM3Rm5z?=
 =?utf-8?B?ZDgyVU9kcklPK3RjVTNlZkc4djJoWVNwYWhlV2E3ZTJwNUIwUEIvY3dUcnZx?=
 =?utf-8?B?UjVFV2VXVHBYTmtpMkpZN1Zwem1PY3JKVnM2TGtJOFdBMmpLUlFFNk41TlhI?=
 =?utf-8?B?Tm1lRTM0b3JldVpCRHpITTZxQ1dTWGRKaUlaZkU4dTFxYXFIQklSc09QSlVM?=
 =?utf-8?B?WDFMOUFmUTE3NnZGRzRTVE9waHVyR0w3U08rNUpBV3B2b3NLOUFuYVJYdjNt?=
 =?utf-8?B?bkxScFhPdEwxR2lnQ0pXYmpEZEc0enJOdHZMZ05hTG0yLy93ZWdZMEswbTA0?=
 =?utf-8?B?QUNjc1F0K0JGYnhzMXExc0hweG9xeDhlaW9yTkFrK2JNbG1DZkRGbGVMd2ZF?=
 =?utf-8?B?cjRmMzdhUnUweUpsdVhQQ002OURIdUZ6MzhvMmNXU1VJNmR6OTY5aDYvKzhy?=
 =?utf-8?B?L0NEVERsaXlGczgrZ1FVWXpDQmhpbC9wSVQzS2tZRkRFKyswcTBIZWo5S2Nu?=
 =?utf-8?B?cjY5Vy94Z0NEb2poa1hvUlRIRXhqN1h2aXYzOE9FVHMvTWhlWFNEbVYzUlFi?=
 =?utf-8?B?YXRuWWZPeVBwcFRQYjlDSE1GQ1dyNTk3ck03SjIvV0RnOGFwZm91dHVnd2R1?=
 =?utf-8?B?aWx4NnBiNy9NeTdKV1VCVjFrYTFSSnpFZStUTGFibUExcnY3MFVUOE1oNmxs?=
 =?utf-8?B?Zyt2SWVHZmJqaVMwMCs4eVN3Rm1nZXBtbzhaZFRuY2dxMktKMGZKY09mRXFK?=
 =?utf-8?B?SFkyMUdSRnc0czV3QXFxZGlLU01Gb1ArbkdxZDdsc29Nc1BjQjZNK0NmU3F1?=
 =?utf-8?B?YzJKNEJ4dTJhU1BOdytNVlpGYWgyWk9LNElibzhWZEZwaFdkMzVzVVgvN21U?=
 =?utf-8?B?MFdCM3Y5WkxTTjlvNzBrZFc1RVc3OWh5WkVwQ1hRZm92eEpSM1NBQ1orZVNy?=
 =?utf-8?B?Wkdmcmd0blVBanVQYzNnS3M4czdBaVlYVUt0bDNMazM4a0pxMWZzdGVYRHBJ?=
 =?utf-8?B?SnZjdU9FWjNhaHVseU1jR0VaMmtCWTRCelBGZnA4bFNxTjFQWWZPaTkxaVVm?=
 =?utf-8?B?V3lRRnl2NmQ0aXBlWWxVeGltZld5SmRUdnNKMVdNUE93OVFNRnBvMm50WHlF?=
 =?utf-8?B?U2lkVEgxTzdQZjE5UGFwWW5OTkc3d0srbXp1QXFVYTNHdkkwTVFjV2lXbldm?=
 =?utf-8?B?MllaNnc3dHd6aUppMkpSRElGc2FWWEF5ZDFpclErMU1zOXlLTkl3cnZsZU5P?=
 =?utf-8?B?Y3h3eEQzbm5TZUpiM016aVRoT2xycnlnc2RMekt1R3BPbXg4enJlRStDTmlU?=
 =?utf-8?B?SzZteHMxN3FlMmp5N2FPbEtVeUZOSEY5VTNlUTNiTzJSV3VaMEFNWE55NC9E?=
 =?utf-8?B?RXNjaHlFRGpMS2lzUmJacFJ6akRJbjFhS1lmQUhzOUc2dHZmbWJpTTA5ZzRP?=
 =?utf-8?B?a1RKQmxqTkN3aDBFYlAybzl4dnVyazdJYXo2V3VsNVZqaXFSRnNVcXFpRlNo?=
 =?utf-8?B?ZXF3L3NmbXducDNWR05Kc1FzK1pHR0QxRFhZWFFJcXNWL3pTelhYeXhvVTcv?=
 =?utf-8?B?WGhDZEZnT1FvUTBQQ0JLbzFRaGR3ajFsbVRxRys5bkpubzYycEpxZ1lrRVZH?=
 =?utf-8?B?VTJlQW10YktxWE1LcEsvOUcrNVRPdzVEWnhWY0ZwZ1VrZVNpZ1FZcnliQ3N6?=
 =?utf-8?B?UGszNzlRRWxxWG9scTJZRVlBeE4rM1M4RGN5WlZtelFXSjNaQ1Y5OGlvU1dB?=
 =?utf-8?B?UVVlUldZaEJRcTN2TGNheUN2cG5LbFI1UEdCMCtFbDZna0JydUdUcDhRK3lI?=
 =?utf-8?B?OHc2QVRUVTRqbUozN0svMDJieE00U0krVmU3M1VEV3dNbkI5WDZSWVd3SEFj?=
 =?utf-8?B?SEdWRUVNOG1BWHo2YlNzRTJpdEJvcmFRWXliR3Iydi9MS1RyRWlNMUk4V24w?=
 =?utf-8?B?UjRESmQxNkZXeVhORm5JWlZtNlFWVDhZZjA0alVuZEJxNjRQZ3ZGMUNYTUY2?=
 =?utf-8?B?dGNuSFMxa1lWaDVsbEFuME1TWHd1Wkk0ODR4R1B0aGpFNHN5SVg1N2tlTFZH?=
 =?utf-8?B?RUppQUVmR0l6aGdVbmFDK3hnN0drWlZqbVk0ajdzTkRaWHFyOERZNkFJQXpv?=
 =?utf-8?B?V0ozMVVESHVBeDduNVJ3WnFXZE0wNkZKWkc0UWNkN2hjK2czMDJmVzJOeXpz?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a505d6-4ae9-4a78-edb9-08dd78094e12
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:25:52.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDwHnbaJLPE3ZWnGZ5JceG65nJN+MzKYyA54J/uPY40dnpzVaYO9/+kQgwZuup/7D7vPJVGmeRjG65oD4N/EG82ehZzqPey/ZB32KtpfOH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8858

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series handles PCF85063 RTC support for boards which do not
have the PCF85063 RTC battery backed.

In this case, the PCF85063 RTC oscillator is manually started during
startup.

Ciprian Marian Costea (2):
  dt-bindings: rtc: nxp,pcf85063: add 'no-battery' property
  rtc: pcf85063: handle stopped oscillator at startup

 Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml | 5 +++++
 drivers/rtc/rtc-pcf85063.c                              | 8 ++++++++
 2 files changed, 13 insertions(+)

-- 
2.45.2


