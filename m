Return-Path: <linux-rtc+bounces-2684-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C739E9CD0
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Dec 2024 18:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF5EC280D60
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Dec 2024 17:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A022B14A60D;
	Mon,  9 Dec 2024 17:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CW8bC7lN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478FE1292CE;
	Mon,  9 Dec 2024 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733764673; cv=fail; b=uD0ygu5G6IZsmhBX7WZzmRzeKZQV5zZf9yRb0YxCmZR3tYVSd2YYNd8tCUYQCmzW+QZ93+J8uGhmrkYYfKtJ9qIeKq37oTmFQ39q6J/gjq6eKc8FAOLEfTXyZCj5Fnx6B9EeeEq48+WmsjK+9PVlaYtBgfJVVpLilU/l16MHYwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733764673; c=relaxed/simple;
	bh=9ybCUj4YQ0q+werXbgr65KxCtAIpktyo6Q7dF55Hj3o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NCWM2MV3WhpytNjl1eBrcGgQcDITL1SOTJM1LT9zkwmOA2xzo24sHb4JYbKGv9PdOpjFTc2HDoX2HZVk4+eQQy9JWmiSrQSz+qKv958dcFHVdCv7ycPl9741OxnLneEJpIR/tfrDhirp6ZKOCtxGT3XwvUA/6JlTmuy7EnxolXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CW8bC7lN; arc=fail smtp.client-ip=40.107.103.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cn5za9MXnXvIMi0i6xC490htkHB2KX+/H0tQ0Le6Vw/d/AxpHkjUiv+e8hTk8KIReprlBFDs2LNjZo7i8q4A64TaJoqw1cwMUUvX3qhbotboQKAtyaVGhRI3j/A+O22chDFOpas6C5UBboIyEuTSPeB18GrK2S682q+18MAmNomqA0Z1LukGrRGGHWnUtgKlvcNZQlVKs/v9KcwBMvXmACoDlR8P7N0xqDL3YC7j8bJH5UbCmuP4zm8+oHhrMnHKPFX1BftxCU+etvnpAn7ZwyzMLDnxXZMl6QsLKAyVKr7q22F9im7BKyPRrvIgFDN4J4zuWXZwe8OrMB/ZNwrSNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J35l1quNpgTFJJh4jnuEygCTk+oZS9c4j/oKBYkeJVY=;
 b=r7yd+27tDcgUYJBHhhpFS5O93UVWlAUxpZxKIHDmiYDVE5ZjT78dYA7hv2JySB5X0yyTz4Zxouz00r6u33ddbFjtXcOpC2YTFKXl/MvjFmWQHIxMui1EbA5ap8GaKfxh4qsIDmnQt+t3Pt5I3PVqDG/6BAZdKH69Kccr7TJ8P4no3Jf0nBrmx7tcsquTWpJ1PCD1X2PjFFcVo3+psVdpwxobYpsH+xwf/rTaoxyc9OdkyaowvYD7UR0rAweA8Vdwyj5m4tyu0v4Sf+64e7bhfnOFc6enJs8tBbdHiPjAaM9RvGPt8R4vNXy92MeQnsx+ITe8HMp7HgWLla5KxMJc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J35l1quNpgTFJJh4jnuEygCTk+oZS9c4j/oKBYkeJVY=;
 b=CW8bC7lNu200PtIIq1ULJ0EeBz/FdPPkI2n7MIZoHstaf5C6N7MVc33jHI9hE/oy9YMLWSJmhBLeVbMxNRghKbJzUZQ1yZnoYpq2puM1BSyrZ/7y9j4Aqnlu8qA9X/slZacyi5BIft/trf3yQKjyt5lBSaJPSyqj5gCy6bUygdkQEhhOTxxrta3ozOiGQI9D/xVrskEMUr69hQJo5p5IoKcGYCaU9Unf7+ZLj/8Qq8JEdOYbUQAIPAvIqPQ/iLw7X58h3TDUIpwDJ0Pp6/5f6hU1SRELCCRiVsDDIZ+wE2X6+gcIKoDpoukEarS96JrdGVw4lRw4hvYaJHjWF7OTgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8365.eurprd04.prod.outlook.com (2603:10a6:102:1cf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Mon, 9 Dec
 2024 17:17:46 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 17:17:46 +0000
Message-ID: <42d39f8e-0b59-4185-af1f-f778522608d2@oss.nxp.com>
Date: Mon, 9 Dec 2024 19:17:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>, imx@lists.linux.dev,
 Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>, Bogdan Hamciuc
 <bogdan.hamciuc@nxp.com>, Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
References: <20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com>
 <20241206070955.1503412-3-ciprianmarian.costea@oss.nxp.com>
 <2005af5d-bdb7-4675-8f0e-82cb817801af@app.fastmail.com>
 <6f4a0be8-4def-4066-9b44-d43059b7a90d@oss.nxp.com>
 <94cba886-86cb-41f1-96ee-501623add7db@app.fastmail.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <94cba886-86cb-41f1-96ee-501623add7db@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0063.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::16) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: efaa6f56-3182-463f-a892-08dd1875665f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUVhVGRkMkx6aXJRSVVIdkxmVm9oRHE4TnNMTW52MXUyMW9KYkFYWVd6alBX?=
 =?utf-8?B?UlBiaFNNYkRvMS81Ulh0NWdxdGVUdUgwbG1iYlpBVWtmUFROV2J2QmJFbXF1?=
 =?utf-8?B?OFdsTDM5K0lOOE9HcXVXbkFJRVpmbFZHdEZHV1RqVmMzV3h2dmxDOElud0dR?=
 =?utf-8?B?SklYT0s3SlZJY0NRQTFCRGJsU29Ydyt5L284ZTN1YlBFd2F2ZEwzOFI4MG1B?=
 =?utf-8?B?dmlvR29nUWVTQ2NiM2VTZFNYUW5tanRlV3hpcXc2a05xQ3BJOXNHTHlZdjVa?=
 =?utf-8?B?SWlsaVZmeEFHMlpNbWxMaVo2T05YdnZZQ0dTTk5nSXpLUlJTZ3pOSWIrUDdW?=
 =?utf-8?B?bGxUTW9sTEpZUTRXTjBicE1yM0tPL1A4emtRNFpESUNwd3hHVkFSZTNJN2p3?=
 =?utf-8?B?eDdRL1lMYzcramczZFlNdkRIUHZsNVIvQjdPMTBhK0QweFpEZE9wTDNwUWN0?=
 =?utf-8?B?ZVhnNzZ5dUxRZlM2YlRwSVZvR2VDYWNWNi8yZVBXaitDbldpUm43S1YrS0FT?=
 =?utf-8?B?b0JLM29TSkpWVy8yV2VVV1lMdlg0RVJkZStEem4rcUhhbElyR0h0Q1lKR0w3?=
 =?utf-8?B?MTJGMmtMS3U3YmhwODRnbk1NbWxvZVJna2I5RDlNUDNtdTBWb0djQTI3UmhX?=
 =?utf-8?B?a2c3S0xqeFJRaTZnNUwwbVA2cmZKWUlpZXRTVUVHZ2JxcGg0UDZtQy9rRThT?=
 =?utf-8?B?cFZWMTBzTHRpZmMyNjhZL09kM2JwSk5EdjM0QUlpUldGdTl3TEVwN0hFUTRm?=
 =?utf-8?B?NTNUY0NKR3gyNVAwQi9aOGp4SkZRWU1RYmFtcWI4WWRHRFMrYnJpWDhUVzFV?=
 =?utf-8?B?cXJlZ1dlUFZBVzFzc1MycC9uMHpWcW5ZdTl3UDVaNW0wa3Vvd1R2NXo3aWI3?=
 =?utf-8?B?WGpnR2s2Y2tLMjZ4VkNrQkVsM2VvdmtjeVpPQW84NEhxbUEwck9YTjNmYWVu?=
 =?utf-8?B?cVpSblRVbm9SSVZzZjFYbmpYY1FRRjR4WGRrNnBnK21qcWwyT2tFTThnTVFD?=
 =?utf-8?B?dFYxMW5Ib3JqQU91YlFDdkZhZmlXMmdXZFM2M3NycUw5ZDQ5YkpIVTQ0VHVV?=
 =?utf-8?B?Rkozc3daZVB4Q1ZQVG0zdnp2a1ZiUWNrVDY2Z0FrUzU2Y0s3TkppL1VvbStT?=
 =?utf-8?B?WXgwU1o0QndQaGJoRzN5bTlHV25VR0k3YVY3Z3hhSkNpcDJHTnVDTlR4VklS?=
 =?utf-8?B?RjBlS2c3R2RLcEtFT0NkQUtNMit5bG1uY2FtOTJnajJsNUJuV3VLbTJtWmlX?=
 =?utf-8?B?OS90S0M3WnFXL1FsU1RuUWxjeGlIMitjSUMzelBaY0tySEMyNVh2MEF3b1RD?=
 =?utf-8?B?QlczWHk3QkhQUDRxdWhhblFHRk95QmxndWVUVlBMc29FTmdjS2tjdVU5enR6?=
 =?utf-8?B?QWF3VEhsUHYvNnJjelhVQWI0aTNPT1NpclZrSXBuWmNVczVNY05FNUt0b0xN?=
 =?utf-8?B?ZE9Ra09hWUJNVDk1RmM2U21rT3U4cE42bEcxVTFvK0xqNzBHbnJpbloya1JW?=
 =?utf-8?B?ODkwWUhTdUVoTzNTdnEwb0xRZzA3d1lHT0llR3FDcWFSYmFZcDlRNHhKTzFh?=
 =?utf-8?B?bnYrMzZnb2g2MitLaDFkdVBTcExWaEhDODcwajkzVGJKSFpEaTNUSy9tRHVL?=
 =?utf-8?B?ZTZ0MUpKZjdmMi9vd0ZVUkd6ZmJpV0ZUczZBSGZEODdvWmdaL2ZFYlUzQmhm?=
 =?utf-8?B?cFpKK01KR3lLZHNTcXpwc0k2b1AzUzBoL0RCZEc3TFYwcVZLenhqWnExd2FP?=
 =?utf-8?Q?F7BKJ3+X2oTRudH6SVSqUlGZpGmgfh54KNw0w11?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFg5SEQxQVVXR3Z0VVh1SGp2c01URlVsZGJuWEZwYjBaemprWFRoRjUzUnkv?=
 =?utf-8?B?NEphUjlPcURIM1ZreDc5WGtieTNVT3lhYTkxSXVFVzIrQk9uMU04cUc0ZXV6?=
 =?utf-8?B?T1NBclRDUm5maUFVbUVPRWRNLzVYYXQzKzU3N2MreS8zTUp4azg3WThzS0JU?=
 =?utf-8?B?RmIvdUhxQnhyY095TnVGY1lBemR1OTQrVy9jVVJ5cnQ2cDh0cWFoYjM1OGx3?=
 =?utf-8?B?cDkzeTlVNnpRckxCNG1Qa2cxcFhpazNiMVJTY0xTMmtIU0gvM1d1d1lIcldF?=
 =?utf-8?B?ejdWbGkrQUh5SlFJWkJhN0llcFFmN0ZQSlNBWVZkUU0vNk9kbjBnNnNMaFlw?=
 =?utf-8?B?WkdCdGUyYVdacFFIK25jdURnTGYxem42ZHJlLzk3N2NjRFVJVHpHTllabUdk?=
 =?utf-8?B?UWplTzVLRWpsaFdWZlNwdXYwYm5LS3F4L1FtYmhZVjJPWGcvZk9lOVZITDJL?=
 =?utf-8?B?NGdMb3ZxZ2dyR1pvWHdBYk8yZXlLUW9LbTdUYytCSVB3aE56Z3dWK0k2U3JF?=
 =?utf-8?B?dmJMWmFreVBnd1pLNEJycldqT0xqb3ZpWHo2RUE4bE1aQ0krbm0xYnY3V3Bj?=
 =?utf-8?B?cWxzSkZaY3FRemozZDhZRS9WeHVvd29XRTBpVis4dE5ua0JDcExoZmE2cWha?=
 =?utf-8?B?aFdpN09hQjloc2J2MUQzUUtzRTVXUitUaFkzWHpsOGhtd0dWQ0FoeVplWEdL?=
 =?utf-8?B?WDNjMWhabW0yb0NuVC8xczRFYmxHZ2RYdzJnYlFqOXpyTFRVWVZPblJtbGNV?=
 =?utf-8?B?d0x2UWpVdXRkUldBYTZMMnBrRTlMcGpUY0VQbmZDY2hHc21hRTNJRnlKNE9n?=
 =?utf-8?B?UFBBK2NRZnRKWm05b0NMTnpJL0c5WkZ3Y0JmeVFBYUo0N09FNkZyOGpVa0xh?=
 =?utf-8?B?VTBOOThGZlhhNGNTaVd3SzhSZFllWCs1cUc5dVYxVzNIV004SXBqc3Z2aE45?=
 =?utf-8?B?MjhvMit3TjFxQnVpTndlblJ4Zm5JRTZLd2tlU1l1Z1o1QkQvRXhnZVFBR085?=
 =?utf-8?B?a3hTN3BaNy9QRFBYOEtTZVk4dVpvd2pqZVlNWGJWcXJKRjRzUTRyK0RQMjlE?=
 =?utf-8?B?elpTTHNmdXZoNWt5cm5GSy9sSVdxWTBZUlg4a3BwTUdtdDd1c2NOSXVBNkt2?=
 =?utf-8?B?dWpCMDdRMVBKelVMcGZnU2RETUhyeFZyY2F5V1RFMVlWazFnVTRvQ0xHRmx3?=
 =?utf-8?B?WFoveVRmQzVqdHVsbnJwZVdrUWlGNUFaNUJKTHBuRk1HVVV2SHhmWWJhS2FX?=
 =?utf-8?B?ZHlPMzZkSHNYVXNCOGhoVXhtTzk3RzJIcGxEaXY2UjlsYmZ3KzFSTWVJYjVY?=
 =?utf-8?B?dFJEOFNGMklZT0VJTGpEVEJGUStYbDVuM25uT0ZPMEZuNXhORzVseExBRzRP?=
 =?utf-8?B?VmZpMzlGVkRQZDVIYmFzanFnSlpNMUR4c1ZIZjlHZndkYWtyNEhIdGY5NEV1?=
 =?utf-8?B?WkViKzNHdUh3bmdkNVlJVzAyN1lVOUFqRWR5NHo1UzdaTTh4RDBMVGtEdndP?=
 =?utf-8?B?eHN6dmNwSEF0ODNrRUQyOHRBVDRkT1FuTFFrQUlZUGZJK2xNeC9CNUM4M2hY?=
 =?utf-8?B?cFhQWko1dmlqNW1VUGlNOTBTYmwvd3NySWtxdm04ZCtJVHduRDFIUU94Sldx?=
 =?utf-8?B?TW85MW9WR3FpaWJVc0V1bHBuTk40SjdEUnhGUXU0ZWI4M0s4NFNaOTdLMTlQ?=
 =?utf-8?B?MTZyN3cvZ3ZQQ2U0dVg2R25BdEIzaS9CSzdoQmtYTEFSeXFZdm9YbUtzcVc3?=
 =?utf-8?B?SnZQN1E3Y2tWMmJkRWNxOFVRQmdmT3BGZDhUTGlIbUxWZjI0bDJEVWlCRkQ3?=
 =?utf-8?B?bnB0eHdTLzRkT0lLaDNENlVYWW9MTm83dVh6T2hIY3JYek5YbkUyS05CcjM5?=
 =?utf-8?B?OVlmME5HTFAycmpabjNGNjVrRnFGQkhKQk43OFlqSjBGZmdxT3JveUlDRFFS?=
 =?utf-8?B?cGNTYXRFOEt3QVZWS3RDZ3BjV3hVNVg3YWJiZ2JHSlg0aDFCUUVyREtWbklS?=
 =?utf-8?B?ZS9uL1AyQWZaZ1dnUjUxR2N3MGh2SEl2MGxxT3FaMndGUTVqQ2dPVTF4ZWRT?=
 =?utf-8?B?QXQ1WlFKUDJnbi9CcXk4VzMzV0NQUjZYUjZ3ZEZPalVQV0NldForZEo2U3R1?=
 =?utf-8?B?YnRZQnZTNjNKNUJvTWV0cHV2bjFVdTNsb1pMbEREbUxNZzM5ZmhVUGtJTFUr?=
 =?utf-8?Q?bsROb+Ux2H3r7pVc8aXS7dc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efaa6f56-3182-463f-a892-08dd1875665f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:17:46.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEPkf2AXe94I6ps2DBxvefZeADk/M6eC7jy8yVS+0ePBO/wZ3FvEONw7kjp6m5HuOHlcOZhVak+7HNnwHTt9P2Pmc2CP1sAu3LDrv5ty4nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8365

On 12/6/2024 2:41 PM, Arnd Bergmann wrote:
> [You don't often get email from arnd@arndb.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Fri, Dec 6, 2024, at 13:05, Ciprian Marian Costea wrote:
>> On 12/6/2024 10:04 AM, Arnd Bergmann wrote:
>>>
>>> However, the range of the register value is only 32 bits,
>>> which means there is no need to ever divide it by a 64-bit
>>> number, and with the 32kHz clock in the binding example,
>>> you only have about 37 hours worth of range here.
>>>
>>
>> I am not sure what is the suggestion here. To cast 'cycles' variable to
>> 32-bit ?
>> If yes, indeed 'div_u64' converts 'cycles' (the divisor) to 32-bit so I
>> agree it should be u32 instead of u64.
>> If not, I would prefer to keep using a 64-by-32 division and avoid
>> casting 'hz' to 32-bit.
> 
> The confusing bit here is that the extra function just serves to
> the dividend 'cycles' from 32-bit to 64-bit, and then calling
> div_u64() implicitly casts the dividend 'hz' from 64-bit to
> 32-bit, so you definitely get a 32-by-32 division already
> if the function is inlined properly.
> 
> I think storing 'rtc_hz' as a u32 variable and adding a range
> check when filling it would help, mainly to save the next reader
> from having to understand what is going on.
> 

The confusion on my end is that I cannot see where 'div_u64() implicitly 
casts the dividend 'hz' from 64-bit to 32-bit' by following the method's 
implementation [1]

But I agree that 'rtc_hz' can be stored into a 32-bit variable with a 
range check added when it is taken from the Linux clock API to avoid any
unneeded abstractions.

[1] 
https://elixir.bootlin.com/linux/v6.12.4/source/include/linux/math64.h#L127

>>> It would appear that this makes the rtc unsuitable for
>>> storing absolute time across reboots, and only serve during
>>> runtime, which is a limitation you should probably document.
>>>
>>
>> Actually there is the option to use DIV512 and/or DIV32 hardware
>> divisors for the RTC clock. The driver uses a DIV512 divisor by default
>> in order to achieve higher RTC count ranges (by achieving a smaller RTC
>> freq). Therefore, the 37 hours become 37 * 512 => ~ 2 years.
> 
> Ah, makes sense. Can you add comments in an appropriate place in
> the code about this?
> 

Sure. I will add such comment in the S32G RTC driver in V7.

>> However, the rtc limitation of not being persistent during reboot
>> remains, due to hardware RTC module registers present of NXP S32G2/S32G3
>> SoCs being reset during system reboot. On the other hand, during system
>> suspend, the RTC module will keep counting if a clock source is available.
>>
>> Currently, this limittion is documented as follows:
>> "RTC tracks clock time during system suspend. It can be a wakeup source
>> for the S32G2/S32G3 SoC based boards.
>>
>> The RTC module from S32G2/S32G3 is not battery-powered and it is not
>> kept alive during system reset."
> 
> My bad, I really should not have skipped the patch
> description ;-)
> 
>>> If 'counter' wraps every 37 hours, this will inevitably fail,
>>> right? E.g. if priv->base.cycles was already at a large
>>> 32-bit number, even reading it shortly later will produce
>>> a small value after the wraparound.
>>>
>>> Using something like time_before() should address this,
>>> but I think you may need a custom version that works on
>>> 32-bit numbers.
>>>
>>
>> This is correct. Would the following change be acceptable ?
>>
>> -       if (counter < priv->base.cycles)
>> -               return -EINVAL;
>> -
>> -       counter -= priv->base.cycles;
>> +       if (counter < priv->base.cycles) {
>> +               /* A rollover on RTCCTN has occurred */
>> +               counter += RTCCNT_MAX_VAL - priv->base.cycles;
>> +               priv->base.cycles = 0;
>> +       } else {
>> +               counter -= priv->base.cycles;
>> +       }
> 
> This is the same as just removing the error handling and
> relying on unsigned integer overflow semantics.
> 
> The usual check we do in time_before()/time_after instead
> checks if the elapsed time is less than half the available
> range:
> 
> #define time_after(a,b)         \
>          (typecheck(unsigned long, a) && \
>           typecheck(unsigned long, b) && \
>           ((long)((b) - (a)) < 0))
> 

Ok. Thanks for the suggestion. I will look into using 
'time_before()/time_after()' API instead of directly checking via 
comparison operators.

>>>> +static int s32g_rtc_resume(struct device *dev)
>>>> +{
>>>> +     struct rtc_priv *priv = dev_get_drvdata(dev);
>>>> +     int ret;
>>>> +
>>>> +     if (!device_may_wakeup(dev))
>>>> +             return 0;
>>>> +
>>>> +     /* Disable wake-up interrupts */
>>>> +     s32g_enable_api_irq(dev, 0);
>>>> +
>>>> +     ret = rtc_clk_src_setup(priv);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     /*
>>>> +      * Now RTCCNT has just been reset, and is out of sync with priv->base;
>>>> +      * reapply the saved time settings.
>>>> +      */
>>>> +     return s32g_rtc_set_time(dev, &priv->base.tm);
>>>> +}
>>>
>>> This also fails if the system has been suspended for more than
>>> 37 hours, right?
>>
>> Actually, the system would not go into suspend (returning with error) if
>> the alarm setting passes the 32-bit / clk_freq range.
>> The check is added in 'sec_to_rtcval' which is called from the suspend
>> routine.
> 
> Who sets that alarm though? Are you relying on custom userspace
> for this, or is that something that the kernel already does
> that I'm missing?
> 
>         Arnd

The test usage is via 'rtcwake' [2] userspace tool.
I've detailed a bit the testing scenario in the cover letter for this 
patchset [3]:

"
Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
using userspace tools such as rtcwake:
# rtcwake -s 2 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#
"

[2] https://man7.org/linux/man-pages/man8/rtcwake.8.html
[3] 
https://lore.kernel.org/all/20241206070955.1503412-1-ciprianmarian.costea@oss.nxp.com/

Best Regards,
Ciprian


