Return-Path: <linux-rtc+bounces-6772-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 02csKF5bQWpLoAkAu9opvQ
	(envelope-from <linux-rtc+bounces-6772-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jun 2026 19:35:26 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BED6D48E3
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jun 2026 19:35:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=marvell.com header.s=selector1 header.b=rCX3JahL;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6772-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6772-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=marvell.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C79CE301301C
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jun 2026 17:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5AA2BE63F;
	Sun, 28 Jun 2026 17:35:07 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E629264FBD;
	Sun, 28 Jun 2026 17:35:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668107; cv=fail; b=CLMMQpM9M/2y5My/9ED6bMQJLyC7V5qSwRWpXGJaBuyRQjwu7MIZEGWx6JpsRCEhJVLupH5BG6GR3th5BkEertLaEEDDYrWf7CGzVxNe9k2eKRmND1c0EoxMuvnwUNMmj7gT7G6mI7jvnWJJ6YNQ9WsRNJlx8KTmHgg3gZCjom0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668107; c=relaxed/simple;
	bh=WNj6zNlrZQVC2jLN+rIEhTg1l/TtuoD5inR2X4kmjPI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MuHND22Zu3EJ8Mmh9lmH10zxTL8qs9Pv9LP0MG7wEjG4pmoAq3kH/WpTLriklHQhJwdsus7sGlT2IKFw4xHrBcSF86M/J9I0krvHTtJs2AXfREYixeAWJPD1YEzqjtdI4zpctiVGWXg8XKNr4wH46vWkqzZZRMkXnR7fXEn7VRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=rCX3JahL; arc=fail smtp.client-ip=67.231.148.174
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SET50C3658852;
	Sun, 28 Jun 2026 10:34:57 -0700
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023110.outbound.protection.outlook.com [40.93.201.110])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4f32s68hdn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Jun 2026 10:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0YRmdoaX3kqcTbYRcM05hdDw0Rgmcwi/8a+BEo1qlenl3efHjpzs6+tQ4XEU1a/t6Dl6k4cn5rf8wSwe9ZzK44qbYtcbuXgEF2KrN35m5tHhGDZerw2Hr8k1PkMhN4uhwFbOYlIUOhpCCdXt0swKzmMoKawAUckePNrbaToDsJS0YbkwgmVOQBiql5g09OB2L8CsCbY61R/pMeWu6YTtRwvjawGGnhM6bVzilNcNg/hVavdS7lt5AR0QBnA1HBLrvIuHQTcBv8kxAa6gcSg6LyD/lqMf4dseoQSPdMIhHMxcdwa3HkrmmxouWMW5yvGnCfmh4J8CicSG6s0DPTdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNj6zNlrZQVC2jLN+rIEhTg1l/TtuoD5inR2X4kmjPI=;
 b=ktO5sI58KMEYtlkndLEaC5GlZSKjp8ypA1XJf2Wx8ViWTigThy0a36+EbNmEYUDsR6kOft1csFSGZ7/XIHGCSdy1i2PBMVh+ONHTRph8kDtq2LKafuYxHi/6fOHTU8h+FIeogo7kA+q0hJ3xi4zrgeSXbbBL5z0uvUrHmEziRGTqZymy/blwgYfFiepaGY6LUc7GU5tGI7dbsT60FZeZf4A5TTSBVlzz7yyT/1hH7NgnqVyUJJ9Kxb0ZWLlKtRJIsXJhlidi7bJWNU/h6f/aZC/20Sse1Hy/X6r+mFQAew5rhx5dMYN7Ln7bV6Cw9DZOAqgl97Du0hCJg1czlQLUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNj6zNlrZQVC2jLN+rIEhTg1l/TtuoD5inR2X4kmjPI=;
 b=rCX3JahLJtborMYsHP1T2fl9MemDbHCn3xZOVW9nWmHolDXJGEJV+6MAudB6Gr1t+ikTsyIOknclUWmp420psVE4Ig0lEEWd3mzqOv4QgtF4xT53OfPMMWWrQnOfvqufI4pSbxQgO5Z4FikTPGBjSB9HG+C9L6ML3iQ15XzzB2w=
Received: from BN9PR18MB4251.namprd18.prod.outlook.com (2603:10b6:408:11c::10)
 by CH4PR18MB6359.namprd18.prod.outlook.com (2603:10b6:610:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Sun, 28 Jun
 2026 17:34:54 +0000
Received: from BN9PR18MB4251.namprd18.prod.outlook.com
 ([fe80::8581:a781:5bfd:fc1b]) by BN9PR18MB4251.namprd18.prod.outlook.com
 ([fe80::8581:a781:5bfd:fc1b%5]) with mapi id 15.21.0159.018; Sun, 28 Jun 2026
 17:34:54 +0000
From: Elad Nachman <enachman@marvell.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH] drivers: rtc: handle OTF clock changes
Thread-Topic: [EXTERNAL] Re: [PATCH] drivers: rtc: handle OTF clock changes
Thread-Index: AQHdA9VZFFT36YPJiEegKspXTfNbY7ZN1VuAgAZpN0A=
Date: Sun, 28 Jun 2026 17:34:54 +0000
Message-ID:
 <BN9PR18MB42517285F78D807CA94F97AFDBE92@BN9PR18MB4251.namprd18.prod.outlook.com>
References: <20260624123103.3523728-1-enachman@marvell.com>
 <20260624153123af6b28e3@mail.local>
In-Reply-To: <20260624153123af6b28e3@mail.local>
Accept-Language: en-US, he-IL
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR18MB4251:EE_|CH4PR18MB6359:EE_
x-ms-office365-filtering-correlation-id: fa6f49ab-ed01-413e-6e33-08ded53b911a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|38070700021|18002099003|11063799006|4133799003|4143699003|56012099006|6133799003;
x-microsoft-antispam-message-info:
 3UtwMQXQoC7Po+bKONdE2+vNhacxEoa2xYW2FEciBXPhsNEeznYu+XydZQcxVNqam960fnzLPOhDzgQvrC0vuYairysSzQ2rKqAIzSHC4h6fHq39SKPrphilfGnCo0vTf0nE4s6Y6LzyAbk4s1EDlFPTmuFuOTgOv2WiUM6+/CKpIpuHd9ShT55UMEFSZ1rw3osvVbsgV1wyEP0U0NzkUsyTNVNx1YzjDJefJ5KGrk69457fdnXUcGxmYoHfmWDYZUh+HCaWNWelthLdlxqUERBDqS+OMH6PSW1vWdsWfAtWpSZx7bOcY0G/ukZfJo9OBTiiDHBFk6Y2w4N7oF6q6WqSAqZt3U/UFYr2pxGdWsLuHeH2CfYGmwsnsOIbfp19uCuWu4z2BEyUwlKXJQnmQkJSdwG8E6HeEcyVEiFCmG9HDXIc7ECSrvstiBLWOuz7ojWrZHXEEM+cD2Q+qTL0af+OMlz7ZqQLPrmibrKkE/Tn+C+Ph5z+/B9ezIQ14kIvSb8sGcu4DU6oUwfs+J5UQdWU8NSeAEle15VM0isqb41aG71M1hxqV3yCA7ZeMBP7UG8fI0Wms2x+WRL8y6y7DHOKmX6mJA8jB1oDptQZMLT+cYhYBdmGigADxEaTn75g27K7tIJMD/tikxD56lBLmnPSJtDhPbfuSbttSDUNkFE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR18MB4251.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(38070700021)(18002099003)(11063799006)(4133799003)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODBBOVhYWEQzYnNyTG5pMWt0UlVOS2tLNjRWbVgwSlZUS0N0TDZjSzdQTUdD?=
 =?utf-8?B?b1d2d1VPVE1MTGp5LzZKY25IbEhZNXNSNVFNeVlJSEtXYTgwWjlEM2VUdlZI?=
 =?utf-8?B?M3NSZzY5aEdQNzFiNHA5ZlRlMElOR3hWazZLZnhnYnVySDNmcGNheDdjREpL?=
 =?utf-8?B?b1hJZmgwb1pTZGczSGhQQ3pHR2N2b0pWWVZMRzY0YzNFc3BLTHBwd2dHTzB6?=
 =?utf-8?B?V1g4ZmMwQ2diSlhtek9FS3ZZeUc3Z0s1dU8wVmhFSm5uNnIzN3NDQUJTV3Z6?=
 =?utf-8?B?d0FyQjlCdXZSQTQ5MTc2UlpUUmhKQ0M1Wm1FVyt6MXFQL2U3bSthYzZ5ejJ0?=
 =?utf-8?B?dWZhbEJwSTZrcjFseDJUWFJvdWFRZUtvUklqUUpoTEhCd251YUhjTFhvMkI3?=
 =?utf-8?B?Zm1xbUZRcFRrUWdXcS9WTzhMd2tQR2JnN2wycEl6ZzI3TE04eVhCcCtvN2JB?=
 =?utf-8?B?SURKQThEN21QN2ZMdUZkaFZIS05XTW1yamRrODZ1R204TzBQSUl5Z1RPam1j?=
 =?utf-8?B?SG55d0x5U05hLzg3QWZzbTJnYndDNWFLZHAvZlNYYmFpbDRxZ3g0TDFyQUd0?=
 =?utf-8?B?K0JVOXc2aU1pZUZRTmQ5a2hOMk12bXdzMkhiSUJXR0FQZGMwU3BPc3gyOGsr?=
 =?utf-8?B?YUZRa2VxZWxscVByanc0Y25ESzFkOUgxTDVqaHl3bEpCSWFnMTVhUDVnbXhM?=
 =?utf-8?B?bllWWE9mSnV2bGQ3NmZzcnlqaUZGdTMzVWNXTkw1bzIzTVhvMUVJTlNxNDNN?=
 =?utf-8?B?RmV3RlZpbVFDcG13dW1HQ25vNUNpbEoxWVo0WTRxU3pKRmM3eHZPek1sa3hL?=
 =?utf-8?B?WFZHSkFsUHROOUlDRzA5dzZkemJlamwzY051VUlhZGJ1akEwTG9BemkxNHJz?=
 =?utf-8?B?a2w5dVdEendyOFBpMytrSWU1WFN6S2tjUHFRMll0MU9FRHVqNTBGYVBaVkdj?=
 =?utf-8?B?TWJqOC9LbDAzc1A3WWdhWkIwT1dtczFyUmNiRlhja0hKT2tGYVFmY0Q2NXBo?=
 =?utf-8?B?WmxObGRQdFFRbnh0ckkwZ1dlQzREVUZiV0EvR090VmVrSlk2NWZ5WmVOb0pK?=
 =?utf-8?B?WTVPUU9yTDkvb3BhbE1LTHlaTnlkNVJaOGJQSnJSaFJIOGQwdm5SVjhxdG0w?=
 =?utf-8?B?cnNmWGVhaitiaWFZbW9MekpTMFpibXdhQWQrZUx6d09SZGkvQVd1SjF1MStY?=
 =?utf-8?B?QkZiZFZibUc5UEMzVjdibGFlWitIKys5aWQ4cFZnU1VGMGliV29ack5zdlJh?=
 =?utf-8?B?NlpOSXBOZUUrSEI1QzJuOW5vdGxaNVkzek9ydEhTT3U0am0rVWhwOEJmY0RC?=
 =?utf-8?B?c1JZcTFja0tHa3BtbW9QQ2QrSzVFRlFNZE9LdGxVUENmRFo5U0E0SFhQQUJp?=
 =?utf-8?B?T2VQRzlaZCtNTUtsdmNsSzdPZmtzbWJ6eWVIKzUvNks1QUorK2pNVlZEVVZt?=
 =?utf-8?B?bDFxaDJqeGFRMVI4eUNGNXpxWkZEYWZmbWRDcTdHOUZlVjBBT2dINXI3UWF6?=
 =?utf-8?B?bGpkQUxvMCs4ZlgzbU5HdlZtNHgrUndsNHpmWmc3aEYrSk1mZ0xCTDl3Zjli?=
 =?utf-8?B?NklyeEsveVV6dER5NVc1U3ByUTY2OFplb0NvRkxFMjVmYW05SUNxQXFuVnlY?=
 =?utf-8?B?K0FGWmxEOENqUklSRllTOEtxTktueWIxeE1lSWJMUFVaS1RrWjV6Zk9VNXc4?=
 =?utf-8?B?eXg0QUJvc1VnRFFMMGNHVmZITVdXZG1DK1dzVlJGTWVVZlZwVGl6dnQzQW93?=
 =?utf-8?B?VUVrRkUwV2JaM1U2NUtYdHdqdi91dHBHWjhPRE9LdGM1dXdzeUpmajhrTUQ3?=
 =?utf-8?B?SjJBbVNEY1dZVmRFL2NiREdJMU1ST29lUHMvMCtsMTlQVVhnK0UrMU95SWds?=
 =?utf-8?B?MUlOZzBQamR4cmt1di9jNTBHRll4ZXBxUHVGd3QzNEZHcHdUeE05djhHeHkx?=
 =?utf-8?B?UE5RQmpMaDd5dGlLU21MMHFMSGZGaUU1T0FzSFJabkFkc2hiT2NDSWQzRlJN?=
 =?utf-8?B?dmdMUlVyVDdIVkFRMHZpRXBsZ0pyLzZnN3NaNmN3d0F0V1VocnhOaVZMZ0Vs?=
 =?utf-8?B?MDY0NjZibWlWRG5MSUMwMlUvTUFnU1YwZVdXQXFSS2o4ZEJHQk00OFY5dEYy?=
 =?utf-8?B?VjRwcTNoaU1GMVRyZ2IwSWtqeWdEbTdOaU44amJua1l5NWNTYXdUS3BteW1U?=
 =?utf-8?B?aGZ5SDh6UkhKMlU1MjRJS0hZK29weEdCZTdhWnZIVXN1UVlYa2ZmK3hZcDdy?=
 =?utf-8?B?M2h5ZGtIYXVDbVhMdEJZRXZRa01Udm01cTFiam4rd1ZzMGI3eERNbzZXSGtV?=
 =?utf-8?Q?nxlSbqoKw8x9VuPE6y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Nq9UZDZzXi4VKsB+gTMfICJtpyO5sTq18ZmcbPVnjst6QBBmEf45oReb+oMABIxT/uZdZTJ55K15DvgswpoFXg2rhR6JQUwfl4lbFefHJqFrMQd08c8IyfJBRR4tWdqJqt6ZqBg/A2YGpV+NUJqIZ2B5gOppqXqWsIQRYRN9nJ4YQUeD2Shw92z4Fz3wKXxEj1owRdTBZlbAz/D2KyK2lbYlf+XLTGTDCxcK2F40vnuhwUsXqtpUw5h6KlOqh9Fr7jeO/x7hrene7H6Te3v8dO4r4XatoNB4XO0rZzIhwZ2insqezvCnYN0ql/lbekZ6tpn8T8/iaNN1IofnrKAGXw==
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR18MB4251.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6f49ab-ed01-413e-6e33-08ded53b911a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2026 17:34:54.7386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vxkXsZm5rmkdJmLryWBtxXIsRwfjXDmhCKwNAfwQKFDHyVgRqRG/aPCtM0rVH1q8gUTfXovUmkWvx6kmuLSsvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR18MB6359
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1NyBTYWx0ZWRfX6g9rK1tPDRz8
 B5etoyrH/ei/LceMeB0z+8JX5tFqgvCgVb1tl4ECn8bNVTpaIC5B2VmNPjS/NzE+QafhTCEbotX
 QHfCoXBc66PFWsJpRtivvKSgLRuZv0IuiWPeMKCsFZHuSO4r4EEHNuEhEOxqWOyyoFuRL0Un39u
 MM5shtxXCMch7n3cnJBUYVldwAzbhDyjS07mGAffZ0vCzc7v87XQTDKLT6iAmyV/o/Si1VkIN1I
 AwCaZBTTtFtSsH/D7S4dukWrW8EAs91A18XOMrSMiCl1s+PopN6u++RAZFbFGVxZhnjHz+wvcvN
 bHNx6Vs2aU3Kuex68MGG3BDquawwuh1C/1KlZ/9HWFVhGgbdlBCtuj84TR2+K1iv4Oz7nTVAw9S
 zY0qs72H6dq9nShalKrgZrPhLi4ZRGfkhDvODjijdbsNbpOFrPuSpcfnxrmUxA/JPQZ0IcCPrXc
 icYp4kxNk7pbBAL/3hA==
X-Proofpoint-ORIG-GUID: TA4m6hQQdPFOBcpU6GHTKGkV3doblzs4
X-Authority-Analysis: v=2.4 cv=e6Y2j6p/ c=1 sm=1 tr=0 ts=6a415b40 cx=c_pps
 a=NP/xy1SyNTxufu9/jqGmNw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=-AAbraWEqlQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=l0iWHRpgs5sLHlkKQ1IR:22 a=TtqV-g6YmW1Jfm2GSLaY:22 a=M5GUcnROAAAA:8
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=VkYIIOQnoEfqwP40kwQA:9 a=lqcHg5cX4UMA:10
 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE1NyBTYWx0ZWRfX79mriTnXUTGI
 D+3pbE9mO8PC7pq7Qglj9xOJSXeBmLHDjDYye99pvNiEFJwiNoc9Tpfg8QgMIm0QSwBYaORFCOu
 poBfFcERzTF2yWYPsej4H+H5r/DnCos=
X-Proofpoint-GUID: TA4m6hQQdPFOBcpU6GHTKGkV3doblzs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_04,2026-06-26_01,2025-10-01_01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[marvell.com,quarantine];
	R_DKIM_ALLOW(-0.20)[marvell.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6772-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,proofpoint.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:email,BN9PR18MB4251.namprd18.prod.outlook.com:mid,marvell.com:dkim,marvell.com:email,marvell.com:from_mime];
	FORGED_SENDER(0.00)[enachman@marvell.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[marvell.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enachman@marvell.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	REDIRECTOR_URL(0.00)[proofpoint.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13BED6D48E3

SGkgQWxleGFuZHJlLA0KDQo+IA0KPiANCj4gRnJvbTogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhh
bmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjQsIDIw
MjYgNjozMSBQTQ0KPiBUbzogRWxhZCBOYWNobWFuIDxlbmFjaG1hbkBtYXJ2ZWxsLmNvbT4NCj4g
Q2M6IGxpbnV4LXJ0Y0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCj4gU3ViamVjdDogW0VYVEVSTkFMXSBSZTogW1BBVENIXSBkcml2ZXJzOiBydGM6IGhhbmRs
ZSBPVEYgY2xvY2sgY2hhbmdlcw0KPiANCj4gPiBGcm9tOiBFbGFkIE5hY2htYW4gPG1haWx0bzpl
bmFjaG1hbkBtYXJ2ZWxsLmNvbT4NCj4gPg0KPiA+IFdoZW4gcHJvY2Vzc2luZyBleHBpcmVkIFJU
QyBldmVudHMgYW5kIHJlYXJtaW5nIHRoZW0sIHVzZSBub3cNCj4gPiBpbnN0ZWFkIG9mIGV4cGly
eSB0byBwcmV2ZW50IGVuZGxlc3MgbG9vcHMuDQo+ID4gSXNzdWUgc2VlbiB3aXRoIEFybWFkYSAz
ODUgU09DLg0KPiANCj4gVGhlIGxvb3AgaXMgbm90IGVuZGxlc3MsIGl0IG1heSBiZSBsb25nIGhv
d2V2ZXIuIEhvdyBkbyB5b3UgcmVwcm9kdWNlDQoNCjQ4IHNlY29uZHMgYXJlIGxvbmcgZW5vdWdo
IHRvIHRyaWdnZXIgUkNVIHJlbGF0ZWQgd2F0Y2hkb2cgd2hpY2ggZXZlbnR1YWxseSBjYXVzZXMg
Tk9TIHJlYm9vdC4uLg0KDQo+IHRoaXM/IE9yIG1heWJlIHRoZSBxdWVzdGlvbiBpcyB3aGF0IGlz
IGVuYWJsaW5nIFBJRSBvbiB5b3VyIHN5c3RlbT8NCg0KTm90IG9ubHkgUElFIGJ1dCBhbHNvIFVJ
RSBlbmFibGVtZW50IGxlYWRzIHRvIHRoaXMgYmVoYXZpb3IuDQpVSUUgaXMgZW5hYmxlZCBieSBD
aHJvbnksIGFuZCB0aGF0IGlzIGFjdGl2YXRlZCBieSBTT05JQyBOT1MuDQpTT05JQyBOT1Mgd2Fz
IGludHJvZHVjZWQgYSB0aW1lIG1vZGlmaWNhdGlvbiB0ZXN0IChmb3J3YXJkL2JhY2t3YXJkKQ0K
d2hpY2ggdHJpZ2dlcnMgdGhpcyBpc3N1ZSwgY2F1c2luZyB0aGUgZm9sbG93aW5nIGtlcm5lbCBz
b2Z0IGxvY2t1cDoNCg0KWyAgNDA5LjE4ODc0Nl0gcmN1OiBibG9ja2luZyByY3Vfbm9kZSBzdHJ1
Y3R1cmVzIChpbnRlcm5hbCBSQ1UgZGVidWcpOg0KWyAgNDM2LjI0MjM5MV0gd2F0Y2hkb2c6IEJV
Rzogc29mdCBsb2NrdXAgLSBDUFUjMSBzdHVjayBmb3IgNDhzISBba3dvcmtlci8xOjM6NDMyXQ0K
WyAgNDM2LjI1MDE3M10gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IHNvZnRsb2NrdXA6IGh1
bmcgdGFza3MNClsgIDQzNi4yNTYwMzJdIENQVTogMSBQSUQ6IDQzMiBDb21tOiBrd29ya2VyLzE6
MyBUYWludGVkOiBHICAgICAgICAgICBPIEwgICAgIDYuMS4wLTI5LTItYXJtbXANClsgIDQzNi4y
NzIxOTRdIFdvcmtxdWV1ZTogZXZlbnRzIHJ0Y190aW1lcl9kb193b3JrDQpbICA0MzYuMzc3Mzgz
XSAgX19pcnFfc3ZjIGZyb20gX3Jhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKzB4MjQvMHgyOA0K
WyAgNDM2LjM4MzUxMF0gIF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSBmcm9tIF9fd2FrZV91
cF9jb21tb25fbG9jaysweDhjLzB4YzANClsgIDQzNi4zOTA2ODVdICBfX3dha2VfdXBfY29tbW9u
X2xvY2sgZnJvbSBfX3dha2VfdXArMHgyMC8weDI4DQpbICA0MzYuMzk2Mjg2XSAgX193YWtlX3Vw
IGZyb20gcnRjX2hhbmRsZV9sZWdhY3lfaXJxKzB4NTgvMHg2Yw0KWyAgNDM2LjQwMTg5MF0gIHJ0
Y19oYW5kbGVfbGVnYWN5X2lycSBmcm9tIHJ0Y190aW1lcl9kb193b3JrKzB4ZTAvMHgzN2MNClsg
IDQzNi40MDgyNzVdICBydGNfdGltZXJfZG9fd29yayBmcm9tIHByb2Nlc3Nfb25lX3dvcmsrMHgx
ZjgvMHg0YjQNClsgIDQzNi40MTQzMTddICBwcm9jZXNzX29uZV93b3JrIGZyb20gd29ya2VyX3Ro
cmVhZCsweDU0LzB4NTBjDQpbICA0MzYuNDE5OTI0XSAgd29ya2VyX3RocmVhZCBmcm9tIGt0aHJl
YWQrMHhkOC8weGY0DQoNCj4gDQo+IFlvdXIgcGF0Y2ggYnJlYWtzIGV4aXN0aW5nIGNvZGUgYmVj
YXVzZSBpdCB3aWxsIGV4cGVjdCB0byBnZXQgb25lIGV2ZW50DQo+IHBlciBlbGFwc2VkIHBlcmlv
ZCB3aGlsZSB5b3VyIHBhdGNoIHdpbGwgY2F1c2UgZXZlbnRzIHRvIGJlIHNraXBwZWQuDQoNCkkg
cmVhbGl6ZSB0aGF0LCBidXQgdGhlIGFsdGVybmF0aXZlIG9mIGhhdmluZyBzb2Z0IGxvY2t1cCBm
b2xsb3dlZCBieSByZWJvb3QgaXMgd29yc2UgaW4gbXkgb3Bpbmlvbi4uLg0KDQpJZiB5b3UgaGF2
ZSBhbnkgYmV0dGVyIGlkZWEsIEkgYW0gbW9yZSB0aGFuIG9wZW4gdG8gc3VnZ2VzdGlvbnMuLi4N
Cg0KPiANCj4gPg0KPiA+IEZpeGVzIGNvbW1pdCA2NjEwZTA4OTNiOGIgKCJSVEM6IFJld29yayBS
VEMgY29kZSB0byB1c2UgdGltZXJxdWV1ZSBmb3IgZXZlbnRzIikNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBFbGFkIE5hY2htYW4gPG1haWx0bzplbmFjaG1hbkBtYXJ2ZWxsLmNvbT4NCj4gPiAtLS0NCj4g
PiAgZHJpdmVycy9ydGMvaW50ZXJmYWNlLmMgfCAxNCArKysrKysrKysrKysrLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcnRjL2ludGVyZmFjZS5jIGIvZHJpdmVycy9ydGMvaW50ZXJmYWNl
LmMNCj4gPiBpbmRleCA5NjYyNmY4MDY4ZjkuLmMzMmVmOTVhMDdkNCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3J0Yy9pbnRlcmZhY2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcnRjL2ludGVyZmFj
ZS5jDQo+ID4gQEAgLTEyNiw2ICsxMjYsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChydGNfcmVhZF90
aW1lKTsNCj4gPiAgaW50IHJ0Y19zZXRfdGltZShzdHJ1Y3QgcnRjX2RldmljZSAqcnRjLCBzdHJ1
Y3QgcnRjX3RpbWUgKnRtKQ0KPiA+ICB7DQo+ID4gIAlpbnQgZXJyLCB1aWU7DQo+ID4gKwlzdHJ1
Y3QgcnRjX3RpbWUgbmV3X3RtOw0KPiA+DQo+ID4gIAllcnIgPSBydGNfdmFsaWRfdG0odG0pOw0K
PiA+ICAJaWYgKGVyciAhPSAwKQ0KPiA+IEBAIC0xNTksNiArMTYwLDE3IEBAIGludCBydGNfc2V0
X3RpbWUoc3RydWN0IHJ0Y19kZXZpY2UgKnJ0Yywgc3RydWN0IHJ0Y190aW1lICp0bSkNCj4gPiAg
CWVsc2UNCj4gPiAgCQllcnIgPSAtRUlOVkFMOw0KPiA+DQo+ID4gKwlpZiAocnRjICYmIHJ0Yy0+
b3BzICYmIHJ0Yy0+b3BzLT5yZWFkX3RpbWUpIHsNCj4gPiArCQlpZiAoIXJ0Yy0+b3BzLT5yZWFk
X3RpbWUocnRjLT5kZXYucGFyZW50LCAmbmV3X3RtKSkgew0KPiA+ICsJCQlwcl9kZWJ1ZygibmV3
IHJ0YyB0aW1lIHNlY3MgJWQgbWlucyAlZCBob3VycyAlZCBtZGF5ICVkIG1vbiAlZCB5ZWFyICVk
IHdheSAlZCB5ZGF5ICVkIGRzdCAlZFxuIiwNCj4gPiArCQkJCQluZXdfdG0udG1fc2VjLCBuZXdf
dG0udG1fbWluLA0KPiA+ICsJCQkJCW5ld190bS50bV9ob3VyLCBuZXdfdG0udG1fbWRheSwNCj4g
PiArCQkJCQluZXdfdG0udG1fbW9uLCBuZXdfdG0udG1feWVhciwNCj4gPiArCQkJCQluZXdfdG0u
dG1fd2RheSwgbmV3X3RtLnRtX3lkYXksDQo+ID4gKwkJCQkJbmV3X3RtLnRtX2lzZHN0KTsNCj4g
PiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiANCj4gDQo+IFRoaXMgaXMgdW5yZWxhdGVkIHRvIHRo
ZSBwYXRjaC4NCg0KSSBjYW4gcmVtb3ZlIHRoaXMgZWFzaWx5IG9uY2Ugd2UgZmluZCBhIHNvbHV0
aW9uIHRvIHRoZSBtYWluIGlzc3VlIGFib3ZlLi4uDQoNCj4gDQo+ID4gIAlwbV9zdGF5X2F3YWtl
KHJ0Yy0+ZGV2LnBhcmVudCk7DQo+ID4gIAltdXRleF91bmxvY2soJnJ0Yy0+b3BzX2xvY2spOw0K
PiA+ICAJLyogQSB0aW1lciBtaWdodCBoYXZlIGp1c3QgZXhwaXJlZCAqLw0KPiA+IEBAIC05OTks
NyArMTAxMSw3IEBAIHZvaWQgcnRjX3RpbWVyX2RvX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQ0KPiA+ICAJCXRyYWNlX3J0Y190aW1lcl9maXJlZCh0aW1lcik7DQo+ID4gIAkJLyogUmUt
YWRkL2Z3ZCBwZXJpb2RpYyB0aW1lcnMgKi8NCj4gPiAgCQlpZiAoa3RpbWVfdG9fbnModGltZXIt
PnBlcmlvZCkpIHsNCj4gPiAtCQkJdGltZXItPm5vZGUuZXhwaXJlcyA9IGt0aW1lX2FkZCh0aW1l
ci0+bm9kZS5leHBpcmVzLA0KPiA+ICsJCQl0aW1lci0+bm9kZS5leHBpcmVzID0ga3RpbWVfYWRk
KG5vdywNCj4gPiAgCQkJCQkJCXRpbWVyLT5wZXJpb2QpOw0KPiA+ICAJCQl0aW1lci0+ZW5hYmxl
ZCA9IDE7DQo+ID4gIAkJCXRpbWVycXVldWVfYWRkKCZydGMtPnRpbWVycXVldWUsICZ0aW1lci0+
bm9kZSk7DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPg0KPiANCj4gLS0NCj4gQWxleGFuZHJlIEJl
bGxvbmksIGNvLW93bmVyIGFuZCBDT08sIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIv
dXJsP3U9aHR0cHMtM0FfX2Jvb3RsaW4uY29tJmQ9RHdJQkFnJmM9bktqV2VjMmI2UjBtT3lQYXo3
eHRmUSZyPWVUZU5UTEVLNS1UeFhjempPY0tQaEFOSUZ0bEI5cFA0bHE5cWhkbEZyd1EmbT02UERQ
Ymp1Q21qV0dqUmlVeGtTNXNQS2Q0bEhVX055cFY3cFZob0ZkQmNMbmtzVFNNaVZyRllzN2JsRVZp
R0pSJnM9SVFNOWNCcENVem9WNE9OSm5RczR5anpianlnTzd6UllEVzFqcEpMM3pXTSZlPQ0KDQpU
aGFua3MsDQoNCkVsYWQuDQo=

