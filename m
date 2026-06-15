Return-Path: <linux-rtc+bounces-6648-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IWQ6Kg2XL2q+CwUAu9opvQ
	(envelope-from <linux-rtc+bounces-6648-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:09:17 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B47683A7E
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:09:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=CDFVSnF5;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6648-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6648-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F6A7300A12B
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 06:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666993859F5;
	Mon, 15 Jun 2026 06:09:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7063793B4;
	Mon, 15 Jun 2026 06:09:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781503743; cv=fail; b=gSwTuwpUiwfBZ4TL0eHNfV+BXVN2D69Mj4Yk7eSajHu0q0ooEBM6/vJ5voO+qRfQu+cyTdl5gF8J0GOV2mNhm9nBUG3HZ9VZcvsek138myRP6uGfPI9W0dZ/ryacRbncXbp2wv7SJmvkh3cmpLJCcxmliTsH1QZiqCwcetd242M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781503743; c=relaxed/simple;
	bh=BPd5x5M4GjF2ntOP5NbCL4NBXT08BvgVI/U4cjfAfVs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=toXy0MrEFK8UTrhGlzxegzZjFc+lRkmWKgiAAQ2kP5PAtwROEbeP2mHeBZcxZcq7AWEsfCJ/HVLf49ZEUtSBrMBzBGnkoul9RgwhhFg6YP1E6B/CAXGZ7KHg0jL621rFm+OER5emYzE5Zo8gLJXBexRu1JhRytnRRCLpf0YTbMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CDFVSnF5; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7/0uH54CLWLCXFD4I0m+jelcnDaIIdowM8MH2q3vXhpWo7oBJstJh+KM+NCKToLZobgW0oifd7YUuhKxxyfvjKTMsevM+P0uBcUk3t8SxkzDEYOlHgbZJ6qJwy5qjjvlxYkZCfE6JtTTteAmjJ98kdK5gHOyXV2x2iyC96Ol2Jtzq0aMJlXiXhpLUsVXqTGzU99PRB6JJ9E7bdDN9Telz93rGwAs1H+zV9uQX5Q61mFky2r/FpLgrGVYTQxszbz1yVjkExP4yHiReo1k6CX6alEYrkrUL2Fhp1dsKTDKB3nsZqNHgt6Z+ZZ3jYB4UE0RamWUyUJhzHT40HMRRlorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3o/JCAwmXZKk50LjBu4DrdQHHrhqJ5NxEe6NAkogDc=;
 b=lvcjHfPFazSvUEZk3Bt+Z3FiN2SdfloLIWmkYLgv4OvCMQBWFd1WUE4jOTLnWR/rnyblGvmfmwNHEtfANMJqpGy25nSt10uckhGVyTbyRGq9PAeZ8q8BdYksdWPxvN+qHK3OLsRFPjZ3HMSwYiv0FXzPtkPq5wz1g+LQn/UA8F+3tzMtmjY1pbAv2Dit3/i3H7XAjXh3vWxosGTDzlhiCT5MCfWNJIshQNH6rWwwpqe7xHHjgibpm2wByr2vxolaxju/lfa6M8y8AnzP6Lg6Kr0jVFv6QHuz8c+zZec63yRxvnz6DzWO5cbaM6pF5GJYLWqVpG4dhS0jpMTxLRLm8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3o/JCAwmXZKk50LjBu4DrdQHHrhqJ5NxEe6NAkogDc=;
 b=CDFVSnF5oovUErr3hgkVdWmchm4NFaUw3tVbavl33MLz89raeevIS3nzaRi5whl7fQvXjIfNQ5Qa4ldbMoN+HyNE8xp8Wrbt9FFrT53GEEL3ftrpR50VoRXwKxzhDVRipm9GIy6TkHD1bnsCogVgJIGlbMxEtZxlGoG3bKcTkWf8MU3BSdVHPWawaRbJeMtnx/nsRfjb7TW0ks4keisi89pebnqskRWcSDfI6uRdSDauNjBxhCa/9zUe/2uAwnVLEZfRib5of46lmxnDkHYgAG8+Cbtznm8c8WqzgVPLz3eaNRyzfbMvSpUC09MDO7J7Y/cgDMnWIMAaRvYBbgGRCQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by MRWPR04MB11496.eurprd04.prod.outlook.com (2603:10a6:501:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:08:57 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:08:57 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Pankit Garg <pankit.garg@nxp.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support
Thread-Topic: [PATCH v7 1/2] dt-bindings: rtc: Add pcf85053 support
Thread-Index: AQHcX5YSbxaLSC8IOEuGOO6UoJ4wY7XuZonAgFHz3HA=
Date: Mon, 15 Jun 2026 06:08:57 +0000
Message-ID:
 <AS4PR04MB9362CA29DC9B6A31CA2ACC65FBE62@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
 <AS4PR04MB93629FC0E5B22263A41914E9FB2B2@AS4PR04MB9362.eurprd04.prod.outlook.com>
In-Reply-To:
 <AS4PR04MB93629FC0E5B22263A41914E9FB2B2@AS4PR04MB9362.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|MRWPR04MB11496:EE_
x-ms-office365-filtering-correlation-id: def7eadd-643a-494e-dfda-08decaa4963a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 jlDWnQKF+rpInf6drCOehphA/uVa1EydLCtVbmkT+CGmDRBOWT64B2mPwsIYvm2n14gZggtpCVFjzUbPH3DDgnaLL51IknKSYrTe3bKzp0zfTT5/aGUntAt8S/ki+MfKyxe1/pOfmxgfCvzAJ2P/r6GVcRdJISEaYnf2s3SWe9najpO6WefzcGHLFCKzQ1q3rtUk1XpmVQf6XMTrrzQibyeJ3wK8Nr/v9XRi0qjFfTkC+nuXtUWTB5/JF4kWwRdoirWg3njESc46gNsTAFSgUgBXAgCnG2af5f1FDvObseKl40Ebg4mzQmXATZWrOJdwNGQnM7XvD1+aSbQbBuxLk1m3ekx9qAiQvjEY1vjjFnwrqRftPYCLVcQK0syVMx565OagmsA8A4Zl4G5rVOkHLynAIRxbaxkKasO/nOglWoESot+ESBZnDwIBnvvXv6ygRZBw6agp49EdjXe8pEWUqmiMOYPn2cwitmL2E6WjGGoH0NhvOr3Smobz9ofJFQjbMS1QFXMh2qtjqouK2wlHVL7aUy+CxavNaV+lZodEAMdIRMRUKWKD60ILk3rNhgbLRbjd6Fn2cd0nLeh/Ex+4O3VSbPfs06LafSitETgqNTrmAkMDDok/rv8X4zUGn+zicKqWC2Mt+soVpJ0u1mXspjaRY6FfrLJrPSm7UDVKXVAtkSaQ2qLECa/9Y5j1EmMHabbHfz0afPEdi938vqML1wyeIWOYkDpVgzYkgGKLgknLPHkipYQLfa8S44HpPzix
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?k39jYq+d+BCtLb6UYMRkkogloh2YPEscO9uEaWwr2lGZN5PYvHPi7k025Fgk?=
 =?us-ascii?Q?f909q0x2R1+np7WF68t4WF1xkkGxFIYmhaJ5qnl51OXwJsWoQsWVzQIVm06S?=
 =?us-ascii?Q?jcO2HdMmJvhR8mvIzfmB/CK6Co6JGTtWdNWUXv7v3orqukpBMu4UTE6uDqCD?=
 =?us-ascii?Q?L9z5YOOgJV7Lrrfu8m+GGROVIMNrHUyyf9HcvPnkDHaU6GQNj3aFw0aTljgs?=
 =?us-ascii?Q?9G1f3m+jH3rgL0QB2Bfkc/kXhJ2hz3c0p8cqsc7/2iAhdPEA0maqbERixz9h?=
 =?us-ascii?Q?fgc5F3Rp6DKaILd2zo8HsqElksGmP/O+fFPPTdWwP/ZLD0X4HdhYfZNPGsB3?=
 =?us-ascii?Q?KDRNdaGZGtGQwVULMafzZLLuLPLxx3rYojAJIZlE3tO0pQkq98aDJHWH3d2P?=
 =?us-ascii?Q?VcCMpryoz9kEUrb5dcVje4/buzXzjBYAhyNTatQSlpaMsPMh9I+ep0h8tkL1?=
 =?us-ascii?Q?aUvIWM7Wzpcb9z8NvpOPaeubOd/3xizKkAD9zgnrrbVkQL+5ytnGrDt1BxJU?=
 =?us-ascii?Q?1BJGHO1lsK8id6yRiPwxFvkfzUvPgPmCxxfjjmIa4wFtZrVocEFhVbidYkXW?=
 =?us-ascii?Q?X59NRBCo37/aboUWQX26wIStzLbGSl8u200yRUPjkaTgy1gA/6+eiF/+gRcd?=
 =?us-ascii?Q?ACcBJR3avtuuirN/7MdoP5oGmgvQz6YVWjBX6wE74CTIj0YNPOWNQRNBMjoe?=
 =?us-ascii?Q?FcqfCgvO26gm5H23OzwAPGRfagzzOd5Ap4LD9AAbel/ciFdwtwrfKINUmmXg?=
 =?us-ascii?Q?8z8REeeMV+4hZkyG/t/3rnDrkQPPLUU1YHJeefAWq3XOZnk3FmNciLnU67E8?=
 =?us-ascii?Q?qdePUBhd0JH18qCTVxOoMp9HjUswkZX5kIZcLG95HQiRH/w5n/U8Aw+Tvk4k?=
 =?us-ascii?Q?MZxLAGPrmfUSvSTIKHbOHiLK6AP6UOiXeAE2Vd7rZxPmeVWrPrFaPQSExHa7?=
 =?us-ascii?Q?KlX5brpd0qOioOyNvpnuco7uEEW/6fNqKjQldAblvFe6ZhUhUXIBZzpMLiRv?=
 =?us-ascii?Q?iU41fFCEyHMPDIc9IIEb5VjVms9DkT8rAVyW4tCEF1O5niQIu/zNf0vRo645?=
 =?us-ascii?Q?0g/7E1KUVQFYWN2ZJGXiHqI0v3PjTkTPjNIIQ2tYfmfSwyg4fufseJ8mhOBE?=
 =?us-ascii?Q?kxrk/gQkRwvXY104FI8jkRg5zVfNyN5z/GUcs367w8Kjoiq1T6CZAvQAd3iF?=
 =?us-ascii?Q?rwvlzo8+F5QRkn3NpMnH55cLMmuPlQ793oidGqNhRC7bULebV3hNh847QA5D?=
 =?us-ascii?Q?FuU+ikrLWX6Obkpc/hq6rQsOC5BgwpnusiWqI1/susWWRIPBeFfSpzD6bewf?=
 =?us-ascii?Q?rBi18c2BPlaiSN+pJRtclEsRUHFyPVOCrofudKMpJSvJ42FGJOjIGNPMT9fM?=
 =?us-ascii?Q?dmRQFA/cSC8xMwn/kYYRt1ngc+DNpJh0VsGX9OpZp9WwVk+tU8ohJ6n7IE6a?=
 =?us-ascii?Q?QMVv1/CR0yYRbl+vZaXURacRWndgDUauACuLuIe1g8yhCfpY4bAZvn75T7oM?=
 =?us-ascii?Q?Q1M8gpyTh9QIj2VeGkLglRT0XRiKhH1J0HhzP1bXj7xaSbN7QZGCuruG3JGq?=
 =?us-ascii?Q?VKoHz3Dl2+EQyiZyQMkBJ/qx/ye8skorGwMhu84eOYtlW1a9Msr5Q5Cnk7Lj?=
 =?us-ascii?Q?6JZoYd3uy1huXFNh2oBtgX5rWngdso+5KwxLR5XFHJKDLKFAeteKyFkx3L+0?=
 =?us-ascii?Q?ObP7igFEmsEFD72NeL4+BWeOn4b34D+9UrhZuuP6+t49EjH1IFOxlV3oIgsn?=
 =?us-ascii?Q?40Mfpawx5w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: def7eadd-643a-494e-dfda-08decaa4963a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:08:57.6872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6x8uM+4nbDEZZZIeZRunUAZhjZ5rp/Md46wJvkxRggQr0S4HmsTjYuZjc5gkml1h9ZrC3oEg1BviWp6eWFOZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11496
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6648-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:vikash.bansal@nxp.com,m:priyanka.jain@nxp.com,m:pankit.garg@nxp.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,AS4PR04MB9362.eurprd04.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim,nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05B47683A7E

> > +
> > +    i2c1 {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      rtc@6f {
> > +        compatible =3D "nxp,pcf85053";
> > +        reg =3D <0x6f>;
> > +        nxp,interface =3D "secondary";
> > +      };
> > +    };
> > --
> > 2.25.1
>=20
> Hi,
>=20
> This is a gentle follow up on the patch series I submitted in November
> (regarding the v7 of PCF85053 RTC driver). I haven't seen any review feed=
back
> Yet. So, I wanted to check whether you might have had a chance to look at=
 the
> series.
>=20
> Please let me know if there is anything further needed from my side.
>=20
> Thanks,
> Lakshay Piplani

Hi,

I wanted to follow up again on the patch series I submitted in November 202=
5
(v7 of the PCF85053 RTC driver). I haven't received any feedback on it so f=
ar,
so, I wanted to check if you've had a chance to review it.

I understand things can get busy, but I would really appreciate any feedbac=
k
when you get the time. Please let me know if any additional information is =
needed from my side.

Thanks for your time.

Best regards,
Lakshay Piplani


