Return-Path: <linux-rtc+bounces-1964-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333C976941
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 14:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4833D28480E
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Sep 2024 12:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87C81A2876;
	Thu, 12 Sep 2024 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i8i60Lk+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E70B19F42D;
	Thu, 12 Sep 2024 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726144654; cv=fail; b=KV+FkLv3fEcXey72EOlOQDurBhYEZbbRRBmfnfUGG2SVr0vHboPSFrgbW4rEy4+Kwqt1oK0zKKFEB2Cww/mBBixnPTa873gCTdE5CqaQsjwtSRvivZ4lEAPipqqqGlZyeqWJu+djAucQNzyEonq5g4DLwhizSYzcUrminvA1HW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726144654; c=relaxed/simple;
	bh=N++pw1PhiZDyT4FMQom0HHo8hEz1VSIpoMmVKPmZniQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pK8AGHRRBtFnQO9Tk3B8ER8D+0IqTtMtSwzkzv0UobQhSqKuzYPDg658rfpo/hZYF/JiuJV7Xxp23FY8wSUFO1I9TAb5K9NPnnZLS2RjXKBZbiajzEAxc5dFObgmk9hykRk/dbmTUupcYi5vdV7shnxJlH7+h/r6554lyFsl3Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i8i60Lk+; arc=fail smtp.client-ip=40.107.21.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQAiUVHUCUp2BEhC8SpoUCoO9pfDZc8H1nxAbh4bdPWLjCVbmuhkpgUFxdEFyQvJs9o614ANE2AC4u3NMPb6Ib1n7wrkPYDUuZMXCK1CpXUmbHd/deUaiCuBwBAnFlrGy+yc2zwZ0dH/zAYaYWbtk13NHMl/zuSq+4dR8rAkQnsRHFjHilgl5/ImEepk1mGdMC0TC1VO0GEnfDIYDZPglIHzALO1nGyPMfpb8otGw//mvdgcqIu3Rb3z8HNz+QQPPWpn6esZ5yi4froeoD1LheEdmTAZgzpDOGxY4v9PWv9WSKUBekHQMuJBbUYGn9zweQ0NFtI2rwW/48I7BWeIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzIjuBwIa5f1XGqcALVOSPdZTxgGf2atIH74XTRzuxo=;
 b=vgH/4OlUskVj4TrCJf/aPomRYXrk9q3jg+EDc+Ri13hwrtbba0iCInG9xbT2h1BoTQygSKZbBtJw2439//IGKWhMELotUxb69d+Gpl5aKcWHJCtjHHnrsV9ucjv0dSoEXWOSXOJN1PiaWkdSVXVW8iJVAL88B4Q9V/C8/rRoh3HcVYL0BWzLUqPVxYHwPRgWuv7NR5xShAd0xM64cvD2faq5bvTT7zCJ9Zn1kfHb+PS0+aCfTanz9DJI+O+C5Phn2j2en0q2VVXRf2uET+dPh301atAqhHElOQI9H/d+VhNZjdVLJjKFe3chMeORuLqDHwm5QIMI8iCJTi1gWn2wXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzIjuBwIa5f1XGqcALVOSPdZTxgGf2atIH74XTRzuxo=;
 b=i8i60Lk+j6VdASOPzNX+eQXQSNeYgyFMSxwXOFaxtBJ47OIT5mDiyM6x9vh0Mjy6G09/GGq06OjTlmOUNxGuuZY0Q9uM9ZI5Bp07g6iHQln485phvb7I6YV/VyiQ2Zjkp/EZ/9UmpUWL2/92bwPWZUA/6OsdQtXesT8dh21HDiZRpWVVp2GEe61oRLVRLjj7BlEyp9m3J4F7+vBQdNAXy56px+5XnOmqOHoHKvra7ZDsW9Wcj//ktw97XmGaM18zRiOaxSGd3SJ9tp3QnpIl+OEYng+SVS+GUj1vXuN6G+rQwtQ8xxur19Lv7bPFG/wF3ghZ3pV5vknSanrB8QHCwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VE1PR04MB7231.eurprd04.prod.outlook.com (2603:10a6:800:1a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 12 Sep
 2024 12:37:28 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 12:37:28 +0000
Message-ID: <2815dcf8-bb90-4e3f-837d-2c2a36a8744e@oss.nxp.com>
Date: Thu, 12 Sep 2024 15:36:46 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>,
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
 <20240911070028.127659-2-ciprianmarian.costea@oss.nxp.com>
 <20240911-racism-playmaker-71cb87d1260f@spud>
 <62ba70ca-429e-476c-bb7b-78f743574a68@oss.nxp.com>
 <2024091212260302903af7@mail.local>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <2024091212260302903af7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0047.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VE1PR04MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: db49fa07-2b0f-47f6-28e9-08dcd327a965
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnd3dDRrVUFpdW93dGNiY08zQk0xU05SUVQrKzdoR1NOdGZ1bzhKOGNmVVV0?=
 =?utf-8?B?TjN0TnVwZTJkcUNDS3ZyQlEwQjdKVVFkM0NkU1JKbXNTYmpkUCtwZEt5Q2Nh?=
 =?utf-8?B?MXpPaDhhMHVFU1YxbVlsbi90NXF0MWZiZU00QW1WUDB0ejFKbjFEYkNBQ1NF?=
 =?utf-8?B?N0M5enk0VU9FS0RRblg5VWdVTVp3bEZUQUhoVGFOMlJLZjdFNytNd0lGb0px?=
 =?utf-8?B?TVpGLzAxUWliaEwzMmoydmhZYmFiUnBFcTJSZkRJbzhPcDlMUXJZQzRqRmRx?=
 =?utf-8?B?N2xRQUppVEVtb056MDhmQ0JhemF3L0hiR2hlYUZkUnN0dktLM3VodWJmSXhW?=
 =?utf-8?B?Q3Q4KzE0Sjh0T0JiSGtoTkdQQmI4VWVxcFZwejM0NG4zTlB5QmN5RHVlbjl5?=
 =?utf-8?B?ckp1QU9UdEpZSzdPTzQvZEJOK0RSUC9hdzdCbVVWWVJ5STlQR2YyTDFic0Ft?=
 =?utf-8?B?Q1pST1dHVHUyaGhtRkRiZWdKOXQzWkIyaEN4U3JjVXlScGJyblUweXVFczBY?=
 =?utf-8?B?WlFKZnM1a2hnU3VrTko4ZndVVzBhclZuWG9MTlNhRFZic2xHRnhYeTlBSnBL?=
 =?utf-8?B?MC9ORklnRmx4cGVieVdpSUJybklYWGxGSk9sQitzNFdvWHNNVlpYZmVCNGxj?=
 =?utf-8?B?MzJUWXpuemdtSjdEQ09FdkZKdmtBbjhZc1FkWFpiRlNTc3ZHcE04MGJSSXdv?=
 =?utf-8?B?SlpKejV1MlNUVFdLd0VkdGlDMnBMRlIrZU5zQ1l0RlBzRHl2SDFIWVVBUmdh?=
 =?utf-8?B?Mm1iQ25MbVZqbkx6VzJzMkJ5K040N2VmMnVsUFdhNHNtQTRuYnE2ejNvQUtw?=
 =?utf-8?B?bktTMEhxOEhCWjNXOVNqd2ZLQzVnZXpoU3VuTklicVIybTBmRWxvbmhzaWpt?=
 =?utf-8?B?Ui9jLzhhTG1nRkpUMEZ5QWd5aytERTBSWnlTNCs1c3hBZVFJUTRQczVMOXI2?=
 =?utf-8?B?SzQxYjc1bjFUQ0NzakNtaVhGSlFYa05INjZIbm45MGNLY2d5WTZWVUgza25n?=
 =?utf-8?B?VEZ5T3FqejYweEpWTW5rQURKcUVhY1RGcWttWEVHVEx5dDNhanJHaTVyNHdt?=
 =?utf-8?B?a1VXWDlmNTU1ektmV1Y5anVVYzFTdCtEMWhzdmNsanpxU1QwUTRXYmVnTFlC?=
 =?utf-8?B?SENockVZdTVzcjMraHgyUVhMWWxOZTV6WHNuVEsxbUZEcWV5VHZFeWt2dysv?=
 =?utf-8?B?NkV3bXhWalp6TUUzSVBkOWFITS9jeUdzbnZDWmhNY1B0YnNad0NEZVlNOHRV?=
 =?utf-8?B?blpXM05TdkI3bjNzajRBT1V0YXo2QmR3RWtVU0tVRVlub3Qxcnl0dmNKSzRw?=
 =?utf-8?B?Uk5iMVFRN0tvYWRpczR1SERHd3NRU1VZUjAxVUdLWWgrNnEybnRKNTRpSFQ1?=
 =?utf-8?B?NFhpNHdVZjMrM21WUFd2R1pVbEZuNVB2S2hYdXB0SlhCZENjTkVNc0hLV0o1?=
 =?utf-8?B?SVZpVVdkcXF4R0VvbXBRVFZrcTkyZXpqWnZDcHZHR0I3Q2FpZldDVnJRWDRT?=
 =?utf-8?B?YUxGSGN3ZnY1eUx0QWlBSWZrRmVjTXJsVVo1TSt3anV3Z0xJUVRTVlJIbmhz?=
 =?utf-8?B?d2M0Mi9xMkdnSGRZSUlPN09sWjBzMXhlNWRvS29GeS9EaHpvVS93b0VId0tE?=
 =?utf-8?B?dkhqQ2MycGNyaVV0bE1kSVVWczJPRm5leURnL2RVWGtPMTRwTy9KNGVuaVpp?=
 =?utf-8?B?TXFNeTYyazJRTm1ZMTcydmljSlFSZ0NYU0VPZE4wbGRWMVBweG8vOGpxU2JE?=
 =?utf-8?Q?qxYCmRPRwwe/yi8M/o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUMyK3d6amd2aHE0cHVCblB3QWQwcHlma0wxNWlXV0ppM1pXR2psQm5UR3cz?=
 =?utf-8?B?Sjgra1dobmJKY0N6RncvUUo2aVZkS2N2dk9WQmhOd3owd3U1UDVJU0hZU1BV?=
 =?utf-8?B?QmQyWVFubDd0S2F5M1A2QWF5Q3NTaUU1bVRhNTIzUHljUjlIRjFVcC9VeFpv?=
 =?utf-8?B?MkVZYjNFV2UrYUR5NGVIMW0rKzFSa3cvdzVVZWFMU25WRForV0Joekc0Umh5?=
 =?utf-8?B?UnVxWXZXaStLMWRRYmVaVmpxM0t0RWphcFE2M0crU1RaNVMycWZQT0NJQm5z?=
 =?utf-8?B?MC9McjVqMWpTRWZIY1kwMW1XcWhWN0pPMTVpNkRBRTRyRjZDNmxzT2llcUVR?=
 =?utf-8?B?NHRFaG1GcDN3MnBVcG9ydjIwQW1pckZiUGsrclZZOXRNZkdxK2NjWjFRUGRT?=
 =?utf-8?B?a3FKbXBWNE5URGVuN0FEWXpnZGY1UFpmejlHQmhwM09PSzF0YlhPQTExNE95?=
 =?utf-8?B?eDA1akJIanJZMGVpMURJdE5iMFhvOW9jZXJ2MzFuRC81RXVJMkJEcTZZY0tW?=
 =?utf-8?B?ZzRORXBKaldJcFcza0xZMHEzUi91SzUzNk5BYm82a1NZSnJzamUrWlRvVkRy?=
 =?utf-8?B?cXlGeS9QVFQwaU1qNzZNZFI1U2VibktGdkJKdTNBSy9Gbm8zS3R3SW5jSUJy?=
 =?utf-8?B?N3lWUk1Gdkg1U05PeHJLNmMrUEx3VVpxSVBqQkxvL29rbThlV2lTSGJwdmVJ?=
 =?utf-8?B?dllWUnF5UnRJRnFXUWpoeS9Ta1BwMGdUOVdKRlhNcUh0bms2Y29hVmd1SjFO?=
 =?utf-8?B?ZmR3R01KVWFNQVBjU2JRT0pDbzNtSWhxcUUwZVJHMDMwOFA3U2ZnMmZ6d3k2?=
 =?utf-8?B?VGpiNDR2M090MmpuNHVDN3JvKzZEVTNCNHU1bUswUUdoOExoWnZQNUM5ODcx?=
 =?utf-8?B?aFdWL0Z1cXhLT0FxRTlSTWhpbGxISGs1bi83emhrM1ZJQ0lhZm1sMmJ4Z1Fn?=
 =?utf-8?B?RlJ5YUd4QVZsaW40dmVMc0M5SWhQRlE5Z21lS09IengveVMyOC9ubDAvRTli?=
 =?utf-8?B?ZGFZeTg4SGx3d1IrcUFRY0ZERUJ4Zkg1RXNmM1FyKys4SFdsZTVZK0pXY25X?=
 =?utf-8?B?OGJRUVBXbHVyaHNDTTlBZFl5alRtUVU0a0M3L21ZcXBQSFY2dkZCTUNXZjZi?=
 =?utf-8?B?NVpZcDJ5alAvYzFOUDQyRi9kSHNZb3c3UXpOREJHWU9KOG1SRWxlaTlNdCtI?=
 =?utf-8?B?VjhOUFNyR0gyMUpxVDZ2SmllMElVWHV6OEJieU5zaDFnc2R5REZGWlAyalhp?=
 =?utf-8?B?WlREdmtaaEhhUThOVSs5dFJJNHd5cWhEdE1Oa0ZJQWhJSEhOM0xtTkVycjFm?=
 =?utf-8?B?bmppZ1VkOWFrdWJGam8wcFhaTGtZY1FDSzB5VHNKQ3RKNTlTNk9zQVp1d1F0?=
 =?utf-8?B?TFBNWXk0SWtGNk9ySG1wOVNFdmc2OTBRS3o1MDgwTmFGdC9mUEdrS0xUMHJY?=
 =?utf-8?B?TVlyTjJ3UnhCZlV3ZUExZEE4dUxJR281aDZ5THc4bENrZG0xZWZVOUdRWE1h?=
 =?utf-8?B?ZWc5NWRKRTkxYXFVM1Z4ODIrWWFSM0w4S1J2UkRtY3FRS1J5ZERpTUZKUWRh?=
 =?utf-8?B?Vi9nSzBvQ3JFY2pIYmdSYWpvWXdCNjY5S3luVWtOcTBlb2lIYlc0TXRLa2xI?=
 =?utf-8?B?M2V6RHZpK0NESEhnNitGN21VUml6K0laa0pTRXFPSEo4Nkt3QjhORDV1b0g5?=
 =?utf-8?B?dERNVlpWQkwycWpxUkp5dWhpQ2tud3ZkZTlacURtYWw2N1hJSEdpczNXNXk4?=
 =?utf-8?B?RXVLMk5EV0RGMVFTclZ5NU5xRFRNM1JmdjRFeXczSjEwSytBaWJtYXRVek8r?=
 =?utf-8?B?WjRSZ08zcWVXWWswR0R1L2ZMd3BKSmY2K2lpS1lkaUNPTWhhdlpLdlJvcWE5?=
 =?utf-8?B?Z2dsOVRpTHZ4cFVzcDJmUXJBTkdtell6RDlWclFsQ1VTNlozbVUzSWl3RFlC?=
 =?utf-8?B?TVY1V1NjUURsQkZqQjRnM3FHT1BvL1p4eHdNTFIrYVh6Z2JzUWdycGhOTlJW?=
 =?utf-8?B?K0lmOE53V1JNOHRibm9yQlVady9CREVQT3J3M0RqYXJqOXJmcWM4Q1lMQU13?=
 =?utf-8?B?cXVIbDJYTU1OVGZYRVVSU2xuMHdZbDZMMHp0aS9VcEZHL1hPZk5Qb0o4SlRh?=
 =?utf-8?B?TGZKajRFK3BSSmtJa1lNemRZc0tiRG5RZTNyOFN2WjJFQ09vekVGWlBiNHRP?=
 =?utf-8?Q?4v3HQHncpmYhgeaaMmRlX4U=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db49fa07-2b0f-47f6-28e9-08dcd327a965
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 12:37:28.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrOfZFCoQS9bIvbTIX71YnvPQNE5pYnPHzqyeDVifXAkJDFvHPRFrH9AN8CS+YDulkHtsDa1y+xXZfAOuIMGziKQkSNUk5PMyDopb+Sakqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7231

On 9/12/2024 3:26 PM, Alexandre Belloni wrote:
> On 12/09/2024 13:50:25+0300, Ciprian Marian Costea wrote:
>> On 9/11/2024 9:21 PM, Conor Dooley wrote:
>>> On Wed, Sep 11, 2024 at 10:00:25AM +0300, Ciprian Costea wrote:
>>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>>
>>>> This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
>>>>
>>>> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
>>>> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>>> ---
>>>>    .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 79 +++++++++++++++++++
>>>>    1 file changed, 79 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>> new file mode 100644
>>>> index 000000000000..8f78bce6470a
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>>>> @@ -0,0 +1,79 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
>>>> +
>>>> +maintainers:
>>>> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
>>>> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: nxp,s32g-rtc
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  nxp,clksel:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description:
>>>> +      Input clock selector. Choose between 0-SIRC and 2-FIRC.
>>>> +      The reason for these IDs not being consecutive is because
>>>> +      they are hardware coupled.
>>>> +    enum:
>>>> +      - 0  # SIRC
>>>> +      - 2  # FIRC
>>>
>>> Could you please explain why, given both clocks must be provided by
>>> the hardware for there to be a choice, why choosing between them is a
>>> property of the hardware?
>>>
>>
>> Hello Conor,
>>
>> Thanks for your review.
>>
>> According to RTC module's clocking scheme for S32G2/S32G3 SoCs, it has three
>> potential clock sources to select between:
>>    1. FIRC:
>>      - fast clock - ~48 MHz output
>>      - chosen by default because it is proven to be more reliable (e.g:
>> temperature drift).
>>    2. SIRC:
>>      - slow clock - ~32 kHz output
>>      - When in Standby mode, SIRC_CLK is the only available clock for RTC.
>> This is important because RTC module is used as a wakeup source from Suspend
>> to RAM on S32G2/S32G3 SoC. Therefore, a temporary switch to SIRC clock is
>> performed when entering Suspend to RAM.
>>
>>    3. EXT_CLK:
>>      - has not been tested/validated for those SoCs within NXP's downstream
>> Linux. Therefore, I did not treat it, nor mention it, for the moment.
>>
>> Now to answer your question, all above clocks are entering a RTCC[CLKSEL]
>> (RTCC - RTC Control Register) mux. Therefore, a selection can be made,
>> according to one's needs.
>>
> 
> Then should this mux be registered in the CCF so you can use the usual
> clock node properties?

Hello Alexandre,

In hardware, these clock muxes and divisors are part of the RTC module 
itself and not external. Therefore, I would say no.

> 
>> I will add a shorter version of above information in the bindings
>> documentation in the V2 of this patchset.
>>
>>>> +
>>>> +  nxp,dividers:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    description:
>>>> +      An array of two u32 elements, the former encoding DIV512,
>>>> +      the latter encoding DIV32. These are dividers that can be enabled
>>>> +      individually, or cascaded. Use 0 to disable the respective divider,
>>>> +      and 1 to enable it.
>>>
>>> Please explain to me what makes this a property of the hardware and how
>>> someone would go about choosing the divider settings for their hardware.
>>>
>>
>> As per hardware RTC module clocking scheme, the output of the clock mux can
>> be optionally divided by a combination of 512 and 32 (via other two input
>> cascaded muxes) to give various count periods for different clock sources.
>>
>> With respect to choosing the divider settings for custom hardware, it
>> depends on the clock source being selected and the desired rollover time.
>> For example, on S32G2 or S32G3 SoC based boards, using FIRC (~48-51 MHz)
>> with DIV512 enabled results in a rollover time of aprox. 13 hours.
>>
>>>> +    items:
>>>> +      - description: div512
>>>> +      - description: div32
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 3
>>>
>>> I'd rather you provided an explicit items list here, explaining what
>>> each of the tree clocks do.
>>>
>>> Cheers,
>>> Conor.
>>>
>>
>> I will add such information in the V2 of this patchset.
>>
>> Regards,
>> Ciprian
>>
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: ipg
>>>> +      - const: sirc
>>>> +      - const: firc
>>>> +
>>>> +required:
>>>> +  - clock-names
>>>> +  - clocks
>>>> +  - compatible
>>>> +  - interrupts
>>>> +  - nxp,clksel
>>>> +  - nxp,dividers
>>>> +  - reg
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>>> +
>>>> +    rtc0: rtc@40060000 {
>>>> +        compatible = "nxp,s32g-rtc";
>>>> +        reg = <0x40060000 0x1000>;
>>>> +        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
>>>> +        clocks = <&clks 54>,
>>>> +                 <&clks 55>,
>>>> +                 <&clks 56>;
>>>> +        clock-names = "ipg", "sirc", "firc";
>>>> +        nxp,clksel = <2>;
>>>> +        nxp,dividers = <1 0>;
>>>> +    };
>>>> -- 
>>>> 2.45.2
>>>>
>>
> 


