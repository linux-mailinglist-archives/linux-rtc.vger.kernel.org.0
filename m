Return-Path: <linux-rtc+bounces-6242-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDpNLfIzwmmUaAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6242-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 07:49:22 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B8303721
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 07:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4750131FA9D4
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2026 06:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C7C3B3880;
	Tue, 24 Mar 2026 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BiabtNdO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC03B2FED;
	Tue, 24 Mar 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774333889; cv=fail; b=JkQfR80JjOl/37DDi42hl25y1g/90zsJgOkvI9eBMbeWo81pxZjJVPijaEqfQIC8TXJRCXTKbYweSJCl2pmEfIDBxXGT5vZ/fDuulIUo1KXUub3sxP2hZkoh6Ft5UzbhLKTP69vL3Yvi3qsK0aCdf9m/Rj/O6OemYHE642mnqXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774333889; c=relaxed/simple;
	bh=VXUVLNlInIY/K7RSU+zMixLJbG18YWzwu33MYUqBO74=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lkLovLrz5hVhVvHLoKMIKhrejdIjMR2yPCHQgp98boqJyAT10aaT5XztpmnQkvzcZ2LdVxCAVYSu51mQlTRCcjPdchgdTtzKBGOlfDvKHxyuhS+9V+82vpKRWLz2Wt7qeTNDDFiLp7oaM4Mzm4F9d+SyZc9qJjGbRfAM9wRucT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BiabtNdO; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOqWKmdrfmyq+NCwujQO0LL6JRx6j9+cxzDsnLzEpFGPwafjIqyssb7W/3647YHDmzR7EvgDXGdN946NJ0123ZzW2Z7ZT1q7CocxY27/8QSOgu6q6VzSADNveKWc6i6k5m3cMsGehWJPWejy98ETaazx3P7tNoKsDMLWoBjmZ5naMpwN5ZG9MygeN8heyR5UxxgbhG+7CRRGxqbrTDe5IAhvAJSNRv+UI71EfBuSFMynnEj7fcWuQZ9IHGAJmhCRNGyFe3Y2+iwLefWEMXsJVfzsUKu+IqIldheV4nGB1dfmHvdl2r2QrQc3pgZqWD9Hz0eElNlsLu4kQP4+C2MoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXUVLNlInIY/K7RSU+zMixLJbG18YWzwu33MYUqBO74=;
 b=UOkn6yLe3iGxpI+kAu/AQHspRU++EizTJ52TlnQtQmuyX4gLhEbFrt6anubw6BKk8vktdw9VAuzYrXG2DIToe2MS6IPUYJOcwtpCnVthNQBLAnHmE02Zg4tm/D1leZShqR0aSW92clEtglNaMo/HKizZx4QCBWW86AGdC8OKsu4mCoJSe9mjlDrRL9NHUxN0Qyoc8kcEezTjj1Ctfwu5cpn2NaFlJorWqGq/rBSiZORWQndijhFSqCUX/uY8LHL+jG4n+8u12c12vH9Vo/mlZUECkjV5e29Dkcwkn/HwO78GRrWc2m1XTRupYkSDUrMoih/ndnSjjWXBzoXEJsRZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXUVLNlInIY/K7RSU+zMixLJbG18YWzwu33MYUqBO74=;
 b=BiabtNdODq/mABE5zHG18iDjGHVm9l9a0rrJgmzx01+nJFf7EBazt/nKZDveJOklz0avufYQ7/jkzwh5FuLJfKGNfjJrULp3LmJrbFCYEvWr8MSIsViSY4Dy48UW/VNEFR2fOPbfEQRb7w4onKA/Yiz52Z2hBztZYemIonZfHjXY+Le9eIHl7mo7bEUuiupzCCKqD8Bc+31SvftxGIN+49R1HnjJqkUozyD3iP0jVENSTjE6X41FTUFK9QjdZeaJT7VaJH4gNUcdOEZqznKq7I9U51bq/1783jqfHnrdUWJNYRhzFjEFd0VvMJVanWhkO3rsWGyMHSYvUyu1iWmkwA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 06:31:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 06:31:03 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Romain
 Perier <romain.perier@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rpi-kernel@lists.infradead.org"
	<linux-rpi-kernel@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>
Subject: RE: [PATCH 01/15] dt-bindings: power: power-controller: Convert to
 yaml format
Thread-Topic: [PATCH 01/15] dt-bindings: power: power-controller: Convert to
 yaml format
Thread-Index: AQHctVOqGlSbXDjdykmcKYMQ27+l4bW9Q7+g
Date: Tue, 24 Mar 2026 06:31:03 +0000
Message-ID:
 <PAXPR04MB845906AAEF49644510641B938848A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
 <20260316-power-controller-v1-1-92c80e5e1744@nxp.com>
In-Reply-To: <20260316-power-controller-v1-1-92c80e5e1744@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7298:EE_
x-ms-office365-filtering-correlation-id: ce6ce97a-1af5-4465-6d7f-08de896eec62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 kqzZCJTvz4INgZNwbvYRepwgizxRaiNntLWExlRcUJg9B/qdqokJdNFjP/+tVoAPT4rGS5+yzYrWk8m8YRjFQuBayl+Vb4Tgs+vfdIEO+kLUVCzuQG2ymmrpqTVQHbzmeL1gWQBxTaYpQv0eiCgPUmc0acAX1HzXZzr36wVUFCHLiWITlCCb0OFnaiRZroYjYMLaX9F6BvrGaNUnFHocboYnTm/vkv1UrHn6peLPLyQEHbjQMlS/aBNv2vxqg1KO5yF/IEsbb1onIO3IWwMOFosPByO/2Vb87jtHHtsPjN4CKhreRlO5cvb5AEzREhxRQ9k9zx19SryS8a2EIbxuNI5wWV6vTysoEstaQA2GNUlyjhaA/HYS08c7LMUGTm29q6Tuyx52HyJLSYwsngyLUlDjshFO2SfKkQFzbq8nwFqzWDrfw8hBzo8xe0gA2ZUKVHKBBFyu5xWGVjqqWiGDHcbnkf4k6mKt8c0Fy5cFhDGJGhiJ6oF4la/3oFrYKy2MJgNFKV5+3Ec2mVhJqg2oWDTpmvVm/qa1rsS3HZ+3NA7x10z8UyLYsoX4tbPjmfJONkWNe3Wn+flMlTzCS7kgAWbnzTsSdh9qcOLpHkiuzw/acfSRpv8twX2eTxtdWavMmJ996khF6eCzNNs7I4zsuYkknWSS2aVhVyqy2GzMKOdo6mDAk4sP1hgql5o8JQ8mrg/0h0601k/d1vYd7BHC4OXkUbjeuCjsg+UQ099HtPEajnpgwyHYwbrWQPdjHPly
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TTdtTklMcVFucHhaVlNjQVpQODd1b3BXMEo2dk9XSWpkSHVqSHdwRmVjbWlX?=
 =?utf-8?B?VitUV0ttNVFieUFKdTdzVkNBdERYb2tCdVhpTThtODlrL2Y4TjhuOFRjV2ov?=
 =?utf-8?B?M1FldHZPU1g0eVpqTUFOMEdZQjIrVjUzOERkbHpob3laeUNxQXpvY0xNTWF6?=
 =?utf-8?B?dEdDN1Rma1RVUlBkUHY3WTQ5NlFQTTRZZ3JWbDBzL1djSGEyMWl3bzZtZDFj?=
 =?utf-8?B?MDdpbE4yaUtlMVo0ZmQ2TnphazBuaWlJRGg2MlBEREl5YTN3V01RMjEyQStQ?=
 =?utf-8?B?NGtMekN0TXhKSnBJbmVOUzBTZTJZODJTYmV2UU1IZFhoVHdEZDl3MUFNajhz?=
 =?utf-8?B?Tk9KQUJURTc2MWpWUjhMbzMydThabCtEMXFSMGtCM1ZZMGRMekZVbVRoakZG?=
 =?utf-8?B?WFJ5bWozbHVzZ3FaUFVpK3A1c0I2RUZ3NkpKUlRDY3RtVXcxeHU2bVJ5dCs2?=
 =?utf-8?B?YkphQ3ora0M2SXVqTmlqTWNtRU9aNUgza1RORWMxcXB3TjZPWUFZMFBIanRC?=
 =?utf-8?B?QW1JVHJqZkRLR1RLRE13Nll5MWtoajluSjBHYWxudFhFVGExYVB5RjluVDRZ?=
 =?utf-8?B?TVI3d2VPdmQ0akdBVCtERnpYMUMrMlNpc0lwZnRXWDhoa0dTM3d2NmJlWDBJ?=
 =?utf-8?B?eTJSNnIxTWJab05MYkNUWERGVHpFbkt0cVZYdEdONCtkdVhKNktZNkZ3WUd4?=
 =?utf-8?B?V01BbjlERHlPTDk1aDNxa1M3WGZ0QWtiYzhFMVcvQy9McE5SNUEyekFKTFBx?=
 =?utf-8?B?c1B4MFNXYnowUEZlK21GalFxSjNjTlNCS3cwOEo0TkdNNlc5OGJIbkptK04v?=
 =?utf-8?B?NGhKTnZJRXRlUU11WFhybVNiMFkzb2d4aWd4dHlxYkhRWWI4OEp3YUtTa0pW?=
 =?utf-8?B?RytxSmc5TFNadkZHemJ2TDdVK1FDZE9YQXlZclllTEhId29uc29YZHNVS2Ri?=
 =?utf-8?B?UFBrazFBQS81RDdvUzVKaU4zL0xrL3V5Z2tFb2wrcHAwNnVZQklCbS9UcCtv?=
 =?utf-8?B?eG5USm05d2lPeHYxNDA3WjlQVXNrY0lxOTA0S0RLSXc3bEN0djVKMGFpTzZj?=
 =?utf-8?B?aThWbTAvTVkzK3BYVlR3WkZHUThpR2gzN2Q1OHVURVpyQVVIV3VoL3IrRi94?=
 =?utf-8?B?a1MxR3ZLZmxod2xrNzNIQUs0eis5ZThMeDFoSkNtV0lUcktDbVp5VHZFNUtZ?=
 =?utf-8?B?d2poLzh2OG5IWVRWTjFBdWhUVkliUC9aMzZuS0RUcWcwWWhBS1gvM240YTRs?=
 =?utf-8?B?Sk1LbzZXVEIrOStpWnRad05JeTBEaHd2eGhMTmVlbTVYbUVpY2FsQ2UyaGt3?=
 =?utf-8?B?YnVzRGJnekF0SU15OWhTTTNxMUkyb1FNYnlzWXo0VWxLV2NiODU0WDFCd01X?=
 =?utf-8?B?MU5HMmJNek1VZ01zc3Y0L011UDZTcXowajJyVXZxMGJaNFppQW9XOWlheTJ5?=
 =?utf-8?B?ZjRSN2Z1bHdLbVlUdVZJcU1kYmttMHkxOCtwK3gvYWJkTGR3MXpJdGRyVG5y?=
 =?utf-8?B?K1VzUnRhZEVTWWIxMUxvejQ1ZVduV2JDQ3hiYmsyY3hVaURhWXdjZXBKMGtG?=
 =?utf-8?B?MUlhMmxyb0lySEU3T1RuZExTRUNzMTdFKytYbndsTDJ2UGF3ZWJSTU5XR0Vu?=
 =?utf-8?B?dmFqNWU2b1NVUlU5SmVmdlpQdSs0MmxkUkZQMnRHSi9teEE1NjhkS3pyUWY4?=
 =?utf-8?B?V2Q0UHRJTHVGbU11SCtWTGwyTWhNTVNGVmdjdTlwdzVoMDQxZjZDVG01Wnd4?=
 =?utf-8?B?aVEwWkFXRmE3NEdmblBjSGtPMWhSRFJNQkswRDJCK0c5S3ZhOGR1MVp1ZmdK?=
 =?utf-8?B?Q0I1OWgyc29ZREU3TkRjZWJNamdjYk1VZGdCdG9ZODBHMm1sdkx4anR5RThj?=
 =?utf-8?B?aUNxazZnMDcrVlU3VHNrNGgyVzVGVDJQSEdrOTQveVJOenVjamhLUWJtMUxN?=
 =?utf-8?B?M3ZzS3kySExrTWFjZFBya2Q0eGRrNk0rRHFQRHcwYzJOTDBySG40b0pmNm9U?=
 =?utf-8?B?RlM1NUpKRURMUzVKN2NqZlU5QWlvQTIrZFRTVnkvNGxqVW5nM3VxSHQvVDNJ?=
 =?utf-8?B?cDBHM2FkL2hiMnR2SmpyR2doSnVoRExKc3VwRlBjajJ2WTFYOWVucnJFQno0?=
 =?utf-8?B?WnBGZk9mcTlCSXkyQ2dCeFlRWHhxd0FjQnBiMHBnYlJUa010K1BKL3Z3bWVN?=
 =?utf-8?B?dnhkcjNleTlDWWJHVVhTakRmTzEvWTczb3B0RGFNR1FQVzlzOU9iUjFrQ1U5?=
 =?utf-8?B?azV1Tjl1R0l0eTRLMHFBejdETFc4MmltQXlvVEtSeGppbm9xWFhTMHpjSWN2?=
 =?utf-8?Q?rJ0yqkCfmQy3+Q5p39?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6ce97a-1af5-4465-6d7f-08de896eec62
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 06:31:03.8276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfOBvBj5j243bC+MyIMj0vqah91FUB1HlJ95AcXs1mSUu1RpzhscN9H+HUfUu7tyZcz40cDb7FKI+MsINeoAMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-6242-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.nxp.com,kernel.org,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,nxp.com:dkim,nxp.com:email,0.0.0.5:email,devicetree.org:url]
X-Rspamd-Queue-Id: 1F0B8303721
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgUm9tYWluLA0KDQo+IFN1YmplY3Q6IFtQQVRDSCAwMS8xNV0gZHQtYmluZGluZ3M6IHBvd2Vy
OiBwb3dlci1jb250cm9sbGVyOiBDb252ZXJ0DQo+IHRvIHlhbWwgZm9ybWF0DQoNCk5vdCBzdXJl
IGFib3V0IHlvdSBnaXRodWIgSUQsIHNvIGFzayBoZXJlLg0KDQpBcmUgeW91IG9rIGZvciBjaGFu
Z2luZyB0aGlzIHRvIEJTRC0yLjAgTGljZW5zZT8NCg0KaHR0cHM6Ly9naXRodWIuY29tL2Rldmlj
ZXRyZWUtb3JnL2R0LXNjaGVtYS9wdWxsLzE4Nw0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBG
cm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gDQo+IENvbnZlcnQgcG93ZXItY29u
dHJvbGxlci50eHQgdG8geWFtbCBmb3JtYXQuIERyb3AgdGhlIGV4YW1wbGUNCj4gYmVjYXVzZSB0
aGVyZSBpcyBhbHJlYWR5IG9uZSBpbiByZWd1bGF0b3IvYWN0aXZlLXNlbWksYWN0ODg0Ni55YW1s
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IC0t
LQ0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItY29udHJvbGxlci50eHQg
fCAxNyAtLS0tLS0tLS0tLS0NCj4gIC4uLi9iaW5kaW5ncy9wb3dlci9wb3dlci1jb250cm9sbGVy
LnlhbWwgICAgICAgICAgIHwgMzANCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItDQo+
IGNvbnRyb2xsZXIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2Vy
L3Bvd2VyLQ0KPiBjb250cm9sbGVyLnR4dA0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXgNCj4gZTQ1YWZmZWE4MDc4MTI5MjMxNmM3NWVkMzg3YmEzODQwMjUwMWM1Yi4uMDAwMDAw
MDAwMDAwMDAwMA0KPiAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDANCj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyLWNvbnRyb2xsZXIudHh0DQo+ICsr
KyAvZGV2L251bGwNCj4gQEAgLTEsMTcgKzAsMCBAQA0KPiAtKiBHZW5lcmljIHN5c3RlbSBwb3dl
ciBjb250cm9sIGNhcGFiaWxpdHkNCj4gLQ0KPiAtUG93ZXItbWFuYWdlbWVudCBpbnRlZ3JhdGVk
IGNpcmN1aXRzIG9yIG1pc2NlbGxhbmVvdXMgaGFyZHdhcmUNCj4gY29tcG9uZW50cyBhcmUgLXNv
bWV0aW1lcyBhYmxlIHRvIGNvbnRyb2wgdGhlIHN5c3RlbSBwb3dlci4gVGhlDQo+IGRldmljZSBk
cml2ZXIgYXNzb2NpYXRlZCB3aXRoIHRoZXNlIC1jb21wb25lbnRzIG1pZ2h0IG5lZWQgdG8gZGVm
aW5lDQo+IHRoaXMgY2FwYWJpbGl0eSwgd2hpY2ggdGVsbHMgdGhlIGtlcm5lbCB0aGF0IC1pdCBj
YW4gYmUgdXNlZCB0byBzd2l0Y2ggb2ZmDQo+IHRoZSBzeXN0ZW0uIFRoZSBjb3JyZXNwb25kaW5n
IGRldmljZSBtdXN0IGhhdmUgdGhlIC1zdGFuZGFyZA0KPiBwcm9wZXJ0eSAic3lzdGVtLXBvd2Vy
LWNvbnRyb2xsZXIiIGluIGl0cyBkZXZpY2Ugbm9kZS4gVGhpcyBwcm9wZXJ0eSAtDQo+IG1hcmtz
IHRoZSBkZXZpY2UgYXMgYWJsZSB0byBjb250cm9sIHRoZSBzeXN0ZW0gcG93ZXIuIEluIG9yZGVy
IHRvIHRlc3QgaWYNCj4gdGhpcyAtcHJvcGVydHkgaXMgZm91bmQgcHJvZ3JhbW1hdGljYWxseSwg
dXNlIHRoZSBoZWxwZXIgZnVuY3Rpb24gLQ0KPiAib2ZfZGV2aWNlX2lzX3N5c3RlbV9wb3dlcl9j
b250cm9sbGVyIiBmcm9tIG9mLmggLg0KPiAtDQo+IC1FeGFtcGxlOg0KPiAtDQo+IC1hY3Q4ODQ2
OiBhY3Q4ODQ2QDUgew0KPiAtCSBjb21wYXRpYmxlID0gImFjdGl2ZS1zZW1pLGFjdDg4NDYiOw0K
PiAtCSBzeXN0ZW0tcG93ZXItY29udHJvbGxlcjsNCj4gLX0NCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlci0NCj4gY29udHJvbGxlci55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyLQ0KPiBj
b250cm9sbGVyLnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgNCj4gMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZmY2OTgzNjVkNzc4NDQ2DQo+IGMw
OGNlZWI1ZjNlZjE0NGQ1ZTk3ZDJmNzkNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItDQo+IGNvbnRyb2xsZXIueWFt
bA0KPiBAQCAtMCwwICsxLDMwIEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ICstLS0NCj4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcG93ZXIvcG93ZXItY29udHJvbGxlci55YW1sIw0K
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
DQo+ICsNCj4gK3RpdGxlOiBHZW5lcmljIFN5c3RlbSBQb3dlciBDb250cm9sIENhcGFiaWxpdHkN
Cj4gKw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBr
ZXJuZWwub3JnPg0KPiArICAtIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPg0K
PiArDQo+ICtkZXNjcmlwdGlvbjogfA0KPiArICBQb3dlci1tYW5hZ2VtZW50IGludGVncmF0ZWQg
Y2lyY3VpdHMgb3IgbWlzY2VsbGFuZW91cyBoYXJkd2FyZQ0KPiArY29tcG9uZW50cw0KPiArICBh
cmUgc29tZXRpbWVzIGFibGUgdG8gY29udHJvbCB0aGUgc3lzdGVtIHBvd2VyLiBUaGUgZGV2aWNl
IGRyaXZlcg0KPiArYXNzb2NpYXRlZA0KPiArICB3aXRoIHRoZXNlIGNvbXBvbmVudHMgbWlnaHQg
bmVlZCB0byBkZWZpbmUgdGhpcyBjYXBhYmlsaXR5LCB3aGljaA0KPiArdGVsbHMgdGhlDQo+ICsg
IGtlcm5lbCB0aGF0IGl0IGNhbiBiZSB1c2VkIHRvIHN3aXRjaCBvZmYgdGhlIHN5c3RlbS4gVGhl
DQo+ICtjb3JyZXNwb25kaW5nIGRldmljZQ0KPiArICBtdXN0IGhhdmUgdGhlIHN0YW5kYXJkIHBy
b3BlcnR5ICJzeXN0ZW0tcG93ZXItY29udHJvbGxlciIgaW4gaXRzDQo+ICtkZXZpY2Ugbm9kZS4g
VGhpcw0KPiArICBwcm9wZXJ0eSBtYXJrcyB0aGUgZGV2aWNlIGFzIGFibGUgdG8gY29udHJvbCB0
aGUgc3lzdGVtIHBvd2VyLg0KPiArDQo+ICsgIEluIG9yZGVyIHRvIHRlc3QgaWYgdGhpcyBwcm9w
ZXJ0eSBpcyBmb3VuZCBwcm9ncmFtbWF0aWNhbGx5LCB1c2UgdGhlDQo+ICsgaGVscGVyICBmdW5j
dGlvbiAib2ZfZGV2aWNlX2lzX3N5c3RlbV9wb3dlcl9jb250cm9sbGVyIiBmcm9tIG9mLmguDQo+
ICsNCj4gK3Byb3BlcnRpZXM6DQo+ICsgIHN5c3RlbS1wb3dlci1jb250cm9sbGVyOg0KPiArICAg
IHR5cGU6IGJvb2xlYW4NCj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIEluZGljYXRlcyB0
aGF0IHRoaXMgZGV2aWNlIGNhbiBiZSB1c2VkIHRvIGNvbnRyb2wgdGhlIHN5c3RlbSBwb3dlci4N
Cj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUNCj4gDQo+IC0tDQo+IDIuMzcuMQ0K
DQo=

