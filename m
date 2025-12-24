Return-Path: <linux-rtc+bounces-5612-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E50CDB857
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Dec 2025 07:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7AC23009F85
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Dec 2025 06:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE4B30B50C;
	Wed, 24 Dec 2025 06:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b="C7tXz6wv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1121.securemx.jp [210.130.202.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7957C2ED873;
	Wed, 24 Dec 2025 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766558104; cv=fail; b=B8LW7JqWKMYlOQjHExqXUs9fFR1Y367CAW4PchW1E/HAIleHdjBj8PX2iVEl3hiXyj3qR1/j+yuNh8Y8Im5MH2wfHDntXx3CSb3B224Cxmez2jAhdDHiuOiqzzvJzGPXN2gaZYmu2ZJJuJM102Ko0RnSSRdO6GhkRYXv5AVAhg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766558104; c=relaxed/simple;
	bh=ewISne9/Ht2hAlkTJTuAONTt/znDJBiK6+PreMYvp8o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L4yfMH8cqzM6ZNnBViToXjtAlxLDe+ZBUL8GtAMlYa7n3mECjrvKCRFLc6XnizZc37ymZawurI1b8/q+gXF+nKSpyCPQjdRnATMcq7YcgwcCMWDPf8XqPR56/26z1hMs2i9YLFf7H0c/+WGjs2Xt1Ub8qzHpGYUSCy3w1NkX6h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba; spf=pass smtp.mailfrom=mail.toshiba; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b=C7tXz6wv; arc=fail smtp.client-ip=210.130.202.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1121) id 5BO572fS859870; Wed, 24 Dec 2025 14:07:02 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro.iwamatsu.x90@mail.toshiba;
	s=key1.smx;t=1766552789;x=1767762389;bh=ewISne9/Ht2hAlkTJTuAONTt/znDJBiK6+Pre
	MYvp8o=;b=C7tXz6wvQpmAaJ1apg10B8Aavxhqg9hoZyoVuoJDN3fUW3Gxz6hNBYWkTx2znYHURRL
	BCy4XZ6Sg6SiQOEQF9KENEdf3dWs2XcSQ2oKYgM694dzI+D1I2Diar00OmEn0gDuX3h37d90galXp
	OjDNcY0FfvxeDgXdJt26x0PV5p3w8TNBzdUVPhDIxmWD3Rc8GEtnoiCKccpF7BTbmgIPmJDPWhb5R
	tkj9Ck12rdSWSRxSuXFAW/uPEbS/XhEjyqvidLI+D7zSBNDkIV1LTrkV1KXk+yVp8rwB9IQs/UjgW
	e5J82Q7XyYmqd/C/PPs49yD1Ef+0ShxXytuWIy9cxYxw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 5BO56Tfq957324; Wed, 24 Dec 2025 14:06:29 +0900
X-Iguazu-Qid: 2rWglrLTIzosMK0n0z
X-Iguazu-QSIG: v=2; s=0; t=1766552789; q=2rWglrLTIzosMK0n0z; m=KDV6eJPp16bIc6uSr8/hMGgB9ajSnfFnmEK6ny8Q458=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4dbfx10Vcfz4vym; Wed, 24 Dec 2025 14:06:29 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwYOm8xrZyGC/j9C/5v/+6vXmp2RNCKQX3zBoBVhjCeKs6eSKUTywt5p+H4EkvS/A3vfv9FhGL0CXsC00sBxd1YBF1aOFWYpnm6Tdf3IfSDHWWJpqKRv7Ps1DQqvZhI7I5Fd0EgZjgX226r1LS2sOhEWQMp01lwBi1akieUP3ehh08S4jPuH3oYMUSihdxLgmQgh06d7nuPdCGL2unNaGS70WZ8gZvumyFye20llgfClMREUag8Q8MDa0nzXV6FR6Ojy3Tz1fkjjT/Dn2nfKoKQX+uRVTRaz5fNhMeHO1mE6yleYowNpMDBHWYujBFW6VHsdKlyrjsWEohWSt/Onrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewISne9/Ht2hAlkTJTuAONTt/znDJBiK6+PreMYvp8o=;
 b=aubWnlCeoDwjgxumryeVmYvkDEd9EjbMAWKIkRGn6V9Lyhhd+czV+FA2+S6LnoF+ZSD6pZft5b8I/2THLWIdVM/Etpl+XsWj8o4xLL+DLUQ48YM9uG6MmNeTk2UZgmPYNim1SdVFlvxi+hA59ihEdYzQjQPXQZWdnrC0TAGbu7FkqTHFxv8/PS88l1CMtJz+hW26QsvRvdV+rd04F9iTUe4E33MKwLFZMrRoFMD39FqAfdio58ENZthfU7NMT5oLUt7Hb1XcLkcYZvQ9JPVyYB4ABhTcuvmmwtA7x4jZKyX0EQhEl68qxecRRx9AilJNf5SZS2G7VdB5n0qgumH6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <fredrik.m.olsson@axis.com>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: RE: [PATCH 2/4] rtc: ds1307: Fix off-by-one issue with wday for
 rx8130
Thread-Topic: [PATCH 2/4] rtc: ds1307: Fix off-by-one issue with wday for
 rx8130
Thread-Index: AQHccOCSkzmf1jOF5kuvTua8s/UXu7UwRCIg
Date: Wed, 24 Dec 2025 05:06:24 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY7PR01MB14818A301AD396B57AC28919FCDB2A@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: <20251219-ds1307-rx8901-add-v1-0-b13f346ebe93@axis.com>
 <20251219-ds1307-rx8901-add-v1-2-b13f346ebe93@axis.com>
In-Reply-To: <20251219-ds1307-rx8901-add-v1-2-b13f346ebe93@axis.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|OSZPR01MB8630:EE_
x-ms-office365-filtering-correlation-id: a33fbf1a-bb25-44c0-59fb-08de42aa2fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RXR4L1IvS3dmWHBjd1l6OUN2dGk1MlRMQXd3VjA5U0lZaWwyT0FpMERiaEdM?=
 =?utf-8?B?MmM3YVAwZHZGQzRlcXp5Qkw4VzFVZ3YxUlQwbzk2eE5Xa2xhMms0SFRrSzBp?=
 =?utf-8?B?L1VIZEg0Q2hSVTJpVGJiNVB6R080dVVjcUVac0J4Vk1oSGZadFFrZnZCMGU0?=
 =?utf-8?B?THlWM21mT0R4T0x0ei9lTkp3QkdKR2l5djF4T3ViejFCU0g3dFZxbkVVNmEy?=
 =?utf-8?B?ZDZjOThoUHhDdGE4L2VWRWtPWWU3dlJLL25lY05TYm9CdHR3eXZWUFJZa1la?=
 =?utf-8?B?N1RoWW9lbG9nQnByT0J4VmtNTGFiTGtqUVJMMnJsckJ6V1RPUm9tT1dXM0ph?=
 =?utf-8?B?c2k4TC9VendMTUE2dllyOVpZQ1VWOTNiaEd6MW1IczBNbTN5SWxLb29MMDR0?=
 =?utf-8?B?Q3JtMVRxWHBiZ2VldzB1S1M4b2RVeTJxUEtSSGpWZkN3UTRobExGRDlEZitq?=
 =?utf-8?B?Nkw1WHZnYlRXaTdqMkQrTG5hWkZycHptZEZwSUVYL0FDVkJta21sL1M0TU55?=
 =?utf-8?B?ZFBmdjV4SDd0MWQ2WWMzUGxJTGhjSlVLSmNRU3FnSXZsTkNhZGgvSjRXWWta?=
 =?utf-8?B?UEp0ZXQ3TGJGeVF1ZTl5SFQxdk5ScU5aM2dhczdTbnY1Z0N4bmhOZFFTQlB1?=
 =?utf-8?B?emVoanNUai9wbzB3VGh4RWtEb3J4Mk41Z2crZTBEaFVuR3ZHZldYNklUbkR2?=
 =?utf-8?B?Z2RyM1IrNXlZZkJZcWlzeWF1SGw0QUZRU2VPbVprK0ovY2s3SFY3S1l6WjBU?=
 =?utf-8?B?NGhFTXh0aS9MYy9kZzFJZUFFUGFmVTNFbnYvb2FoVVdVWVMrY0tCeThzRFlk?=
 =?utf-8?B?MURHcnF1QzVYWjJ2ZUpQSUozekIvZUZFYzNuV0ZDQklCUHIvdS9Tbkl5M0pu?=
 =?utf-8?B?eHFhOGdLdy8vb3AwMmFzdzlBSlNTUVlXb3A4bWR2dERuOHY2NE15ZlhhdTM5?=
 =?utf-8?B?Z05aRVhZK3ByWWNZZWtzSFlZcmxSclZlZGFMeTE0Z0tkakY4SWNYVEZXc2hj?=
 =?utf-8?B?bkR2dTFsVG0yQlFMYjFrc0s1S3U4KzlLaWZvVFJSMEYxdFFDakFpZDk3YzZ2?=
 =?utf-8?B?K2pibWZ4RmphNE5KK1RwMnRyMTByQXd4M1JXN2haM1FoREJ0RURaMWxFU290?=
 =?utf-8?B?eTBacllLLysyd1ltNzNqNUlsaVhKdkZFMFZXS3lTZGxYNjE1aEJoSFJrRzdq?=
 =?utf-8?B?azZJUHNQQjhGQ0d6eXNwUS8xRkJsNzF2ZnFHOEVoaDdqOWxybmkwZ2lvWlhM?=
 =?utf-8?B?R21jL0JSMUJicWdsZjB4OG8yZ0pwMks2TFZkV2h0NDE5QWc0bXpZOHh0RE5V?=
 =?utf-8?B?c0p0WnlOQWFndzVMdmN2VFJzei8xdnJiWk4reEtnYXhCNmsrcTlZajdxOExm?=
 =?utf-8?B?eHYxNUhTRTZtMnplTmo5S2VGbE4rbmxIT3hpS3RNQkx0TFZnYnlOSGYrcDdS?=
 =?utf-8?B?bXNyS3c0NjdGN0RjeW1YbE9IcVBFTGxla1JrazJ2TUR2ekpvSysxUkF5TVBJ?=
 =?utf-8?B?aldobHZWMXFLUFdlQ3dwakJ0ZHVqQ3p3ZFc2QzM2UXBveDJNbXZUQ2VsNzRT?=
 =?utf-8?B?aEFiZ0RnOFduN1NRdjdWTkxsZ21HYVREWStKc09ZeUhHTDlYRUNRaTRFSzhC?=
 =?utf-8?B?b2dkNVgzd0tuazBTRUxRb2kzdHp5ZnZwTnZGMHp3ay9BM2M1NmVKVFRVRUFz?=
 =?utf-8?B?bFFGTktrYlIwaG1qWGlKeWJ0SEtyZ0ZKcGJuRW1pOVVLekwvUUI1WjY3cm5o?=
 =?utf-8?B?UUVtSzlZeTdFM0NLK0s0MzhVc2FvRFdFdjhWSWx3U2lveWk1cEFQYlFWNHdM?=
 =?utf-8?B?aXE2U0Q3L2ZzY2NENklZd1BiSmRmaXAvdmkyS29jdVlpcEpXc2RQa0NYRE1P?=
 =?utf-8?B?czdpc2hHSEU0cnVlSlJVQVV5cFJvTHNpM2MxcnloaXdKUFpWUFVkdStDemto?=
 =?utf-8?B?eURYV3g5THFaVmZiaTBzMHhPdGxPaGp3UjBKSjRzVE9rNndZcVNWMGlwNGtt?=
 =?utf-8?B?N3g5NUl5Tm9PL1ZFTlozcmJIUzlTOXVNc0ZUS2dhWHJic1RBK0d2bHZKTmRI?=
 =?utf-8?Q?zcAvPM?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aGd0VzZrcHpoS3I3WUFNSERjWjNaOHhkeksyRVNkSmdXSWU0cmlERmNJc09I?=
 =?utf-8?B?WXI3SGthWldlUXJGSHpjWC92bHRvLzc5TDEwU0FpcEUyclJFbmNuMjhBV2FS?=
 =?utf-8?B?NnZnZWQ4U2pVdnFGN3R2aGMrNWxlK250Mi9EbmpmakcweURrNS9FMmRvMS96?=
 =?utf-8?B?NHYzblUrSFJLcjRIRXFBMkt1UytackliSThQbFp1dXFWazBGaFliMGpDbEtL?=
 =?utf-8?B?bnE1QW1DMUQ4MXc4M1BPdFAxeU53UjR4TThWdktTZVlHd09MYlNSWmJUTXJU?=
 =?utf-8?B?eHIyR3JqaUYxdWMzeHRNSmV4cS9oMEhaQ3ZYYVB5aDN4M3Q0ekZEaFNMZmNw?=
 =?utf-8?B?QVE2c2lhL05lUGlWV3Q4c1doNjEzWTQ4cWQ1bnovQkVlc0swSWVDRXpZTVZF?=
 =?utf-8?B?enVydlFKMzhMOHp4MFZtWHdxREdLT2cwNDEySEVPSXArQTdqeHpKQnYxdFBs?=
 =?utf-8?B?NktVZ2crbXMvVnl2eTMyWU16dzY4blZmVEFVZGtlR3hnOFZaeVp5TUpXem8z?=
 =?utf-8?B?UmpQd2xOZW00VG9MTUwyTlpPQkQ2aUgzbEZnR3h3Z0pPYlRSTCs2TXM5UHBh?=
 =?utf-8?B?d2ZWZ2RRNHpZV0dFWUtRSEUyamtRVlE3Mk43V0pHeVl0Q2FobDF4cXdRSEJI?=
 =?utf-8?B?WEQ0ek1xbGlYQ2hhcEppM1BzWGJQZU5pVnRLeUhQRlVSdG9PU2pSRGNZbVMr?=
 =?utf-8?B?dGpSTVEwNHd2ck9KbW9aSWs3dlpHeHRpbTl3cmlzUThRU1hGdnUya3RFSnZI?=
 =?utf-8?B?RHFNUXBpZEpUS053bDZQNlVFYTQwaWVzQnNXYk5Hdk5FWGl4L3JzT09nTldI?=
 =?utf-8?B?dkNseUJYbmYybHgwTUZWUEFVSDhLeGU5ME9vWDBnSEtNazBnU2JTL3M2VjVY?=
 =?utf-8?B?MVdwaEZYalpmNjUvaUJZTk5rQ3QrMHVBWDZocWo1K1VwRDc0Vjg0bnNxM3lJ?=
 =?utf-8?B?a2JoWWZHMWhYK1I3czlZS0k3dEJGNHdQN1JHNTdDdU1RYnM1bjMzcnZRaSt4?=
 =?utf-8?B?ZkZjSmFrSS9RK1RpYmNsUDNiZGprbUFJL1hqYnRpd3ZVa1RlSElIRWQxMlBy?=
 =?utf-8?B?Mi9TQ1E4aGRxZUFYVnB2ZmV1WW5QY0lkTXlUUXc2NW1pd0loWGNjaDc5UFMx?=
 =?utf-8?B?QkFReTZMb0lETjhPOGpHRng0VEU5UXVKeGdGWXMrY00vZFFheUNEK2l2Vms2?=
 =?utf-8?B?Q2pmRUlVUVJxT29jdStZeHdsUk9SaUI1cnFGbmNOQ3pHcng4ZzlZZWNFU3pB?=
 =?utf-8?B?OU5JRThFUHZkZkZqRCtsTEE0RlF0a2pLMEt2dmlpYllLSWxLY2hhNHNhcnRZ?=
 =?utf-8?B?aVdNcmFURDB5RWdPVGpmL3p4MThDNHRLUmY0UU9Ma2dHamdjUVExSHI0amxv?=
 =?utf-8?B?M3lqU0pZQmJJYm9qekRXNDNnZUpPMnQ5NGZBR2FKNnFwWEVVbnZGWXFvRmdE?=
 =?utf-8?B?V0E4OGRURTU2c1FDZ3pRNWNyNHlORFFLRDZDZmVHYnBlcnNGTHc1WlM4bWpI?=
 =?utf-8?B?NC9mTk1hUHpBUU1td2pRMnJld0VGSDRzUlNEWFJud1JVRGtMdlpjeGNXeHdB?=
 =?utf-8?B?ZkJnZTVJQ1JPTVptUWFKTmZTS3NjdnV5Z2xWem0wVzJIdVRJUEtOZkJWWkR6?=
 =?utf-8?B?aDNIYlYzSGRkd2tXdk4zOU5hbFphNUYvMDZ5cmJRVjdJNG5lVy9mY3RLR0tU?=
 =?utf-8?B?VUw5L1k3cURVMHJnNXhaNFRlbU1YVWZtSGx5VjNSamZwTUFPakhCYmZhWGpr?=
 =?utf-8?B?Z1NzblJaMlNRRHVxeDFLMk0wWWtqdG8xWngyOGJ3Um5OV1U2ZXA5YXozcHY5?=
 =?utf-8?B?YTUwUzJwYVRPQ3diUEZ3RkFPcGVWMExRb3JmaE5BOW15M1BOOEZCVzFPNFg4?=
 =?utf-8?B?YVBvcndBd3c0OVl6dVBpMVBXS0VhOXdUZ083a0xLcS92U1gxNGxvSUFuTmd0?=
 =?utf-8?B?RHNSU0pjeVZJalhKdC9VaEJOaEltMHZmRFoyRjhIb0RZZDlqSHFUTXc0dnVl?=
 =?utf-8?B?dmhPSW1sU0EvRTFjb04vbGFnbUFORytDUS8rZ09ZSUwxcTROcGxTdloycEpm?=
 =?utf-8?B?N29YTEpsTFBRQm51eEx2UkxsVzJEcmVtYkowSjlYanF3TkFMTlJlNzhUUkJF?=
 =?utf-8?B?MWo3Yzc1NkkyaUs3TnluWlFnRm8vdS9ka0dsMWIwRGtWYm1GMEhXcER1RXZ6?=
 =?utf-8?B?NmVaWEExaEUzeE90WmI5cE1OaGw0ZE5mQTJqOG91L0UveDI3UWp2R1k5YXlN?=
 =?utf-8?B?U0ZjRjJPYmthc1pNenVrV3NJaXozYzBlK09QSXNQSmJ1YUJ2NjZRaWlsamxQ?=
 =?utf-8?B?S3JvSDdIYnRaWlFReFZlY2p3eERMN3dPRU5SUnd3RzdUYTczV1VQR1pFbXhS?=
 =?utf-8?Q?giHgrS3ljIXvlkik=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a33fbf1a-bb25-44c0-59fb-08de42aa2fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 05:06:24.4202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ROD+5yQe+F+NcX5Ram/7gsV7pchXhFXNPjwbxqqm+OHPJJfyXALUL0AkvGopFQVijmFbDtK6iYNgSl7LaVvs1BmoyCl8l3rvGxryLOXU9HZVVoiAYNd3NQJVuQc8TSRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8630

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
LmNvbQ0KPiBTdWJqZWN0OiBbUEFUQ0ggMi80XSBydGM6IGRzMTMwNzogRml4IG9mZi1ieS1vbmUg
aXNzdWUgd2l0aCB3ZGF5IGZvciByeDgxMzANCj4gDQo+IFRoZSBSVEMgcmVwcmVzZW50IGVhY2gg
d2Vla2RheSB3aXRoIGEgaW5kaXZpZHVhbCBiaXQgc2V0IGluIHRoZSBXREFZIHJlZ2lzdGVyLA0K
PiB3aGVyZSB0aGUgMHRoIGJpdCByZXByZXNlbnQgdGhlIGZpcnN0IGRheSBvZiB0aGUgd2VlayBh
bmQgdGhlIDZ0aCBiaXQgcmVwcmVzZW50cw0KPiB0aGUgbGFzdCBkYXkgb2YgdGhlIHdlZWsuIEZv
ciBlYWNoIHBhc3NlZCBkYXkgdGhlIGNoaXAgcGVyZm9ybXMgYQ0KPiByb3RhcnktbGVmdC1zaGlm
dCBieSBvbmUgdG8gYWR2YW5jZSB0aGUgd2Vla2RheSBieSBvbmUuDQo+IA0KPiBUaGUgdG1fd2Rh
eSBmaWVsZCByZXByZXNlbnQgd2Vla2RheXMgYnkgYSB2YWx1ZSBpbiB0aGUgcmFuZ2Ugb2YgMC02
Lg0KPiANCj4gVGhlIGZscygpIGZ1bmN0aW9uIHJldHVybiB0aGUgYml0IGluZGV4IG9mIHRoZSBs
YXN0IGJpdCBzZXQuIFRvIGhhbmRsZSB3aGVuIHRoZXJlDQo+IGFyZSBubyBiaXRzIHNldCBpdCB3
aWxsIHJldHVybiAwLCBhbmQgaWYgdGhlIDB0aCBiaXQgaXMgc2V0IGl0IHdpbGwgcmV0dXJuIDEs
IGFuZCBpZiB0aGUNCj4gMXN0IGJpdCBpcyBzZXQgaXQgd2lsbCByZXR1cm4gMiwgYW5kIHNvIG9u
Lg0KPiANCj4gSW4gb3JkZXIgdG8gbWFrZSB0aGUgcmVzdWx0IG9mIHRoZSBmbHMoKSBmdW5jdGlv
biBmYWxsIGludG8gdGhlIGV4cGVjdGVkIHJhbmdlIG9mDQo+IDAtNiAoaW5zdGVhZCBvZiAxLTcp
IHRoaXMgcGF0Y2ggc3VidHJhY3RzIG9uZSBmcm9tIHRoZSByZXN1bHQgKHdoaWNoIG1hdGNoZXMN
Cj4gaG93IHRoZSB2YWx1ZSBpcyB3cml0dGVuIGluIGRzMTMwN19zZXRfdGltZSgpKS4NCj4gDQo+
IEZpeGVzOiAyMDQ3NTZmMDE2NzI2ICgicnRjOiBkczEzMDc6IEZpeCB3ZGF5IHNldHRpbmdzIGZv
ciByeDgxMzAiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBGcmVkcmlrIE0gT2xzc29uIDxmcmVkcmlrLm0u
b2xzc29uQGF4aXMuY29tPg0KDQpUaGFua3MgZm9yIGZpeGluZy4NCg0KUmV2aWV3ZWQtYnk6IE5v
YnVoaXJvIEl3YW1hdHN1IDxub2J1aGlyby5pd2FtYXRzdS54OTBAbWFpbC50b3NoaWJhPg0KDQpC
ZXN0IHJlZ2FyZHMsDQogIE5vYnVoaXJvDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3J0Yy9ydGMtZHMx
MzA3LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtZHMxMzA3LmMgYi9kcml2
ZXJzL3J0Yy9ydGMtZHMxMzA3LmMgaW5kZXgNCj4gNzIwNWM1OWZmNzI5Li5iZjQyYzI1MGVhN2Qg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYw0KPiArKysgYi9kcml2ZXJz
L3J0Yy9ydGMtZHMxMzA3LmMNCj4gQEAgLTMwOCw3ICszMDgsNyBAQCBzdGF0aWMgaW50IGRzMTMw
N19nZXRfdGltZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBydGNfdGltZSAqdCkNCj4g
IAl0LT50bV9ob3VyID0gYmNkMmJpbih0bXApOw0KPiAgCS8qIHJ4ODEzMCBpcyBiaXQgcG9zaXRp
b24sIG5vdCBCQ0QgKi8NCj4gIAlpZiAoZHMxMzA3LT50eXBlID09IHJ4XzgxMzApDQo+IC0JCXQt
PnRtX3dkYXkgPSBmbHMocmVnc1tEUzEzMDdfUkVHX1dEQVldICYgMHg3Zik7DQo+ICsJCXQtPnRt
X3dkYXkgPSBmbHMocmVnc1tEUzEzMDdfUkVHX1dEQVldICYgMHg3ZikgLSAxOw0KPiAgCWVsc2UN
Cj4gIAkJdC0+dG1fd2RheSA9IGJjZDJiaW4ocmVnc1tEUzEzMDdfUkVHX1dEQVldICYgMHgwNykg
LSAxOw0KPiAgCXQtPnRtX21kYXkgPSBiY2QyYmluKHJlZ3NbRFMxMzA3X1JFR19NREFZXSAmIDB4
M2YpOw0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==


