Return-Path: <linux-rtc+bounces-5934-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOikOogFgmmYNgMAu9opvQ
	(envelope-from <linux-rtc+bounces-5934-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 03 Feb 2026 15:26:16 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA0DA8CF
	for <lists+linux-rtc@lfdr.de>; Tue, 03 Feb 2026 15:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0A363038866
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Feb 2026 14:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADED23A9620;
	Tue,  3 Feb 2026 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="RN71/hnr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C13A9614;
	Tue,  3 Feb 2026 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128771; cv=fail; b=knQO8cY+chsyhWi0/4xJqu8ToGNw+GPEjfLIi9NRda2QC3GYptXjwrfornBFQMRf0atWusXy/0McfBjuGWN36gebBNkN1QofZrRq4BKI+pjNI3uI7hdcT7cWI6K7OByRWET+j66yiTMmCtxh3AkqQ6QXcKeuoFoG6uOG1Cj7dgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128771; c=relaxed/simple;
	bh=BiDiBEFQNNU+OogynGmrvJpF3zRvyws5V+6yS+N/5JI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ot+tfXoX9Y5lVHdeTAf26sKISS+tjlpDIw6ijKyOSnrYES9KEETND09Dx+HGB8TOrporHIUFYsWsg5F538S1lvEjCm8Zk4wkuQ7l1ERYoY4vwkJy4pyAYdX2t+qghCnHWe1rA2ULBa7Y4201EICUFxywxB3G1G+5F/ynGTDvUv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=RN71/hnr; arc=fail smtp.client-ip=52.101.72.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1uYxA9iBSZbAFqv3bScHhn5VAbKaDynUrd8vG7x5AJ4T+FqLVSuef0rQTo/bUNGoa/YBkVPvVxFGwDfFqODMf1CPpg9HVTx5r6B/fSZbc36lR11rewmX0Vc87x7g1TqprWVTqM5VGYoXndvXnvTwxMQz3l+VsdC9wke/RLoyulDYOhbh9aPASchv3lP7hWhwCxFrP3d+mMZF7+6/c6kOYRK2aZ9pjnkwVPaW8q4SqyMZyscf1Sy5DZp4iz6CAwbzDruBtRxGJ9HO6yneDV7NCBxgpncMdhZucLVbbNZcFcEQjNXwuWTlNk1ZYqcFFkBgX4dJ2SQIDG+FRX5MfHfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htFRRwqGYTQ+1sDmdUzq5jY0tz/RXWOKa6AvpXZKY3A=;
 b=K3ijkIx98nOKE1j4XXOw4EXP5NDYIDYPDQ5HIekVTJL7A0AF6ib6ayJLoxmYa0xvnLU1KtvuOpJjrAyLpBQXU3HswP9qmZsdq5Bs9j4wto06ILWnakFk2SKeX8F8c8piCjT4DOZHwwq+v0lxWfjZ8zXahMJjm1JRQpq5icY9T1lgHzkpoz71yVbJBa7+Bcumf1/wHqPY7H1FcRpb1uyt9Q/Rkm8gFz1QUuX77aLxOm2+1KLR9tL/hRvCkGkKKBknaRDZWm8kd6U8aM19BAYu5K7pdozBEU6N3Hlk9T6fQ7JKmPXobNPZXcRiBoEGdZIZehmsUHwMPXQmhTl8+l29ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htFRRwqGYTQ+1sDmdUzq5jY0tz/RXWOKa6AvpXZKY3A=;
 b=RN71/hnrO1LNLAxkF30fHZHhNCxn7//fIlq1ttQDlCVylcRJK+X8cVllDwaVPIHgwJYY9ULEfOmh1Zi5EDbpJI08OGMWNUwRAcY6K7e6aWkxKEaGVZ5dePeHFzc2QzjS1S2okFIwm137ZcfYY07za4qFpPjQkng6KiOvG41vCUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AM9PR02MB7329.eurprd02.prod.outlook.com (2603:10a6:20b:3e5::6)
 by AM0PR02MB5778.eurprd02.prod.outlook.com (2603:10a6:208:18a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:26:04 +0000
Received: from AM9PR02MB7329.eurprd02.prod.outlook.com
 ([fe80::3854:ac4f:3dfc:8113]) by AM9PR02MB7329.eurprd02.prod.outlook.com
 ([fe80::3854:ac4f:3dfc:8113%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 14:26:04 +0000
Message-ID: <506a4702-9a28-4dd6-8e62-feec1ee9f83f@axis.com>
Date: Tue, 3 Feb 2026 15:26:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] rtc: ds1307: Add support for reading RX8901CE battery
 VL status
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fredrik M Olsson <fredrik.m.olsson@axis.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@axis.com
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-4-b13f346ebe93@axis.com>
 <20260131000549071abafa@mail.local>
Content-Language: en-US
From: Fredrik M Olsson <fredriol@axis.com>
In-Reply-To: <20260131000549071abafa@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0091.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::29) To AM9PR02MB7329.eurprd02.prod.outlook.com
 (2603:10a6:20b:3e5::6)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR02MB7329:EE_|AM0PR02MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca5c386-24ee-4a63-8a62-08de633029d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFhBTVNjZzlYTHlkNyt2bWVhdFE2cmdHdWdkSW1qeVArZzVvUExBUE9tZ3Mw?=
 =?utf-8?B?Z0REZzhoYzhTVUU2SW1pMk5Nc0Z0YmpyY3YxUkxidWxGOHBJU21jME9qOENp?=
 =?utf-8?B?Zjd2eUpkTVIzbHAzM3dvYnJGQzYzSHltd0g4ZVo2d3gzWXlZTDJoWDdmQTJX?=
 =?utf-8?B?TDA0MDFtaUZTN0U3S2hCUVArNk1leUdsZ2l3VlZZcUJsNWFSZitWYjJWOFVs?=
 =?utf-8?B?V0t0VHFjWDd0TFZFOGwzZkhvcFNDVDJ3MDJEZlZQZ2JzQk5QUHJ6dHFJdzBm?=
 =?utf-8?B?WS9ORzNtSXlobEVwenhsaURONTNvOExuZ0dFNVRaaHRYT3RaZGZhN0VIZlU0?=
 =?utf-8?B?N0ZDdXJ4bEpTMjAvRTl1WXh2QmxtcDIyZjBCL1c4MGdNNDhMaXlLRkk1Y085?=
 =?utf-8?B?Z1JqOXhPb2JDeGxOZStjR1B5M1dEai94UkdtMHFabDM5bDNIdmtKd0N4WENW?=
 =?utf-8?B?YXJFNmtsamg1MFhqVWJwYitFdUpKV0IxeEd3d2tneTBIWUtQMFp1QTN3SGN5?=
 =?utf-8?B?eFppOEgxYi9iSzlaclV3MWlyVDBtT2dDNUhMeTZCbjZmVkUyN0dJdlhLNGhL?=
 =?utf-8?B?UTB3cC8xcEp3NStLWGk4SEhnUDlQM2FBeWx3Vm5lL2NlaFJpRTIyWDNGb1Fv?=
 =?utf-8?B?S2lEV2hmTlVhaFJ6QWErODhIalVlUVJqU05ZYzRxeHVNbkpPMGVRZi9qNU10?=
 =?utf-8?B?UDJLNGVYZkxBUUVHcmZYRThnOHAzK0pTbS9LdFhzU3VEcGxZMVhqeHFxSDZY?=
 =?utf-8?B?NkZ3N1l2Mm9GbktTVzZ0SkMwVWhyWmVxM0hyM0Rtb3pJUCt2VTdYZmM0V3ZK?=
 =?utf-8?B?dlVaVFVYdUlLOWlPbjJVZi9lV2drVUNHTTVLSHh0b2kvcmFQSlpmMTBkVEYx?=
 =?utf-8?B?V2krelBOejlsd1JKY3J4dGt3QzdsczAzMVNpN3JYZ00yaEpWR1BzVDBsY1do?=
 =?utf-8?B?NDdabXpNcXNnamg1UEpJSmZXT1ZiNENuVkg1TStVZmVNQmcxd3RnejB3MEhk?=
 =?utf-8?B?b1VFMW90K2ZBME53eUlreVp5clB0NEdoU2lXbjV5WDVvVzZmNzFwVUdvMG5n?=
 =?utf-8?B?UEVZRzkxZ0F1cllDOHRyM2RYb1lHN1ZiZEMwc3plSm5weVAzS1RiR1B2YmI5?=
 =?utf-8?B?VjdReDU4SWtWYkdETTdnQlpjYjVoTHExeDdmcDA3eG9jcGtMOW11d0dVL1ZL?=
 =?utf-8?B?SVU0NHpxNm5wblYvclhtQjRySWNyT1JMd3lmRnViY2dRdVZ2ZFNpbVY5cDVR?=
 =?utf-8?B?UHRoditVYi9FamJOblJyQW1CVDVyUlJDMnpoTkI4WHBEOUtaSXQxK1c0QWtw?=
 =?utf-8?B?eUJwMkdpd052VUtFK2k1cGtaV1VUcEVBalJhM3I2S1djd2Z4NVhiQVlzc2ds?=
 =?utf-8?B?VnVvVmVKaGJmRy9SY21oREFYR0IyWVVONnBEaXEvN2ZVayttVFN2YVpVQjNS?=
 =?utf-8?B?V1NCam0rdThDaVlrQzJwWUplSGl1TFpRc2oyYkRvUVEwWlU2ZUtTYk1TNlZk?=
 =?utf-8?B?ck5QQ01vMjEvTUk4aVhvM1pFaTdjaGxnR1FSQWYxdjV2MHg0VTlsVi84TjMz?=
 =?utf-8?B?bXVUMVRoYTNSZklTd1R0bWwvRkI4SXZRUkhETHNmZmdOdUVPWVdNNFhFTEhO?=
 =?utf-8?B?R01QL212UFFNaVNDaWJyYnlVWU8xSkJlUUt2Q2lyWkJoTHhBUnR6NW5xL0xZ?=
 =?utf-8?B?d04xbXVHQ0FWNDFDdE5RU2thM2NWS3FxRnRrazFqMlBPTmJMTDUrektJR3Ju?=
 =?utf-8?B?Q29vM1A1U3VIUmZJSkJydmdEK0ZteHlTWW1La29iMHpKS1VlT2JNZ2lnVUI5?=
 =?utf-8?B?RTFpNEZjUkVSZmVHeDNxSjZ2c3h6clVUVEpPc1FHUTZpTnpBL3F6SDRMb3E3?=
 =?utf-8?B?Vm9UdDhHMTI4TURqUDVvNHc4YW9obmx1RWt2eXQvejhtZExGemp4eGs4OVpZ?=
 =?utf-8?B?VThTZDVLenViRGtNd1JOaDhmV2lyZFR6SmROd1F6cjluRDBRbC8yUU9qdXB0?=
 =?utf-8?B?WWluSXUxbWdmVm9qeEc3Q2IxdDRiMEdoNTM3b3REUkttSEFtOW9tL1NhcVdE?=
 =?utf-8?Q?2sW0XN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR02MB7329.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZERtd2lERkoxeDRNRGtJWXNseW1Ub2Y2YUlqZDdOM2Rab1c5N0haeEVqOTNt?=
 =?utf-8?B?WitMekJSY1RUeXNYMHJKQ050anZ1c1lEMU91WWVvYlYzMGluelhkRlhUR1RH?=
 =?utf-8?B?aFljUlFkYy93a2NqdUVaWW9hc0lPMmJJemlzTk5VdFEwbkExZndGVDM2TjlN?=
 =?utf-8?B?NkMwNEpRM0orOUtzRTdKVGdtVHlnZWRVWEN2ZDc3WVI5ZG9CaHcwQ0pUN3VT?=
 =?utf-8?B?T2dpQnE2cEhXRE44ZzE1QnBIcFNDODltT1pFVThUQStTRnlBZmUxd0xBZEVF?=
 =?utf-8?B?OGt6TEtDdTNmVUR2ODBscTZuRDZ4ZTN6WmJkcHNEakF0Z1pISFl5Y1J1YUE0?=
 =?utf-8?B?VUIrZVlER1N5THhUdVBmYzVLLzlJekZFanRDUTFEZDREendDQisydk5CejJx?=
 =?utf-8?B?eG40c3JSZFFlUGhJdWNhL2o5QkNvWmpjTlVlTXZjU0w2YmNZODZ1U2ZBMng5?=
 =?utf-8?B?WlVyYm03Z0FSZC9vTHNXcU9Lb3dCZWNVbHJPZkVDZVhod1VZZWI0aWN5NUZw?=
 =?utf-8?B?TzBNbFdjQVp3SFQ5WkdLcUtSNjBtRGNZazNHU1k2L2RaYXVodCt5VTZuTDdV?=
 =?utf-8?B?cFhtUDNGMVdmRUVmcW90YmE0bXpuZGJ6RHUyb3pIeGlZNk9SUVZSVHpMVEt0?=
 =?utf-8?B?Q3loZDY3Z2VIUlk5YkFub1JUVk0xMlRodFJRV3VUNy83Qitqd25HUTd4eEZF?=
 =?utf-8?B?S1VzYWtRZWlOekhIcUhYMUFuMU5FY3p1NGZObURueDZ6Sm1SSDYyRG5KSnB5?=
 =?utf-8?B?ZWhBUE1LQmFqMjd6dUZaUWdjQWhveWRvWDRIckdhM3lEd3owdEI2YmFqRjdM?=
 =?utf-8?B?UHh3ekUrVHBuMlQzK2hkTnphM2h2dkNjU1drVm9FdmJibkQ4SUd3aFkzMW9q?=
 =?utf-8?B?VVNTdlZQTTBLblpkd21uMmhNWVJCNmJZQTRqVjhiZythdlIwb3U5bndkK0xU?=
 =?utf-8?B?S1F3OXdOZVBva3VTem9rak94cGJMV0dSZFhBTllzV0swanlhNTFqa25KTU5D?=
 =?utf-8?B?c0Q1dDJ0bnk1KzR0UTYvTHlsNUdQdTV0dHUzMVRxSzNPR2IxMU40alFVZkZR?=
 =?utf-8?B?RjMrM3A0bFRwWDRxdHZpdk5oemZPTU5YVHRNOUF6T21SbUkvYTdyUnA2S2VO?=
 =?utf-8?B?UDE0UDdGWlNKZy8vVmFZR09vbkg5SFVFNmNZUXgyM3BWM1cvczhEbGZtbEJw?=
 =?utf-8?B?VVJkNjM5R0pWRUx3MlFGRTZZTDRiSkt3Q0RJVUU4WTdxako2UGt4MmxuQVNo?=
 =?utf-8?B?OHNiYjRtdDhDZWh1aE1WRHdXdkdwTTFZOWgyMGR1a1ZDMkxzL3JiRi9HYkpw?=
 =?utf-8?B?RTJwYXpZQkh3cUdNTnhrL3dxY3lVNVFJMEFGWmRzNzlTcXJnR0kzMTh4L0Uz?=
 =?utf-8?B?dTV2R2lOYWkyMkpXL1IzTmZlYjFtU2lMSURuVGt5TjMybDNLUkI1R1dlTTl0?=
 =?utf-8?B?R0VMTkN1bkJHK3FUaCtya1FQYmltN0trVDZpaXlOOW5NMndEd0pnbHZOK2Fz?=
 =?utf-8?B?RFZoZGlEY0RveWg3WUlwSHIybXNMVXVEL2RZTnIrNVNXOEhHUDluVWlYVEdX?=
 =?utf-8?B?cnZNR1hWNUI4SS9QZlN6cXBqT1hNT3FabC9qY05GWS96WnJNZVQ1UlFSdy9n?=
 =?utf-8?B?clBrYlo5VElpS2pTRWlpeHp1TldoMUFLY0Z1V0lkVUJVbXFadXpkVk5OWjRr?=
 =?utf-8?B?dXFuWHV1WXRvUXJMN0lKeEFabEVMK3RveHdKYkpXZVJTb1UwTUFxR2xva2Vr?=
 =?utf-8?B?TjEvWlZlSVk1ckJTNE5DMVExVUg1eXVMZ1h4WW8wSThMOWlFUnlVVDBtSHkz?=
 =?utf-8?B?SytzWWVtdW5GdHZLZ3dpMzN1QWtWM1VwL3E4eXVSOXlUeTZDVjhMZ0lZSXpU?=
 =?utf-8?B?Q1lmRTl1VXFJMVVCVGtFTmdzVXRuTGhhMExFTCsvMnFqbk03TWZFZUtxeHQ2?=
 =?utf-8?B?c250dno2YWk2bWdSeHFHTkF0Wnoxc3F1eWJ5QWlrbzRUWUEvTW9HbG84MHBn?=
 =?utf-8?B?YlFzeHkrTTRDYi9BanE0RzlwZUNqUzBFZFVyWXd1TGsxdG9xVWZxQ3hXTWJO?=
 =?utf-8?B?K0pOak00Q054bXBadkRjZHVGVklqVU1pRDVJeTRBVHhlMGFUc1VnUTk5N3Nv?=
 =?utf-8?B?MUVUdWZJb1cyY3dBUG1HQTBVTkgvaWVmUFZwNzhoYWdPTG43azE4YVRkQi9U?=
 =?utf-8?B?SjJXd1Y0ZTNhVStoSnYxK1dweFpkaEdKelY0cDQweGRGNHpIaGVIM2hacjNK?=
 =?utf-8?B?WVpxY0lZRDZPZTBlb0ZjZXJqbzltUGlDSll1b0tScDQrREdUYjF6bEJIcTVV?=
 =?utf-8?Q?BMt2fJrrQpbec+19nW?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca5c386-24ee-4a63-8a62-08de633029d0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB7329.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:26:04.8108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFSaig/BLLf/seq2OK7gODMCc5uNKNRcxCLnBPbchNqLIlr3K2I+zrRUdotaS+WR++Qa+ikm9KQtTSyio7ycuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5778
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[axis.com,none];
	R_DKIM_ALLOW(-0.20)[axis.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axis.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5934-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fredriol@axis.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,axis.com:email,axis.com:dkim,axis.com:mid,bootlin.com:url,bootlin.com:email,aka.ms:url]
X-Rspamd-Queue-Id: 92AA0DA8CF
X-Rspamd-Action: no action

On 1/31/26 01:05, Alexandre Belloni wrote:
> [Some people who received this message don't often get email from alexandre.belloni@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 19/12/2025 13:10:38+0100, Fredrik M Olsson wrote:
>> Adds support for:
>> - Reading the battery voltage low status using the RTC_VL_READ ioctl,
>>    which also reports invalid time information if the VLF flag is set.
>>
>> Signed-off-by: Fredrik M Olsson <fredrik.m.olsson@axis.com>
>> ---
>>   drivers/rtc/rtc-ds1307.c | 46 +++++++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
>> index 99d95e520108..ca062ed0c867 100644
>> --- a/drivers/rtc/rtc-ds1307.c
>> +++ b/drivers/rtc/rtc-ds1307.c
>> @@ -133,8 +133,11 @@ enum ds_type {
>>   #define RX8901_REG_INTF                      0x0e
>>   #define RX8901_REG_INTF_VLF          BIT(1)
>>   #define RX8901_REG_PWSW_CFG          0x37
>> +#define RX8901_REG_PWSW_CFG_VBATLDETEN       BIT(4)
>>   #define RX8901_REG_PWSW_CFG_INIEN    BIT(6)
>>   #define RX8901_REG_PWSW_CFG_CHGEN    BIT(7)
>> +#define RX8901_REG_BUF_INTF          0x46
>> +#define RX8901_REG_BUF_INTF_VBATLF   BIT(3)
>>
>>   #define MCP794XX_REG_CONTROL         0x07
>>   #    define MCP794XX_BIT_ALM0_EN     0x10
>> @@ -458,6 +461,39 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
>>        return 0;
>>   }
>>
>> +#ifdef CONFIG_RTC_INTF_DEV
>> +static int rx8901_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
>> +{
>> +     struct ds1307 *ds1307 = dev_get_drvdata(dev);
>> +     unsigned int regflag, tmp = 0;
>> +     int ret = 0;
>> +
>> +     switch (cmd) {
>> +     case RTC_VL_READ:
>> +             ret = regmap_read(ds1307->regmap, RX8901_REG_INTF, &regflag);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             if (regflag & RX8901_REG_INTF_VLF)
>> +                     tmp |= RTC_VL_DATA_INVALID;
>> +
>> +             ret = regmap_read(ds1307->regmap, RX8901_REG_BUF_INTF, &regflag);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             if (regflag & RX8901_REG_BUF_INTF_VBATLF)
>> +                     tmp |= RTC_VL_BACKUP_LOW;
>> +
>> +             return put_user(tmp, (unsigned int __user *)arg);
>> +     default:
>> +             return -ENOIOCTLCMD;
>> +     }
>> +     return ret;
>> +}
>> +#else
>> +#define rx8901_ioctl NULL
>> +#endif
>> +
>>   static int ds1337_read_alarm(struct device *dev, struct rtc_wkalrm *t)
>>   {
>>        struct ds1307           *ds1307 = dev_get_drvdata(dev);
>> @@ -599,10 +635,13 @@ static u8 do_trickle_setup_rx8130(struct ds1307 *ds1307, u32 ohms, bool diode)
>>        return setup;
>>   }
>>
>> -static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms, bool diode)
>> +static u8 do_trickle_setup_rx8901(struct ds1307 *ds1307, u32 ohms __always_unused, bool diode)
>>   {
>> -     /* make sure that the backup battery is enabled */
>> -     u8 setup = RX8901_REG_PWSW_CFG_INIEN;
>> +     /*
>> +      * make sure that the backup battery is enabled and that battery
>> +      * voltage detection is performed
>> +      */
>> +     u8 setup = RX8901_REG_PWSW_CFG_INIEN | RX8901_REG_PWSW_CFG_VBATLDETEN;
>>
>>        if (diode)
>>                setup |= RX8901_REG_PWSW_CFG_CHGEN;
>> @@ -1005,6 +1044,7 @@ static const struct rtc_class_ops rx8130_rtc_ops = {
>>   static const struct rtc_class_ops rx8901_rtc_ops = {
>>        .read_time      = ds1307_get_time,
>>        .set_time       = ds1307_set_time,
>> +     .ioctl          = rx8901_ioctl,
>>   };
>>
> 
> This seems to be an unrelated changed that hasn't been squashed in the
> proper patch.
> 

Okay I will squash this change into patch 3 for v2.

> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


-- 
/Fredrik

