Return-Path: <linux-rtc+bounces-5610-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8FCDB5CD
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Dec 2025 06:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A52D3021755
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Dec 2025 05:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CEB329E56;
	Wed, 24 Dec 2025 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b="KTusMRuo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1120.securemx.jp [210.130.202.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817E5280CE5;
	Wed, 24 Dec 2025 05:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766552751; cv=fail; b=GngCdRZgMNPnht76cnyLEtOk4gGOj7woexdInkXVxq9M44dlr9F5uN2EWD+MjuUf/V6uB2twsgMLjnA3IwoKBUBzEcl2huFCMDzV4AdD7sYb43HQaoAEvEGC8tJNGAI0hEuC6IkHRiI6HsjF5fX1y1NJre+mN/FVmAl6T9RZhNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766552751; c=relaxed/simple;
	bh=o50p29JcRxkm49DAdVdSGjTbTqTgfzLmM7nFjSsvflM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j5oynjfhOK6ZFdhBJ1lgwfI4LrSJpRotEk2+f2XpwkQ+NWHoMYSXTGQ+6TDNxCn4xTQ4z3Se8s2hkGVB6rbH49pzYIbgRi5VkN3zWgaM1Qw9712sV+gvsbrFVXGPj0RCqUKHN0/dr1/LMTxABQzBpRI44F6UpnRkPPnhMVmhloo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba; spf=pass smtp.mailfrom=mail.toshiba; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b=KTusMRuo; arc=fail smtp.client-ip=210.130.202.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro.iwamatsu.x90@mail.toshiba;
	s=key1.smx;t=1766552734;x=1767762334;bh=o50p29JcRxkm49DAdVdSGjTbTqTgfzLmM7nFj
	SsvflM=;b=KTusMRuorBrno52LcWA14UUZNAcpjwK/4bEcE14ljNQDrqUn8x2abf/X2BDV0t1v1R6
	MBEEQ/289Q3CLJrnF71UIkEQwZpmfQBrmVgJ8N4mPMVFyM1Y3nG1M6ZMkEyMSgLEHNhVdIGCvSPZV
	TrhV25OUFrvltKeeuctM6eQV85RHZgqqaioyoUIAzjxF1P9D3VeJtHCJOUKfiZ7y23+auMESRuuuw
	7Sy3SclMPSPlvrw+uj88YraBQvzo1Ya3jTKLUZBAovbIPgFIHanvaDi7dHg4up0k36PvFOZqVnDxD
	CQvrI+Hmrse1a/JYQ8/3cd0e1fyL8t45Qvkb9kbhIsBQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 5BO55Yga3031793; Wed, 24 Dec 2025 14:05:34 +0900
X-Iguazu-Qid: 2rWgP4I50cWdc5Iu9p
X-Iguazu-QSIG: v=2; s=0; t=1766552733; q=2rWgP4I50cWdc5Iu9p; m=eh3AMTrNL2/G0HXOSc90hE+ADLg26GiTq67yGVT9XiE=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4dbfvw6QjWz4vyk; Wed, 24 Dec 2025 14:05:32 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deSlHZlGAoZJEG5HQfIaaQYJKyOflsjIsmlWke7a9ns1tJgGeHvvHYW8p/b85Oi9S/oqL6Rlu7JTazeT6eTzAVNModakW6CLbA/5C4zIKPrr01BXKe59SLxFxy/b8yFvpSJW8ubGVRDmG394FqOUkbgCl9XeD1CGPrPM713sIWioXTwx+WexWRwzvCtCwi+GmfzuCeXsg4Yem81Vln33uaMlnJEme2FDOaAb5hNloNJJQdVZa62J8cCD/P+NvrLxzedP//22SNXk0g71r5OD4slg6nqCc5zf0+sMALUvd+iO4H99C5Mm/TBP6y7YksVIJPkJbOrgLMBCZxko+dmacg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o50p29JcRxkm49DAdVdSGjTbTqTgfzLmM7nFjSsvflM=;
 b=koxhd+T+G3+X1BsYbY3ndqfDFkuUhda/nn0fGh0Q3FGvCsMdaTtIcFEZQAWjRretrX+bS2T92M9H3mF534sg89wB91LfCHOTZm1ka23TQtTVbrYUoySwSZoyQhjlSaOIwWFQO/nGGCxgHdh0257p1qGINzFv1MNdgCIYVu9daV5Def66WxvMxYrr5+aWwpLjr0QoqvMb9ufnAFFbSkW598pvSSmBfZuf/try1myNMGR8rJvxtE86pQCUkVE5BmAPZGySDvMVav9xHakA0m8Q9lBxoTBIosOKZ7jHtDa+nojJHMshBUwtwF/oWfNt2y00lsNHVQlTcGF+r7CGBXhhdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <fredrik.m.olsson@axis.com>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: RE: [PATCH 3/4] rtc: ds1307: Add Driver for Epson RX8901CE
Thread-Topic: [PATCH 3/4] rtc: ds1307: Add Driver for Epson RX8901CE
Thread-Index: AQHccOCTncu71pKck0O7zFH31AlijLUwQ+tQ
Date: Wed, 24 Dec 2025 05:05:30 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY7PR01MB14818A0C465ABB9E20734893FCDB2A@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-3-b13f346ebe93@axis.com>
In-Reply-To: <20251219-ds1307-rx8901-add-v1-3-b13f346ebe93@axis.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|TY3PR01MB10188:EE_
x-ms-office365-filtering-correlation-id: a9aa3c16-b8aa-40d2-2a52-08de42aa0f77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RDQ4REcxNDc4Vkw5UTRDVEZhTldXNUF6MnRqWVBFdFJhUnIwSVN1N0NEMGR3?=
 =?utf-8?B?U0Z3Y2FIb3UrUXlmUmNDZ3k4Z202L2ZJRE9pNm5MYWJWL1RQTldNZTNFcHpl?=
 =?utf-8?B?Q3ZieldOeW83bys4NndnTVcvRVhDa0pHWGdSandHdWoycjBVUWpGWk4vY1ZD?=
 =?utf-8?B?dEp1Q0xldTlxMDhucWEzTGdHN3NLRUhMeWpVLzJZakRFT1BVNk5lSXVtbnIv?=
 =?utf-8?B?Q2ZXQVFOZkRpV2U5MnZDVEpWUjd5MXV6dDNYYmUvY0NvZlhRZzN6SnpxZHFB?=
 =?utf-8?B?RDBxL0QrTjRYL1ZMMW9HaWNJYy8rQmxQTkRMZ3oxbTNEMVdDbDhNVTR0RGlm?=
 =?utf-8?B?RFJOVndpelcxMFFoQkpaSEhqRGk4WGwwdkw3K1VxOFVDMllRMlNmUjRQWGo1?=
 =?utf-8?B?T0tJeHpCeEVBVFIwblp6STBJVThFWGhJZ0lYSitqQ1BreU8wQ2NJTnhvVzhV?=
 =?utf-8?B?djU3UDc5c1F5bW1zR1grb0dpK25xZHdJNU9DYXhRVisyVG5wUDVaLzhuK2c3?=
 =?utf-8?B?Wm4zK3pMMjJPT1FpMXljTG8rMGdsb0FMYWkyeGdRMEY3SXExNWNKUUcxOGxi?=
 =?utf-8?B?allLcmFCMlJveExoL2FUVWxwK2hEeTliV1hJK05mWnBaVFJwVDk1TVJvRVVX?=
 =?utf-8?B?bTB0WE1kME1sa0l2N0w3UGYzSlNNM1cyellWcTBJVHVDMS81V0puQmVBNDc1?=
 =?utf-8?B?eXNQelVTczFCMGJJU1duY1dod0lIcThtSEgzUU81a3p3ZnNIdHFLYTVjT1h1?=
 =?utf-8?B?SFVaaFhhUDhRQmRrdXNwdmNkU3FCdUE1c24rYllubXZ2Y01rUWhuMzVldDRS?=
 =?utf-8?B?c1ZPb0oydXVqZzRudHB4amxOTE5BV1FxSHhpSEdGUGx2MjhHcjlnZEp4Y25k?=
 =?utf-8?B?ajYzSFNKRXNwK0E5MEdleG9BN0xCZE9JYzdhd1oveWZPekV1N1Z0SHJ3aEZX?=
 =?utf-8?B?dHR6eUVUbFZJdHFkT1ljUmEwVFIyUTg5RVhPRmlramZVYkdXZjAwNzJ5RVA4?=
 =?utf-8?B?UnFyR0FnU3dkbmdFMTV3TFo4WXphZTVSZXlZTzFwTXZSb3FPK1dFVVI3OVBu?=
 =?utf-8?B?OFcwY0NFQW5WNUNOaXlDTW9kK20yMzErZE93ZTJoQkc5ZUg2N296WVFDQzVM?=
 =?utf-8?B?RHVOR3h1aEp3Mzg5WE9haVVMNEplaTRZMjhhRSt2ekY2bWhMSnZDcGtHQy9h?=
 =?utf-8?B?dU1TZm0wR1BqNmd4R3JFcWp1dUFMVm95T3c1RmZ0WEtiZHRHVG9KNzNoZTV0?=
 =?utf-8?B?Rlc5a0NxOWZJMGM5UExsNmdPOFBoS2V0K1paeVNjbnRFRXpHK3BKZEg0R3pI?=
 =?utf-8?B?Ulk1SjUzV29mL1o4SnJESFNsOGY1WGNyVW5PN1dzazlTNjF1dXJ4SnhMM0xn?=
 =?utf-8?B?MkdaVjJSSkM4enFmdVdxU0FvYXRlZlFtN011MEtwYmZGZ3lmWEVFUlVOb1Rz?=
 =?utf-8?B?MG9RY3ZpSk94L21ZSDNGZVIvcXpiQjNkSzFUVy9KV2t0VFQ4aWVuSWNQWFVv?=
 =?utf-8?B?M2d1R240VnZoeWg0QXBmbEtRTkJwdU1LSkVIcFptNXNETVQ2QlhXTnJtU25B?=
 =?utf-8?B?RmgxT2xvVkVVeWdES29uSnlHWitHc0RCMzdZczNkT1NEYWhjTm92amNiTGlE?=
 =?utf-8?B?M3puOXdGcUdhMFBFMGNXV1p2Lzl0VW5iOXMxTzY1QjVJUlBvU3hNY09pNUNT?=
 =?utf-8?B?aVoxT3hBaXhKLzFEclBYVit3NmJWVW9DcjBkL0ZmNHlCaExvdTBzSVIzK3Fo?=
 =?utf-8?B?R3llNUNrNFNhRkViNktGVWxTZ0o5ZFhzMHZscXB6N1J5UFIrOHZDWHFLbXF3?=
 =?utf-8?B?VWtBbHR5Rk1IRXZVVjdYaGJ3QXBPL1dmbEp2TU5HKzNLaytEbmhVVG9YUllX?=
 =?utf-8?B?QWp4cUEvZnJqN1c4SXUwNlFUREdXVFZKU1pFWHdPYVpNcjJGblBoYkttSFJO?=
 =?utf-8?B?WHJsbURvTU16V0UzeGhyVEt5cURJMitPcnlvOTdSSnJkRkszOVRQR1dLeE11?=
 =?utf-8?B?SjRnR2lTUi9rKzdYMzZlNHV4VEkvbmtVTm1MMXFhcWUyN3o5am1OekV6TUVZ?=
 =?utf-8?Q?agJg6v?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WTNmNWY4Y1JrdjF6OTBtaFNLbEdtdCszMmdDdXVOUzB3Nks0dDNlK1RMRHZN?=
 =?utf-8?B?QzR6bjVpZWQwVUxheEV1UVlCZTEyTnc1WnNSeVl1ZUNYUG5EOXVNQlVhQklF?=
 =?utf-8?B?UWw2aHk2UjJZRXFyZHV4bUg1dURMWjJObEFneElzTmtZRm1vZVZmK1k4dFdQ?=
 =?utf-8?B?bkVsM3VmYThUNUFKWjFLQktUdnYwdzZ6aWJraC9rcVFMVWx0cWptdi9vSEVr?=
 =?utf-8?B?VkxBaXdIWm12V0NnK2lacWNpV0tFemc4czJWTGswenllSWJFdG1abkRSRitT?=
 =?utf-8?B?UHUwN2EySXRGYm5Ed0dUeHZuU2d0UW1jVmtuRDhsNDRrb0dXRmJSOW5UMEpE?=
 =?utf-8?B?SFg5ZysrTVRoZFVGOEV0UXY3Z1FYdXNlUWxqMTZSNkdhZU4vMWxXREpJcEFP?=
 =?utf-8?B?QXcrZ2xvYWlVYTE2Y1JzUDhSUmpRSDNieGVDbC9rYkZ3VmgyU1czUW5rRi9y?=
 =?utf-8?B?OUZndkVSQ3c2RDQ3LzkwRXhzSVZ2c1NIbDR3ZUdtSldQTW9KOWNvUEt2RE9L?=
 =?utf-8?B?bi9DMlVkeXVsekxEaFZRb2loMFlLT2JHY1ZqemVTVlZSaDdyeVV5QmROTHVq?=
 =?utf-8?B?MFBxSmgyaThveTkyWkZRelYzT091amtEV0k4azA0VWlLYWdwZml0bmVIV3J6?=
 =?utf-8?B?bzNvMU93UTZ3VDRUODltV2VIcCtZZjZ2ZDVNbDJ3Zno4QnQxV2RGVW1xVnQ5?=
 =?utf-8?B?bklWWklkZmNyUGpZYkdZWG96Ylc2ckFUZHFoUkZqbGZHRDZrTlJIc1RpRnkw?=
 =?utf-8?B?bXFicjRqeVh5a2pvWWdXdEZ2QjByLzhITlBNTjhEaXJoNElnd0N3a1I5RzRK?=
 =?utf-8?B?eUFsQytkS29tY204bzNSbEQ4TDZiQ2NJZzljYlRMUEZCY0M2M2tySWZGYkxH?=
 =?utf-8?B?MUNrOVVOekdqL3N4NUtUYThwUExxWFFTS2lmMEx2VTE0ald4QW05Yk5PV2Zq?=
 =?utf-8?B?VTA3TkxyYzdPaEhpQnZGTWhhYkhnaENnOEY2Y2xqTnRvaTR4VEpyRFB4dXNW?=
 =?utf-8?B?Y1EySzJ4QnUxT2pmQ2d5THRCb2JNK2EzUkRqRkVwclhKcDdzQVJKTStwNzIz?=
 =?utf-8?B?LzhkVmNpTVJ0Yk42OEpyZWRJUjUwaTdTZ1ZFdnRRNTVmb2RVRndGVU8yWndh?=
 =?utf-8?B?Zjh2dlNBWHlyQi9wUFFDZUtOZnEvV3IxdDRYOEdDZzFhSEFTa0E1ZlNubzlr?=
 =?utf-8?B?VndsWjNQRXBpd0ZBd0Q5Wi9kU1FLMWVwR25HdWxaUER0bHNVWWdPM2RGT21I?=
 =?utf-8?B?NmhOVzc0NDh4aGV4L2NQSXRtdDdMeVd2dUEzbC8wL3JzQ1hQWWRwRHhDbmhG?=
 =?utf-8?B?TTF6eHFGNGRLbk9JSWcwZXgyLzZycmlFdmVVMC81MUM5K0J0M0ZZTDJXVk1H?=
 =?utf-8?B?ZUxIN1U3MGlDdllKZHhLa2JwMC9HMEI2OWNKc0V0S0x0MTdMSW5kK0lRcFpT?=
 =?utf-8?B?c2Y4L2hwT2lMNEw1NmRiSmV4TU5GMENhRGtyU3MyMmVFcnBDejJoVi8vVHcy?=
 =?utf-8?B?RGV5WEVYeFZnNWhEZ082TzdYQ0M5Mk81c0d1ays3SmJ2c0RvU1ZJd3Y3V05G?=
 =?utf-8?B?Z0hYSDRkZENpRmFlL0ZEQzN5SVQxS0kvR0lCejlrRkxpbFNhSnh2bFVCM1VE?=
 =?utf-8?B?eFBWS2Zpb0ZtR0lMM3NpdUJYTWZjRGxlOEYzRWFjemxHaUNpeVB5cCtHZUZE?=
 =?utf-8?B?am9hcWNYbkZyd0YvS0ZkbjdtV0d1OEZtd1NUOGVtVlVHd1hwVjJVNWhwS2tL?=
 =?utf-8?B?YTFqblc0elRTQjFmK0dKK1RKa00zU0kwVVRRU0dUREFFY1ZIMjNFT2xjQWhm?=
 =?utf-8?B?bzYxQlp6emFTTWl5MER6cDIveDF5a3ZVajZrb2cvVXdNSE1FU0JIazIrakZj?=
 =?utf-8?B?NXZuekxKWmh6RnhYS3JsY2tBM3h6bVJJOVlwbklheTZqc3BDeWhvNCtoTEZs?=
 =?utf-8?B?TndZczZxcWZwVWR0M3JCOVpVc3p4cmpzN0FRQVNIMTkvNmtyYkFuRWV6UmUy?=
 =?utf-8?B?c2phN2pmWElVaFhzQms1dStVTUNYajNkQXBmSlJJeUo5VHgxa3RIT2tJaktO?=
 =?utf-8?B?RUJ5OGtRZ3Y5NHhnRTk5VTY2Rm9DV1JiTHlyTlJqdFhldWFKSjBROFVZWGY3?=
 =?utf-8?B?bWh1WlVYRFFrS0lHN2dBR25maFpqVk1zNFMwK1c1d1hKOTVSaGZDeUtiOHFn?=
 =?utf-8?B?cHlISU1oamUrUyt2MUtwSEI5WVdsMnU3ZlNBZzVOMndmOExCUlNOLytiVzNH?=
 =?utf-8?B?UzNMTi9uV01wTFJEaGNKaDRXZGRMTzJBV1FXNzlvR1VDQUZWU3RFNHZ3SFZQ?=
 =?utf-8?B?MUpqMitESzFJSjVrV1laRkgxa2J2b0lSVS9Ec1U1RmN4bS9EZFgrbkVaanh2?=
 =?utf-8?Q?VQgw96NJZ4g+jgUY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a9aa3c16-b8aa-40d2-2a52-08de42aa0f77
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 05:05:30.3935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hs3yakW4VXprOm2wO2s+NicoNs3u79gl5nMsCWfZjPzg4wb/Xw6f2cELTm4qalvrVP9fWGqa99zPbRdwzpHLJK9M4JJq7eRzTOVNPM3Gq7sYJX6GDIoHFhZ9fg7dluJd
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
LmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggMy80XSBydGM6IGRzMTMwNzogQWRkIERyaXZlciBmb3Ig
RXBzb24gUlg4OTAxQ0UNCj4gDQo+IEFkZHMgU3VwcG9ydCBmb3I6DQo+IC0gUmVhZGluZyBhbmQg
d3JpdGluZyB0aW1lIHRvL2Zyb20gdGhlIFJUQy4NCj4gLSBTd2l0Y2hpbmcgdG8gYmFja3VwIGJh
dHRlcnkgc3VwcGx5IHdoZW4gcHJpbWFyeSBzdXBwbHkgZGlzYXBwZWFycy4NCj4gLSBPcHRpb25h
bGx5IGVuYWJsaW5nIGJhdHRlcnkgY2hhcmdpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBGcmVk
cmlrIE0gT2xzc29uIDxmcmVkcmlrLm0ub2xzc29uQGF4aXMuY29tPg0KDQpSZXZpZXdlZC1ieTog
Tm9idWhpcm8gSXdhbWF0c3UgPG5vYnVoaXJvLml3YW1hdHN1Lng5MEBtYWlsLnRvc2hpYmE+DQoN
CkJlc3QgcmVnYXJkcywNCiAgTm9idWhpcm8NCg0KPiAtLS0NCj4gIGRyaXZlcnMvcnRjL3J0Yy1k
czEzMDcuYyB8IDYyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWRzMTMwNy5jIGIvZHJpdmVy
cy9ydGMvcnRjLWRzMTMwNy5jIGluZGV4DQo+IGJmNDJjMjUwZWE3ZC4uOTlkOTVlNTIwMTA4IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtZHMxMzA3LmMNCj4gKysrIGIvZHJpdmVycy9y
dGMvcnRjLWRzMTMwNy5jDQo+IEBAIC00OCw2ICs0OCw3IEBAIGVudW0gZHNfdHlwZSB7DQo+ICAJ
bWNwNzk0eHgsDQo+ICAJcnhfODAyNSwNCj4gIAlyeF84MTMwLA0KPiArCXJ4Xzg5MDEsDQo+ICAJ
bGFzdF9kc190eXBlIC8qIGFsd2F5cyBsYXN0ICovDQo+ICAJLyogcnM1YzM3MiB0b28/ICBkaWZm
ZXJlbnQgYWRkcmVzcy4uLiAqLyAgfTsgQEAgLTEyOSw2ICsxMzAsMTIgQEANCj4gZW51bSBkc190
eXBlIHsNCj4gICNkZWZpbmUgUlg4MTMwX1JFR19DT05UUk9MMV9JTklFTglCSVQoNCkNCj4gICNk
ZWZpbmUgUlg4MTMwX1JFR19DT05UUk9MMV9DSEdFTglCSVQoNSkNCj4gDQo+ICsjZGVmaW5lIFJY
ODkwMV9SRUdfSU5URgkJCTB4MGUNCj4gKyNkZWZpbmUgUlg4OTAxX1JFR19JTlRGX1ZMRgkJQklU
KDEpDQo+ICsjZGVmaW5lIFJYODkwMV9SRUdfUFdTV19DRkcJCTB4MzcNCj4gKyNkZWZpbmUgUlg4
OTAxX1JFR19QV1NXX0NGR19JTklFTglCSVQoNikNCj4gKyNkZWZpbmUgUlg4OTAxX1JFR19QV1NX
X0NGR19DSEdFTglCSVQoNykNCj4gKw0KPiAgI2RlZmluZSBNQ1A3OTRYWF9SRUdfQ09OVFJPTAkJ
MHgwNw0KPiAgIwlkZWZpbmUgTUNQNzk0WFhfQklUX0FMTTBfRU4JMHgxMA0KPiAgIwlkZWZpbmUg
TUNQNzk0WFhfQklUX0FMTTFfRU4JMHgyMA0KPiBAQCAtMjI2LDYgKzIzMywxOSBAQCBzdGF0aWMg
aW50IGRzMTMwN19nZXRfdGltZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBydGNfdGlt
ZSAqdCkNCj4gIAkJCWRldl93YXJuX29uY2UoZGV2LCAib3NjaWxsYXRvciBmYWlsZWQsIHNldCB0
aW1lIVxuIik7DQo+ICAJCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAkJfQ0KPiArCX0gZWxzZSBpZiAo
ZHMxMzA3LT50eXBlID09IHJ4Xzg5MDEpIHsNCj4gKwkJdW5zaWduZWQgaW50IHJlZ2ZsYWc7DQo+
ICsNCj4gKwkJcmV0ID0gcmVnbWFwX3JlYWQoZHMxMzA3LT5yZWdtYXAsIFJYODkwMV9SRUdfSU5U
RiwNCj4gJnJlZ2ZsYWcpOw0KPiArCQlpZiAocmV0KSB7DQo+ICsJCQlkZXZfZXJyKGRldiwgIiVz
IGVycm9yICVkXG4iLCAicmVhZCIsIHJldCk7DQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiArCQl9DQo+
ICsNCj4gKwkJaWYgKHJlZ2ZsYWcgJiBSWDg5MDFfUkVHX0lOVEZfVkxGKSB7DQo+ICsJCQlkZXZf
d2Fybl9vbmNlKGRldiwgIm9zY2lsbGF0b3IgZmFpbGVkLCBzZXQgdGltZSFcbiIpOw0KPiArCQkJ
cmV0dXJuIC1FSU5WQUw7DQo+ICsJCX0NCj4gIAl9DQo+IA0KPiAgCS8qIHJlYWQgdGhlIFJUQyBk
YXRlIGFuZCB0aW1lIHJlZ2lzdGVycyBhbGwgYXQgb25jZSAqLyBAQCAtMzA3LDcNCj4gKzMyNyw3
IEBAIHN0YXRpYyBpbnQgZHMxMzA3X2dldF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IHJ0Y190aW1lICp0KQ0KPiAgCXRtcCA9IHJlZ3NbRFMxMzA3X1JFR19IT1VSXSAmIDB4M2Y7DQo+
ICAJdC0+dG1faG91ciA9IGJjZDJiaW4odG1wKTsNCj4gIAkvKiByeDgxMzAgaXMgYml0IHBvc2l0
aW9uLCBub3QgQkNEICovDQo+IC0JaWYgKGRzMTMwNy0+dHlwZSA9PSByeF84MTMwKQ0KPiArCWlm
IChkczEzMDctPnR5cGUgPT0gcnhfODEzMCB8fCBkczEzMDctPnR5cGUgPT0gcnhfODkwMSkNCj4g
IAkJdC0+dG1fd2RheSA9IGZscyhyZWdzW0RTMTMwN19SRUdfV0RBWV0gJiAweDdmKSAtIDE7DQo+
ICAJZWxzZQ0KPiAgCQl0LT50bV93ZGF5ID0gYmNkMmJpbihyZWdzW0RTMTMwN19SRUdfV0RBWV0g
JiAweDA3KSAtIDE7DQo+IEBAIC0zNTgsNyArMzc4LDcgQEAgc3RhdGljIGludCBkczEzMDdfc2V0
X3RpbWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QNCj4gcnRjX3RpbWUgKnQpDQo+ICAJcmVn
c1tEUzEzMDdfUkVHX01JTl0gPSBiaW4yYmNkKHQtPnRtX21pbik7DQo+ICAJcmVnc1tEUzEzMDdf
UkVHX0hPVVJdID0gYmluMmJjZCh0LT50bV9ob3VyKTsNCj4gIAkvKiByeDgxMzAgaXMgYml0IHBv
c2l0aW9uLCBub3QgQkNEICovDQo+IC0JaWYgKGRzMTMwNy0+dHlwZSA9PSByeF84MTMwKQ0KPiAr
CWlmIChkczEzMDctPnR5cGUgPT0gcnhfODEzMCB8fCBkczEzMDctPnR5cGUgPT0gcnhfODkwMSkN
Cj4gIAkJcmVnc1tEUzEzMDdfUkVHX1dEQVldID0gMSA8PCB0LT50bV93ZGF5Ow0KPiAgCWVsc2UN
Cj4gIAkJcmVnc1tEUzEzMDdfUkVHX1dEQVldID0gYmluMmJjZCh0LT50bV93ZGF5ICsgMSk7IEBA
DQo+IC00MjIsNiArNDQyLDE3IEBAIHN0YXRpYyBpbnQgZHMxMzA3X3NldF90aW1lKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0DQo+IHJ0Y190aW1lICp0KQ0KPiAgCQkJZGV2X2VycihkZXYsICIl
cyBlcnJvciAlZFxuIiwgIndyaXRlIiwgcmVzdWx0KTsNCj4gIAkJCXJldHVybiByZXN1bHQ7DQo+
ICAJCX0NCj4gKwl9IGVsc2UgaWYgKGRzMTMwNy0+dHlwZSA9PSByeF84OTAxKSB7DQo+ICsJCS8q
DQo+ICsJCSAqIGNsZWFyIFZvbHRhZ2UgTG9zcyBGbGFnIGFzIGRhdGEgaXMgYXZhaWxhYmxlIG5v
dyAod3JpdGluZyAxDQo+ICsJCSAqIHRvIHRoZSBvdGhlciBiaXRzIGluIHRoZSBJTlRGIHJlZ2lz
dGVyIGhhcyBubyBlZmZlY3QpDQo+ICsJCSAqLw0KPiArCQlyZXN1bHQgPSByZWdtYXBfd3JpdGUo
ZHMxMzA3LT5yZWdtYXAsIFJYODkwMV9SRUdfSU5URiwNCj4gKwkJCQkgICAgICAweGZmIF4gUlg4
OTAxX1JFR19JTlRGX1ZMRik7DQo+ICsJCWlmIChyZXN1bHQpIHsNCj4gKwkJCWRldl9lcnIoZGV2
LCAiJXMgZXJyb3IgJWRcbiIsICJ3cml0ZSIsIHJlc3VsdCk7DQo+ICsJCQlyZXR1cm4gcmVzdWx0
Ow0KPiArCQl9DQo+ICAJfQ0KPiANCj4gIAlyZXR1cm4gMDsNCj4gQEAgLTU2OCw2ICs1OTksMTcg
QEAgc3RhdGljIHU4IGRvX3RyaWNrbGVfc2V0dXBfcng4MTMwKHN0cnVjdCBkczEzMDcNCj4gKmRz
MTMwNywgdTMyIG9obXMsIGJvb2wgZGlvZGUpDQo+ICAJcmV0dXJuIHNldHVwOw0KPiAgfQ0KPiAN
Cj4gK3N0YXRpYyB1OCBkb190cmlja2xlX3NldHVwX3J4ODkwMShzdHJ1Y3QgZHMxMzA3ICpkczEz
MDcsIHUzMiBvaG1zLCBib29sDQo+ICtkaW9kZSkgew0KPiArCS8qIG1ha2Ugc3VyZSB0aGF0IHRo
ZSBiYWNrdXAgYmF0dGVyeSBpcyBlbmFibGVkICovDQo+ICsJdTggc2V0dXAgPSBSWDg5MDFfUkVH
X1BXU1dfQ0ZHX0lOSUVOOw0KPiArDQo+ICsJaWYgKGRpb2RlKQ0KPiArCQlzZXR1cCB8PSBSWDg5
MDFfUkVHX1BXU1dfQ0ZHX0NIR0VOOw0KPiArDQo+ICsJcmV0dXJuIHNldHVwOw0KPiArfQ0KPiAr
DQo+ICBzdGF0aWMgaXJxcmV0dXJuX3Qgcng4MTMwX2lycShpbnQgaXJxLCB2b2lkICpkZXZfaWQp
ICB7DQo+ICAJc3RydWN0IGRzMTMwNyAgICAgICAgICAgKmRzMTMwNyA9IGRldl9pZDsNCj4gQEAg
LTk2MCw2ICsxMDAyLDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcnRjX2NsYXNzX29wcyByeDgx
MzBfcnRjX29wcyA9IHsNCj4gIAkuYWxhcm1faXJxX2VuYWJsZSA9IHJ4ODEzMF9hbGFybV9pcnFf
ZW5hYmxlLCAgfTsNCj4gDQo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ0Y19jbGFzc19vcHMgcng4
OTAxX3J0Y19vcHMgPSB7DQo+ICsJLnJlYWRfdGltZSAgICAgID0gZHMxMzA3X2dldF90aW1lLA0K
PiArCS5zZXRfdGltZSAgICAgICA9IGRzMTMwN19zZXRfdGltZSwNCj4gK307DQo+ICsNCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcnRjX2NsYXNzX29wcyBtY3A3OTR4eF9ydGNfb3BzID0gew0KPiAg
CS5yZWFkX3RpbWUgICAgICA9IGRzMTMwN19nZXRfdGltZSwNCj4gIAkuc2V0X3RpbWUgICAgICAg
PSBkczEzMDdfc2V0X3RpbWUsDQo+IEBAIC0xMDQwLDYgKzEwODcsMTIgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBjaGlwX2Rlc2MgY2hpcHNbbGFzdF9kc190eXBlXSA9IHsNCj4gIAkJLnRyaWNrbGVf
Y2hhcmdlcl9yZWcgPSBSWDgxMzBfUkVHX0NPTlRST0wxLA0KPiAgCQkuZG9fdHJpY2tsZV9zZXR1
cCA9ICZkb190cmlja2xlX3NldHVwX3J4ODEzMCwNCj4gIAl9LA0KPiArCVtyeF84OTAxXSA9IHsN
Cj4gKwkJLm9mZnNldAkJPSAweDAsDQo+ICsJCS5ydGNfb3BzID0gJnJ4ODkwMV9ydGNfb3BzLA0K
PiArCQkudHJpY2tsZV9jaGFyZ2VyX3JlZyA9IFJYODkwMV9SRUdfUFdTV19DRkcsDQo+ICsJCS5k
b190cmlja2xlX3NldHVwID0gJmRvX3RyaWNrbGVfc2V0dXBfcng4OTAxLA0KPiArCX0sDQo+ICAJ
W200MXQwXSA9IHsNCj4gIAkJLnJ0Y19vcHMJPSAmbTQxdHh4X3J0Y19vcHMsDQo+ICAJfSwNCj4g
QEAgLTEwODEsNiArMTEzNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBk
czEzMDdfaWRbXSA9IHsNCj4gIAl7ICJyeDgwMjUiLCByeF84MDI1IH0sDQo+ICAJeyAiaXNsMTIw
NTciLCBkc18xMzM3IH0sDQo+ICAJeyAicng4MTMwIiwgcnhfODEzMCB9LA0KPiArCXsgInJ4ODkw
MSIsIHJ4Xzg5MDEgfSwNCj4gIAl7IH0NCj4gIH07DQo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKGky
YywgZHMxMzA3X2lkKTsNCj4gQEAgLTExNTgsNiArMTIxMiwxMCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBkczEzMDdfb2ZfbWF0Y2hbXQ0KPiA9IHsNCj4gIAkJLmNvbXBhdGli
bGUgPSAiZXBzb24scng4MTMwIiwNCj4gIAkJLmRhdGEgPSAodm9pZCAqKXJ4XzgxMzANCj4gIAl9
LA0KPiArCXsNCj4gKwkJLmNvbXBhdGlibGUgPSAiZXBzb24scng4OTAxIiwNCj4gKwkJLmRhdGEg
PSAodm9pZCAqKXJ4Xzg5MDENCj4gKwl9LA0KPiAgCXsgfQ0KPiAgfTsNCj4gIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIGRzMTMwN19vZl9tYXRjaCk7DQo+IA0KPiAtLQ0KPiAyLjQzLjANCg0K


