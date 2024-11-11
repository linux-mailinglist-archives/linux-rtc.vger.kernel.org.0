Return-Path: <linux-rtc+bounces-2495-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0089C4013
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 15:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38DF0B21710
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Nov 2024 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B391A00DF;
	Mon, 11 Nov 2024 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="icvlHjCS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2061.outbound.protection.outlook.com [40.107.104.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893C19F430;
	Mon, 11 Nov 2024 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333595; cv=fail; b=EdfRTJ4j0jDC3uy4Bb5JUhQ4lZ4HrgHzaHa3XAyTFsh2ECVKXBuEORmM5eIpvuya+bLsg36CatZTHBoNMWpEXxOaDMohkp0+3xnFYFkQEUCJrd9Obzc7P/x/PkdfFOocKAjpTkSsKYNBiSC4Q1c708DppCH7Iw68rhQmTHl1mGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333595; c=relaxed/simple;
	bh=zMoT52Y4KbMz5Hxl+/iz+upgB8T5ohzHzoVIcvF/IBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qZnpwmN0RYaH/RqIWyu7x6X2LVc+OWUsdwXY6xr9WOhRgiaTGxNRCz2YuST4fAPpLPtlBfqCf6nOEvDKrRYqqSoC8FYq9g7brh7IcOJNB/VuecXIq5Q/+Lia4nEU6mB4u7SqebyJKjU3A/cbs2BNKsUPASglGHWIUWT3/6nWjbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=icvlHjCS; arc=fail smtp.client-ip=40.107.104.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQ/0s2gS6+ejqv0FkCIm+HUXuW/itDnCX72gRd7yYAKeBsCEqgEhgGebjIZUwGmN2rHaIkpb8WvvzihygAeNPaiWuOpvU8NrjqL1Yf/SaV7cB+4X2ViaXJuHQxbRFx+S6PixQasEXHon6Fwess5LWQcbk8x0cUqO+aPQ6AOCU+L+324HYv+M7uixm95HBMfExOg/yyPQ+Q0DC9s9Ykwbnc61ZwyqXWtDwEFlQ9DpeyfNsLMOnPAIMAHxUxuZKFW0BQOLGAuEL1j0Tn735h/h9SCVbmNngk2kdpjGcJWZ7LftUtJ1rAlO4nekACaJXhwbrcewFYaSeUWEQjV1SubvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyAsWCWWz8WK2yUFnergg82sc3oC8YnTgkgyqPMqRTk=;
 b=kYhqZBrzvGhWWR8No9Oqho5mTsZCsicxohKVLu+HAmUW0uphiWfaVDjrprRdIZb4m1PCB/LnWG1MMDeU+nVEtjEbeP6pAKQW59m4hYSIZ/KBaTGFfXkWzE4HqzG+nK81EzMbc2r1hsuNt52EmtVd2V2y/Sv4V1Kp2vo0GAVPdrnrZZZ04CvVjwxGiHiErm5n8xmOuBC7SBguzwhMaq8oTDelY4RB/J5cLylb2MZyl+ZjFVVRg1a9YTZLmoSZQspI003gKLXKb/S9MxdMtiOsUoJqHKXEY9cLhzfe6WQ4euOLx9GDDniKzbSrxpnQWiLG9aWQVJCaXN4/eFn9aBpy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyAsWCWWz8WK2yUFnergg82sc3oC8YnTgkgyqPMqRTk=;
 b=icvlHjCSVBhOKlOkauJaSOG8pgffPUv/6zu8H7bLJY6VF6z0oK0llWtW92bPBSGNZXFXAl+pvCLbUNelNW5qw0uvrZT5qcGMpcEIWKVFp3yL/rMLlLQBzvLbBwYeDW1nArleElYTwuN3f0Ei1uikX/F0yYOTgFycNVoIAXAWQwTAOKPtQyLoh+awlsa/0/HioQeQBQh0Y3NLt9ZMf30zepMRJW6F68tmErFLICWBCx8OVtvoPFiMs70fXd2s+4VU6fizN0aX2FdTa9g4Q9aKkB3L4DBgbEKVB48ostfyd3SsEb6Vy93DRJ4VP0xVEyPqNYiKuOyVP/wXezMu0RGNaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 13:59:50 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 13:59:50 +0000
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
Subject: [PATCH v4 3/4] arm64: defconfig: add S32G RTC module support
Date: Mon, 11 Nov 2024 15:59:39 +0200
Message-ID: <20241111135940.2534034-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::11) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5c6baa-bc52-40be-eb34-08dd02591b99
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDZOeHRreWNrMUV0c0Jzdyt0Ui9HVlZESUNjSDZjVFRDR1NoZ0hndGtHSXVS?=
 =?utf-8?B?TUhaZVhhK0VRRjROcC9IaEZ3Q2xHMThMSFB6bTcvbzhUM2I2Q010a2ZjQkd4?=
 =?utf-8?B?SEZ5TWMvVHVKU3BvekYxZ0MvVm5JMW13cC8raVFmaVpqWXJvVWxieVV6ZDlW?=
 =?utf-8?B?RE5xMTVBQUNPbWJoZ3g3dW12WXBPbnBuZDUyUVh4WE4wczlKTlRLL29Jekh5?=
 =?utf-8?B?TkwxMzRidHdMVUJRQzQ5UExQSy9jQUtWclNEdWtoNTQyc0hvRUJlOVJ4U2Zm?=
 =?utf-8?B?b2dzcCtTakk1WmtiSlUwNmx2Ri9Zc3gzR0JZeDBrQXFkRkhDZndHa2x0aENq?=
 =?utf-8?B?VEV0Q1JUS3B0eW9pM0NvTVk1R21Ud1FMWERPYjZEdjFHVDhaeGJjVFhrWmJY?=
 =?utf-8?B?OERTZDVsVWI0cW1Jc3JPU0crU0NpZ0VxWEpyYUZURExUVG12WmswMk1BZUdI?=
 =?utf-8?B?ZUV4bjhaa3ZteFFwemc2S2RuQ2hGUGpmb1BFaVJQQkd6cFRmQjIyd0syWEt4?=
 =?utf-8?B?YXRzRmkvdGlMNmYzcnpyVGdaN3hrOE5uaGxsciswNGtxbmovYUNXekU0dWIy?=
 =?utf-8?B?NFFJVUZKZ0JFR2FPUllJanc5V3NPSGdjbVhXM0tjc0Y3MlUyQlZBeWtaNEg2?=
 =?utf-8?B?cmFpZGFYeFdTL3hQN3plMkFzTTlUTWs5cEVDdm1HOHFTbStvaW9PeVE2SFNt?=
 =?utf-8?B?T3NUM2pzU2ZPdkVxQ1NNMW1pbEExQ3FnVWttdk4zT3p1YWxjekZtSWxFVnJQ?=
 =?utf-8?B?anpMOXBVSHIwbFliU0NtYW1rTi9jYUxhbktpZUNNM1FwTytIbGxTbjVmdkRE?=
 =?utf-8?B?c1Mrc3pkY0FNQTAvWWs3ek9IZ2ZpcEdYY1BrcGJEdHRvQ0xRVlFnUmcvbnRG?=
 =?utf-8?B?VmlyTC9NZVcyTFA1Q0VQWUZSNi8xckVZZ0VSelRGS3VPeDhhODVYa1ROUEZu?=
 =?utf-8?B?eVEwSGVXUEVDSVhVKzI0a2d5dHV6T0RDelFZa29ZSDd5MmJhckNLRm44ZnV3?=
 =?utf-8?B?WEVNNy9NOFFhTnQySnM0UGVhYWlzK2hsK2Y2L0ZUSXdMME5aZzFXdHF2SDc3?=
 =?utf-8?B?dVI2U01LbmJrbnprSk0zMU81akY1cFhoWE1qczFFSUJGdVJML1hIYTdZV05w?=
 =?utf-8?B?NHFDVEdDT2ErZDVyK1oyU3o5eTgvNW4ydGhOaHdhSjQyZ3U2WmV2elZGZ2lo?=
 =?utf-8?B?VmdaWnR0MXZSWWpVYlk3alhSN21TdFhuTWVLMUVrV2xUUzg2QWhzdDJ1NU9E?=
 =?utf-8?B?ZUl6T3ZqMituZWgybTAraGFuaXBPT0ZwaVVKTHpRZGxjZ0k2dW1OUFlmSUJa?=
 =?utf-8?B?MFBwRFlWZlVNcWtrS05scUt6WG5xMUFsallpTWptRlJWVHRRc3VLUHowZlBN?=
 =?utf-8?B?YXMySnJRaFBCTFdvdi81MWR5alpGbzNrN0JxenpMQWpYYldoTHlzMWZaVzZn?=
 =?utf-8?B?UUdUOFBkd000eS9UNXRSbWNTbUY5MWNrdHlrT2NldHUyRnFMVWkybWZDaHg5?=
 =?utf-8?B?ald6MWt1RGkyZmdDaVpvd0ZsUDRiMktkWUlSNlI3RENaRzhia3o5YUE0bjM0?=
 =?utf-8?B?UHJFL0NDU1luMFRKdXc1aVBFdGtYR2h0QlVxVzBpa0lyTkZkQU80bnV4bjIv?=
 =?utf-8?B?WnViVldtMjVEenVkZkY3UFlKMmUxWElnU3R4d2dYOG1lNnF1ZVN1SDZCVXFC?=
 =?utf-8?B?VUdHakJyb1ZUdHlSbDU0RE1lblN3Z0M4ZWgwczNKZmFsQXVjRE9EWG9MV0s4?=
 =?utf-8?Q?Q5Mo6WQbzAo3lcl3wbHfmUs9/1tasZTqOQ2H/Ig?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzNQR1dPdFdBdVcxV0ZUU0V4WXJiR1lJWFV6K2taK0ZHVWpoY2k5Y1hGTmdq?=
 =?utf-8?B?OW53Y1F4WEJCZWxZVHIwZS9lUXZuVXcxSkZIR3V1U0F3V3VxaUNmNHBYMUJk?=
 =?utf-8?B?SDlFV1hHV0ZuNDlBOCtzZDRCWUNJTlpIVTJtQU1VbElwT01qR0hhc04wM3No?=
 =?utf-8?B?WUxsQlVYWHZ3U1dGVzMvOUZwUWNEallGWUwvbTIrNkJkWlRJU00rTEdId2Z6?=
 =?utf-8?B?RVJlYXZwTndYZVBzV0R3UWZSN2Vjc3ErZjl5QU5HZnBYUTA2c05uZlMreTQ0?=
 =?utf-8?B?QkVnVS9lRmcrMG54YitEOFNSVldoR2Z0THFFZnhGMEtPSzhMVzZpei9NUzVB?=
 =?utf-8?B?SXg2WnNzdW5XU3BxbTJjS3dnNHdvVmhDQkNGVEZPZmJVVGpGNnNSbHIzM3BT?=
 =?utf-8?B?M3lzN0VBSjNoTkRDR1hJUlBTalEvVFllWEFESlErK0RxR3RzMzRyY0JWSGFD?=
 =?utf-8?B?YytXcXdPQjhjU1BWbTZSSU1IVXZHUkEyeUVlb1RhbDV1TlB1SXloNUFOVklI?=
 =?utf-8?B?OHV4NEVUSTN1MDRWdy9ERnVjaGdZQ3JqZDVsZ2MrS1Q0VnRuMERmRkFzY1VH?=
 =?utf-8?B?WW0rQzZ4b0s5bmxBNkJzRG1VNXBPdVVkV2dZcEIyU1YrNzBUMzFrTDJnemdW?=
 =?utf-8?B?NlB3dmFzYXl0czBPZTloaitiTmw4Yk5DUGRVNU56aytoYjRtMnVkVW50Y1dm?=
 =?utf-8?B?N1UwUzlqeUdQQUU2eGhJRnkwcGJnMXZONGtiTnBib0oyU1dmcWYzWStkeG5k?=
 =?utf-8?B?VlplUEdTK0d3UXp1Q2lhYnoyaGswbVd5Y2oyMFRBSGpnVTRQbmdqRU1qWkFw?=
 =?utf-8?B?TElpeW5SVmlnL3BDanJ5Vkp2ak5ZbXIxYTI4cExKRDNUV2loU1RSRGxDWDVn?=
 =?utf-8?B?WFNRSERDdlNMbm8yT0lYb0FESkdJaWJPekV0OFJBMzhzTk1BcFhRKy9hdUd2?=
 =?utf-8?B?ZllTZnJhOVY1Zlo1SkJBWVQxdUFXUXVWMzNaN254dnMyY0U0RlYxb0VGbGhT?=
 =?utf-8?B?SGRnRzhVK1hIeVo1OVR1cHFnWHp2b05WZ3hOSTlsZWlQbndmMkQ3MEJDeDRK?=
 =?utf-8?B?b3krQ2pLWnJHbC9GRGdROU5MTHNudnQ5QkVlVXlrWGFlNlQ4NTFQeTc1aS9F?=
 =?utf-8?B?NnB1Q1lFMDVYZkVhNlFlMlIvdHFyZU9YQ0RwTWZGR3M1enNpTzdOZkxjemFR?=
 =?utf-8?B?dGxiRmRHMWhBY2dsb1luZ1dWK0pXSXRVUnRWOUV3MGIxbXB0REZmaHQzMHYw?=
 =?utf-8?B?cEJ6YmtmVmRyUU1DcHduS1hXN2NTMW0rSGZGS2srempoK25MY2RwYXdySlE4?=
 =?utf-8?B?SzZPM0w3SVZKZml0dVhDck9FUmtWL29xVGloNmdsVmwvTlRZUzdHNmZnYi9i?=
 =?utf-8?B?cG82TU05NHFkRlBwdCs5SE50aVNyQUtIRzJZdlViYjdoZlhiYy84UFNNa3Jy?=
 =?utf-8?B?clN5bE56KzQzTXR3QlRrMmhFOGkzTDJDMDkwQ1FIN0VUUlZaaGNFM2swQWxD?=
 =?utf-8?B?aFRSRERncXZCaXErOW9pckxrWWZPRmxjNHlNSXJIK3dnYThtZk14OVdha3JG?=
 =?utf-8?B?ZlVNQ2JweVZmdzR2KzhNWHA1WjNDZVVtRlVObktwR2hQdDJ3dVRYcCs0dVdN?=
 =?utf-8?B?YjJwaUZLaGNLekRrbjdIdDNmT3RReFYzWVgwbGppakgyY2NTdUVWV2tOd1ZO?=
 =?utf-8?B?K1gybkFSMUNrMm5DbFBkMGhBYzlPZ3VhcFFKOG9yb2R2bzJIcUNGdGtocFZN?=
 =?utf-8?B?d2dkaXhpWDZ0d2pabllYKzBLdnVaazRwa1lqb0hBNFMrYVRUcE5LOGZRRThY?=
 =?utf-8?B?a2hxOS9yVHh0eTExTEhYcFdHdG5vY3g0QStyWjRGRDJkOXBDQXhSdlAwRnpv?=
 =?utf-8?B?TXRoMlQvSzcxeks5ZHRZUE5vbDJ6azVWTFFDc1hxbFFqSmJUaHovTHVoRXZ4?=
 =?utf-8?B?Sk5wRHZBUGEvVG93a2NmdEZ3T01sU1JFS3FuRzM3MkM3cTYySUpKdy9iOXBk?=
 =?utf-8?B?QUU3QzNiNVRUT0tCRGwyWndmVHVUdWovbUl4QU9DSkVraHlYQ2V0clEwUW15?=
 =?utf-8?B?cHIrZnorQXIybW82dHlnR1pIRGJjVEtiNE5pdlQ3TTdOMWxLYVptL0x6MDdl?=
 =?utf-8?B?OWhOdXlwdTkrUkcraGE2dkZhS0Z5a0locEdJT0F4QjF4UXEwa1psR25Jb3JW?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5c6baa-bc52-40be-eb34-08dd02591b99
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 13:59:49.7005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XOJ3Eybjo0JLpj/29lRNVqRuKcWmG01yjRjVB2AFqM8ZOIKLWzkiYuPQ6k49RtFqP1/Jvf6qoR2up8FciNf4jNd0PhyosO0F6q87XOGkVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC module enables Suspend to RAM (STR) support on NXP S32G2/S32G3
SoC based boards.

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


