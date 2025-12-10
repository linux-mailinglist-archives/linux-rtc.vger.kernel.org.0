Return-Path: <linux-rtc+bounces-5524-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C8CB2DD6
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 13:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D1863017A42
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Dec 2025 12:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C59F1E1A33;
	Wed, 10 Dec 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="HJWuF736"
X-Original-To: linux-rtc@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023088.outbound.protection.outlook.com [52.101.83.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69F61397;
	Wed, 10 Dec 2025 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765368383; cv=fail; b=GE0txLgkiBRB+sgqxFwbUFSLPdNCGgQwfN3mHhJIGoetySPz35ij13+Yy/cnYXM62MPR4VvIep3hVvy4Oy8CKFu0dB148fAft3u/6K/HdQ8A0F7KKRlSndlHj8t3dH/JWKk5qSZQjq7/stF3amLxJUvNzulbUawiz0Azxva4BXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765368383; c=relaxed/simple;
	bh=wcobXffdGBaZQHqY0ebG8JyH0EgPBWE3BPi0MKGo0K4=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J8Iq62H4JITj/iMLRaVP7iAHFzntTFdmZ2ypg2/O/DxGP/c4lzzcDLIdwKawV0iis3IXHh4GRBiWf59pqGa1VxS5uuntRTznjB0U3sUoAztpRcYKiIUPZFDP1VHTCvbLCOcQfSDI+KenYFshNJyVQfRqq9rLFTBmm8hnIc8Q7kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=HJWuF736; arc=fail smtp.client-ip=52.101.83.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpsWNuhK9HGkxPgEZ+fWwZabOB80bRI+v9GeUQREbeszKVkuQSySIE6+nC3EMa3xlHTznDr+d8Ca77dTKSqFcdW61p7qZRGIjRakUZpk1u4sIa8CAD06xsXg47zHn6EJCEZ7lDElymGgzBw8ml2WH2ywt07dkn/YX1ZR3ZCOh+iScSefUbDkUswkZbtU+F9pndiA8CuW+B9KceREo/wa9xRZ3H27EdTaidnVc61OFTUAxfwtZgxr6yEDU4b2H2OyjfAuyNZpdFZ5D9NJzbUwa2JFzSyLnm5raUM2gXb/pYScXWc0YWDgYATplhJh8+os3Zm28BXNlzrPl3GDSUTqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVVGu0Ud9AgfIjrEUQ8ZY92C7C/bPVJM7fBBHiFg+2Y=;
 b=exjoNpKMwD44gUi0KKUZnC+69A2kog5fczqbTLDpaGBSWLlwhJn8vYgEW0umsJp7CrCHR268Zgex58k2iLxacwQjXnDhlyV0VZ7p8pSc46V0++LLtbCC8hmLkXPfMwBzWqEJYMH7Z4d04y20qHobvHgd8W/zfX3cbFQjhwY51VzNqVI5SUsCgu7B/PpIGm4cRTvxbPh8CxBZKeRWXymAMwRUFrUNDiG7iGdOM5eddJdmq4ntAaD07ujzGt9J1EaY8cqEVjGPLHiGNLRVmZOCGYZYmwkKIos3hDNgLSC8zWQlYBiMlQ27w5qcil8rmHpwd9rF5rY+N8Cy44hYwy3Oxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVVGu0Ud9AgfIjrEUQ8ZY92C7C/bPVJM7fBBHiFg+2Y=;
 b=HJWuF736Du/GHB9Z2M/IzqdJsxEHFwAlYvZSQ/+eePgTt5/bOTUQuYyRtIHGjGwUMQCIIOSg8QPa0/uaU7PAHtNLA1x9eVkvG+YANqqT2dr0FS4TazxUzOnsOE6QChQfUEvTCJIdOaHt+GxjbO6VkHNYS1FnKRUvJFzO5ENzljXKTwtujYGu7R9w+7I0VqxfL/wUsM6vH8EIbVvCCNWiJcWSN0CssR3lCRVehjPRCerAzr2i1WG0DkAIzujAq+73O/vA4TtwDi+hlzEVxmyqYzFX20FH9i9uwENMTkeapJDnCbB9jMuVWjuOPDB9Ijt7tH0bcmpCIg53ts8H55tK0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by DB9PR06MB7322.eurprd06.prod.outlook.com (2603:10a6:10:21a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 12:06:14 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 12:06:14 +0000
Message-ID: <353422a2-ba6e-4600-9326-e0cee2098062@vaisala.com>
Date: Wed, 10 Dec 2025 14:04:38 +0200
User-Agent: Mozilla Thunderbird
From: Tomas Melin <tomas.melin@vaisala.com>
Subject: Re: [PATCH 2/4] rtc: zynqmp: rework read_offset
To: "T, Harini" <Harini.T@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Simek, Michal" <michal.simek@amd.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251201-zynqmp-rtc-updates-v1-0-33875c1e385b@vaisala.com>
 <20251201-zynqmp-rtc-updates-v1-2-33875c1e385b@vaisala.com>
 <LV5PR12MB98047B0A754AFFFB01163E0992A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <LV5PR12MB98047B0A754AFFFB01163E0992A3A@LV5PR12MB9804.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF000167EB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::66f) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|DB9PR06MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cb8c8d-c5ef-49fc-aa6e-08de37e483fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aW5IdWNpVXdUZEd5cEJkbm1nc1BhOEFvcmxCdmlFd0Q5TlZ1dEM1dm5LdVk2?=
 =?utf-8?B?V3hvZjR0b1BwWjFjWkR5MndWdkF0ZW0zSC91YzdZcEp1b04vaGlDZzlPcEV5?=
 =?utf-8?B?TVlRSHNMRSs3SGl2Zk1BaTdpV0lhWnFaTGJBUCtJL3RObm52ank4L2JsN0ZK?=
 =?utf-8?B?UjBCTlpNV1oydi9pTitxOVdXU0JpWDkwVVJrZjVkWDZNWDJVRXVkV0Fud0p5?=
 =?utf-8?B?UXFzcUs3WmlUeXRBT0NOSUozRjVWOFo2bGh4L2prdDZsMUFUQ1ZjWU5IK01X?=
 =?utf-8?B?eWd1RXNyREhpSWQyYk0yT2lwZVFaRjd5Q2h1Z3pvaTlwVUdrakZsQVNWZFJN?=
 =?utf-8?B?eDREQ1AzVW8ydW1Lc0pMNHFlekxNZWJrdXc0Sit1ZXpYTVlOSHEySnduNTNj?=
 =?utf-8?B?UC9pWkd3SUFNazJaOHUyWUgrTUhjcnNja2ZaYWVrS1QrazZyZkMyYlh4alZs?=
 =?utf-8?B?YjFqdElsTjEwY1h0N3dIajZXdkFDOWl0bkd3YkpiVFNjOFpmK1FJS0YwWnRQ?=
 =?utf-8?B?M1d1cElWNlVhVS82RUorZUo1aFUrNzY4NWROV0QybHZhOVVHMUVXaUhEWHJ3?=
 =?utf-8?B?UndtcXFaTEdqeFFkUDVUZDZucGFlRkJOQjBjaE5tdTVOVDRPQVFQemtUeTlP?=
 =?utf-8?B?dkNBVzB0aVQwZ2pDQVFtZG9YSndnZkx1b2NUUUdmR1ZmRUo2T2FFVitieHdo?=
 =?utf-8?B?RmxuSUhRWFpTSFdNZFl4ZEdRUUpnV3d4STE4RFdibXNSYXdIdWIvd04vczQy?=
 =?utf-8?B?bi91UFFWb3AzT2VYWUdQVTVtVmo1eEdvMmh1SjNhdkJaajBJUzJNRk04UFd4?=
 =?utf-8?B?R09GemM0bWdtSThTb0lNM0VMSHBFdmF5VUhEc09BdW5iT2x4Q2grN3RaRFFv?=
 =?utf-8?B?UEthbnJQNXY3VVFMZHJlVko1VVBVMnp4eWJ0MSszY3FmVUszZk0ydjNQOFZ4?=
 =?utf-8?B?VUZmbStvdzAxZmlxYkgrMkdkcUFZWER0aWRkRVZQNGxXbFFmbWtzZVFzRjI2?=
 =?utf-8?B?WVdHMzB5QUNuSHNONU14WElyZUwrb0dHdE9rbHpURjNtSnpwSkUyK1ZUczBs?=
 =?utf-8?B?NE5Ka0x2ajFjTWxEM0ZuckNvRWJVN1FTUitjazZTanNQV2M3b2lCTXJrUDg5?=
 =?utf-8?B?UXZkaGp1UCs3b0dmVUo5em1lVWVNWkdVV05KYi9xQ3hMWkZCMnVOeFM5Y3pB?=
 =?utf-8?B?TkN1ZVVxMmV6OFcvRXpOOWFacGQ3MDN5MWRwSFZXa3hCTHN4ZlI1V1ZNc2hu?=
 =?utf-8?B?ZzFHK0JnRU92RjdnT1lia1FBWTlXWHZ0TnpBVGpVVXBHZ1BXb2NXTXczTGJi?=
 =?utf-8?B?UE9pdzB2SjJscWI5bmRuRHhUb3lLZGIwZEk4S0xFdVVTTkNuWlBINUNZN2VD?=
 =?utf-8?B?T3RWb3hkMi9WM2Y4c2tScDY0aXkwUlRseW1qQ3drSVE0Y1M5d25zdDRaVmEy?=
 =?utf-8?B?cWV0U2wxbmNzaURoQm1BNTQrZHNsaWQzc0tLcnl1MG5vUEFKaklkd2MyUm1I?=
 =?utf-8?B?cTA1c21Qa2NJQUdGK1Vla2kvSE5oUUNBaktRUnNQcWptdDFSWHdqZk1iL1Fp?=
 =?utf-8?B?alRlVFBCYnlSRG5PcWdLcTgrN1JZRE9jUWZWTCs1YTlwa1RYZXRsZUpMVGg3?=
 =?utf-8?B?MlUxbDNqdEVTdXZaajNEeTI3NHlEUFJhR0hOVzMwTnpBRFdCV2xJSFBZZmxC?=
 =?utf-8?B?YjR2NHhpdlZBUDlHZTB4NGFmN01kNjYrSUhIOWJBa1QwdmtBL3c1WEtrZ0lw?=
 =?utf-8?B?UjdPU1IrbFlLVGVQKzFubEZ2L3IrSnpnZnhpbVkrcWcrS2hJSUdWZ3kvVkVP?=
 =?utf-8?B?aVY4MjM5ZHZSeUJoK0RkcTJIeWNBdFpYS0lhRnkrRk5TdW5sZ2FSNXpXVUdk?=
 =?utf-8?B?Z1pCK3piZ3pkNFY0d1RzNnR0bmVWSmJXZGVUVVBreU1JWlF1S0M3Y0ZPZmFs?=
 =?utf-8?Q?Kb3YfP3v0slALDrgQHAommjLN+gc12OG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3prTjlEQW5mQ3FLOTNzMkdLQXBaYnVhVmgwZDlIQ28rQ1VIYjd4Y3hWZVIw?=
 =?utf-8?B?TFZVNWh3QVVTY1pvUnRXRC9tQTlTZmVPc2RsTEJUb0dmaXdpWjRHZ28xQWZj?=
 =?utf-8?B?KzQvMXFZZ1liRWNia1VMb1F3Y0pRcEJvM0hXNGZrUHZWVXdvZVRvVGlaNlVk?=
 =?utf-8?B?ajlOdEJNVHdBd0g3OEJ2OUZkTGxldUNHMXcxZnVmc3pEWlBhbGNGcDYzbWhj?=
 =?utf-8?B?ZXQ3eVRHRnRXQWJuRzhlR0V5cVppNmk4M0piTjZaZ3UzTWRFU0RNRS80VDVq?=
 =?utf-8?B?aDhsa3BEaWhXOHcxL1NkN2NXWENsVFdXSGZlNGVFME9yUnFjemVadVdidEVV?=
 =?utf-8?B?WjE2UGVkM0k0ckRad2w0NzJCTGttRmZlUWFKc0s5MkhxMGVUQlRJWE5CanZG?=
 =?utf-8?B?eTlYR29wUkhUeVJoRzV2cjQ4b2ozRHNwTXVHNVJBa0tTM0hXNUx6SmpJcllP?=
 =?utf-8?B?WE5VdDI5RnZwY2dtV3ZMQUIrY1g0QVF0dlkrS3hGbGNOeVllRU9GWW5EWjJa?=
 =?utf-8?B?ZUR2NUxXemVlcWM1S0p0bVM2b3dtUlRzSHpGMEJ5NGJmNlQrL2hxMDFmakFB?=
 =?utf-8?B?aWJ1ZzdDMzZ4ZTJ6QlpkTHcrR2NKUmlKdnhVOUI4eFJDR0RqN2dKN0J4WmFK?=
 =?utf-8?B?R2VIb2VGUHQwTWN4cXl2SWtFZkU4SEpkclcrZEYrcDRTVU5MNnZSQjcxYVZo?=
 =?utf-8?B?V1p0V215eGJjK0d3L2lrVG8waUM3eGc3MmhjUnU4cXFsTTQ2aGlrMC9Ca2x3?=
 =?utf-8?B?dlRoQ21TbWptcVBUY3hnMXk1NEVsQjRLUkJEM2NtaUpZc3lzRG1qSGdmV0Ry?=
 =?utf-8?B?aGNEcTdkcUFmM3h0TzA2eFN2RXdBM2drRkJhUXlhQ00zQmZpMHdUNnphazlU?=
 =?utf-8?B?dnNLUGdYT0JmVGRsSWFiaTh1eDA0ejdTQk9uUitwc0hMTUhXL3c5NkJ0Tlk3?=
 =?utf-8?B?K2VDbUtMTmRqeUpaUjl6ZlhPK2lBOG9BczJraFJYMnUxRUNoOWUvQ09VY0JS?=
 =?utf-8?B?VC9ZRk9LWEFIaDNmYUM2UFBwa3RnNzY3SnlkTm5XOE14M21tUDFEUmtUZjNO?=
 =?utf-8?B?Z3Mwc0xvRk1hc0xZSy8vWTIwdFo0MWw4Z2FWRi9wd2EyY29MVGY1azZ0M0Yz?=
 =?utf-8?B?VGVkMDBmWk0rME9TZko3ZUxZUDkwVjBOL2R6UG5uS0wrNEo4UlZ6TzBIUEEv?=
 =?utf-8?B?aHNFa1hEQ0NINHZsck1YbFNxQmZLMXpVNCsxWHYxakNzcGlqUWFwRVJSdU5W?=
 =?utf-8?B?TkNpNngva1pqdnRnVG1jRDN6c2U1T1Z3QXVOYU5md01Gai9RMkFQNkNHS0Zw?=
 =?utf-8?B?VWtaWFBkZUN2TUdPbHVNandYazc1eFd3WFdPR3Q0QURoVEIwYTNIQ2h6L0lK?=
 =?utf-8?B?QlBzT0pWWjJqdkppVVVIYnNyckc4Zmgza2RXNHdQajZvWlYrajRBK2F5M3JU?=
 =?utf-8?B?WG9rRTlrRFVXWVBkeTBENFdBV2twSEZUeWw5Z0w0SE9mUUhBTHQrWFZQMDIz?=
 =?utf-8?B?eFlUMlBIWFA4RkpSYjBNV2ROc2FJT0RRVUl1WmxvVVBlT2NTYWJxaWo4UHpW?=
 =?utf-8?B?d2xmUGhCa1BXaTltMGlkbHR1N3F5VjBCZkpoM28vTytPaXN2cHlUc2dQM1By?=
 =?utf-8?B?bDB2OE1BK3A0cFlEbGlRWHJmS2NuSzRPdjBRWUgreGo5U2pYNG9Ja2k3VnJt?=
 =?utf-8?B?MG0weGYyenl0WjZuNWNoTGNQOWJuNnNMNDlsOEJZdG81UWNra0c2YVpkQTJE?=
 =?utf-8?B?RXNQUGtPb2JOblFtblN5dnZVVGhxZ21DeXo2RGZlMzdGT0w4TmNOc05zZWJ0?=
 =?utf-8?B?ejhBK1h0MzRBanRFNTViSng4SEpCSUhaYjlGL2tKVy8zQS92K2NmdHVUa0Zi?=
 =?utf-8?B?YmpKakxTc0JXVUVvLzhQWDk1TXRLNkovamZicnpITytHbExqZ1kxZ25BN0dh?=
 =?utf-8?B?aEtKKys3OEJ5S1J1RStyVVVOUGhxdkdMTXphdS9WUnQ3c3AzOTZZTDlCaGUx?=
 =?utf-8?B?Q01uM3diTUtSRUdBbUFsRVBuKzFGekJRd3oyZm5Cd2g2cS9DV0pTNWpnaElJ?=
 =?utf-8?B?WEtEY2w2cmd0ZU4xZ0lUYU5tOHJWWVR4b2NXTHhQa0xOMzU5TlVqamxHMVFM?=
 =?utf-8?B?ajNBRTIrNHA5azdvQnBpNHVUV2NTT2lXYmlnTlNWZGFtNUM1eExJaVN2cHc5?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cb8c8d-c5ef-49fc-aa6e-08de37e483fb
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 12:06:14.0174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wyhtXiSyPuLfJgqPXgr3RnJmqPCqZkdd1XUZJsDWoDLyg2LSmKiC/jjoRcxQZhV7Qs+H5ce/zQQxCCB77+Y3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7322

Hi,

On 09/12/2025 19:28, T, Harini wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Tomas Melin <tomas.melin@vaisala.com>
>> Sent: Monday, December 1, 2025 6:20 PM
>> To: Alexandre Belloni <alexandre.belloni@bootlin.com>; Simek, Michal
>> <michal.simek@amd.com>
>> Cc: linux-rtc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org; Tomas Melin <tomas.melin@vaisala.com>
>> Subject: [PATCH 2/4] rtc: zynqmp: rework read_offset
>>
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> read_offset() was using static frequency for determining the tick offset. It was
>> also using remainder from do_div() operation as tick_mult value which
>> caused the offset to be incorrect.
>>
>> At the same time, rework function to improve readability.
>>
>> Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
>> ---
>>  drivers/rtc/rtc-zynqmp.c | 25 ++++++++++++++++---------
>>  1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c index
>> 856bc1678e7d31144f320ae9f75fc58c742a2a64..7af5f6f99538f961a53ff56bfc6
>> 56c907611b900 100644
>> --- a/drivers/rtc/rtc-zynqmp.c
>> +++ b/drivers/rtc/rtc-zynqmp.c
>> @@ -178,21 +178,28 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev
>> *xrtcdev)  static int xlnx_rtc_read_offset(struct device *dev, long *offset)  {
>>         struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
>> -       unsigned long long rtc_ppb = RTC_PPB;
>> -       unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
>> -       unsigned int calibval;
>> +       unsigned int calibval, fract_data, fract_part;
> Prefer one variable assignment per line for readability.
This is after all quite common practice, and in a function like this
where several variables are needed, I would argue that this is more
readable than the alternative. Is there some convention I'm not aware of?

>> +       int max_tick, tick_mult;
> It would be better to explain why tick_mult is changed to int in the commit message.
This is part of the refactoring, mixing signed and unsigned variables in
operations is more risky than having same type.

>> +       int freq = xrtcdev->freq;
> Please follow reverse xmas tree variable ordering.
Ok fixing this and other occurances.

>>         long offset_val;
>>
>> +       /* ticks to reach RTC_PPB */
> The comment is misleading. Its tick_mult is nanoseconds per tick, not a tick count.
Perhaps the comment was not well formulated. I suggest changing to
/* Tick to offset multiplier */
 as that it what it is primarily used for. Would that be okay for You?

Thanks,
Tomas

>> +       tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, freq);
>> +
>>         calibval = readl(xrtcdev->reg_base + RTC_CALIB_RD);
>>         /* Offset with seconds ticks */
>> -       offset_val = calibval & RTC_TICK_MASK;
>> -       offset_val = offset_val - RTC_CALIB_DEF;
>> -       offset_val = offset_val * tick_mult;
>> +       max_tick = calibval & RTC_TICK_MASK;
>> +       offset_val = max_tick - freq;
>> +       /* Convert to ppb */
>> +       offset_val *= tick_mult;
>>
>>         /* Offset with fractional ticks */
>> -       if (calibval & RTC_FR_EN)
>> -               offset_val += ((calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT)
>> -                       * (tick_mult / RTC_FR_MAX_TICKS);
>> +       if (calibval & RTC_FR_EN) {
>> +               fract_data = (calibval & RTC_FR_MASK) >> RTC_FR_DATSHIFT;
>> +               fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
>> +               offset_val += (fract_part * fract_data);
>> +       }
>> +
>>         *offset = offset_val;
>>
>>         return 0;
>>
>> --
>> 2.47.3
>>
> Regards,
> Harini T
> 


