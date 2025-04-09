Return-Path: <linux-rtc+bounces-3837-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDA6A81C5A
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 07:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE7021BA0053
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 05:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEFA1D5CEA;
	Wed,  9 Apr 2025 05:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QARsrIVB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48871D5166;
	Wed,  9 Apr 2025 05:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744177796; cv=fail; b=debaS3O2vqoUW22vh8uUlkQpe3DtZ6YuNCAUX7XInHyByo6ENsXAQRTYKWxvo6/4VW074Nwl/PSeRqBLjB8mfOKAI7fLLtih8ZmN6aG8sA0THjBSPdXlNBDnomUOgbcoxuahfABiDykxEUdC3SKGljtdUkbzU8dmhmQ9lsJmhiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744177796; c=relaxed/simple;
	bh=gH3W2dLXCNnBHduBsKziwdnT2mYbeXtSuhho/0/m8Sc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hB7swG1l3mB6UHjSPmAYPWalSFfx6B1G4wvLSmpDxcWBjQiz2P6A6l8T6db/o/gbpRVpXr89G6veM+U5dy+My2mnc2PPoIzOmWawqGeGim+lZ8fVuqFJjx+dLNlm5A/orxsmV/uGpqaUNIgVRc/VC9R+/dF5hvzshJEWP7Bpdlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QARsrIVB; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbdM+sEOZMqOIKf3BF44HlzaFAAMLaXm94MIaCAnCPWNxDFIuspvZymOf7ayq7zwS+ztSqROA/kB1pG100dCzAlz3iBQnIRJzewHG3noUuBWtQ9fckWAp/U5qGzyID6voHoDszPqCZC927sgSYpa0hg/seXCFBBYTifmmSrHAzcf0XRw464MZhH6eMCXp/rdT/jBQ7/jK0ELFdqL+2ezw1BgJG2j12wjHwPSibUEuNrqG/C5+04ujxrA0nkWMOG26z9+PtE5JObuUs223qthv7NnwFIbNJ5weLPdNW0weBFO5DjAtVEOJmnmpFT8+sckNwu3hU4nvyvGPKpkbvzZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttTlp5M/UNkjfjguP2v1XwHOUl2HenyqUAjD8Q1duHw=;
 b=hWgY+wecDgTFFOYGdgpUZsBsZ5DdH83XIYUUHuaioTOZaOTWjTkkdNUCklkiTKKalkA6KVexl1S13XFl58nQ+9vrdM9drbiH3yV9I7777Vb1TqhkweHE/rm4GCGHuQYFXhhHU/aZ/5ibu6brQRP8ApC5hgSIADhQpKKQMWTK8huok7h6OUH0BnO5I+u1fmD3iMnWW/IAP0ISZXMMf/xvlQ82iHt6wM3tKIZsm5YHJUnHSYQ9UL8tFU+YMDkgOFM8D/XZguG9YVteevoFi92ZE7ooiVWjhP3AQCRCco9x1XJb1oAdlVVjSi7ZaIvWUyXJ3dcFqoowAkzGgtakvBGDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttTlp5M/UNkjfjguP2v1XwHOUl2HenyqUAjD8Q1duHw=;
 b=QARsrIVBkG35kbuUaMzFdtoeGotgcWgvSYjVnBDLNv2QxQ0ezQawnxx5kwrOSjYpMcqOFZYYvGqjqRrx5UBy9oChMF73D9sLVnd0jXyBivEjf/telIYKYuVebfuJTANHre9zA8aeDAt7c/ak62cdTn6EoPVOenW2zgxb8i3vq0ESYdXMdoDfw4T6gxAkWk7q1vNvyYX1eEEEFWRaZT2+0RTSeACfrabvDX4pEZURTrmYpWZmdSHNMul/RrbwAJQY4OvAeMpM7IU1nPLMedyb7ggN08Z2/OYzzrsFL4OWCHADA17DA0vWQEmrUksoUCBULeuw9ckQVd7L4V3xL0TKiw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB0170.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 05:49:45 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 05:49:45 +0000
Message-ID:
 <MA0P287MB2262E17477166BBC1B62B2E9FEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 9 Apr 2025 13:49:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>,
 linux-kernel@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev,
 devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
 <vxjtdvy5vxhmqldgvt4mgeuor36gdjriiai7y3rej3tevuwisa@wpupxzhvc3tt>
 <a691fe4864debf7592010bc892066beb439c1740.camel@gmail.com>
 <tay4sxc6vx3lgwywlz3nefxo3tlkj2lm6qwdozogz5agao2djh@wt2qtruopmy2>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <tay4sxc6vx3lgwywlz3nefxo3tlkj2lm6qwdozogz5agao2djh@wt2qtruopmy2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0275.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::17) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <423859d5-0119-4a47-a663-91ca40ab683c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB0170:EE_
X-MS-Office365-Filtering-Correlation-Id: 491cfd69-8fe6-44c0-fa90-08dd772a54e3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599003|8060799006|5072599009|19110799003|6090799003|461199028|15080799006|1602099012|10035399004|440099028|3412199025|4302099013|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1NxQTZaMXNwcDVzWU83TEIxNm5RT2p1WjZpSnZZOUZWQnFOeWRITEE4eklV?=
 =?utf-8?B?YmFqL2NFOUdHZll0RS9VcWZBZlpLbFArNXNlWTVLNUF2d1F5T3gzL0lrQjVn?=
 =?utf-8?B?UmlJVmxwRWRSNlo3cnB1YU1GNlB4dW5KSHFxSVU3Uzh2eVUwKzBjWVRTanJ3?=
 =?utf-8?B?YUduTlpnbWtXejRydkhXbXQ4VWZ3ZHY5OGdXWTAzczVjZFhkOGVuZWFRVmRh?=
 =?utf-8?B?djZZK0hnNVlNUnpZZjR3d0h5V0R6Q2xpWE1NRWtiKzQwRW9UYXZqSHJadmY1?=
 =?utf-8?B?aEplR0N5czBmK0hNa1dOTzBJQkhTL2NaOU40cURUYkNvTkFpUEwyTi9jNTZp?=
 =?utf-8?B?Rmprc0pmdko4b2czNGMwOUZZSDUzcC9nd1kxWDVoMHdmMnFHUFMzbUowMUw5?=
 =?utf-8?B?TXVrUWh2ZFlGTGY1TmxvaVNibHFzanRjNXFmTkt0NlZJN09FSTJqVVJNWG4y?=
 =?utf-8?B?MXZqeHhNVlRYQldRSTNkNW4rU3FzSUpqYzN2dXhNT2ZocUY1SStKZWh6bXMw?=
 =?utf-8?B?TWo4RktmNkdtYWtMM3J5UTlzb2Vpd3dIZUxBelJ5YXhBK01hTWNYdE55YmNS?=
 =?utf-8?B?K1pOK1RTMmNOM2xjMUUvRC9jNXNlSDBBUWpZNlFLRTdpMXE1d3p2U1NVQjJH?=
 =?utf-8?B?bmx3cUg3Y3FpVzc0dGZ4SGoxZndVR3ZpZ3dIYkZoZElRVGtSOHNNMllMcUpJ?=
 =?utf-8?B?WjVXSTlZSGJvNWsxUUxxNEhtbDBIMVFjMDJtNUV2Q3dmclh1Z3JSMUZRSkVa?=
 =?utf-8?B?VVA2YXV1V3l6anUwRGgxckhERVN6MWtLZlJoOXNMOXlEK2NWT2pGem1xQWNs?=
 =?utf-8?B?WHpUTk1ubnhDSWJ4NnRjK1l4SlM1REpJUDd5S3YyTjlxMVBpUFcrUHFheG5S?=
 =?utf-8?B?bDFxQ0kzcjFNbE9hQitPa2lpOHYrVEpaWmZOMEV0bUR1aExxV3pCK0p0YUV6?=
 =?utf-8?B?VVJHcTM3NlJNUDRjekJ2a0dTTjJZT0JLeVE5eTBqVS9jOGVWdDhLS0lDdFhC?=
 =?utf-8?B?dnpUYlh5citIT1pIM2hQU2hSSXY3M01kRjRpL01JbHhmNE55RkVnM1JSaU40?=
 =?utf-8?B?OE16ak1SQURhYzFmemdWVUdidFFlSUFqOXBiRy9WYnhNbUJpVitiZjlRY0lm?=
 =?utf-8?B?eDhscE1XdGJYWTU4SDV3NloyZzhUNllndlpoeDN6S1NuUk1SZmZLbG9FanJG?=
 =?utf-8?B?djJGVFFwT0IrdkZXZVplK0R1blBmNTQvOXlIMG9ZVytxa1hyTFA4Sm5XSHh5?=
 =?utf-8?B?Mzlia2JkdTlUMWp2VCtwZ0tYMWloR0c3cERxV1ZSVFdiWks2aklMZ3hLOTV0?=
 =?utf-8?B?S1c0c1hlZUdKN2NWaVhFb0pydlRaRnhqNkw0cjNsT21WSGJZNlQveTBKTWhn?=
 =?utf-8?B?MWEwcnFXczBDQXFaUFpQOGlHeTZnczd0K3gvODlxdmk5OXJCZVdlY1lCWFJh?=
 =?utf-8?B?NmFPODVNMTZPR3hvbHlMdS9EY21oUjV6YnhGS3lzWTVlMVY2a1AyRWZmQm5L?=
 =?utf-8?B?V1RwQklTREF0aEJXak1IQVVkWnB5bWxpZnc2MllvMldyVC9hNlN3cjdnQ1ZY?=
 =?utf-8?B?ZklkSTB2ODBCdFlFaEJqS29FV3hpa3dBTXJkL2IxdjdEL2c5citNdWlYRi9n?=
 =?utf-8?B?OGxQUFJTL0hoOURoQjluMDRlWEFwZWVvYjdOZXREQUtndzdQemF5bWNDTWs2?=
 =?utf-8?B?eDd4Qkt6bzQzSy9IemlnYU1STjRKS3Q4Umx2Y2E4c2lONTVZRTA5SWllRjRR?=
 =?utf-8?B?aHFEa1IxWGIrVWNWWmcwUFNQUzF0N21WWllmSHExQS9yNXVVQjdIZGo5cU82?=
 =?utf-8?Q?bkbWL5DPD/wAO1zGu0l7hd98K0uxRxa+/7MZI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djQyeUpXeGNMbFMzK1JIOWFLcUtsSk1PSGRXbWtxcFlLODMvMHBsdmpGenFD?=
 =?utf-8?B?TUdXTTd0VUtXQ1BjbFd4V2ZqRk9OTzVoZ25MaUcydUs1VndXc1RFZC93QW54?=
 =?utf-8?B?UmpnSDA2SDRVYURPdHZIdTVOWC83bTFoTWxsM0RNUUZqK05ONXlUNFBsSmFU?=
 =?utf-8?B?K1ozbTkvN0h1L1Rwcmo5VVNYYld5OFc2UmJiVXlFOWtsbi9ObHplbnNNOVJs?=
 =?utf-8?B?cnNINGkrbW01c0tFZkRhV09qb0tEbFhWQXlKOEhYdVkzVitnVGNsclpRdnpC?=
 =?utf-8?B?czgxRkVxV0prS1lLTGRkR2tnUS83SGhJZHlveWpJOEZJd0MxamQ1VWhnSjJi?=
 =?utf-8?B?Y0R5NnZ5dG5uSVRRdmk4QmdKN05YM0VSZmZqdVhWaHI0b05oam5HRC9YYUh0?=
 =?utf-8?B?KzBwSm5QbHVaejBiZUVIT1FGNGV6N25tR1huMVA5L1ZoR0NJeGpPT2lFVVF2?=
 =?utf-8?B?aVFoYlNNYTRBTG11UU9UMDg1U1dXOU5nSlEzblJGNFZ0RFNlQStrbUJTR3Mv?=
 =?utf-8?B?dzA2VG5GUDJ4YXVwVWowK2ZDNkladEovUmlJczBvWmVTVlRWVTcrd0dWMDZU?=
 =?utf-8?B?Z1JMWUdpWk9xaDJFQTd1N0NZQ21ELzV6djdoOTJoNElaL1J5WkRFYStWUDhz?=
 =?utf-8?B?VC9KZ2lVQ3FoMTBJcXg4YVFmS3JsSUR5NlNlQmRNZXhpenVaOUNVUnpMSUk5?=
 =?utf-8?B?NXo3QTZ6a21IeXVDeGQ4Tk9rTkVkRW4yZ1F1aG5BRVFKckhJWk1CMzJITDBV?=
 =?utf-8?B?MS9BQVdBdVRiRzJGWlhhcnptWkxONjdwUnMvUGdIdFJHQ0dCTU9oSFZ4Znk0?=
 =?utf-8?B?ZHY1Z3A4OEZxU1ppSG4xQTZJT1NLdGduUFlrVU05T3o2WFpnUXZBUUJ6Y2sw?=
 =?utf-8?B?SlFKY3ZrcXE3QjVQTEFnQzFGR05aQW02a0VaWThCVGRMT2pQd1liZTQ2ZHZT?=
 =?utf-8?B?SDdHWjNvakE0MklrRGNzbVQ3VjN6UjljUVp3ZGF4SWhQQzhrM3ZUTDVJWDN1?=
 =?utf-8?B?Vkp0ZkpUY3ZKQ3V6MEZwUDcrSUVQdE42a1oyNkFvMXczVUlJZXlKb00xcEJZ?=
 =?utf-8?B?eHpxdkcydTVGZWl1WmtwY0VGZ1E4RUxSMzF5Zy9LSDFCbkNrSGRuNWREZWhX?=
 =?utf-8?B?QTNSWnNsK1Mra3RHU0ZXZEdYMDJFQ0FsamV4Vksxa0tVU2FOaTFPWkw0YjlR?=
 =?utf-8?B?N0IzMkpsZmZucmp4NWVxaGZKTU4wNm1UM0NIOG9mQkVKOTdaL2t6LzA5MGd2?=
 =?utf-8?B?SGxtUUVaMklBYjl0K3JOZlc0Nlh3dTRhazdKamZZNG9neU53Z3VqYXh5WHNp?=
 =?utf-8?B?ODVRODdSV2J5emZpdVJkTVNGemo2bVorTjVWSWhWczNnNUdNQ0ZUQWVwb0J5?=
 =?utf-8?B?MHAycm90Qm52eDRkUVhRUDJ4K2Z6ZmMwSDNQZmUrcWZTb0NPRHBUeGQvQVNx?=
 =?utf-8?B?bmxLN3JWZGI3M2FseWV0TlBwTFhteWo2TGFJY0x5MEFMNFBHazNtbkdZUEZT?=
 =?utf-8?B?ZVhLMDM5UXllWERyblYxRzNVSmFDMm50ZEZLOUVGM2h1d2kvMkVhOXFtRk5Q?=
 =?utf-8?B?Sm83VVlsVmRaTzkvRUJuWEhIOElzaTF4V1dxQlh2dHFHUFQ3ZEQrOUVHS0Zi?=
 =?utf-8?B?TFl3ZzVDRVVvWDNUQ2dOMzRTR1c3bkNTVFFEemlPRWRLSS9YT1Z5Rk8xb1BH?=
 =?utf-8?B?WGlna2VWV2ZqTXA4NjJ0U2EyZmNhbkdiZlR3azRlVTg0K1VSWkIzWi9MNnls?=
 =?utf-8?Q?J7Zzu2OxDoe6/1AUiW2L/+wYSFsuhzebikspa3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491cfd69-8fe6-44c0-fa90-08dd772a54e3
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 05:49:45.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0170

On 2025/4/8 7:34, Inochi Amaoto wrote:
> On Mon, Apr 07, 2025 at 07:29:37AM +0200, Alexander Sverdlin wrote:
>> Hi Inochi!
>>
>> On Mon, 2025-04-07 at 09:09 +0800, Inochi Amaoto wrote:
>>>> Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
>>>> called RTC, but contains control registers of other HW blocks in its
>>>> address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
>>>> (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
>>>>
>>> I think this is a mfd device, so why not moving this into mfd subsystem?
>> MFD is by far the most tricky subsystem to get into [1] ;-)
>> SOC looks much more realistic [2]
>>
>> [1] https://lore.kernel.org/all/20250306003211.GA8350@google.com/
>> [2] https://lore.kernel.org/all/20250303-loud-mauve-coyote-1eefbb@krzk-bin/
>>
> Cool, let's keep it.
>
> LGTM.
>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Hi, Inochi

I think you were not reviewing the latest version of this patchset. The 
latest version is v14 
@https://lore.kernel.org/linux-rtc/20250315224921.3627852-1-alexander.sverdlin@gmail.com/

Chen




