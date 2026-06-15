Return-Path: <linux-rtc+bounces-6650-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mpfsEqyYL2oSDAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6650-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:16:12 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B00683B35
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:16:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=IABYLq1d;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6650-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6650-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50143300C93E
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 06:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2DF30D3FC;
	Mon, 15 Jun 2026 06:14:37 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D633AB285;
	Mon, 15 Jun 2026 06:14:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504077; cv=fail; b=cakXc9JIb7ccaQftFcHTcAsF0vjqtxW1gK2VM1PcA2HOzb/fjypI/yTdDNozc9oiDjGxgO0Yuy0/92j8EHNwVYY7DxrUMsMRDQJwWppCGlgchfpIVolIy6Xyyc8VU1NkXpPinhwt/nkQ8dFdLyl58vtI0RZCmQac/2FLhw+3pI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504077; c=relaxed/simple;
	bh=w9iBp9XVCTEZk9VMiK+jRO/nxhIPYG0l6+l/JMSVZb0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hjT91CIfKhUyftD0TGDbAk29IcPinuC/iKKK2DoYtN0pDvvdjI8LYwiEF8DmdmlMmpTtIZEvqRlDzMfBLBoMfsnNXSJs69vrLoNkz1nkwh88Y5fUf9LD42AQw1UZig2eIMjV7LX35i/oDX1sP7d2b/bWFCS5y+jJVAasZqAMCUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IABYLq1d; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvqTKeAge8SVl5ru0SvRFiNHDUFskyodmRxcaDXHP+OE+5gNUNjXA2RtQGy/nf/c1Ry4LcIJI07slWxFoJz/6z46YuecGFkxoBEVp4MgjlRDWv2g3M7E4kgrucXEpjHmVseo3Bzs3AFD5I+07JEBwSHElt0AOUBev8XsFlS/jcOqKo0jm3y4lKiIkXkxr7a24SPUXRAqRWwi2m/UnZBAetkn149eQdjb9q6dmAqbET3OqQa7x4txNB6TJuuuQOENaztyw6BLdGfsuPzq1eDUxq8quf8Lxh5jqJfA+r8yuCb1mR3PqbGz4gIfD74BL9Gb1UE2yGGTFycGr5cvq3D4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9iBp9XVCTEZk9VMiK+jRO/nxhIPYG0l6+l/JMSVZb0=;
 b=t4JYz5r1KDXEhW9XMk3Z2bOxyS1zn1D1ut1TAjiy+yfJP9WSHf+F9KHyLjFlmiPRdP7OzVDDTzSdY9CkG6CHIw2P3bhapu2KPI2tcLYz0zha01dDerTqy8SnwLJ4d0sYwYH2i84eW1GxeP+TmxkYsxn0WewzveblSdEf6o2VoU8YizPtP2dQHjk3slJEO08AY0H7/93D++Xw6PtJVPzjSigHtlYcJjWLbQkTj1XJr5sWwLh+99Jhfgnl8LWEWbZUPtzENWAYAF6zv8PPYeMvyCRLFQoVKb0T4ydxr/+laNbclpKOVMd0Lg9E0NloEo/drIXDz0yld67aqTjB2m8gQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9iBp9XVCTEZk9VMiK+jRO/nxhIPYG0l6+l/JMSVZb0=;
 b=IABYLq1dGt9/L11wD6jgGQ29ihTF4XJdf7VXxK2FKaFGyZpK8QGCuEYMi1+VjwpvOP+FWn4x8SYfWF8sBEturOVLRYhG+2zg59rjv3iGzJ4f/mqvP0WElmRdvuLGRWAIt7JaQPSur/S5tEEGWkr4jmR/v6/XgNsAPEiGMiokQKZOmh7OtnsNt77+3Vpoj2R6eEOGTBYBra5pH0ZyVMLvB86cOa9I8Y3mxGX0ElFpjQ/+N4CKg8N1sE+JeP5I9fyF0TRLPIoIHBRfkE6FDUZqs/Lh4+QtE6+bQL0TrRHfQfZ4AZFHXyybeZax43jdNW7KJmqOuEmMch9OLhS9NAoyTg==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PA4PR04MB9413.eurprd04.prod.outlook.com (2603:10a6:102:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:14:32 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:14:31 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net"
	<linux@roeck-us.net>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>
Subject: RE: [PATCH v4 1/5] dt-bindings: rtc: nxp,pcf85363: add timestamp mode
 config
Thread-Topic: [PATCH v4 1/5] dt-bindings: rtc: nxp,pcf85363: add timestamp
 mode config
Thread-Index: AQHcWuAAR8BPN5MBkUWbSOAo/I/sE7XucZvAgFH02JA=
Date: Mon, 15 Jun 2026 06:14:31 +0000
Message-ID:
 <AS4PR04MB9362F3E93C1133986D30B0D3FBE62@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
 <AS4PR04MB93628F4BEFE9293FC6E457C6FB2B2@AS4PR04MB9362.eurprd04.prod.outlook.com>
In-Reply-To:
 <AS4PR04MB93628F4BEFE9293FC6E457C6FB2B2@AS4PR04MB9362.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PA4PR04MB9413:EE_
x-ms-office365-filtering-correlation-id: 6d57734f-03d9-4c7f-d8e3-08decaa55d2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|19092799006|376014|4143699003|921020|18002099003|56012099006|11063799006|38070700021|22082099003;
x-microsoft-antispam-message-info:
 +8Sf7OWS4XHF2yrxpAs5gDP9JzxKHTgv3ntd+ZsR7i89ux7sR/YKgIGVTL2jAI7Ydjp69bUTvvYUm4yTWXEyAXs01ZOZpZTL0xc8PfS5jlBnZzljSkks131y9Ki2uG1nt/7XPyuAm0CUYRjatfw6uxWS0o6FBlLlP5/etLJOEtd7KCYDQyrK3n4y996L54Ka/sGZWpcRq9WIZ7PWE0bAD0vKn+a8pidDwb5+LLHBvzYVc2lDUp75w/mYQSuIpdwv96fpVLJrm6FTZeBPeZmwC2xFaH6BRBP38OT02TVeapJDW2axCZpmPGUdo2reN3vNqCDGqyEGqpENZslYm6bWTnJXDJVcbF4E3iAXD806jTixOVV5xx7q5ijCJqQZrWKI44bVkq7H889z0dy2i0OLONcwFm3O0RsvsVScKf6kNcVDmMuP/fjj3KQeVLXDT7acaHzOKeHcLKYQOHDAGPBLEC5ioL9t5hCBqWP35IQz4yC3bSQ4L/b/qTX6jHYtKwOlZArQtphU1OKEqmxxb30ZgzSj2R1Qb1JzRUTbP/ZS0qurUbD+rtBA4wsE14hh3hER642d4XpzZsTT17icB9Qcx7fKkHi2/JrjzeWpSAkRKmbOR52XBIJsoS2EQxgiRnpF7VLEIlhfeoro5i6A7kg+yFngmjhdgYu5DkPuB4496HlfwcqNqFm04dIQSuLdsqiJPENFDlGln8J0jPo7WdxI7aym8sR2brciV9eDXgOD1kBLQFvuSwpO74wzwGfNQX3rOSJjEw9wRbGkAs8CPRgpYA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(19092799006)(376014)(4143699003)(921020)(18002099003)(56012099006)(11063799006)(38070700021)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cRAl8j8vCecUPpbIoSBSVrKOKnUdJNUr1ynhsq7p75nzftYRiRqzq+y2WSN3?=
 =?us-ascii?Q?CU61v5vKU4/SFuoS2Mtb70Xo81I8617srahiy74Vci+2uXzPEf6GwFcVV0s5?=
 =?us-ascii?Q?ARJ+HYE4H/rESMgqAR0fwOyW+Vcg6JN4nfGLMuHbLsB0/3KXqu3BXMTFhiyi?=
 =?us-ascii?Q?gRUZG32QC2nAos6UgWKoh4oKe2PSlFCMqtS17U9/BojmAmcohz4Eb0DZsFJy?=
 =?us-ascii?Q?5o5RuRTuKfvsAaDhUjehGBHH2U9wGGgdRBTyR7wOxeZ0fbm6CieTerlWn3iY?=
 =?us-ascii?Q?5Jq346q70xA4YC8rCs5cZQK2XwWlPH4BIBKMrv8g7a9E8+qQ9Pudk/zjrzjG?=
 =?us-ascii?Q?hdIc0tVBcxDRPj7YKukFm6DCVRvSBnNMmFeaZtEfshaLLKeKD8IvXQ9ad9Mg?=
 =?us-ascii?Q?X5lOgtqXHgc5E8jjqUny2mzWPoikh+7h/GsCn/PDNhpKTk+S/o2jFn6Mios7?=
 =?us-ascii?Q?dhpY5tJG9Xwhy5Rid8TaZfL7ZhLoLDuY9FU0oyn1wNE8qKBCoyWks0ZBVfUe?=
 =?us-ascii?Q?n6rY/zt66Mlz58xJ5aEa/FAmkD0fmCEXNbVxdWiI35iLGynrAfVvLg0HXcA+?=
 =?us-ascii?Q?bE48HUoc1uDKOyskVEaa623dKvtnlcNyqN1zjBChIbT/Il+c7m/Bzi9u36vF?=
 =?us-ascii?Q?AIdMXTvfZLSHceSXCjuHHj3O5240qT0Q4/jxWJWllAyml9dSPICNsQGOGIEu?=
 =?us-ascii?Q?HTFmmP8Jt3Ip1Iyw5k5USLuT85I+JHrZLGv+L0VAUGfxSFe5jbxhKjAfHgun?=
 =?us-ascii?Q?XE+pxqw5FFhSE82RTXTzGJnS+DN0ff2RWY82Gt0KjyK2ExcVsjXbfNfmfMdR?=
 =?us-ascii?Q?Rzg9XVFT7mHO1BBj+hZTE5d9/kB//lxsflxL6AGtcarRJrUSWV7IrUwK4WBu?=
 =?us-ascii?Q?UwFoMjFmcslKMu71tTGPO+3ZGujn83xKnDcsAam4fL58I13AGkyf+/bvGisX?=
 =?us-ascii?Q?enxEMDr0yOHw+P1VwFvUMnW6mbeHT+AkjylvrMyl/CXxqWhmWgY7qfaaL8oT?=
 =?us-ascii?Q?syrhB2k3n1r8SVj66AEv9tbIfCQkU3JJmHSSbcGHvbXEOs21qVHeqd4nbsiX?=
 =?us-ascii?Q?jZOLb6e4++oPhbtvgAzAujpRODevysBfokWJIPrbghBkV5436ijFLkywX60O?=
 =?us-ascii?Q?rKljDsd0ieBJ9AT6G+SIiHrlXEflR2rmB6q3feYXllEwHTi4IGr5PsBxwFTK?=
 =?us-ascii?Q?GQMRLK0bPQiaMdNEw76pg8lQOtE5GY36OgazHrl+gYt+8IhsYo99CK+MdrSZ?=
 =?us-ascii?Q?a99rvIHG4xBCM0tRolKQy5rfxMTegHmrrZXS5Eia7dpbbNzBmiERHiXqMnm0?=
 =?us-ascii?Q?shB1FCrHN+TmsMc8JzAT214wN2UsTg6JZiRdeMUESVqBcky59COINoIbAIDA?=
 =?us-ascii?Q?VU/uuiQ+1oKQWG7Agdk9rfPkgtaHuTP9SnA2bKSPdmPRETFTPBJQp4m4KPRl?=
 =?us-ascii?Q?Qb/xddOX1rveXP5HrF4dT0P3O2l00wZm5NRTHJk72Sb2xAKM/GMVYWJOZ5yA?=
 =?us-ascii?Q?hV5+2afFGQaGYgtm+3zBV7KVBr4eJSNEJAxz1f5/BDL+DjSkli+goTxgvbDG?=
 =?us-ascii?Q?Dvq84GUEbYRnLbAvQy4ZdSCR61K8FaLdN6/wtAQuXCxt6LPmwU9G+Onu/YQF?=
 =?us-ascii?Q?R4awl/pyQ9F6KpbQ62Js+mLPfdi7j/EBEPRjjzohjVh1KJk5pl2DSRq+hdca?=
 =?us-ascii?Q?1zOTOMPpCSyxgepvou2Gjijfw54Fw2U5l0l/TRY0rorPJHNU9lCu/lj7uMKi?=
 =?us-ascii?Q?Y7KY/Rex5w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d57734f-03d9-4c7f-d8e3-08decaa55d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:14:31.4180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibZM1/9TSeOReuGmAU5HxzrEyMFY+f1IT6PUDT2nxT3esK9IgyW1GxytqPju5pQORZnZfLEVv38rTjZLKZjbIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9413
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6650-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:linux-watchdog@vger.kernel.org,m:vikash.bansal@nxp.com,m:priyanka.jain@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,AS4PR04MB9362.eurprd04.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim,nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98B00683B35

>=20
> Hi,
>=20
> This is a gentle follow up on the patch series I submitted in November
> (regarding the v4 of PCF85363 RTC driver). I haven't seen any review feed=
back
> Yet. So, I wanted to check whether you might have had a chance to look at=
 the
> series.
>=20
> Please let me know if there is anything further is needed from my side.
>=20
> Thanks,
> Lakshay Piplani

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


