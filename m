Return-Path: <linux-rtc+bounces-6652-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E0WZHjibL2qODAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6652-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:27:04 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB65E683C7A
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:27:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=TioGeIaC;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6652-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6652-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB04730048D3
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 06:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF773A0E80;
	Mon, 15 Jun 2026 06:23:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326A2DFA3A;
	Mon, 15 Jun 2026 06:23:13 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504595; cv=fail; b=kV6STcXmYqghYdJj3N1uyIfQ8qx/FmnAynqrzbRfIZ4HvOQmtVaecwjDRsa6+IYf4uXzV+VHYrQWw2pc5V1hFaKN9C8KSRtWALk/eQ09NmtSJa6MxpMpVAC9aTwlZ5EYkg23cnFhWOy4obzfcVe8cKh6rS8NjkhUKXwtQffOLFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504595; c=relaxed/simple;
	bh=kpwYwRGuGjgoFvAhZ0hahR/cdoQCA85i1XVYRJmYSjI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dgrc2Po1Cm21F/3gbwMUNHHvaLzJZC+aPNTwc8XRpJlyYsrEqg7YU0xROjGW6G3YP19Ac2tXv5MtheTcpoA6VGQZrJdushIEw/UDoAykOpxBH8anfrFzVWj1sWXDbUpHXTt1nuZBKgDEGZUqZ2wVu8eX6chKlQ3BCeSZSm27DG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TioGeIaC; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpRiWMZlDxOeC0dAgJyzXM4pSdLVuhb32XFcNol20IQ0VbeZqcfAv2K6Sbj0HcJjZBaOauY4DH+w/DXl2wyMKvkKBlD93Xu6JDYOJt8Epug9uH6oW5p+sDw8CmtBP00wM81wBMQ1PqsVf2c8ly1Z5RUIj48THxalED1JGlvE/MGimT9crUgLIg6NvyUeJtkJUSVWKG+eVEcnUMNcw/PWq3YIowT0y5/hmUS3Tp638RBYJMSEaeAMKbClf6jXv8iGZcUAnyzqPOj6whxJDnyWZOB/G8mxm/FcxraXd+oY+Ro1oOAimqZliy4wWLT5sCTuQhxO/TXqYY8st8F5mV75ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1radrsCNIubQJu24Z7gmOJTjYnvlxq6ucaLgwBfT0o=;
 b=NFZJxFtg88j11NvzVyhHIUw9L6O2iWOdE3UXSjY1N7l6+0faMtT6JLQEol1e+dSBpRMU+1rYDP/rj5kuTTfdOTXi7B4CxRIDxaVwoyBIQS63yjKDS4vlh0lkx/4HYmHhGNPxrgVvZY5QMkuHorD2u9hwihpVvVYjvX49sdP4dvR9E9Sexbieqpb880GnXMjVB1I9Yiit8CQm6r1ZU65VCMSDpwqW0dxe9oe0pkdgERSzC/XfjQewwzF29k8DPs8OS2g+gNx5uObxWtwqf9S6tCd0p1DBK2e9g0dNnqY8mOia66epFFBGLGDyJFxwqRyv6bnQAOalK5hNr6gCoNkHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1radrsCNIubQJu24Z7gmOJTjYnvlxq6ucaLgwBfT0o=;
 b=TioGeIaCVmpBppRZ2Hlw8V3CheCv8p9qFD49lalj2rTKx6NDoS+yFGFagvRNXjJrTuG1pJWXz/EMKtFERc7EtoBGD7XuSrK10c5CTu4kYJhwB+NIB2T1/s4xHQiyMuKj+F1f6aLpeciQ+x6vAZltWPFXLB24zTEE3KYtzY5SRilg9vXG9LWYX42od53Wk8SGi7D3QufOgFkb5pLp8KNFA5WkK2vK9pddfE7qLi1SBHniG+7D91FDiv9ubXxXYfwymlPGHEnsmVQl0UNkBB7U/H67KA9hUWrnuAboKe1OD+gFSc3AcOZDAvcAxVo1Jc/ioSW2ZJS0uuFhYPQ6cXRY7A==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PA1PR04MB10442.eurprd04.prod.outlook.com (2603:10a6:102:44a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:23:10 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:23:09 +0000
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
Subject: RE: [PATCH v4 3/5] rtc: pcf85363: add timestamp support with
 configurable timestamp mode
Thread-Topic: [PATCH v4 3/5] rtc: pcf85363: add timestamp support with
 configurable timestamp mode
Thread-Index: AQHcWuAC0fEfpvKJ+EqE1HLqhxCRU7ZAaMlQ
Date: Mon, 15 Jun 2026 06:23:09 +0000
Message-ID:
 <AS4PR04MB9362A6437652BED0090C665CFBE62@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
 <20251121121137.3043764-3-lakshay.piplani@nxp.com>
In-Reply-To: <20251121121137.3043764-3-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PA1PR04MB10442:EE_
x-ms-office365-filtering-correlation-id: 63948792-6853-4344-5968-08decaa6922a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003|921020|38070700021;
x-microsoft-antispam-message-info:
 6KvxS567OB9XbLgBC7S37ZviDp1VFmNfd+OlKWgl81uVx8GxUZ8fzvLCH9u1y0h+dmBWRjifr6kMCN65fZCZsequ4Jp+sqd4HKAdWj3g27a5DigLk1sQp+eAUL9PKLq01DpHbYfKE8wC64eEvbKg0H56Y/vCI8FfxZ9B/APQWRsE5/M+yOluktKKE4iprQKfZk3it1tBIKk2R+rSuQncExD08AmU5wtHEDyg6LaFoSeOKIfBvpv6CM7j+m3dsDiQRXB56PyAtNazCAQp77bewZNTD8SCdK34R69rsLZle71o/VmluMf+z1K922pPJy2wIesLRo2hETSREh4AtrnsOvkbVJDz0q7thaHWhBlPxK1+rk45OX8hyXoWnRXo9ysyCZ/EHb+Cdlz0n9O8/8ax/FY/cvmbneH9BXcSBEWmLlLM5GKzX7woJUKzoV5sF9J610HnJi8jhSwBPsUkyyVaGWfz49dMMSdf9PqhEPHZE1afhk7+1EWar9RDkyVnYpmYQY/BeXeoX2tB8sDqy5V6HFbPPDiDRBjq3y/nhDf7e8XQ68mXtoa3MdCgRu5GdYtmULsgCx/3ml8HJcQxKeONEMdZP0nqasEmpGVTvfSR7OHlRz2njS16qmTr6F46rnyJ5+UtvxTu3ouMqXakM1ELaDdlCN2dg8goV6epA0jnaXM7K0CR05iaS33YhJFdyf9yNrwtaKbTgAPZE7Z/bOqVKLZKfEnEE1l3EkUMwGAtP0QbaQWtsvx80ewT5KSZLtEIJIu139A72YAnX/yekvCrvw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?10BuFzSchNC/2M4VIiAGryKQdZVtfjN3poyDGp/YQKiJic88HHPozT8mzP1M?=
 =?us-ascii?Q?/OHYNmb3Q3a41vwNETjAxgQPk6Sli35/Uh1QROFvDYoOyXnyTxxOBPqQiama?=
 =?us-ascii?Q?vYr9F782gQ2IDGiuqzWWApw3ca/pelqqF+lkAvJDGibGXizj1Xx7MiMEk0Pr?=
 =?us-ascii?Q?iEjgSyNyqbY6fYSL3lz46duo0av1jpjJhwhb3uX98RKsET2taKEsrUgUSeQe?=
 =?us-ascii?Q?bTz6iWxuzpPmTDHn/79tiKWh5TvyV6yOMwdt5JxsmBWYb3mxuLWd55MwGVsk?=
 =?us-ascii?Q?omnH1aSB8fkCixndxfQjnKBkeEGCtE/PjmhYTsDNbqbwV2RHwjagLNNvUDDJ?=
 =?us-ascii?Q?kmi32NPHKsMxzxn3EM8lK6hcztpSbZAWNxu8BJeaWm1wH05L3oYN9cxU+ooI?=
 =?us-ascii?Q?7E/s84xjplmULE4/cSUv7zlwkbd1k3+d4l7S+IeCklyy9iMic/lzhZXqkwWA?=
 =?us-ascii?Q?C2gL9AEYAFu9Cu9s6C/5xH7+bB7VxA90Dqu2ICA2ZaYOtmPzAe3tqNOtCls/?=
 =?us-ascii?Q?ZvwOGhGyIBtAxN8/VLYP0Dk+k3d70Xakho30q+W49w4hLFwEVZk8j1yTuBup?=
 =?us-ascii?Q?3PodrxNkRYzbIrGID8xCvgHuMeMeqyY1/KTMWgmfyrhfgATzNRMaegqOsLPv?=
 =?us-ascii?Q?MEDX/EK4sdlVVNnn6+ZNGwJRAqwufLCl8RS/+BisLUhJ2Ez3ZiZ6jm5M44IY?=
 =?us-ascii?Q?oMlDf9jjJi2sCdaWE3S6yvxKos5h9uPJmsFgmydlJhyGm4vMO4RxXAO1b5P8?=
 =?us-ascii?Q?N2m2g5zF3Hd4uaVpI8rkhZTBRW8LsQuStf7qdBsaBnIGeFKeT4WhkWQJ3VPi?=
 =?us-ascii?Q?vDNdima8Ipj6/u4wvTusGrhS8ppA4ZFRlVneqFp988lshZ8JpHmbTTxMpRSw?=
 =?us-ascii?Q?sMVQu0F7MqIchGPn+5cjxt2dBuTxkqDx5mmPWkvj2djpWTq3MKzLkCKkIEGE?=
 =?us-ascii?Q?DIbBK/LrHP2DugDMRT93axSBW/kmPidUtw9tIlNlz8IYCa7qeuDdJ0Ssubq4?=
 =?us-ascii?Q?WcEaCsl6LUJEt9TD6/bohQ3Vb5IRWK+381K5JBPzfmORVzm2ODR1PYn95k+E?=
 =?us-ascii?Q?0cFN5HPhsE/vt2K9pQhXTXT8il0peO1RPriT3n/m4mHLcHAMGE90wK6J4kdT?=
 =?us-ascii?Q?5nQbPBuedBrOu9Awi9WgEC1et59ISnW6xAAgSwaGGmbGieHMAFmTjvVFtQVf?=
 =?us-ascii?Q?9Bfpp2sLnhOMXVVWSbXbJZ2FLa8snNwREFyjHRg7X3q10lbiH7KUxVtoEWVP?=
 =?us-ascii?Q?SZ4A3y9xmBNzu6To1Hjgkz9vfU7Fwpcx5OmivLZCd/Gm1A/EurFub2E8mX+6?=
 =?us-ascii?Q?ZCFB5P/6mtnD+P/hNpvbq/iebjBfAOZ0YewX4fd3d6wpJusdpIcLuIlU/u55?=
 =?us-ascii?Q?AOkFiLQkQA1I9kbe33obUPdGZ4s2bbZrUM40//rmiFJQgLY1Bz06C/Cpd+u5?=
 =?us-ascii?Q?Syq8rWc8evlzHRwzjs/n+EO1XIT8l6GmKXGMMNCRY4ZH5zGQrvwSuUbrvCHK?=
 =?us-ascii?Q?Acf3IVSuRIN5eV+PiRrZh6TXxFdfi7nQjmtrgD18FKJfGzlthPDccV65YB9s?=
 =?us-ascii?Q?kdbzP+Ledo/ftzE9kglk60HWiWmWPr2HTN5cxm1U8DnlHEZxoWZGNjTnqSLI?=
 =?us-ascii?Q?GUdHWu/nQp7EaToHPUdDjuqtiVK2SR7fYMs/igsFBS+JY2j7Y+cgk9rsnEtP?=
 =?us-ascii?Q?dnCfIuRLHb5gvqirSdm0de6s7CdTN1L/Y80IeGaDiuweKwpnTE0NWtlZvLrQ?=
 =?us-ascii?Q?pTzMfiFP+w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 63948792-6853-4344-5968-08decaa6922a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:23:09.7821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/+W+KPfYRF63jqClaiRPaU0zD/wNQQYjrYgeN+Kka0DHVIAz2QM+n3Yy6Szfi7Ev1e7ibwn6rf4m8j2FohiMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10442
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6652-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB65E683C7A



> -----Original Message-----
> From: Lakshay Piplani <lakshay.piplani@nxp.com>
> Sent: Friday, November 21, 2025 5:42 PM
> To: alexandre.belloni@bootlin.com; linux-rtc@vger.kernel.org; linux-
> kernel@vger.kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org; wim@linux-watchdog.org;
> linux@roeck-us.net; linux-watchdog@vger.kernel.org
> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Lakshay Piplani
> <lakshay.piplani@nxp.com>
> Subject: [PATCH v4 3/5] rtc: pcf85363: add timestamp support with
> configurable timestamp mode
>=20
> Add support for the timestamp capture registers available on PCF85263 and
> PCF85363. The registers latch the current time when selected events occur=
,
> such as TS pin activation or battery switch-over.
>=20
> The capture source can be configured via the nxp,timestamp-mode device tr=
ee
> property, and latched values are exported through read-only sysfs attribu=
tes.
>=20
> Additionally:
> - Use rtc_add_group() instead of sysfs_create_group() to register the
>   timestamp attributes under the RTC class device (/sys/class/rtc/rtcX).
> - Perform minor cleanups in the probe function for better readability.
>=20
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> ---
> V3 -> V4:
> - No changes in v4.
> V2 -> V3:
> - Split into separate patches as suggested:
>   - Battery switch-over detection.
>   - Timestamp recording for TS pin and battery switch-over events.
>   - Offset calibration.
>   - Watchdog timer (to be reviewed by watchdog maintainers).
> - Dropped Alarm2 support
> - Switched to rtc_add_group() for sysfs attributes
> V1 -> V2:
> - Watchdog related changes due to removal of vendor specific properties
>   from device tree
>   * remove vendor DT knobs (enable/timeout/stepsize/repeat)
>   * use watchdog_init_timeout (with 10s default)
>   * derive clock_sel from final timeout
>   * default, repeat=3Dtrue (repeat mode)
> - Fixed uninitalised warning on 'ret' (reported by kernel test robot)
> - Use dev_dbg instead of dev_info for debug related print messages
> - Minor cleanup and comments.
>=20
>  drivers/rtc/rtc-pcf85363.c | 209 +++++++++++++++++++++++++++++++------
>  1 file changed, 175 insertions(+), 34 deletions(-)

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

