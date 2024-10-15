Return-Path: <linux-rtc+bounces-2200-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E099E495
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 12:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E94CCB23D95
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 10:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E019F1EBFF7;
	Tue, 15 Oct 2024 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cDWl2d/t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2076.outbound.protection.outlook.com [40.107.249.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F2B1EBFE2;
	Tue, 15 Oct 2024 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989511; cv=fail; b=nhfhUZ67AyvApd3JY5M77ebvlmGjH2JtAkI2DDkz9e0lknqb+twaAYmiZ6SESvy2h9ckndStmUrSlIWGXSieyfb0VL7j6EDWXXiQJigcMFb3Nr4OD3GP82AdkkpKGPeCYpjK+QfP23QUnsVE85SR6SkIyxQVsuBFflKnKFIQaiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989511; c=relaxed/simple;
	bh=bL3NkImcly2cuAHYW4cMEdSXW4vh9dDqAo2Dbi22W/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RWnR0XvBH/G2tb3Wf0U3WtTDwnFKz07PEW6/u/ww9ylZpyROpi0juUywiSOxl2Ufeq/KlXMN416y/zyYRaATAxrEwZMFqGmXEKmPVa+oau5oEAhzhcKE6uwPvAlu6ehebmUh81oCe4CEm4mAjsyHNqgTKIwB5hNGnw4Mn5Eecy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cDWl2d/t; arc=fail smtp.client-ip=40.107.249.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBWnBuCQkYFYT1UqubiC/eCHbuDcnYc2B72hR30XXCBsPyQKBGnDXY+S4uUYqpccw54R2QdQ3EtM8DsNZ9Y6x7D975msKxyyU4DWLias/+Y6xl7sJx1uzgjCU7uujMJBg4f4/uywkegBVz6of96LU+JydRz81PxA7cggfKTfd0zkqrrFifciuz3imBXtXjD6CM+EywX1/DripTVamY6QYZP4EgRZLQFVk8ninvcY/4trffwmu2fy/If1tlXy9jctw99/V8oQXCdiwSR1kxumwLBubs8tn31rJotopAdafNJqOm+2o5lw70uXWWbVIfOe1clfKELqcva3uNzrLD4ocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiuOkCfpsNxZrkFZMYxjLbzR4TnUVZDDLO1KoGr8M6Y=;
 b=l4aKBIjNzgM+93qYcBM7taYTtKtAp1dZ1g5BjLY1cx9QjpAEgCXbCnzVwNXphwLa7Rz4soY/ewmqy0muuNez7wj7kLwKdwCxYJFjg+nMIhBWKjPyWhLL57yH74BVenjWpOXRCCcYjw3JNOH9ehxBYm9FuDRMp9vZLMapP2yKIlyOW+kscMITUG9vNSMkAkZPc+Kx68lm2xTi4AyhAw9EUQrNpH35qkp+dW3iy19x3GlKXwzB2Q8YO5VIDV/JAvj6KInTjuVvn2gIny0uHQ7f+qGL5tVhDcapI2cfpyrOo0i1+5g7YDiu1RTmTeK9jaTLuHhzdOiTKd0713slaLS6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiuOkCfpsNxZrkFZMYxjLbzR4TnUVZDDLO1KoGr8M6Y=;
 b=cDWl2d/tuMmshE1JDOGuy6Uo7xbtSYkoJ0LaKnIWXyHVnCIrP7C2UVI63vLl2v400fXpUucyMPP9Yd/jqyw1EcrwBNFcxxuDvK5cS1sTD0yEBnwnJeoVxtZfBMMcHANYU0ygQd/qzfu17TJmSmTe3eAegXnXBHHb6OpfbJrdtt6kxTKqIIGi4vGdMAjQB2tHvEj4uF0l6cQvFzG4n6Jzl3Ymtiwu7wMJhg7VACF+lA2SikvShlXISq4OHRb8pYhghg5tinqYjkFhHHaLCYcKMdKkTaM0eOkw0hhIn/upPbCgRO12Z/+Pc/Kms4OJ35/WxY+EsSuoqMBvFJkwCI9KKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:51:43 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 10:51:43 +0000
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
Subject: [PATCH v2 3/4] arm64: defconfig: add S32G RTC module support
Date: Tue, 15 Oct 2024 13:51:32 +0300
Message-ID: <20241015105133.656360-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM9P193CA0006.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::11) To DU0PR04MB9251.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: e29278ca-cf92-42a2-96a0-08dced075b88
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmV6dDJiZTlnbGhPUXVDT2MvamZFQ3J0eGVtNmszcE5FMzdPSWQxUjM3V0NR?=
 =?utf-8?B?ekpoRktpNmlXR0xscDErYlYxMm5tTUFMRmcxZElmVHR4MUF6ZnlSUUlkSWE1?=
 =?utf-8?B?aDg2b3NZYkt0ZGRza0E3ekg1NXNuNEhrSDBkU2dEQ1ZsM2RHbE5jcjB6T2R0?=
 =?utf-8?B?cE1xUkhJUmU2dXJNOTIzcnVET2ppTjRLVzY4Nzh3eVFlak1aQmMwVkFMY2ZI?=
 =?utf-8?B?UWRYNXdUZ1NQeklqcjVjVGlOTkg1SExYcE9QbmNQQjdWaDVuNlhncDZXV0E3?=
 =?utf-8?B?bkgzaVZ5QTExbGF0MVNYMVJpOVFMZWFudm1yTDJsckhndVh2bjZXdzFMV1BG?=
 =?utf-8?B?ZnpSUnpTbVlMbzFsTlNYUDRGWkpIQTJHZVpPaUFQNG9jQitYOVZwNHJVUk1D?=
 =?utf-8?B?VEFlaWQ5S2ZNREN3RGZETEVoalVzdHN3K0d2TVl3cmlpdFVaTjhJbUlRc3lX?=
 =?utf-8?B?Ym8yamNndStVZmZycmhPL1c5dWpnMFhCZmFjamFHa2xqU01tL29DR1oxTjda?=
 =?utf-8?B?V0FtYUVSdThRT2s1NTM3L2thMTZhT3JRdVZLRjBKNEVmd1VKYVR3ZlZNZlY3?=
 =?utf-8?B?cktTUy9wbENGbHBpNHFLcTZnZ2prQXZjbkxKMTZiM0thMERRKytNbHRBMEdG?=
 =?utf-8?B?bURoVW1BN2h1RUxqR0gwZ2FKOG9ya0lka05FOGRMQVZaNWtFaWNmUkx2d0tG?=
 =?utf-8?B?RFFtVCtGS1MrRk91UU1EUmU2TzlISVdHSGRtQlJINlVNOHJBMndLZE1ya2NN?=
 =?utf-8?B?bVIreCt2RWZFUnYrTjYrbDlXRnExSXpaaHIvcTcvekkvbTBNOCt5S0FKbUZk?=
 =?utf-8?B?bHlqa0lwUTJYK0FwY29Vbjh0K0tCYitENU9kYkNlVndILzJINzR6bTQ2MTYw?=
 =?utf-8?B?YXpNcWFsL01CZ25hVkhjVldqOG9TK1Z0Rzd4MkNmYVAxK0JuZnAzTHVTc0Ix?=
 =?utf-8?B?Mm5JcmdXZzJScE9Ib2k3TjYxLzhqVFVNRXhLR1IyYmMrYXpIeVJVQTNVZ2NO?=
 =?utf-8?B?MG9UVnZSSUtHTTU0R2s3VnRIc09LNTcxZFJpLzlyVG9Fa0VlZEpKVHZsV2JR?=
 =?utf-8?B?SXR1RVJJSEhFbnVyV3BTK3Y5UHJoUDVkQSttbng2YmlHQzJGKzdBTDJmT2lE?=
 =?utf-8?B?UUJnQTl3dFF4c1l2a3RSTXh4TitZeFQ5ekNLSUtQMUQ3N0swSE82UCsxN2pX?=
 =?utf-8?B?NjREUlcvbmpUS0VXRWZJeExRTFJLM1MxSk5JeXliT2RMaEE4NHpXWnR4cDl1?=
 =?utf-8?B?dmphK1dkQ0hUMmN4V2lSUEU4MWtibFdhcHhORDFRTUh3bENpR20xVmtrR09M?=
 =?utf-8?B?WU1QRjViei9ZcjdqTCs0bGFjRHcxc2h2Zm43cWl6YUJnRkRISVZmaitoTVpq?=
 =?utf-8?B?dE4xYXJFVWl3Qkx2RUlsU1lLbGtMUEs1Y2sxYWtmVUJER1BZb3k4UzE1b1Er?=
 =?utf-8?B?NHl0U1BNa080MjlrbnNzbHN2YmNSQVNONXFEL1plUTBBd3BFSEN5b0hqWUFm?=
 =?utf-8?B?aWpZNGpaV1lFY0N1QS9RbUhzU0x0MFRpbXF3ckNFdDY1czdaVlR3dzkxT2xJ?=
 =?utf-8?B?MXJ2K0JMa1oxZ01zWFhOck1qbzlVOE1RdDBmUElVamhrOURSZ09YZEdJaUJp?=
 =?utf-8?B?Qzl3MjFRc1JPdFVvYmhVWm5IWG5JcHFoa3VrR0dSZ0ZBdDVVS0xEWVA3ODhz?=
 =?utf-8?B?T083SHdFT3U0emMrMUlrci9wdXRCTWNPZW1xbmNHL25LbndDcHZ6UjRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZitwR0ZKSmxtYkNSOEFMTktNUGticDBnMHlYVDc3bEhtWDV3QWpraVFwZ0FT?=
 =?utf-8?B?MUk3c3FDN1p6K0E3aFNFLzZiQVk1RTdtNlhSYUNwYzc2MjNRZC8wS09xMHZH?=
 =?utf-8?B?M1p5RDlDcWNXRTcrQTQ3ZXBOVDlQUEJVTHRNNlZLbWR2czJpMWp3ZXV2UUsx?=
 =?utf-8?B?RGhMVW5qNmlINmZGeUhwdkJudEs0WElkTXFPdEpyelB3aXI0L1pyTXh3VDlr?=
 =?utf-8?B?ZW9ad3FOdmhqdjhMdGVSMXRiY1FjSm9kWEJtYjk3UmpLTVhuaVpRbHUzTS9q?=
 =?utf-8?B?Qk1sMGlhMTBaTWFUNEJucE5PeFZkR1ZlRFU2Q0owTkpFNzJtN0pWTUVGM2pF?=
 =?utf-8?B?WXNiYkpxWmhPeWdscC9vUS93V01SQ1VRVjBVdUg1UmRhOGhwUWd0L3NSRU9t?=
 =?utf-8?B?MGwzaTRHNC9kVmJxaGVaamRSbmZUZjlRQ21iS0MxUEE0UUwzcm91Z3NSK3R4?=
 =?utf-8?B?VlZvYVIxT0FEQlF0Sm1ONEJ6bGsvT0w2ME92Z1lwV2x0ZVRLYnBIdkU5VnF6?=
 =?utf-8?B?eCtNNmhHZDluSG02Qi9hUVdNSFM2dlNoV09sMmNiVjA5N1hVQXN5MXJwRUc1?=
 =?utf-8?B?K05GTlcvbGowS2F4UU1UK0JEOEh1RnFqQkpkOUEvb1o5NWRqRENpKzVFeDg4?=
 =?utf-8?B?R3dBM1FjWFBKZGhWWDg1cnVicW93Rnh4SWkwUS9JYWFDbXVLMFBITnFYSm9t?=
 =?utf-8?B?aDFoY3dhWFhKYnpqd1RlQTFwQjRJYjlJRzBNTDBoMUw4UE8rQnBiWGV2eDlp?=
 =?utf-8?B?R1RaRGRxV2FtRzFBamd4S29zTHc2OGF0RjlDemMxbDNVeFhnOVViWWZHb016?=
 =?utf-8?B?UGZwbGRSbFN0bllXVHowaTNaWkxhd0xvMXZXd0IvOFJSVXZEek1xL2xJbEps?=
 =?utf-8?B?YVh1alRMeGV2cmFWaG9DQ0lvOW5jc2o4WmJxUHU0ZjF4L3dubmgzRGxiVWVk?=
 =?utf-8?B?Q0R1dm0zekg4Y0M1aFhBalJ4YW0vQTFFYkNkcEo5ZGcwVmVmQU9xSlhjSW5r?=
 =?utf-8?B?SlJHdzdjbnlMTHRaMlBlRFZKY3ZTUjMwMmUva01ySlcrcG5zeVBkbXI1eW9J?=
 =?utf-8?B?enBiS1ZSRXhGSXZrTDFEQk9CSWUyWmZnNklsYTYycGpoY0lteDZlMXVIdXlL?=
 =?utf-8?B?dThTQ0lQaldZckxiWHFTRFpORkpwRDlDcXU0OURJQ3M3WlVtc1N0b1VoTkpD?=
 =?utf-8?B?TWx4M0RsV0ZtUDkvODNLdHNQZW1pcTZvb0lITUlKcnMxOSs3MUgzVE5RaVM5?=
 =?utf-8?B?V3RDaVpwU0lRekEzcW90OUVPNWZsZnpIbnk3dDlpQ3BVZ21PZ2pSL2N4S0Nm?=
 =?utf-8?B?ZWhIYW8yaFJyL3BEdm4zUC9OZ1dqUUFCaXkza1hvS2YzN3FtZUFPcTlhOXVa?=
 =?utf-8?B?SmpDMllrb0F2MDhacm9ObDZEUkh0L2p1TmlONHpzMUNxWFRDcW1RZ0ZFd3pN?=
 =?utf-8?B?Y0xpWVVlU3E5Y2ZKT1dsUitnK0J4dWtqbW5GSXVUMXFHTGFuVHc5UDFGbUhz?=
 =?utf-8?B?M0VxdUFmdDRWejNZbENTRFBMYXlUemtiVEo2eXdQbDN0NUo3bG9wQnlKbGps?=
 =?utf-8?B?OUNaMDZDcFIycjJyY2JTLzlybk1nNjZ2eWNrTWpZaWxNeTZuTTNnR1dvbno0?=
 =?utf-8?B?T2dLc1ZRMGFPc1QzMlBnUnNtb1NtUEJHU1VOSTBXTG1iV1VSMUdRMXVOaXhR?=
 =?utf-8?B?T1BGMEhidERGeld1aHU1VTNySWkyS2xzSFFtbkRWUkR5L0lMKzN3QjVTa2FL?=
 =?utf-8?B?MU9YVVhwSnNhNlFpSGVWdWVkWjRUU1ozcTBTdTczRUZjQ2ZjUTdEU2xwOURy?=
 =?utf-8?B?ejRaellHdFE3OUJSQjB5T3RqZ1pFNjFuRnY0WEhSTXhjVVBxOFBRZld3ZVhC?=
 =?utf-8?B?cnU4N2JVempFWENGS0NTbXRkUzg0Ly9nQTFKN2ExUlNldTBlNFZZblZWd0xF?=
 =?utf-8?B?UTJVRDZ1Q3pVS0R6QjIvWWR6ZlRreWRmcXhEZjQ1QW41QUpKK081L3hWUytz?=
 =?utf-8?B?by9DWjN4WjkyZGx3SU16S21UZU1XSjNlMkdCRUd2Uk4vME5icGNpencwT1k5?=
 =?utf-8?B?NXBoMC9LUjhDakMxbUx6VE16emhpNndlc3dzTW1IU2NHZ29mcUZmV24wQkw1?=
 =?utf-8?B?ZGJlOTg1RTZiZC9vU2JyKzZMRFJMZ05YT0t6Y09jU25rcTNmTUFiL0t4Y044?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29278ca-cf92-42a2-96a0-08dced075b88
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:51:43.7661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+PxSrYY729lJwUAPVj0XrysxCauXlBJN40jkgI8Ty7r0PNzjok9/8edx4rsgM+nC7ZY0OEvMS/FCZC+wvgvBqwFdSvKc9tU0kO0d+sS+G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC module enables Suspend to RAM (STR) support
on NXP S32G2/S32G3 SoC based boards.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..584cef78c984 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1209,6 +1209,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


