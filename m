Return-Path: <linux-rtc+bounces-2421-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 667349B8DD9
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7E7EB2195D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 09:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2594F158853;
	Fri,  1 Nov 2024 09:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tdayThRr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013000.outbound.protection.outlook.com [52.101.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18B5156220;
	Fri,  1 Nov 2024 09:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730453378; cv=fail; b=RTEjTFQgy0y3LOjEHOqaAkRRRA5u5/t3Kl0nEW/bH21ojHgTy3GlDCYxTmW3rnHP1S/z0aR1HnPC4RLzygntxaK5YBLiGLkyHQdH95HAng/ml9NHHPAvHTktw51YFs408NN52A1eD2+5ahQCjbnXSo832q5NHEwHOKJinhJVCCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730453378; c=relaxed/simple;
	bh=pLyN9uQeSWC1xmMISGMf+YYxJ2MeY+mm3U1O/FA822w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V7ED4ZrTwi2YA9fXxlACUqZ+g1Xms6iercqqjxbxaDpLnRZNyob+/6eCrHUkInGGg4v+F17LBu88SFsxZ3x75dPuJdnXl9a7Bytq5YQpL0pZiFkDj6WgyJILPBaZkEksJ9kIbSungCMyJ/c9j3qzQi5g0kHpqkVWnjR8YnExNIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tdayThRr; arc=fail smtp.client-ip=52.101.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvPp216b6RhJTkdkFq7/DdlhKIs5OTf6zBhdQ2ckekAmx5QHpnItD4n/zIOhDLwpsaNuKLgi0A8rDn5Lv+nkjDGYmOST6nW0JMZ2eVEn1aKVuZ6NDTWD40W7OcBO/dkFFXJkOJJjBJYIGDLaFz8j+QYdZVKif/zec5qIhoHG3pw8+kne3UnHj6L19lepG8xk3YHdEKdvyioyoorF4zNKO61LT+vSYjBXJOKdfq0BRHYoA+1gT8t9ttNpu0YHWqbWPtOP4qR4UuRFCbcbgD8do41zja8RjRw0dD+d8b9CkF/L5e9CRg8mgwbzKMsxjyzzcu44oeFRUNrz27B+Zu1VKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK0x1E72n1sGS5SJjkZSuIEEH26d/Y4oNTA3k6k+WaE=;
 b=Ff50qBcxKCRk5i+JlyQgHSxpwjcQ/MqcAmFzfbFrodylENB5tcowtRbZXCm2DLBJ27Ax/J9zrE7tnyfOzfztVCNtpaNDzIVavc9wjJgG3Yozx+EaTmsDJ1UvOJJDjXQFQjqS4U1CFegPGQMWlsdZePAJTVSX3vbqXpBiFntnxuFIFdsSJvWHqHGpTCJogNChW0jsXyA8MU4BIP3VrHfj+3TNyL3Jd42iNYapbdoId/kM+p7jaLzOHeJZA4iY5IyRYxFrnmtf5Net8PjIXNUGDLQWteJBgNHALOkl0TY4P+PrZ3wdaALEZSrrorEGcPObw2jNPM350d6f3+Ez1geSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK0x1E72n1sGS5SJjkZSuIEEH26d/Y4oNTA3k6k+WaE=;
 b=tdayThRr/NJYx/RHB6yYJv8mmAokgkKwm/OiKTQxm01IJDCijtQVFXa0yRf0HlmmpW/mueBkkgFQB8CinhBSMpVn6C4ypy7Y7+xbSuaRaMZiKgXZ5cR0mhgLzvRbNsAJy07Y6vt67ubvPugRBYDNgU17Bj1p3Da13Qt2PobZDIn2vSuGeIPI2MLWu5uSiFvr0plxVGA6mfIQZRn6pgQHD0A3zShm69byIsU34i4lYfSFA218lSdRuw2XU946cks7IFUHlcdIuYdyVrthnuw8vbymNa3T8/vVA7ZfcXN3K+PMuNb7bdXe5sQtCCaJTy9fN7zi9ERw2nNmxgx3Uo0dwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB10557.eurprd04.prod.outlook.com (2603:10a6:150:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Fri, 1 Nov
 2024 09:29:29 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8093.025; Fri, 1 Nov 2024
 09:29:29 +0000
Message-ID: <4b82e393-093f-4477-bf0f-ee559a3b97c1@oss.nxp.com>
Date: Fri, 1 Nov 2024 11:29:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
To: Frank Li <Frank.li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 IMX Review List <imx@lists.linux.dev>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-2-ciprianmarian.costea@oss.nxp.com>
 <ZyOyvgw0qZ4YKwTi@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <ZyOyvgw0qZ4YKwTi@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::22) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB10557:EE_
X-MS-Office365-Filtering-Correlation-Id: f0eb9486-28ce-4428-d05d-08dcfa57af22
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGQ5VnZ5YVdidGM3ZHg0TngzRVQ3M1FHaEVzazNpZzdsemVoM3kzVVEyZmY0?=
 =?utf-8?B?TDZDZ241QVpEMHVlV0Q0RFBmclM2dC95UnNzRHhBSzRzUmgxczFsZThITzZi?=
 =?utf-8?B?TEhJZUJkWEo4MXNUS2ZWNVlUZlFCSjJSR1N2M1o4dkIxUkNmZ0Y1U25qVDRz?=
 =?utf-8?B?UHRwR3RPL2REWDBLVEFpNUtGM0IrbkV1MnM0VWt3RGYwR2c0QnYzUjRKWXJw?=
 =?utf-8?B?cGlkR3JVM1NCa2d1RFhJa0o1S2lZVUVrbmNyNFdqVGNVUi9qUHJXZUNsVXVn?=
 =?utf-8?B?NE9nQmN2cTUrM2wrWDBlYmdwMVlucWNuUnloZlhCWkpsU2YyQndrcGFBa01D?=
 =?utf-8?B?V050UzVHdkE5czh6bENPSW9waHVIZTRDUTBzenIrQ0tHKytMUTV0ZzA1NlNI?=
 =?utf-8?B?dHYxTlRvZU1qckIwdzFnc3NGVkhPSEJrMjgyRUp5YWxua3YrRmNLMG1peHRh?=
 =?utf-8?B?bXJLcy8yeGxNREtqeGR1NUlBQ1RGRnhBY2NsU2c4di9WNTJTcWlnTkpHWDFD?=
 =?utf-8?B?cytpSWh1R2VnSnlmSjRNSkFrdzdJOStHeVJWdmFXblVEWU84M0o0djExT2NX?=
 =?utf-8?B?L0hJS3BTWFpSY24weG5ENHJmcStSK3daSGRZcjNNY0hOVGNBbjdTRkQrd2o2?=
 =?utf-8?B?Y2VmcUVmanRyaDltQlV2RWQvWnRyV1BxYXU3MXFkNTNoc084aGEvc2ZNOTFM?=
 =?utf-8?B?dS9sdW5ZZDBMaGVZRDZnZ2FlcmFIMSt1a01PZXJKdHlyc3p1dGVWTVVhejV1?=
 =?utf-8?B?Z2RLbzVGTEZiSVFZSlRzcEJ4TnJjeXd2SjdNckdoMFZhang0WGRFNHZRRXJM?=
 =?utf-8?B?VmpZcTBJTFljYmdwd256SFBwamp3TVFvaHFEZVVnMEdxeGU0NzFXQWEyVlNL?=
 =?utf-8?B?SnhYQVZHNEdqNE9PNUNRUW84MnRSQzQzV2tPb1M2Q2xEZ3pSeTA5N1E0cXUv?=
 =?utf-8?B?ZzcrOTdTblk2ckRwNEo3dHQzMzNwaDdDVEFRNitzNTFUQ0UvbEp3Tkc5WmFE?=
 =?utf-8?B?OTg5ZjJhcmV0Rkxib2x3VkdSNDhBS096QTJjd0dUQm1vTjlNTlNxOGNrLzVD?=
 =?utf-8?B?eFp6WmdKSExpQUZMVnpMUHgwZDY4TUU0NTNxbGZpN1FPQjRTRUFGcjNMLzJW?=
 =?utf-8?B?NUdjQXdlTE5kb0xxRWJjSDJRTUo1N1d3KzA3bm14YnBLTytNZGlMQkFINXM5?=
 =?utf-8?B?REZMdU1RSGZMcUhPakZiTjlzZVd3WDBhNjhJTkd5dVgzNlJYdW9oc2duL3A2?=
 =?utf-8?B?Snk1ZWpjWC9sWGZMN0p6amtYczFJbkYvejNDRmRNcnA4MVlEekpiM1FUZmZ0?=
 =?utf-8?B?N1llZDhpRXozVlM1Y2M3WllhREtpS3oxdFRDZmZ3RHYxSnE5WHJncDNzZ1pB?=
 =?utf-8?B?WThFbWthY29KZ3VsOXBFWHRudkZxak9QSkNtSVFJZGEybEFoZWZrZWgxdjIv?=
 =?utf-8?B?NVF4aHZPMlVPQTZOYTh3VFBoanIvcFY0Ry9mTXJOWGMxQklMVnFxMUlDcWtV?=
 =?utf-8?B?anlmVjBHdlpwd2dTcGlaRTJGdm4xakRBMEp4Ty9sUC84djdZSVg4L1ZtNmND?=
 =?utf-8?B?TWpUQ0xINmhNbURGeTg3Wk1TdGIrY2VUS0FIT2V4azlvWDZKTk5jRHk1d1Qx?=
 =?utf-8?B?bmhYYVVqVVhDOFVRWXdTazgreGkvUmhRTDBSVmV3NmRMZmoxcEJXVkpKUlkx?=
 =?utf-8?B?NndaYkhBV3p1MlhNYWNZYzFyVERTYXBoU2o1OTJ2UlV5Z2hqZEd3WGpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGhST2xrTlNoSTRlblNIUDlvWTVxTTFjcW0xL3R3c1V3M3ZKeGNPMURJN0hM?=
 =?utf-8?B?YStmK2Zxc2NyZVQrTVJWTmhoLzUrbUE2bUkwa2JXdUlRclZaY0VOWEgraTla?=
 =?utf-8?B?WUMzc001Tmp6c1F6YkduYXN5NVA5aTJ6UnQ1RElxTXVhOWxkMWN0WWVYK29M?=
 =?utf-8?B?azd0czNyU3pySG04WTFoa0RSM2RTV2ErcGF3ejNsYXRTZG9EOG9rVE5MQk44?=
 =?utf-8?B?ZytHOGJPQnRlUis5aHNodHNJeFk4aGh4NWdENVcwREI1dWNTcUYxeVpFcHNw?=
 =?utf-8?B?eWhaVUdBUG93NUN1dWFxRkxtR1ZBcnUrOFcxOTdvWDhBbWNJRE5jWWVnYk14?=
 =?utf-8?B?MXF2NDE1Z3hHQSszdFdlbGQwTTFxSFpueGZrcWJNSHlMOUFDWjZiMW1Ea3NJ?=
 =?utf-8?B?eW1BMk0ySE1IdWdSWmdvaU53NlJLYktlNSt4RnIzSmZkZ1dBdlgrWWl4RGFr?=
 =?utf-8?B?dWJrdUJJZ054bCt5UC9FTmRGVXRXbGk3ZGlEQ3J4dTVnZHVhMVN3QVRvV3Vh?=
 =?utf-8?B?amY5b2NEUDJWTEFvZVVYMHI0a053ZnpMNVB0aFZvM1p6SFQxSnhSeVRMaTNP?=
 =?utf-8?B?ZkJ3MlpXWkZrdkwzT1ZVQXozS3M1eWdGMUo0Z09XTmVpcjVxYVJ2M21mL1JB?=
 =?utf-8?B?UHRIaXpaOURCa2xGNlBNaFZiL0xZbWVaTnBCK05UUlBGM2RnMUptMFBpWndy?=
 =?utf-8?B?RTRIUDEyNFVub0dEVG1nTlE2WnlxZnM0dC9ucDZTSlV4encrMlM3ZnpSYmxr?=
 =?utf-8?B?Tmx4NzhmaUNjZnRWTjQrUzErcGl1UmlCNmJ1T3dKSDdvdDBZQWJLcW1wdnF6?=
 =?utf-8?B?L0hBV0hyeERSRWNMaHVsRXVSeitTM28xajZXcTB4bnFBT0Zna0FJYmpwcXlk?=
 =?utf-8?B?UExMWU5MNDdRVjZVZi80NjFZMTU4ODRMcGdxOHBoS3RhV2NEb2ZCbk1Gb3gw?=
 =?utf-8?B?M0NlUUl1cHZXa1BON3BwR3hlYk9IU0RLZWwwYWc0bWRZVFVRNXp0WnZ1OW5J?=
 =?utf-8?B?QVhRelZqMU5rbDloMFJ1N1c0ZFI2TWRxaG01WGM4TFQvVkd6djhhSlh3aG9h?=
 =?utf-8?B?RWlEcllTNXVYZDQyZ1lpR0krUkVyTEZjamVSZ1FoaG5NS1NuWmVtMklqSG1F?=
 =?utf-8?B?ajEwVURrQWtDRyt4S1RvMzJyK0xST2RTYTJqQ1grU241TGJVWmtYOUxqSFpo?=
 =?utf-8?B?c3dZSExzR2U2R2RtRzhCcUR3ejJTdjJGYUJ2WXVTMXZLUDdwenV0eTUwclRM?=
 =?utf-8?B?RCs5bWpoNFJOZmU3Zi9kTXVvTjlKSEJtanFaZkw4MU1QTlFhQWxxc0ZZaGk0?=
 =?utf-8?B?UElkMldXNVc2U1pnVzBraVMxWEUwUEtrYzl6VmE5RGpRY1F2MkUrUERMbm0r?=
 =?utf-8?B?M1MrcmpFMlozTzhqU2wram1ZUkNoWHBpL3c4V0xVNWJBTE8zT1A1VzdBbUtR?=
 =?utf-8?B?UCtOeTY3OEZyaW42QnlJTXlnNXNYQzFxeENxOFI3YnBGcHlkWklCbTJYcXVk?=
 =?utf-8?B?OU8zZ052a0E5eDZlNTh3am9VdUtjSE96UGZKMjN2bFRJMDAvMDFpZWxPcmUy?=
 =?utf-8?B?M2k1cjMvaklaNWt0dFFIWGZDemV0NnlxWHRPWWRRWEw1NW1QWlFEZW9za0Jz?=
 =?utf-8?B?SVJaR2ZEZGRNdTU1T2VKZ1Y2U3JWM0RrUzEza0pKN0xGeXhXb3YzVDN4OEk2?=
 =?utf-8?B?cVdnMlBHRHFZSnFzWGZONE1HNis2YjR4RmFycVJRWDVNUlg3cXZma0VxWGJP?=
 =?utf-8?B?MEZMYnl6clZGM2dtanVZaWRzdlZIOXVmU01QUFZONlFTbVFFcXRyNitJcVg4?=
 =?utf-8?B?c2tvOW0zMFRYeTVhUU0vNTBDcTcyVkVIY3Bia1J3ZW04Y2hnWmRvU1M0L3BK?=
 =?utf-8?B?MlBheCtvUmdpMFlhOHJON3BDVTVjMnY0L1pXeFN5M3N6Zmo0OUxtY3FHQk5E?=
 =?utf-8?B?RVVJaUhUYVRGczNHM1Z6THV2Z0UyRWlXeWVRYUMrVm44SmxNVEFobVZnUm1v?=
 =?utf-8?B?RGI2bWJpUlB2Q1pwSTJuUSt4VktjT2lCdnhkcGlmRml3WktLcENKZFNJeEx1?=
 =?utf-8?B?WjRIYWVGNTR6UWRDaG1YSzJzaGtBV3FoRXJQc3EydmRuQW4xbFFLL1ljVks1?=
 =?utf-8?B?NHoxT1ZmSWNMaWhRWDBRbE5EbWtrMGxvbGRpcG5McmF2Y1RqTmRaakRNYk02?=
 =?utf-8?Q?o3y4Qit+UvbIh7xPKT2FokI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0eb9486-28ce-4428-d05d-08dcfa57af22
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 09:29:28.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rz0eV8UGj68Wddb+tXNrC7OGVMJICXuwAuYwC+IrQgfUv1FWuxTga7ksvWKdv9WFcBcnn83moKrUJRpOnZnvRY+Gn/wRguGwacjVlfVWRL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10557

On 10/31/2024 6:39 PM, Frank Li wrote:

Hello Frank,

Thank you for your review!

> On Thu, Oct 31, 2024 at 10:35:54AM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>>
>> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
> 
> next time you can cc imx@lists.linux.dev

Thanks for your suggestion, I will start adding this list.

> 
>>   .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 99 +++++++++++++++++++
>>   1 file changed, 99 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>> new file mode 100644
>> index 000000000000..3694af883dc7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>> @@ -0,0 +1,99 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>> +
>> +maintainers:
>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - nxp,s32g2-rtc
>> +      - items:
>> +          - const: nxp,s32g3-rtc
>> +          - const: nxp,s32g2-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#clock-cells":
>> +    const: 1
> 
> Does your RTC is clock provider? why need #clock-cells
> 

RTC clocking on S32G2/S32G3 has a clock mux for selecting between up to 
4 different clock sources (parents).
Now, as suggested in previous reviews, I've switched to using the CCF in 
order to implement this hardware particularity. In the end I've resorted 
to implementing 'assigned-*' approach which while not mandatory as per 
proposed bindings I find it quite scalable in selecting clock sources 
for the RTC module compared to the first iteration (V1) of this patchset.

>> +
>> +  clocks:
>> +    items:
>> +      - description: ipg clock drives the access to the
>> +          RTC iomapped registers
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ipg
>> +
>> +  assigned-clocks:
>> +    minItems: 1
>> +    items:
>> +      - description: Runtime clock source. It must be a clock
>> +            source for the RTC module. It will be disabled by hardware
>> +            during Standby/Suspend.
>> +      - description: Standby/Suspend clock source. It is optional
>> +            and can be used in case the RTC will continue ticking during
>> +            platform/system suspend. RTC hardware module contains a
>> +            hardware mux for clock source selection.
>> +
>> +  assigned-clock-parents:
>> +    description: List of phandles to each parent clock.
>> +
>> +  assigned-clock-rates:
>> +    description: List of frequencies for RTC clock sources.
>> +            RTC module contains 2 hardware divisors which can be
>> +            enabled or not. Hence, available frequencies are the following
>> +            parent_freq, parent_freq / 512, parent_freq / 32 or
>> +            parent_freq / (512 * 32)
> 
> Needn't assigned-*
> 

'assigned-*' entries are not required, but based on my previous answer I 
would prefer to document them in order to instruct further S32 SoC based 
boards which may use this driver.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - "#clock-cells"
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    rtc0: rtc@40060000 {
> 
> needn't label

Thanks. I will remove the label in V4.

> 
>> +        compatible = "nxp,s32g3-rtc",
>> +                   "nxp,s32g2-rtc";
>> +        reg = <0x40060000 0x1000>;
>> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>> +        #clock-cells = <1>;
>> +        clocks = <&clks 54>;
>> +        clock-names = "ipg";
>> +        /*
>> +         * Configuration of default parent clocks.
>> +         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
>> +         * 4-7 IDs are Suspend/Standby clock sources.
>> +         */
>> +        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
>> +        assigned-clock-parents = <&clks 56>, <&clks 55>;
>> +        /*
>> +         * Clock frequency can be divided by value
>> +         * 512 or 32 (or both) via hardware divisors.
>> +         * Below configuration:
>> +         * Runtime clock source: FIRC (51 MHz) / 512 (DIV512)
>> +         * Suspend/Standby clock source: SIRC (32 KHz)
>> +         */
>> +        assigned-clock-rates = <99609>, <32000>;
>> +    };
>> --
>> 2.45.2
>>


