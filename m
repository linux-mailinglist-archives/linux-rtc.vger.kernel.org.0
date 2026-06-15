Return-Path: <linux-rtc+bounces-6651-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y3BPBOWYL2oaDAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6651-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:17:09 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B51683B54
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:17:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b="MxP9YP4/";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6651-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6651-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B45EB301E583
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 06:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B90037E30C;
	Mon, 15 Jun 2026 06:15:24 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5E3612CF;
	Mon, 15 Jun 2026 06:15:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504124; cv=fail; b=Arc3hncQAUT1v1WJXVj7Ye8fitWKQ4kDF6FXgIDhjJo8DWLW4GJ/HvYnvIU/5OKvJAP/G2UHUoyAi02b0BCmScoWDplMOisaS6Gyy87729vVHnk36hERMGFvR/BWzkgUpalzFfOqEeRkibm5pCTycW3iUpLZQIQx/XsCi13IhGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504124; c=relaxed/simple;
	bh=haWMKF+bMC3SqKXA3fQ5j2tS4y8533bJJhykiMAI6vw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZDLyPZ81C+XXnqQ2tzln+bCxjDJxNFY9FqxteGN9GX09MOqmxvYQCEkOE/VetF401m4qRDCf3ZP6tnr7p6Ef5icv3YbJnn9nF2XTBkWxVu/duTbDxslq4TaWBpvTFE98x3y3BvozsWMG3KtWp4/lAcGVdosZQTSsgsvon1aKQQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MxP9YP4/; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4+nsdDTzh/0a9BAlg/2G1qbsQm6C+MPN6Y5wDrwIz75X/yHXmudQoWL7vzRprMI3Ih2/NpBVo/ceS624/YSeHd+Mh51+Cq78bz1f+X+LHEk1Vm9/K7LfezKUfFmY7wj/FkWbcTQJCV6JVoFAUWUbJj3KLhByL9fUvBc43OtMmnyIwOlpEixNEG3oKkB93j3xOX3HfUo5r8Z2LREL0qRcqbHCeQ+rzODxYLCG01emgP+Fc0d7RZBbWYlJRsHlH7xuJSQT3kjxDnJzuVW4IokXGaPn6VwzJuXZy1gcImVdO6OVrG1FnrrlGTCOx7ac9LIGb0BPertxfBhp4n5bAjfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haWMKF+bMC3SqKXA3fQ5j2tS4y8533bJJhykiMAI6vw=;
 b=tvxrwtEmwZTbL5bT/xCI4KLaOD/8jRz1zcvPxKf2Oa7b3gM+9sCz2K5H4iqXx9TVCIY6GuF9269FI0HaCrt4h9YtiFKZzO4HrafZW+eztOUzsHxo0TdHWQK2CIdGa5foWyrUdpIMKcceD9D+HrXTqBTQxKJLb1MI5AFFolurqJKPC3nOUyiftVUE1Bt7LCWOuf8ppdNjA2KAfN0cQnB07uqpc2yOfwUGCFzjmCs5AEQTQ0wmPB34prpEsjDl3ttKD7XcEGab5bTdoEBncsS6f0jbXmfEuvUQxDVqM8cVJgSapyno1TYWXZvf1AtnrmNi6pLIrpaZwAkg/Bn+OcGFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haWMKF+bMC3SqKXA3fQ5j2tS4y8533bJJhykiMAI6vw=;
 b=MxP9YP4/Tno84PurNyZcOzRVzqWJJtHzLaXSPQ5sss9xVt04fqf4i/7OkOmQxcpLoiDJ4g4mIqaTGZIzbZlIFZlD3vn+tfIeNYniHXYHzlqmBn+naP5PCBP2t1yTMx0RzAzRsBYR8VaEn5oJ/DtCKuykZ1fMoY0nCa2ZWvEx7uxiJUNPnXSbCFDXWWsHuyxQc2MbcaQKFYlYgXYvDE6LfABz5rWJiPXANbHiSrfrM30h6BMSFGhGXQtN9/gxJby9BHxRP9KCr5QS3k/wxdbo6vR3ftRhhF3yfnzvQzfvAVjXLtxLjPB9/bgi4scguN9N4jW4YTILn360u8SoUWY5Mw==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PA4PR04MB9413.eurprd04.prod.outlook.com (2603:10a6:102:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:15:19 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:15:19 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: "'alexandre.belloni@bootlin.com'" <alexandre.belloni@bootlin.com>,
	"'linux-rtc@vger.kernel.org'" <linux-rtc@vger.kernel.org>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	"'robh@kernel.org'" <robh@kernel.org>, "'krzk+dt@kernel.org'"
	<krzk+dt@kernel.org>, "'conor+dt@kernel.org'" <conor+dt@kernel.org>,
	"'devicetree@vger.kernel.org'" <devicetree@vger.kernel.org>,
	"'wim@linux-watchdog.org'" <wim@linux-watchdog.org>, "'linux@roeck-us.net'"
	<linux@roeck-us.net>, "'linux-watchdog@vger.kernel.org'"
	<linux-watchdog@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>
Subject: RE: [PATCH v4 2/5] rtc: pcf85363: support reporting battery
 switch-over via RTC_VL
Thread-Topic: [PATCH v4 2/5] rtc: pcf85363: support reporting battery
 switch-over via RTC_VL
Thread-Index: AQHcWuABy0zhPyNU2EiLswzDq2bpsbVpDNdggNdZ8eA=
Date: Mon, 15 Jun 2026 06:15:19 +0000
Message-ID:
 <AS4PR04MB9362B8B7A103E3142AB8A9AAFBE62@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
 <20251121121137.3043764-2-lakshay.piplani@nxp.com>
 <AS4PR04MB936215FC06B8ACC0F0259223FB9EA@AS4PR04MB9362.eurprd04.prod.outlook.com>
In-Reply-To:
 <AS4PR04MB936215FC06B8ACC0F0259223FB9EA@AS4PR04MB9362.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PA4PR04MB9413:EE_
x-ms-office365-filtering-correlation-id: 61cb6c33-8c6f-488c-1a93-08decaa579e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|19092799006|376014|4143699003|921020|18002099003|56012099006|11063799006|38070700021|22082099003;
x-microsoft-antispam-message-info:
 SN45HeYpmu3ts0dBlbakdP0oWPtvcOJStKq074TKOeYD/VgW2HJGjVbUTeVnI+ghvGk1TeuJxQRdbQtemMsDt1M+nxPo8iykd17AnIDi0H46puMZEPPgDj4KEBASDWu+T+s96XKbidylZAiMJT+iEPMELcHdSoiYijYh64tkLCkiCEIPjBtNZtviUKY1ud1IYlSToRLcE/zS2FvIcSimaemqnuL8sOycEnPkVCfHjinmrcKfCxa2uKGIhygppLUGyM/epIlEWeSUNmp+GqGOZFLUW1vydcMeIEwZcT88VAsBQYG4jhBHYNU1Zwj1gqd4nhI1dczYNyYzTgOIcgr+p6sueQ9QwrztvOGACkRuJKK2/d5ecQb+d+utNQ8u/dKm+xYcNQL9SxKBM/SUgvWHQThYm26+VJSWyVorXbK4oKFJKD5pSJQ5nMaqzDX3CeCcG5cMBPhMJDdLG2b5RTXwr8O99NUdv7HPpy0fpQp65IEz9yqkOzd/WwMYjGs7cYGAwENrT7hESZYqdH6WJb9hrPP5p3yIIfdhDOE9EeN7Nz33Y/CRg3z9EWWmIh2bUdAuB8zF9tOYrlpFc9tBGAtYs4sg/ZiEqUokC6k6C1ZkXoQ8sXUgSjrH+vNfpfkUfxekZsz8q7CxkTTi0/qORl2inAeF11SPDqcpETt32owfCwHdZWyplGEcceZv4BcK3cmh6GoN2IqwtQZGK64/MJ1/QIaLuKunsAwYEWvgMDeOsIop+FylYHTuxlfUJjOUzE0CIqJR/qnEZnehYZgGkTY8zQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(19092799006)(376014)(4143699003)(921020)(18002099003)(56012099006)(11063799006)(38070700021)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?h6PK0+rNLPK1oH6NvMCx9hLaYNPczrk3cP/Wspl/vViIYkayvwzY4S/7cr+i?=
 =?us-ascii?Q?YVvEBvmnuuZt0C+lEhLOtjtEFnqvA/QBXCHcBnjCJiMJldD9xpRuHWlnSlMY?=
 =?us-ascii?Q?5QqLm8YtjP8J9BJxh0aj4/EhQy1RPkdlwcdOa0KJn0vemOJmm+FzMh+557mG?=
 =?us-ascii?Q?GwZTItrsJkSpyJMltVlVDPIVh3iwcZ5ugrHHWNYrnpVqR8Xda2ULhnxFBgSn?=
 =?us-ascii?Q?XbGDZhCDADe2CcCK89D6/JgK4ltccbJToPXi6PUR4AYk4r+qB2pGUD93e96Q?=
 =?us-ascii?Q?uMMGyp3BP8YTehdsgbjgTvwCt8+tY9DcZNOsdKszpSjRMA294u9kS+bFRyFs?=
 =?us-ascii?Q?GhsARbLoihoh+wea4/KPOIc7evXTJVQIS1YFvd7lP3fRpXEOcRFVK74YZnFD?=
 =?us-ascii?Q?8PE+FqOv6YphcoqrITvRP2aRxncMCU5+ejNGIlgflueopVGYJwuew4zDXPBo?=
 =?us-ascii?Q?j1bR/8dNfOTSGptmmu2B8rEj3uHZh/0FO1JBcJwGpB5vpG4myZT6FTMbRiGR?=
 =?us-ascii?Q?fHgQv1hzE2gA56aNLAH1rX4gzC329MnpW7wV4EbcLApbr8fA1M1fZS+wcoc7?=
 =?us-ascii?Q?hGmM0BKwQhjt9VZ8RP/07ilw1NS6f7JPPF5Mo0RF8ITUbJyXjuKrAnzityIl?=
 =?us-ascii?Q?/Ik6LSTm7dOQbrHW0QaI/ZtmHQ9Z0WO5kaEKTpycef8iYsT7iPMRdrmWVFDh?=
 =?us-ascii?Q?ZdRe2UGp1QSGTm1DKSnoEz9ZeEJiFYrbGB/b4BKfJnub7nCnTDTTt7vp2qYF?=
 =?us-ascii?Q?vi2ZDOvLQkdjOqPljsWcm+iTGC4xVMMzQsgdFNOK4d8OrfV98r6COU5n2CqL?=
 =?us-ascii?Q?CUm0qse4cKvadHZRQoa3fzbuXXJTbN1FO5csq4QaYb3q5YAaU86tQerhQW9S?=
 =?us-ascii?Q?emEfOp7LBrC5gvKA3XUNoAHBfUdr//JS43r3x/aPIFEgVjBV3zy7WK/cl+nL?=
 =?us-ascii?Q?o7P/WraqONodtbXdEXBJTgs3bFIcrNX6KcX9vTzKvOlIkyx5VNBtoFNdEhw7?=
 =?us-ascii?Q?DCQfEboYcHn9U7IYvYIoDQfIlU6oQU56WcmdgJWGR8VCwVYmLHhEAKDp8WiI?=
 =?us-ascii?Q?MvypQlou/MvXuCquUhnD4HHdSIiST/sl9SyAlFw/KmArFVCPe9iBhUccn6FI?=
 =?us-ascii?Q?Yr5eb+4fYhiX/1kdyvh5P00v56IEGAwaj/Xqr0xu4AEWkCncWOXkrNEZ0kbn?=
 =?us-ascii?Q?n6rsSIEEyOeGwuq/Na32C0f1e0DnIhuzaQUA2KR8Q2cTdp5hxDgYSTL/cmoh?=
 =?us-ascii?Q?Q90Kp280xKdILrH/SfyNF52FqSxOVdHg7v/tEDaoB+2oACrsh4GL3IkA+LR8?=
 =?us-ascii?Q?rdOO5GP6pxlE7mDeAA74M6sKCtLX5fYCdYRgnFHBj020CT8flkluwOxs8+ex?=
 =?us-ascii?Q?n3SOjkPJD3bip4zgo2zDPb4rphQ7pSQynT+EemplLo8z2RAmPJ02sv0GYcbU?=
 =?us-ascii?Q?F1eOvsOANcIM+fAs8J+9sgEvZOdYcuMC2RKldTOVxuE74sSAWR08OMxztQcP?=
 =?us-ascii?Q?t54QYIDU7iSdhy4Lyk0lRek7Y2AgYYxHuWocVI8HlCQPlqi2bSA5nV08IwTy?=
 =?us-ascii?Q?L/iLdEfriCe9jl6TKl3A/GqLKtqXYrxfbne/+tA1LSJzmSNYv/QUDVp3znj6?=
 =?us-ascii?Q?fsV7eiyECdPg7Nhc61WgCHIP2d7jZmBL7yzTFDNBM40GaSIUekSCq2BkChPR?=
 =?us-ascii?Q?2kmKRy/Z9hRoWP2T2pz9/Zxy6sR4gCidVDeN+mcQMmBpyNLUp6YGE9/2+b6G?=
 =?us-ascii?Q?UQJC1tNKbA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cb6c33-8c6f-488c-1a93-08decaa579e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:15:19.6237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DX2yCnMmgIGgb2iFtnG8GVERAMyyqcCQpBDXc+FhiL+vEzlHeR9T0WgXRwjsQOwYBLQOVaWYNOr041WNZF91DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9413
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-6651-lists,linux-rtc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:linux-watchdog@vger.kernel.org,m:vikash.bansal@nxp.com,m:priyanka.jain@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,AS4PR04MB9362.eurprd04.prod.outlook.com:server fail,sea.lore.kernel.org:server fail,nxp.com:server fail];
	FORGED_SENDER(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,AS4PR04MB9362.eurprd04.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60B51683B54

>=20
> Hi,
>=20
> I'm sending a gentle reminder regarding the patches that I submitted in
> November.
> I haven't received any review comments yet, so I'd really appreciate it i=
f you
> could have a look whenever you have some time.
>=20
> Best Regards
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

