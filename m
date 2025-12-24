Return-Path: <linux-rtc+bounces-5613-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52752CDB927
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Dec 2025 08:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 227CB300F311
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Dec 2025 07:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A662F32C95B;
	Wed, 24 Dec 2025 07:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b="mu4IL4xG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1122.securemx.jp [210.130.202.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8A283FE2;
	Wed, 24 Dec 2025 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766560577; cv=fail; b=qME6Mfwe3oYjJLr54hiqdRGf6BXQAumDIXHmCwfKEPfrjsLHKbFTuLjc6YPkSPN6qkrltjoQ6iv8yyZLRBXS6hyGGsgTDNQpdE0tUzsNuCZsXE/3cMQXJ4aX5zsJNPD4EryX1DgzLq5lmR3MbQfvZqXqYSvjH85S+Go5M62hoGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766560577; c=relaxed/simple;
	bh=SxBiSP4bl+xs4c6L4gAEeqvUdvf1RG85ACRQg3JCot0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qiyR1BRgvjk45gZAaHaEbrfwqg1BPSv92NfZsP5gWSeNow18SUoSFW1haPW6MMkW0Wib0kFwrDNZnmyWk0Gw1lv+BW/6Gwct3r1APw1iVsqcpPAV0b4uNnJrpq1WdWVycfELiuj7d7Cm6Q0awccRYrSDCfYFFiej19hxBeljubs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba; spf=pass smtp.mailfrom=mail.toshiba; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b=mu4IL4xG; arc=fail smtp.client-ip=210.130.202.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1122) id 5BO55WKV265752; Wed, 24 Dec 2025 14:05:32 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro.iwamatsu.x90@mail.toshiba;
	s=key1.smx;t=1766552694;x=1767762294;bh=SxBiSP4bl+xs4c6L4gAEeqvUdvf1RG85ACRQg
	3JCot0=;b=mu4IL4xGb6rDw8oRk8Z5F1L/0+OCnA7M68yMjsP6cpRDyhX5MeknVpA3/zGg1Sb6W0R
	/Rv78SrQtAdrhaszv4YlsrfWSjdeV8QMKHTMQWAYY75Su3aUZgdGfbLHjFBlO7qU8bGi3bLxYlSPe
	0CMCKWPuIrLp3ggSUknrlJjD7pDie59dOEwcJV+VBpOH7qGUrTdBSG7AiLskTlxn3UhrgDMXT0eNd
	qGoNLwzU0Tl3FOkv2MJ3sTAx4XhmbsP5vUb+8P8CKmxf5+WeOz+9p54MkyMm6nXpmelhgrJa+8YZv
	ASc9Z+yN088sbJ371HrWVdSyFR0HO1FhAeU8lnR98T8w==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 5BO54rBv3027523; Wed, 24 Dec 2025 14:04:54 +0900
X-Iguazu-Qid: 2rWglrLTIzol6G9GKu
X-Iguazu-QSIG: v=2; s=0; t=1766552693; q=2rWglrLTIzol6G9GKu; m=SPj31iz8K42QXqGNHrKzqeyOxdgQRD2qwSszAMRDRN4=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4dbfv92cx5z1xnj; Wed, 24 Dec 2025 14:04:53 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rrz1MLb4e4DDjo/ntzxuivG5++NbFe+ohEDZxt/hbtfJgQ7LHYuWGGBUqlIFDCz2lvqoFsRMPHkictWrkshn3bWHs7g0izfk8WZfvldTpUTAgL5doUEiiz2pfKMH85+QPt1SHXIfPy62hX51r5qfU+58shBHmyyL8feh2Le0nsYHi7uiezRzH8swXsFcuU49NbMcmeKOlE8rxQCCzGjoz8WVGyteYTotMp0uw1XQu073AfaeP/Qp03IRvPM5zHzTySawn9kagGNHO+UQtcdiEp8z57YyD3HLgMOOc13zEsFszx3VejwlPZ8DT+n/9V47kZbefn4ONwkKt2T6Eolwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxBiSP4bl+xs4c6L4gAEeqvUdvf1RG85ACRQg3JCot0=;
 b=DS0OdKiO/delLyO+G06eZJXHByyzXJvf4ynfE52HydnvdT+DTyvv2Fa0BdWe1HSsZGmF3fT/96xygQNSA6l+n3kzsmid24z2kmOA8KUF2KFvnnYgjrdGOYgK08oHbj9h24tQEUqgLIQu8i39bG+18b16uER2inPEkcLH2YX+4n9rullI63JJuZtSwoRmFTWX1Lo32WcLVL98BcbcjGznlo11Qt60HD8MmNuwMWmn/hTHaR8rzkIdayuILvG9Tv1ZLpqIHdfVV/WcddmHQfTR38o5K9t8VLQYMaT3JCSycV2ftjSG6qy4xsI9TaK//kXXMGhKFWo+rrLEsjnZaSj1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <fredrik.m.olsson@axis.com>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: RE: [PATCH 1/4] dt-bindings: rtc: ds1307: Add epson,rx8901
Thread-Topic: [PATCH 1/4] dt-bindings: rtc: ds1307: Add epson,rx8901
Thread-Index: AQHccOCUmscT26IEyEOxl65gfggR7rUwQ7QA
Date: Wed, 24 Dec 2025 05:04:50 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY7PR01MB1481815FE28BDE5968CC075F3CDB2A@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-1-b13f346ebe93@axis.com>
In-Reply-To: <20251219-ds1307-rx8901-add-v1-1-b13f346ebe93@axis.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|TY3PR01MB10188:EE_
x-ms-office365-filtering-correlation-id: 4450ffaa-11cd-440e-01dd-08de42a9f7a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dWtpdmZvTURWSlg3Yyt5WlE0alJvNGlBRGFscU9kUjhDQ1ZjeWQ2U2ppMEtT?=
 =?utf-8?B?Tm5iMzJPdmFha3hhLzlqTnBoTFB0Ly90RjgwQVpIdVZtT3V1VVZ2eUNJeWlT?=
 =?utf-8?B?OTRaQ1V6MGZJa2NCSmdsRFVkaDZmTTM5NFRBVEE1UGZxNnBzSVFPeFZUQmhC?=
 =?utf-8?B?UEZDNThDTVhsVGFEcUViVFgyM0VJZEF4R0IxNW0vNFdveUZqOTcrU2JaSVlW?=
 =?utf-8?B?MlBmaWkxcU1TbUNhN1lpektvZnYvcE9YekpNdUhPc3Q4c2Z2U1k1aUkrYnlE?=
 =?utf-8?B?dlFGOEpRdlBJMkphMHRieWZPcjgvckRYdExLYXdJTVZPdGxraXcwK2dXaFI5?=
 =?utf-8?B?RG5Vd1Irand2ZkJwL3gxQWNnOEx1SUppK3ZWQk5wbklJNlR3TUYxNURCS2c3?=
 =?utf-8?B?Nno0YUNoVktiYVlZTXVLdVRHYUxYa3I1QWZuS1FCTlMzdzBndkU1N2orTGRE?=
 =?utf-8?B?LytpNXFWMS9uUzdRMHU3NEVlb0MyeXZrVW1iQVArSnlUc2tCWWpVanA4dHpq?=
 =?utf-8?B?bTFuK2luRnJ1RnROb2pXNEo0V25jZERQLzJBdXJBaDhtN0I5SXQybnB0djl5?=
 =?utf-8?B?M3ROSUNuaituM2NWbnFYOFVBWXZQaGdFRTduR0NzVUxINUFXeVMyUjFQem15?=
 =?utf-8?B?YVJFaElHNy9iaGtNYU1Rb1hnbUM0NlhJZnRDb1UxQW5aS3Axa096ZTJmVHc0?=
 =?utf-8?B?elpZY1lTOW5aMGZxZzNpdVRyQkFTQlp4MElyUjYxTmVjQ3VoZmtyNHQvWDRv?=
 =?utf-8?B?NDBNZ3BJZkhJRjJ3NjRRRXRnQTlBblZuOXJCTzJYUXNDamVlZjZqbDcrNzJy?=
 =?utf-8?B?dm50RWE1SGlHWm1sS2RvZzRhYnhidGpTT0psV205Yzh6Q2ZacHlUR2ZMcUVV?=
 =?utf-8?B?MzhXRmI0a29EemQ5dGdWak9LaElaYkN4WDViZGJTbFRxR0Npb0x0U3M0MVF3?=
 =?utf-8?B?SkNZSmpHZ0JUUnNYN1N5MGkzSjhtbXFqTWVsV1pwTmNPN0Y2QTNlekFmUEZp?=
 =?utf-8?B?UEo1UkExTVNpOFR6VGNCNW9qS1h0eHo0ck1xL29hSVBiVEt3K1ZDLzJRVGxn?=
 =?utf-8?B?Q1VsUDlJZWE3ZUdmYXBhU3E1b3FLU2VxVGp1V0h0M0Q4V0RiZUcvWDZ0WVVz?=
 =?utf-8?B?d1VONk00QWtHUUhSbUJmdjZ2WWI5UitCdjEwR3pmeUhVWlhHRWFxL2ZEWUd2?=
 =?utf-8?B?Y0ZmTm9VQmVyYy9ySlFaZGMzb3hHTmlWZmY2NURCTTFSUWxMZ2JsMUM5aGU3?=
 =?utf-8?B?OFR5WDBTdGVRZUhDTmgwcnBxcXhXTWRtZlAraEZIL24wNlpENGRlUXo5ZXNF?=
 =?utf-8?B?Uk0zcjJ2elhNZkY0d3lJV0lHaG5SKzRGcXludDFiRFhtc0s4YlRlb0hoREZH?=
 =?utf-8?B?aW13b1pKVkllNURJZE04WlpsNXI1cWVhaHpWTzFvOXp0Z0VMNS9UTlI3Zzhm?=
 =?utf-8?B?aytrUkRlMEl4YXlzTFB4akRRYm9MWjNzNFJnWEE5V2ZXQTFBMlpwTzNZcHhy?=
 =?utf-8?B?QjBrSktLbURZQ1JSRFpaMEt4L3JmZGFtK3R2S2pYajlCQUxoOVdaeTc2MElZ?=
 =?utf-8?B?c0JiclhvS2xVODJGQUJ3aFJaL1JzL1pmMFdTNmllT1dvVVYvRmtYWlRaREpQ?=
 =?utf-8?B?ZjVGSGs4NStnWmhtYWJYa2dzcDJ4bmsvRXBiaG95RFdXaVJxSjI4VFQwbGgv?=
 =?utf-8?B?YXNoUXhPWnNWRjBuc3NqY2syQ0NwUjkvZlFFcDhKbitBNmtSbVlXVEttb0k3?=
 =?utf-8?B?bE5Pdk1Odm9KUWR4OWdWUWNyak51Y0grdVdIT3R1TzAzWUg5SEplQVVWRUtV?=
 =?utf-8?B?Tk1pNG1nckpKT3htNnFqWUZsaEw0UjJId1NaODdEeTRmeGE4Wk5FY0h0SVc0?=
 =?utf-8?B?OGZRVjg2UHRHY29RY0VFS0lTbkVzVkVkZG5vUUFmUUZublN1VGtGYXRQWVUy?=
 =?utf-8?B?dVZvUGdlRDZ1VjRIeGpEZVRKYkhzVG4zcFhCUFA2aERldVBaUmN4OUROakVp?=
 =?utf-8?B?eWZKOEdNYlpsbE5td3BDZVJzSEhjOWpQRisxVTh2NFhzQzFSMSs3V1ppOFhj?=
 =?utf-8?Q?NmXh0S?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U2ZUZ1htbWlIcEM1MmlOTnhaaXcyQllZcDZzemhGamhQM1RFVjRGb215SkIw?=
 =?utf-8?B?OU5kVkE5VkgyM2tldFlaSlB2di9qQUM1UnZjRmk4V3lCUnpBTmtiRWgxcTVI?=
 =?utf-8?B?ZWtyMlJPdWdaVVZRWE9vTStnM2xYcGoydUhPTWU5SUtlc3h2YjdPaGJOVU51?=
 =?utf-8?B?KzhhNldPWkVZUlVlbXhvcU9FMXBGT25uN0NHNlJmNnNxYnRLOHZRN1o5NWxs?=
 =?utf-8?B?V292cUQ3emNCdTZHemk5czROWjhVaHU5b2ZJUzFPUWFRaTQ1UE0vRTd6ZEl4?=
 =?utf-8?B?QnRCLzk3T2NRVDAxTUUyTU84R1ZjQ2lJTXNhZnBlTFlmd2I2cE5XZG03OThJ?=
 =?utf-8?B?dHMxWnB0cFloT2lhM1Z5dkVLYVBCU3ppUkYzbTRJM281MlJraU1KVDhjR3FM?=
 =?utf-8?B?eERFRC8zcGJ5K3A3cjdRWWZFdjBOd3IwSHR2K0xtYnZxYzJDTG51K0EyS1ZQ?=
 =?utf-8?B?eWNCeERYSWdlY1RwL2xEbml2MkdYRkxWNEhkeG1MRGE5dWZqL0FRYit0dVlt?=
 =?utf-8?B?VnBGQzV1Y2srOTB0WTRzNG9qTGtBeTdKQjBlODBib0EzQnJ5SktQOFMwNDI5?=
 =?utf-8?B?a2hTSFhuZVp6ME4xT3c5NFlZY0ZuSWhKUzZmM3JESXk0MjVXSjl3OTFhc1J1?=
 =?utf-8?B?dmx4RUwxQ2ZHOFZidUpsck1wUzAwYkpadEFoWm5BWWNCRzhYWEZ2Vi9nQ1Q5?=
 =?utf-8?B?M2JGWmgzVUNzOWhIajNBVm9lWVNjNkU0bEtuSjVmeTlWdzFuV3hFUTYzZzNC?=
 =?utf-8?B?ajhCdG5HT2laSFBodTZVc09WQzlab2V1Q0pCdGlpakhORysrd1hNS29uOWE4?=
 =?utf-8?B?S3AvV3M2ZkxwRkNtNHNXQU96OTc4bFQ5am95bktDRnlRZTZhVXNoTm0xM3BT?=
 =?utf-8?B?TnRoY0JRZ0FTWWdUTTJpemdqNlZHbi9ucDBSakd2SnJndS9TNEduY2c0elFj?=
 =?utf-8?B?cTlybkw4U2NhbGhJcHk2Smc0UG1zT2tsSU5aYWlndTgybGFMNG8rYkNhK2VG?=
 =?utf-8?B?Yi9oejI5dXZIQytsQ09pRkg3YXY4YjNoUFAzTS80eHpMZ0tFcE12SW9xZldr?=
 =?utf-8?B?UU0xaDU4S1owV1l2djFPNTdyMHU5QlUvVzdYMWZnd1B2TGNGdktRcGQ2RTRp?=
 =?utf-8?B?TG96bUg0SGQ3clkrei9DbmNqQXE2OVU0NlR4ZjZVeVBZTjdxRlYyeXFmTkF5?=
 =?utf-8?B?MnpOSzl0Q0dJTVQrWHNXN0wydGZaUjlOZ0hVeGRVV1pkL1ZEL1lyM3Rjeklr?=
 =?utf-8?B?WVM3SXcwd0Fuc3B1QXZyY21GMnA4bmpnaWt1N2RyTkJyaTFrREZCUEtXNGt3?=
 =?utf-8?B?bDJRRTRxZzBBK05rMjVtMWgvcTBJNG5ZY2dyODJJRFlSUjRDcFBnYzFDNXNn?=
 =?utf-8?B?djNpaUxrcWVaemozdzY3aDQ2NGsrSUVPUXhtOFRVSGwvWGIyZ1lnRFJaQUlJ?=
 =?utf-8?B?czArZ1RNTnhGekxsc25rNnVQRkhYZE5rd081SlZlc1JESjN1aXkzaTNrTU5K?=
 =?utf-8?B?ZENEQ2xwZEM4Z3h3QzdNYnVRd3cyanp2RTlkWS9OdmdTRVFyZHlpSGJQV0gr?=
 =?utf-8?B?d2x3d1RGcDZNdjh2bUlvVTFrMHNHRjBlRTFZVmZqZXFmc3ZuLzg4THFiQ054?=
 =?utf-8?B?TU1qR0lGNTNqNXhBWVhhSWo5MFFWR0hXNzRxKzdobU1HRXY4dFVud0JUVXVk?=
 =?utf-8?B?WCs0bjN0eVkrS1RWTFpvUVdsS3hMQzlIdFp3eW0waDVHcUJnaE94cEdwSWxJ?=
 =?utf-8?B?ZjUwTCtPMEtIaG9hYU41Z2VHenJKS0oveG9OSVFJVGIyV24wM256ZVdHZTNU?=
 =?utf-8?B?Y2krUFo4Z09nQVZzb2VWMlB3dm1pc3VWb2JNNDZTZHQyZDlQZzBsVlAyZll0?=
 =?utf-8?B?bVpuSC9FYUFSUmFiSXo0SGNYb29TTEZPMGZGOGhKajNLS082T3ZWSkpHbmN5?=
 =?utf-8?B?Q1I3UVg5VzNHcE1ZZ2ZvUzNpaDgyZUZMZUxZRE8wMlFVUUlDSWRoMENUN0tv?=
 =?utf-8?B?a1ZmUUd4bUZJSGsxcjZwVE5RYkZIZHNFU2hudk5ZMTY4cFlqVWw2MUxwblRs?=
 =?utf-8?B?REZqODBrTXNPV1ZuUUZPc1ZKbEVMb0owbytFYWlXUW5KbUZzanNwbENPT2VO?=
 =?utf-8?B?cVFEODlwemcwb0ZnYi82NG0yUFdhakNFZHQ3dTMrZXNOZGtBSmtmZW42VmZB?=
 =?utf-8?B?Y3lkZmppdjUyNTRmcm42TFVuNUR3Y0dHQUdPVndCUE1MeGFiaDlmM2x1bHY1?=
 =?utf-8?B?M3BaTENZYkxzSHdRdnZEZ3hJanBlcmwyZ01wZjZxVDRBaWZTK1AwM1M5UlR3?=
 =?utf-8?B?dU1Sc3M1MWJ6SkxyNGpBUHJwcXJqN3RWZVFQVzllOWJCZHRvL0tndlBCbG9N?=
 =?utf-8?Q?9o1+Y0QrpzHktJu0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mail.toshiba
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4450ffaa-11cd-440e-01dd-08de42a9f7a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 05:04:50.4621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /pBmP1S8JN9/W9RHhl6va1Zrne1VuKb1shwUuhx8w2pVILXNyXGZsrFBTodsWQah+Pwo/rKLaB7f9tTt5cvnNDKYOEzab2cCSd8Jg9McATbgdzedO3YvMI/5VrVnZM6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10188

SGkgRnJlZHJpaywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmVk
cmlrIE0gT2xzc29uIDxmcmVkcmlrLm0ub2xzc29uQGF4aXMuY29tPg0KPiBTZW50OiBGcmlkYXks
IERlY2VtYmVyIDE5LCAyMDI1IDk6MTEgUE0NCj4gVG86IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtlcm5lbC5v
cmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29s
ZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBpd2FtYXRzdSBub2J1aGlybyjlsqnmnb4g5L+h
5rSLIOKWoe+8pO+8qe+8tO+8o+KXi++8o++8sO+8tCkNCj4gPG5vYnVoaXJvLml3YW1hdHN1Lng5
MEBtYWlsLnRvc2hpYmE+DQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRnJl
ZHJpayBNIE9sc3NvbiA8ZnJlZHJpay5tLm9sc3NvbkBheGlzLmNvbT47DQo+IGtlcm5lbEBheGlz
LmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggMS80XSBkdC1iaW5kaW5nczogcnRjOiBkczEzMDc6IEFk
ZCBlcHNvbixyeDg5MDENCj4gDQo+IEFkZCBjb21wYXRpYmxlIHN0cmluZyBlcHNvbixyeDg5MDEg
Zm9yIHRoZSBFcHNvbiBSWDg5MDFDRSBSVEMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmVkcmlr
IE0gT2xzc29uIDxmcmVkcmlrLm0ub2xzc29uQGF4aXMuY29tPg0KDQpSZXZpZXdlZC1ieTogTm9i
dWhpcm8gSXdhbWF0c3UgPG5vYnVoaXJvMS5pd2FtYXRzdUBtYWlsLnRvc2hpYmE+DQoNCkJlc3Qg
cmVnYXJkcywNCiAgTm9idWhpcm8NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcnRjL3J0Yy1kczEzMDcueWFtbCB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3J0Yy9ydGMtZHMxMzA3LnlhbWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcnRjL3J0Yy1kczEzMDcueWFtbA0KPiBpbmRleCA5OGQxMGU2ODAxNDQuLjli
Mjc5NjgwNGYwNyAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9ydGMtZHMxMzA3LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3J0Yy9ydGMtZHMxMzA3LnlhbWwNCj4gQEAgLTMxLDYgKzMxLDcgQEAgcHJvcGVy
dGllczoNCj4gICAgICAgICAgICAtIGVwc29uLHJ4ODAyNQ0KPiAgICAgICAgICAgIC0gaXNpbCxp
c2wxMjA1Nw0KPiAgICAgICAgICAgIC0gZXBzb24scng4MTMwDQo+ICsgICAgICAgICAgLSBlcHNv
bixyeDg5MDENCj4gDQo+ICAgICAgICAtIGl0ZW1zOg0KPiAgICAgICAgICAgIC0gZW51bToNCj4g
DQo+IC0tDQo+IDIuNDMuMA0KDQo=


