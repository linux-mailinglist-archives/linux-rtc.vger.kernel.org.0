Return-Path: <linux-rtc+bounces-6654-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZgsuIMWaL2p0DAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6654-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:25:09 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1914683C33
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:25:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b="SBB/jEBr";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6654-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6654-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDD2E3006503
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 06:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F913AFD1D;
	Mon, 15 Jun 2026 06:25:06 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E762F83A2;
	Mon, 15 Jun 2026 06:25:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504706; cv=fail; b=aErfzflzYYshecJJf73wd46+lWXvcSaEtDqXqi5YlrwId6Kdi4aVdrHQXSWj5dSX4JRcfEY3vx+xmB9TpFCxJUJ/H9+z9Rs2ejXOq+697nITEQretx7GQKMIfD7DZVZO++H/pUw79KPYMSh7eRLRzQG/AD22hPe7hvbSSiUt1aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504706; c=relaxed/simple;
	bh=1eLSZqaJRn5wvlQ9ZISvOrtKKdH4ETjxwwu4pjBXGBk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G6x2uRskd3eEvE5GZrJCIHzQF2FIpE8pYHprDzmEB47tLpk7UC7PpCO5srSvEMudW6wvajNjDxrmcV3cOH0QHs1WbtgpUd/NsHyckAdNfnxO+DdA8dnFti2WAZSPl8pd9tA1CqRlM8oQtkD69kuCWglL12oyEk3StKZDkkzDQZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SBB/jEBr; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wvgirt/HlCi71olNvSnJvAguMmy2KzS4QOjUx1W4OmM2WNKZZ5OeITAaZCroCi1HegQdp6K9g/qzpdNZRmQvjeKHbTzFHqoZu/FCOcXhM1uwMJCguvFxDLLFzgsYazxKJ4MRDM6wonawGaxpZMRTKA0xNJ/5ZuHcEjdmNNNyQC+V18yjfHxWH94wwQGLNMcFWA5Fs1cRN5/PZzKsY99w3v1J8uRQ9wrVlPZaKjXL1jdtlXN0Fyh9uL+5Y4vPMeLXNdrricbBgQlmEEOp95KYuAIims7CkDogdyj9X4cIb5sntHPQ4m0o/BsK2b+iTSe1t4VsjC1J+63ZPpo1uxTaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/X1qCzA9y770fQnXsP386YDPp6eHg/SobH0pIgrCJc=;
 b=PGf/bpqbmbyLFBYn6C7ou86y4YKe1HOJPtLozrb6OrdkG6RcUzELe13DDRceK4HT/xAUqAw0d0XaaBTRUIABBu4F3w/3XMpjuw6IkTqlv8+BCATVRxIyE+KVWnjTFX6Z7UnaE+3eyfZkqal/U+wxQtvRKQ8No6XyFlZmr6Ot93l0taHuBmtGnZ6+vpuimuimnu6TvMqIgCQMbe0MM2sKHokXPi8qaI/g8oECWUcHp4hmB8XyELeRi2H/whhySsQDl660PF+SHx9bzKgd1pvUiBCH9+nKSTNwqIbO+NFZIZlzcsrlqiJs9ev1MqSNvf0dD7o7+KpGsJUZuIDswZs5Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/X1qCzA9y770fQnXsP386YDPp6eHg/SobH0pIgrCJc=;
 b=SBB/jEBr0rFXsdbW/NMxnCcy8dI1A9kg9kcDXWNGUdtUFtAncQ6WBoI+fqAlGrWhCYUp0KN0XP/Ay/HFDnzsiG9hsg6iGE5mJoufopjyWBmu907xsvuOQiBilyapaFu7Gta2gkrtW3EZb34cZSzxeGShcPsuAd3SRzJjD5GIASGDvau1bCxadtt2ILn43X/JZDVultr1OpAdAsClR/bEVWgShO8qU2fB+/TF+ECMp/eZ45x4sUNZWssRABNeqnQMxSROPQRvngP3CpeQ2pVLimj5yOXz/UhPHPRZWnhvUf0KwQmdxzcG3IXrBk0zXyRlSMc67CvrpV7awkadMbsodw==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PA1PR04MB10442.eurprd04.prod.outlook.com (2603:10a6:102:44a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:25:02 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:25:02 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>
Subject: RE: [PATCH v4 5/5] rtc: pcf85363: add watchdog support with
 configurable step size
Thread-Topic: [PATCH v4 5/5] rtc: pcf85363: add watchdog support with
 configurable step size
Thread-Index: AQHcWuADTZ0CmNsdKUKd0XLq3aFQV7ZAaYiQ
Date: Mon, 15 Jun 2026 06:25:01 +0000
Message-ID:
 <AS4PR04MB93625D7D258340667F6A03CFFBE62@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
 <20251121121137.3043764-5-lakshay.piplani@nxp.com>
In-Reply-To: <20251121121137.3043764-5-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PA1PR04MB10442:EE_
x-ms-office365-filtering-correlation-id: 53ef174b-4fe7-4fbc-8a38-08decaa6d506
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003|921020|38070700021;
x-microsoft-antispam-message-info:
 o7SuWP8FJmJDCo8DyA0Hk2+tJFtssMqCNzfPG85iZxwC8/vvt2jqAQ4WhtFOG97w6WK8HGTmZWlPDiM3qeBHPTtSdlHmytmiDKdZMGXdmDUJsypb031nunwjxR49iatLht0cRtm7aABzIIdlsRXR7Kl9ExD+PH9QnrytDmOAIw8Dz2H/B18GsHByFk/c9AN9hkQtZAe6X2mUXgrDsP0jS/X+kIcsiPdvtEbhLpNF52kijMh15+3qrs+FajCdiH5K8n6ML28MP9a+NjS5uZz8ral6ionjwrPQDhCHLC7yGy6X+FoDt5LqmfP60H9iGxni83qr257fuKM76EtZnC3bzdfh2WqRotF1MGZo3mm9rHqkUTEMEtJexO3MAebi4L+CQoIJACICO7w/0MAaowneOIX+BYMMJNHmSsWEAN1WKPN66R/++69RxPA6sKBSrw47xg/reyd5r78hKCVshOoK4VeqI4bZsr4+aDozwRqc9VgkeEXvOUuN3YF3YeY0SjTokQt/o7vC7cGoIrMVcQviLMdPIinMlbpaiNsMbANwYq56ZiuNBae+t6wkeifr9nCeRJG01jogIkQqrDeYlXjOpLqHH21T7E2d1Sihgj4C3ndrAoaOQaabsLDIRbRQaMINF/3Q2UsRaHunXjZ86cShWY/NVOz3PF7fE0rlXXJ5Z2b3vNzggtFIDKpAAxrxe4EMecVuHVPxrTNjGZhJkUBuKv7vs1HCv8TER4/lpOk9GzJZ6WilQjvL45Cz0baQy6sjp0PH+uRTmBbJVXGVAUfjAQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AfcWV5bNXS7okiN+uybX8Qn7d5Snxcg8RTWR2g0iF8kpnYkB3F4q3zlgDhAG?=
 =?us-ascii?Q?O3bWgwaA3siyvrUdX02IzP54jtW5hn2a1MGQM1zOKwLqoxiXaHLekxn8NmiL?=
 =?us-ascii?Q?iuE7iPERdRy6fvc6lFW06scNRCpyF8G4YqXhghqow9FwqhscgYcR8uZnuifF?=
 =?us-ascii?Q?G3drIerpFoopZlUzirVLxyW24a7ROSUpGWm2TYNTSUDpmyOySkp6hrBL5HV8?=
 =?us-ascii?Q?kFvUfj4aCLiJ2+mnk0MDcZXMhYEu1/AuCrZrHIyHETKFDbuQaAwZiyWyQnmq?=
 =?us-ascii?Q?1S83Xp9ZWtjlQ+l3XJCBnnm/cgsNd5j+QJBdnXOiLOTlPQ37HPEcGX7LBF6Z?=
 =?us-ascii?Q?ezWrHddZyGR+266DP3kSVilVbD/jmcrSuW3+lieHKXUW5LQ++DZR+2iG3gwp?=
 =?us-ascii?Q?Q11N62sg7UH2J8U6LJNuOqmuzs7u2NDdRiaKyaKLXD+JlOXmYH8DTL8qwCJc?=
 =?us-ascii?Q?pDD0YyiFIUBPSXLPGsEiDQyLr990KHKteLDjqc485bKzOGwbfliNVJOywYyc?=
 =?us-ascii?Q?z7J8l6fHdDnRkFsPvbe0x2g5Kayv4Hnoo3R99rxjcqLTrUj665FfRjbKQseL?=
 =?us-ascii?Q?dD92haoRiF7sAtuUWciI/VKbo/eIK3mM4iu7HHTrraC2cXQ34heyKzAVvLVr?=
 =?us-ascii?Q?vCQf8jXEYUzmv5oO+pArRHxh2DGw9A+uLh5FBgJhiQe9j4XCIgTw4U/8Beeg?=
 =?us-ascii?Q?M7T2QPeiAmrNMyQHxF5zbvT1r1kJMN1m4u5mrnWmmNq9Vbu3jWnwmrUrZbBj?=
 =?us-ascii?Q?1r/Sy6rDEV5u9IrHvPlIVbCQ3Hmu8xd/a0YutzDrkvhlWEy67HGmGOAu+lAL?=
 =?us-ascii?Q?5pEg4scZ9l/tXt9a9he88mrRUp8e0fCBdbpPCiy/cakAESYy7L+qDqxbxCHq?=
 =?us-ascii?Q?Qh6rjgNRrOPSKot5a0wQjvOD3h5XN8p7UGhe7JhFRH26zBzvX75CJP6t57ye?=
 =?us-ascii?Q?k6VOVXepgOsfpWvU2ZVjrSIzsY+ZP//YsQanGIiA47L248/s30IpCwKCXydl?=
 =?us-ascii?Q?P1zJ9KRohS1AzVZFoC7CHBvzesnAV/TiRFYfn9MvgrdfNuqa8jf9Ze7wrmPZ?=
 =?us-ascii?Q?G56jMtRJOIRgD8ROoZjS+TYdsiMRoe11CIMiI1UUSJ0sEGoqYROC6rxm6s7G?=
 =?us-ascii?Q?YALcVoA7t5QthFVCbmcNifcm/IF5VObbaRrmGz8DAKxIyz7lL+G3EFyO4CHA?=
 =?us-ascii?Q?VcILuOViXcUqMQvei09MQMSPQKYfu0mCymsSxcyVNjgmfi+yEkALfsXma5Ul?=
 =?us-ascii?Q?4tFvc/j6oBlYPrm/A8YIrQZMusQCkpea5YrIo6ojDgrD401kEEyUE/EbHu0l?=
 =?us-ascii?Q?fCDuNd5iedPO7gSXmkaiXxRyVj7omdl5CeFV3Li6jEpzZA2GviEaC+/e5JJm?=
 =?us-ascii?Q?n9GXISOxb0oAf0XMYyOwZBZIbyppEi855wvSiSJSwnSBREskVpZ6CxxYf5uH?=
 =?us-ascii?Q?BAKEqeoWiRPM6O+Y9k6KI60xczddtbL7ASsXoQ0B+nzT0xadlb5bjT6lakEm?=
 =?us-ascii?Q?C5p/6N00uM4kR8Zo2Hcy03WFUraS6WGayZGPSD26pO2Vuza+MplRnZ6l+4N2?=
 =?us-ascii?Q?vhU1k8YhkV12UHz7DR7JDFu+rGKfOwbwJ7Uw4q5UA4JOg86pzkDvp85lfAKC?=
 =?us-ascii?Q?eCNWhw3DwmfQWsh2ycaRjy945a9ZhfC4AmhoudF2wfv2SPJWZIo6T0byEhn1?=
 =?us-ascii?Q?BVc5Kib43VTCieK096da4MiB2wwOKcucZliRsK27kze01lx0KPi30RgdDMux?=
 =?us-ascii?Q?SFsBSsDiqA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ef174b-4fe7-4fbc-8a38-08decaa6d506
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:25:02.0246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YAzAd3uMrdFs429rs/tBt2DDtYcHQr+rnqAYFXgqQBOvfeSoApwBvM0loAFWJQNRc0bZNG+7Vf0FLXJl57ZRng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10442
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6654-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lakshay.piplani@nxp.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:linux-watchdog@vger.kernel.org,m:vikash.bansal@nxp.com,m:priyanka.jain@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1914683C33

>  /*
>   * Reads 6 bytes of timestamp data starting at the given base register,
>   * converts them from BCD to binary, and formats the result into a @@ -6=
85,6
> +833,10 @@ static int pcf85363_probe(struct i2c_client *client)
>  			   PIN_IO_TSPM | PIN_IO_TSIM,
>  			   PIN_IO_TSPM | PIN_IO_TSIM);
>=20
> +	ret =3D pcf85363_watchdog_init(dev, pcf85363->regmap);
> +	if (ret)
> +		dev_err_probe(dev, ret, "Watchdog init failed\n");
> +
>  	if (irq_a > 0 || wakeup_source)
>  		device_init_wakeup(dev, true);
>=20
> --
> 2.25.1

Hi,

I hope you're doing well.

This is a gentle follow-up regarding the v4 patch series for the PCF85363 R=
TC driver that I submitted in November 2025.=20

I understand things can get busy, but I haven't seen any feedback on the se=
ries yet, so I wanted to check if you've had a chance to review it.

I'd be happy to make any updates if needed. Please let me know if there's a=
nything required from my side to move this forward.

Thanks in advance for your time and feedback.

Best regards,
Lakshay Piplani

