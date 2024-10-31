Return-Path: <linux-rtc+bounces-2392-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 404179B769A
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 09:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D56281E46
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 08:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BD4193402;
	Thu, 31 Oct 2024 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PdE6dwuN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2049.outbound.protection.outlook.com [40.107.249.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79739190684;
	Thu, 31 Oct 2024 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363781; cv=fail; b=Lle6r+sp3hMkJ4NW06FwjGgJf5LoKhKK0p/W7jWJ11yh/iyqWSyvrQUA8PWRVJ0K+lbr2o1vTdhnWIXM1os5RptBHTN8DWnPQmUq7zKUOb78fCGJN7Kt0fU0MECALmmOdbVVPAgsqYTXFReobqwLuVUGABUDfU47UDaQHlICHC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363781; c=relaxed/simple;
	bh=gPWrcsX0yNgOrxniFUUIpd4R/Sf/rzujv/lnBO6E3Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WD5sX3aW4GUwqcVhRsYLZtJlhpKPhO12q+1KqfXPPbQRDN3+ItXsIP6tGexh/yzGdRj2kwi6Km2Y5cTzdxr6+9mE31IGRO1bzjcjmH7aAnXR3Fw9YnOt0qLgELICmzhAGEMMTlXT+uPhHB4ISUveKvkmjYVQB+T3CeXTCi+2qYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PdE6dwuN; arc=fail smtp.client-ip=40.107.249.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrfDMrG5nc+OEP6gVlImGvjh7r2z+Ty0anrI9LbjvQXcezwrb3wqJ3YHU7S7tqnRB3/NSSZKJ1mEiVEEjc4HhgC6GckoG/tb71LrJ7VI6or5mXWkL81ozQ+ltk1K0/PKG/nADTTF0+5iro0SDi9gyfsK0WkNspuFXA2704SkPp9rD5z0vXVoLOH4mZV1mGooHu+HkmIerNGs/1XYQTouLLVOEUKkV/znj/M4a17BqbuhnXu/18Xyj/1kzp8qnpAedP7humeCfk23QZIYzffxEWKcIyoJcwJYl0whI+6RcrDH3KfAgvls4yo1I1j3EzgIsId9rQPC13XQVLmO/4vV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wh3dxdiFnnlVrzcHjBrhgCcglC+z8h3oypiIHqgl9ZY=;
 b=wQ5cTdMUGMg9Qy/ePdxwF1K8KC+2VkkefMbIwRA1uSI1zVdpumqqaNsL+KD2ELVS2lP2IBipvx+YHnWGbG9VyyFuqbHqWcYJn4M2TTw1M3PaO+5YxVPO9BVhmc2KEYoYw+nQBrCQoFq5cfrXQrjz+slVHUfhy5kSG7DnBB3EatTrpBn32qxukw2aE6OXasUMBaB4LkOvEGmFEKrzhkccHOEXSQjiYAwvQftHM8d4r9nd7WYukxyjOyUSWkev9pzYPKIth6IZm2pgbnkmLh8VhwLFbBd133Xh3qqB7Ko/5MtX3zfd8r1HE3c/ywLSG+RdjzKUnKP45t7JraTOV6M1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh3dxdiFnnlVrzcHjBrhgCcglC+z8h3oypiIHqgl9ZY=;
 b=PdE6dwuNfYrH/LufA/7Un+FGTuubreq0Y43u3FU6A+2TA9P8P/gVL6Ej4EcDG3FX6bOFU0Cll1v3RTUW0yQgIeqVol2l4G327AmP4cCDDcPg96IJ9s7/0IP0MP8RYTN+iZhL22E7+ROdbgRUmD/dgXWl/AUuz3L/RITvQFTyy9v0/XvBGgBEtucJwWCzLD4BlR5r/CxYJtJAaNyuLx8eNblcjSe7thu+JWMkg9Nr7lG2R5LbvNpQ7nF1FYCBAO3mH+A6Rl0dyPIrVNOPB0M31Wnr43SyPFtFpHylBmsDSOETz/g4gQGS3o+e2sKpbqImqm8k94OEvg6OQFt/WByVPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI1PR04MB7199.eurprd04.prod.outlook.com (2603:10a6:800:11d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:36:09 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 08:36:08 +0000
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
Subject: [PATCH v3 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Thu, 31 Oct 2024 10:35:57 +0200
Message-ID: <20241031083557.2156751-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0132.eurprd04.prod.outlook.com
 (2603:10a6:208:55::37) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI1PR04MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: f685d535-b702-4696-76e6-08dcf9871102
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUVGeC9TRXY5Zk45TGxyQVBIZnJGcFFvcXpXWXRJUDB1K0xDOWFMTGNyWmN3?=
 =?utf-8?B?OWpIRVBMa0lsS2oyZWhKc3VKUitxamkrdTlyWWI2enl2YlF1SnVBQ2RnS2Jq?=
 =?utf-8?B?cU1JY1M5ejBOUjJTdFJWeEEybWZpU29GZ1M0OTRqUk16SWpFM2o0ZEpJVVFM?=
 =?utf-8?B?QVpqOCtWN1J0WlArQlk3bXFJRzlRdHVOK2lYYVdmSVV1WmZ2T1NPUzJNNytW?=
 =?utf-8?B?UDZIb2JuTVhxSWx6R1JXd3RPMXlYOFVSS1Z6MVV3NS9HdXlmOHpRZFRDRjh1?=
 =?utf-8?B?ZWhHOHFlVXB0azFraU9ncng3ekdha0tRdTliUjBjVVZiWWY3MnVxazFueXVB?=
 =?utf-8?B?MXpmSnpLazd1Z0ZHS0NYN0k4azJueUhhNXJxZ1l3NnI5cm1MTHJwNjk2VklK?=
 =?utf-8?B?WTZ0a2lNWjR0Ymk3QkdSTGp1c25VaVdleHFuc1ZDYWpURmFuaG1Qb3BFd0RR?=
 =?utf-8?B?U1ZsNEljaENlWXV6U0ttUGNrcUZlYWdCV3I0dFRiWXd3dU14VHQzbGZ6M0JL?=
 =?utf-8?B?RlBiL1JiNlpIQXNyejNOdGphRitIYXMvR2Foa1dPRENiTmdmTEh0VkpPWHhU?=
 =?utf-8?B?MnFkMFNYcyt5TDJRbGdTVk5FQVV1ZlZPTTV4U2VITmREbHU1S3M1U3E0ZTNv?=
 =?utf-8?B?STFOWjFDV3IybVlOV3V0clJhdjZWeStHSTh6QWVXQ2gvWEREeXY2bnh0VHRr?=
 =?utf-8?B?TDJ4cGxGaTRZSGtwU28yVjdvQzNFT3NYa25XcnQxc3g1aWwzWjU1eXFaNVdL?=
 =?utf-8?B?ZlVGKzhocFo0U3ZpbElyRHBXejl4UGM2UWFDbkVVT3VTUHBLdXFpaHE4ZC9h?=
 =?utf-8?B?VEk0ZzF3NlZONzllQ1UyYnNLeTVoY0dETkpjaVBUcWoxZHhUQTExWVdMY2dY?=
 =?utf-8?B?K2x0NksyTzh6eS9JNjRuL2R4VjNWYVpGRkQrSGd2QUtmRXhDVkg5VGl6TTJW?=
 =?utf-8?B?Z0U5b1gxK1BUVWdjOTNEUUw0bzlKY0Q3enNFcFo4WmdEWHc3RXBqeUhoUU43?=
 =?utf-8?B?elhIMStZbGpuNHpqNDRlK25LR3k0c0xIaSt2cllVeWluR0ZiaVFIb2dmRysr?=
 =?utf-8?B?ejVwcytJZFd1NGhrT2RjWmcvd2xBNHA5WjVJSUFiNmZwVUFBbzI3OGxrYVhR?=
 =?utf-8?B?M0lOcFVoSmRVVElMYUlIeFZlQXc0bTZJdEgxc3I1V1AzeXBVKzdDcTRTYWxx?=
 =?utf-8?B?dm5xM05aL3FmSGRmVkhId05IMGJ0OFU3NzFVa01JUktCTGhqT1VGMG1hVXpw?=
 =?utf-8?B?OG1UMnBnUzVxOVV0dTM4SjRoaFYyUGVrV3RxQmVzdWR6NzYveTJNcllPTDVh?=
 =?utf-8?B?U2JWWkVxVkppM2RXQzZFcXBDVS9tdDZ2bmZFL240eWw4dFp1STBMSUpoWFh5?=
 =?utf-8?B?eHpCTVRYN1RuNWR0clN0QzBRZUhmcGllNXFUaElZSG5kUU1sS1NQOFl6Zzhh?=
 =?utf-8?B?S1lKdTFvQTNVbERaUFhlaFVObWFUNEVieUFXeGpVQ1RzblZ3K1NNWHBjakp0?=
 =?utf-8?B?ZXRsdHUvYnQ4K0hUQnNxWk13eXkxTDhWekZsN3huZ0R6WnZDdU1EUHovV1VK?=
 =?utf-8?B?N01iWFQ0Mmt5VERWeGYxN3NZSnhQSXhZeno5L2o5UkhPa3NMYU1za2VoT2tC?=
 =?utf-8?B?ZWdza09ucGpJdEljdmFYRFBuNzY4K2o5aVUrejVWVldFVjl4RFdaaXlrK3k3?=
 =?utf-8?B?TlFJcTZ0SXJXSFFFNHQrYW53TlQzYnNRaEp2NVRKM0FrSlhwdVdyM0tBYzhC?=
 =?utf-8?Q?J5cWXoNKCBnlj3KjUU+PN2mCx9lkaYPULPsezTD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzFPeXBqSy9mUWNaVTE2RXVNYjBpREZtZlUxRGcyNDRBTDNabzJBWnE2K3di?=
 =?utf-8?B?dExOd3BtTG1vWEZXeFlPV3NQb2FRaHZ2ZkErZGpOeHM0Vm1HSzhBbXlEdHVr?=
 =?utf-8?B?UjBobnBWMTA2dUtKeVJEc3VXL2NMTURsZnk1V283T0owbUZlZzNnTkl0R0s3?=
 =?utf-8?B?YzlrR3htOXh4bmowTFJjNDB1Q3lVeW1FSXVaek1DdkVzMytRclhUVkordkdI?=
 =?utf-8?B?dUcxMjBSTEVmQ1pVV0xZbU5IS1daUWx0ZVprSEloVjduamtBa0lhVDBMM2E4?=
 =?utf-8?B?UHR5c09MRlpFcjluU1ZJYlNqUHVjcDZMcUNNemJOTXVDL0dOMGxYU25rRDR1?=
 =?utf-8?B?UGVrTnJPUlBxTkNZdnRNU3UwSUhocyt3Um1SSHpzUWg4akFFNEJLTkFXR3VB?=
 =?utf-8?B?bUFOWXkwTmp3UGdodW9RNFZycnh6VXJpak52ZHRPMjBnbHB2L0Fud1pocFUx?=
 =?utf-8?B?TWFqWkt5TTZuUWdGaENqelVjVGcrZjZDb08wNnFqaFkvSHFXTy9LNmxadWpF?=
 =?utf-8?B?YmVmb1U2STVZbk9Ub0FHYXl2WVFVdWlZT0lhMzFhUlhHTU5KNlZMUkdGVSsx?=
 =?utf-8?B?WVFWa2lWalpWU1hhVnlVU21Lc2dHKzlkSTd5b09PZGwwdktpQStLQWJiaCtC?=
 =?utf-8?B?Q05oWGJ5K2s5MDlVWjMrbXNvZ2RncUdlOFg5dUwyR2lnTFN1YVVXaE1DcTRu?=
 =?utf-8?B?K2V5Y0t3b2RNWitVZksvMGNiZVdhOU9HMXZodEMwdXp4TndFQ3Ryb0doVEc2?=
 =?utf-8?B?S3BrZ0dpVXRibUhJYUc3VURINGsweHkxSzU0WGViUW5ITWFYYVRGb3NUSE5z?=
 =?utf-8?B?THZyQWFZWlpZL1lqZ05WZDRHQWxNcGZFSjMyL0xvSVJlUXlUMTNRTTM0VnBN?=
 =?utf-8?B?VC9wNlFUQ21QMkhDQ1RBRktaczlXMFNDcUYvSW96bVBPalJ2ajhVMEhtV0NK?=
 =?utf-8?B?NDNwOXhRdnJJdllsRWlPd2ZpNU0veHd5VTI3M3lPN0tqc1NYRVJvS3VtS2xZ?=
 =?utf-8?B?NGs5aXo4OW1BTmxrK05mb3plam9DMzFhN3VwTTFzS0dwcFRpRWEzdHBHWjJH?=
 =?utf-8?B?NTU1ZTIxb21IOENuQWZkNlRuN1F2d25Tbk02QnRvbzdVR2F2UjV3Slh3TVYx?=
 =?utf-8?B?NE5QRThuL3FkVDF3UlNycE9iUnZaMWNaa0xFeU91eXFLV0VRT3ozUmFweXB5?=
 =?utf-8?B?OGcrRk9KdzlQejJ3dFdqc25SQUx1akVob3U3TmdCR1prWGFHWWt1N2wvTS8y?=
 =?utf-8?B?anlRa2V4bS8vT0RGenFVOUhnaWJTeEEybldCQnlGWUhXMkJBN0hncEYvbFhH?=
 =?utf-8?B?a3I3WW1GMzVZR3o3YW1Wd0MxS0M0amNKYjVmTnNMN0IvVWsrY1JhVTRzT2Z1?=
 =?utf-8?B?R2FpdVhUVDBGMkhDUVBZOTEzN0VpaGpEVlhGSlZqZGpWVDR2bjlkZFI1ZVlj?=
 =?utf-8?B?OUtSQVlCTU9oeVNGRDNrZnVjZ04rcjNxRXF3UFF1Qk9NdDJKMDZ4eW1DRmNm?=
 =?utf-8?B?RXMzVzNXVi9XdmE2RmI5Nzl1T0FVc1cybEZiYmw5QlBHTFllQmFLZjBrRmIy?=
 =?utf-8?B?azh5WW5hV1pneVcvUE5YL21LcVB3VEVWQUwzTkR4d0FjbUZhQzJtKzNNelUw?=
 =?utf-8?B?eG1Sb3lPeUsxUXN3U05TaHplcmJvQUVFbE5XQXFCY1NwNkpxdjZhSDJ6dFUx?=
 =?utf-8?B?d096SU1ja096U094TnZldkprQ2tXa1p2SEdHdUNiZG8rSzJrZ0VHVlJYU21B?=
 =?utf-8?B?OHpXcnRBcUFFTkpHd1kwMmFwdGlWRldPbXRmSFpGR2dRT29WdW9mbEtJWUI0?=
 =?utf-8?B?S2RKQ2JTa2pxUWtXVHdpODdqaHdBS1FDYm5DT3hib2tpQ2VqOHBpZmplUXZM?=
 =?utf-8?B?MEErSExaZ0VLdTNjTCtJYmZOL0JBWVh3SWdTZE1iOVY4YWhNbjBoS0JJTW1T?=
 =?utf-8?B?T1NHcTQzeG13L3dpdng4UkZ2dDdCRlJNQnVyUHcrVFV2VjYzeURZZkJleCs5?=
 =?utf-8?B?TjhUMlIyRWQwbVIzUWJCbzVYNnZxTWt1ZWVSL1B0cTZIa1lvUkpDYUVDOE5a?=
 =?utf-8?B?TXJJWkRaVzh0R280Vks3OFMva2xiT0xCdjJudDl6L3A4b3RNbjZIUVJSWEpq?=
 =?utf-8?B?aDh0SWpCQTVadFNDRlFIQ3hmNnRSQllWN0h1Y2pKNXR6NzNvTUVjSlBzakRO?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f685d535-b702-4696-76e6-08dcf9871102
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:36:08.2679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JV/sNlW0gJLaGObf1ysfPyoRsvvuioBFOXx5pQhdrAWXj4rkTRggjTd+sSB82qRgE6SPn6yC8Avy0JgSmbg2zg+20zUDsw9i6zX2/vcWIDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7199

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches
on this driver can be reviewed under this architecture.

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


