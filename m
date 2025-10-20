Return-Path: <linux-rtc+bounces-5104-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8674BEFA95
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Oct 2025 09:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C36B3AA964
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Oct 2025 07:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2FF2D9ED8;
	Mon, 20 Oct 2025 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P/KharKh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C8B2AE70;
	Mon, 20 Oct 2025 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945172; cv=fail; b=n6J0eAoi4fLRNcUGRhqLBG3Zfra11kvbr1lTpNh6pNXl36YTeWAR7s0G7WzUB2fxDi3ptkrk35OV/ny3KfmVK5CaE4cCu/zDGXJEXCn9NC4eW0qIRsQYUckyZv04M/Q4A+JxfSJwlYLRMmBt+GH5R9cCVSj+EXA1fC2aoMNecKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945172; c=relaxed/simple;
	bh=LI+3/Kh2JkEj3+Q55jlUCj1DRvpXAwaB2mNrLbnZDQI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AqpjrDB98b9Qxvj4QoBLR8WI/ia0YLjEoPGZz10hqRS6gcWIlg+vD3gPRv7h+P32iR07ekIEA3F+9Gni5zqam8sRhmX1OAxrr/rpq4CXsnuGCnfoIORUQ9oiml72/aj6SM4AttyQb1OaQfpsAI/Vbjo9LBqunPYJuInMBINUTuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P/KharKh; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8yJSK7bG7LU6TnLTkAKEarWVv+WGKWv5EZVzIjhMlAAJ+SerrapYVSsdv/ehYkpkH9RGfHaakNkfOmprBzKpT/5zwNeq9tIw6Bl6CBBk0vBwy0yAu5lBKvqCWeVylyssy+Nri2Ovst0W6AEMPWnQ3QcAGFNrXa1wV/9xxWOncau2Di9Vg6KEgnp7fdCD1LXGaMlFQhWR5ODZsuvx1jT7rwKw+cbysKX1GPsQTtIIruqU0uebSBBckhM69kmJ+K1uh34fzkZ5vXHGOMfpnTas5TtmFwqtoVWmZSVLq/WN0So/iusrW5o0CGhfEZ1Ld5wNqbCXA8OHNqVV7+xvgIlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI+3/Kh2JkEj3+Q55jlUCj1DRvpXAwaB2mNrLbnZDQI=;
 b=iSSSI5IDbTqARHa07UUzT3pfALS2QZpYocuhHV+bNav9eYu4LjFle7a/jWTM/TCS2CLCUTMfhIZvgdkeDZfjMYavmn8sHQS9cbiIAKOg3m+ERtCYASYqCSZ1fnW1zUyDVR53Zb+1QTyCBU0p48E8U1keUcPSR3ubmer2CdnmuCUNH9Ia4+RK6WNSlM8SUDoJwT1akBp4tm1rddCf31FiZ1dY6lLvGdhk/XIn+q4be+1owDp5r38RIdoADJJxx0YY7Eushkb4nUGapK8CnfA5LJWDxTJCmDYlnwQ4scfvzqcB7XUJDE9qfi22/odHr9MGILIHueArQDYzJ5PFjhzCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI+3/Kh2JkEj3+Q55jlUCj1DRvpXAwaB2mNrLbnZDQI=;
 b=P/KharKhWaEtSmpGz4XBC7L2dipDT98OL5cZ8ksGjqtgKL8dW9b4szdNdRCud7tYxSqDaYH8p5V+WPDGAb+XtMTB9irueXBBUULnn+P7RfATg7hf+RW72Lp/LNIILFU/chMoPzF6WUnZlSQ/HDlBxHGT8QRlLn6HC9cxI31E5yI=
Received: from TY7PR01MB14910.jpnprd01.prod.outlook.com
 (2603:1096:405:253::12) by TYYPR01MB14293.jpnprd01.prod.outlook.com
 (2603:1096:405:20f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.11; Mon, 20 Oct
 2025 07:26:01 +0000
Received: from TY7PR01MB14910.jpnprd01.prod.outlook.com
 ([fe80::c78:8e4f:a976:9941]) by TY7PR01MB14910.jpnprd01.prod.outlook.com
 ([fe80::c78:8e4f:a976:9941%2]) with mapi id 15.20.9253.008; Mon, 20 Oct 2025
 07:26:01 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
CC: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Thread-Topic: [PATCH 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H
 support
Thread-Index: AQHcQNrvkDmOdfN3mEu3PphiJeH10bTKnngQ
Date: Mon, 20 Oct 2025 07:26:01 +0000
Message-ID:
 <TY7PR01MB14910C2E56DA315FD7D4390C9D3F5A@TY7PR01MB14910.jpnprd01.prod.outlook.com>
References: <20251019092106.5737-1-ovidiu.panait.rb@renesas.com>
 <20251019092106.5737-3-ovidiu.panait.rb@renesas.com>
 <67bff695-48ef-4b06-a434-aa5844f8d9c4@kernel.org>
In-Reply-To: <67bff695-48ef-4b06-a434-aa5844f8d9c4@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14910:EE_|TYYPR01MB14293:EE_
x-ms-office365-filtering-correlation-id: 15784565-d9b9-4054-e59a-08de0fa9ebba
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?cTExa0lBNGdldUFUYTVSdklpSEZVMDhrcUp2MWtUTGpvUlNnUlpaQ3RBampM?=
 =?utf-8?B?bENkZjhyVXN0R0JRSjVKRVRITmkxQnU2U2cyL3lzWmptb3cvWVlyalk1UFpx?=
 =?utf-8?B?bWdCRkVlUWkrNHFMdDEvL3NDNnV6RHUrUTdzbklZTUFOSW9MclVua0ZqemQv?=
 =?utf-8?B?clUwUTZsZTNLYW1UMlJkTjNveWwybGZtTGVvU0VjK05mZGdlVTE2emxlWmxY?=
 =?utf-8?B?VG50Z0lEMkYySVR4SGIyeXNpeDJFODhqQTU0V0FYRWVKWjZseHJKcC9OeVZn?=
 =?utf-8?B?dk1kbTYxNm1zbG02T2REMHduaU00UWlHRFd0clBVRWthelhaRzY1SHlZSEcz?=
 =?utf-8?B?c0QyYUR5bjRENytZeTUxUEtYSFhxdVF6SVhSZXdOaHZLMU5tbUlaKzA3UmxV?=
 =?utf-8?B?MnM5R3VIMUR5UUR4UU5XdWlONVBvbmd0cHJldi9ZWGc1eWZIS2VsbjJKSVBK?=
 =?utf-8?B?MTFxMHU1bXljS3NPMVVTRmQ4aWt1eUR4NnBiMGl1alk1V3RkK1FLU1BFN282?=
 =?utf-8?B?L2pOQTFVT3R2am8xWmkva3c2cjNLTVhiSlJvTWhsazRKOHBTVGszNlBJd2lP?=
 =?utf-8?B?YVg2cnkwcG5Wb2pUQis3UU1pVjhaWDVtUG02OVlET1oxVWVIZ0hETHM3am5m?=
 =?utf-8?B?MWVmYVVvVElNa0pXSFkrOFhKOFB0VDdoRmZydTd1dWtTM2toaEhqRjk2Uy94?=
 =?utf-8?B?SUZONTlqMzNtejVnUUJnZmtpa0dGV3FKU0hiSUw3ZGhvRVVrcWtCVnlDZ3dQ?=
 =?utf-8?B?Um9veERLSy90SDV5TjQ0L3JnTEU2MW1DZ3NXTkoybXBkZVVFZVBMZ2psbDdY?=
 =?utf-8?B?aGpmazJHMWEvbFpyMjhVRU1WTUhIRy83YVUyTFFKRWcrNzB2OTRScEJCMVhE?=
 =?utf-8?B?KzAydWdWeTNIWEZVU2FZa3UvNGJyYjJoRTQ5aTFtMldiSUVxSmhseHN4Y2hZ?=
 =?utf-8?B?RjhtTTBndURzYlRHeXFuNHJiZzVsVWVFU3ZDeFF5NCs4cmdhV0ZKSWl2UjIy?=
 =?utf-8?B?SDJjSDlob29EZ0RZU2tPK1BNcktLaHhtWnA5TGxUT0RHT256U3BTWDZwVE5W?=
 =?utf-8?B?MnRoMHF5d2NOU3I2eGcrcmMxVGxSQlAzVjV6dUdpV1Nlc0dZWXZwbkV2YXJQ?=
 =?utf-8?B?WXc3aW53Z0o4QjlQY2l3UjZMeFlrMVhybTZzREZQbWZDcTRmOXdkNjRybnJO?=
 =?utf-8?B?Qy9uRDBuWXNBT29wQm41dk1hNkxSdU1iRCt5U0Nhb3Vuak1mdjZPazdhUUlM?=
 =?utf-8?B?UjFmeTFET3BkcG5tK2xjQ0x2cFBXSmhSZm9hL3FJSXpvKzFFdXhBamd1NDBp?=
 =?utf-8?B?RHNmbjFMbnowSFVYOFJTNXZYcG9kNXYxMy9uYXQ1RXFlTWk5Y3ROQ1FGTlZQ?=
 =?utf-8?B?ak45cDRUekVKaVo2NysrNFVwbGZGWkpjL0liT2Y3WnJQTWlqandPS1JvNVRw?=
 =?utf-8?B?VXJSZ3pQakZrdGFpc1RLKzc0L1U0R3Vtckl2RkNiSStnYXdmSGt2TC9kYUdu?=
 =?utf-8?B?LzNUbzhteWNSSC9YQ3RtTWljSGlLVGhuQy9UYVlrekJtWHQ3dktFaVd0TzMw?=
 =?utf-8?B?VXVuWkowbWpkYjBFNGYwdEJKSlF5dGhPYi9WdXhVdm03cUdtSVpYcnZVYnUz?=
 =?utf-8?B?R0U2TGRPanBadFRBVUVtNUcybGdpcVlPR1QzRXVXTWNWUUZuQWJab25QVkhU?=
 =?utf-8?B?S2lyazNRcTJndHhXVS80a0ZhUW55SWdPUzRQdUFBVHh4V3JrTjVwZmJNMEpQ?=
 =?utf-8?B?cWMwbU02ZG15Um5KcGxsUDNJcTZabnFwQ3llMWM0alVhYXVCQ2ZERGM0ME0w?=
 =?utf-8?B?c1VLZVNLb1Qwajd1Vjd0TjhDaGwzMkY5c1YrcUJSWHFyVkdLR21jTkZYSnEw?=
 =?utf-8?B?aERLVGE3RUlpUlBQYzdsb0NGdjVMMjJycFNwQTJUR0NFRzFWMnNIVkNIbCsv?=
 =?utf-8?B?YVQ5a0kvKzRTQ2ZpNk5YUi9wOTRwV3lDcVNSMGg1QmRPeW9iSFYrODk2UEZT?=
 =?utf-8?B?aWU3b2ZCWTZiZmVPY2JFdVc2Uk1uaEZocjdPWStJWmF1ZFZJU3lLOVM4L1p4?=
 =?utf-8?B?b0NzUHdDNXM3N21DSWxjajk1S2hRbndEdldBQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14910.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1AvOFBCQWE4di96WG0wajU4MUpsZTQ5UWE1MWlFdEd1aWdncjhnR2pIdG4r?=
 =?utf-8?B?V05QR0g5ZjZuY2R4NE8yZXNGZFlGVW9MMGZzYkJUNk1DV1dVdm9WbDUrL0JG?=
 =?utf-8?B?VW5FdmRUUjZRb0dCaVB3QUpQTHkwNVFPK2lmYjFPby9PYXBuWVBPL2kzdmdK?=
 =?utf-8?B?b1gveGVGRkUxd3FoQzVxbDF0SUcyVGFYL1cwL0JlVnFPL2JiTGpoM1VwRkEr?=
 =?utf-8?B?OE5EVUpWZHpPRnYycjcrU2lRNXJhOGJjdHBWdTdBaFhianZBaHMwY3IvblFl?=
 =?utf-8?B?byt3REIwMEw5UzhadnJRMnFHN0NpSE9IRjN1K2dRY2FGRnpHTWdFalFOVUV0?=
 =?utf-8?B?NElGTFVIRmRRa0hkUmhIRU9VUnhlcU5GcWdqajUyRnBGTDc5aGk3TVBkbDFn?=
 =?utf-8?B?dDhSK2dsMUtEcSthUDlkSkc0bFlLbnJFU0R3SFBzbzlvT1lnWU9oSUNCVk5j?=
 =?utf-8?B?R3FQK1lhOGZ3dUN2OFNxaGR5b1h0ZVUrSWhyYjJpdUdhVk9qZEIrZDZIVUFa?=
 =?utf-8?B?eXgyeDVGOFkzaStPTEVpcjlEVGpheldVVXNiR0Y4SVoyanpRWkI4NWd1VmdR?=
 =?utf-8?B?V0xTYmJLcUxRLyswSkR0RUNLSDdmbHhOYys3Mzg1UDZBZHZ5em1haEdnR3U4?=
 =?utf-8?B?a28xV3hvZTkwOVcxZS9sL011SjltS0dHNXNPL1JzdHFCTWFyMGhOYStRMUh4?=
 =?utf-8?B?eVpGRWYrN1hPeGoxU2tpenM2TmVScEJSR1EzOGxrVm4rc2lObWs4M1NobDlB?=
 =?utf-8?B?MHFWejhPZTZlVGVmZ3JPTkRURlZQVGYrdVR2TTdQSHNrYWFDWmFGYWVhZE9y?=
 =?utf-8?B?aEFzak11c2wrbkgyYkw1WEFuT2lRQng2eUNyWndSK1hLdk0vRDg4WTNDNFp2?=
 =?utf-8?B?bUNOTHBCdE5ZNkxwOGJHaTFid2hFZjR4Q3o2TzJzUTlwd2hMUGI0NjNhbm16?=
 =?utf-8?B?MXBRQ1FjRzg2MXk3UzU0Zyt3NEdwUElvRmFWWEIrSW9ubTBDaWJEcDlKeVJ6?=
 =?utf-8?B?V0VqSXFXZ2hoSzFuZjJrUE5sd0ZKOURQQU8xeUZxWUQwalRjMlprZ3g3YXRi?=
 =?utf-8?B?RzVEOS91MzIwY0NKUTNZbldNZVZHSzRQVyswYzRoS2orckRNYWhoTjUrbUN1?=
 =?utf-8?B?UWpoMWFBejJVYXc2OUZUWXZtdVZvcExoeW9rdmtmMTJIUkFBa3QzcFVNTXlF?=
 =?utf-8?B?Y21CZStlOVVkODNSL0FMN0RyN00wcjJQYWZwbzlaU0N6OGhDdXp6b0RPdFdB?=
 =?utf-8?B?VWkvMlJZR3o5ZjZTY3pKTGNxeWNDdTh0cVE5SGF4T2NaTXR6QUppcktTTFRX?=
 =?utf-8?B?S2VjckxOUWdXR3pyZEhFSmVwc1BwL1VtNFFiRUUxck96WVFmbmdRSFdZM2N6?=
 =?utf-8?B?dGVqVE96dG9EcnFsSHBKejBDK3RjRmtWVEp4amdTK1FlLzRxVVRTa2U1cEZ1?=
 =?utf-8?B?K1BUM1VjMkkxREIxbXNRby9XOEFFRTF1dVFJS0RUZlROQ3FraVBmQ3YxeFk4?=
 =?utf-8?B?MUZFSGQzdFZqbjg2RmYzQjhNdUo4bXNwM0NLa0phYW1SNFVvL25zODNTUEoy?=
 =?utf-8?B?TlpFbHVqeUNQYmpFc2s3K2hWU3kxeXpHTGs2ODBJWnRXWThGUVcvNTZQUjVz?=
 =?utf-8?B?bllVeXZoaWdZRkNSMmV0TkF2TThNNkkzUjU1N0RJN2pnb24yNHlyNyt2NUll?=
 =?utf-8?B?aGpETDVhN2ZxQ3ZONDlvbUNYNUVnc3RFaWpWdkptZ3BvSW8rRy9URGpReFFH?=
 =?utf-8?B?aStSTGVYaW5NVzZmWGxSRDFPU0xKUWIxVVFhWGtCckxDVmtGcEVoUWF4Z2dQ?=
 =?utf-8?B?eUhQUVoyY05MWElWcFdOaXRwQ3QzaDArK0J5WkcxU1c3QkRkaUg3QUVsT042?=
 =?utf-8?B?dFU2Yjg0V3M2RkZjR0kwQitPU3dKeldUcHNwUjJEdGF3U2hGUzlpcWUzY0tF?=
 =?utf-8?B?cDlYSWFzMEJFTGVXYVNtemlGUTNYQlVQREorcnlSZkFHK1p0ajZiQm94Skdm?=
 =?utf-8?B?N1FJczlCVkVUd0xLTnovVWxBRC9UT2FtZ0dqaWtnRzlhT0UrUkhaWFFzRGV4?=
 =?utf-8?B?aitpZytna3BpTFE5bUlGZmp2MHhTUDZqQVF5OU9QYUYwRUIwZ2FqbnFtbCsv?=
 =?utf-8?B?eGhOenRoVlM1bk1FMmNVeDJrd2FsZFFFUGEyY284SlhpNFlkZkFhV1BmWHd1?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14910.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15784565-d9b9-4054-e59a-08de0fa9ebba
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 07:26:01.1648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95owernR+c/c9QZkntgB4XHh2gZDqKkosmQHQyrdtkSMQWEJvoeepfCxzMnENuwrR77/mfkvz6RnQDmJCEoD7eU2IoPbshbuM5Vq094VZkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14293

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogU3VuZGF5LCBPY3Rv
YmVyIDE5LCAyMDI1IDEyOjMwIFBNDQo+IFRvOiBPdmlkaXUgUGFuYWl0IDxvdmlkaXUucGFuYWl0
LnJiQHJlbmVzYXMuY29tPjsgQ2xhdWRpdSBCZXpuZWENCj4gPGNsYXVkaXUuYmV6bmVhLnVqQGJw
LnJlbmVzYXMuY29tPjsgYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207DQo+IHJvYmhAa2Vy
bmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOw0KPiBnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZTsgbWFnbnVzLmRhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47
DQo+IG10dXJxdWV0dGVAYmF5bGlicmUuY29tOyBzYm95ZEBrZXJuZWwub3JnOyBwLnphYmVsQHBl
bmd1dHJvbml4LmRlDQo+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gY2xrQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNl0gZHQtYmluZGluZ3M6IHJ0YzogcmVuZXNhcyxy
ei1ydGNhMzogQWRkIFJaL1YySA0KPiBzdXBwb3J0DQo+IA0KPiBPbiAxOS8xMC8yMDI1IDExOjIx
LCBPdmlkaXUgUGFuYWl0IHdyb3RlOg0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0K
PiA+ICsgICAgICAgICAgICBjb25zdDogcmVuZXNhcyxyOWEwOWcwNTctcnRjYTMNCj4gPiArICAg
IHRoZW46DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgcmVzZXRzOg0KPiA+
ICsgICAgICAgICAgaXRlbXM6DQo+ID4gKyAgICAgICAgICAgIC0gZGVzY3JpcHRpb246IFJUQyBy
ZXNldA0KPiANCj4gU28gdGhpcyBpcyBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IHR5cGUgb2YgcmVz
ZXQgdGhhbiBWQkFUVEIgZnJvbSBlYXJsaWVyDQo+IGRldmljZT8NCg0KWWVzLCB0aGlzIGlzIGRp
ZmZlcmVudCBmcm9tIHRoZSBlYXJsaWVyIGRldmljZSwgYXMgdGhlIFJaL1YySCBTb0MNCmRvZXMg
bm90IGluY2x1ZGUgYSBWQkFUVEIgYmxvY2suDQoNCk92aWRpdQ0KDQo+IA0KPiA+ICsgICAgICAg
ICAgICAtIGRlc2NyaXB0aW9uOiBSZXNldCBmb3IgdGhlIFJURVNUIHJlZ2lzdGVycw0KPiA+ICsN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

