Return-Path: <linux-rtc+bounces-6653-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qyRRM4eaL2prDAUAu9opvQ
	(envelope-from <linux-rtc+bounces-6653-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:24:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 25367683C19
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 08:24:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=j5KG1zRu;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6653-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6653-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 882823002325
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Jun 2026 06:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFAA3AFAEA;
	Mon, 15 Jun 2026 06:24:04 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BC2F83A2;
	Mon, 15 Jun 2026 06:24:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504644; cv=fail; b=QBzl4ob3PHeh0HRooMG9lvMRSiwSboNhFOkMzqkO4FZ3m+co4pySaGjUc57XF70PP3escvnjlKPdOCbjl/IJYLf2n/27kYssUtcOASD5SfKFbh9f24+UQ9iIR5hQ80NCM/kyDuW7XX1wIxQqSnIzPGrXNx31Zh0n66TdQq8UrLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504644; c=relaxed/simple;
	bh=qX4JANRi+dGHK272JRBcBnNK+p8SHXC1UPMkzcwmbyw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eJnmNNyIOwaSDAtml3q+8MIVhMpUHf6Ll4Aqor272uaY4z9WdpPOZ/hemnUvFIZPuqQPUBTp3P5W03oSOTZtZQyBA3z9qu/GEddAEncO6iWFT+GoJ0yxytFGaVVaHTm+hzz2EE1dAS8kw1t6AWNtsM8jNMpegCouxka2Nr0ebBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j5KG1zRu; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGH++Aw41wngGk2ytt55ojsaGxT3WqVwUBUhaZ/Moww2aywIi1t/79tnlTkJhT8vhs5I7mPCWzD9c4z/TCC1fyNdlhZsSAR0BwOQ5HfqnfjZKmdU2p1pYQRCfxI5SQsluiMASihQre4KVIRzzePgGISWHnJs2RyA0z4DGfiiT2/FEKpfC14phJTCLSBz4xtLHV8aIZvBrqRhrR78xtNngvGxvGYT2YjQMm1hCzl1TVa8a8kA1eVwUsnHosm/hDkVDrLKjznPmQhHSWiam5EXrqbWluG6Mj4Rr5BqRtOaKdgtIacStbK+wX2Zk1DgsBw6b6NX7/GzVjcnktghHCjmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2eJNN4dCHKXCHO0PloeRFlBAY6RwNLqAxvDklrwRSw=;
 b=TfM7ZaYih7Y9suPaukwrTmofmnRpQUkJDyeGcaSB5YCvMqBo3X8SDUi/kSZgpC+7qN/yfeHBqiwz+K04SC/5AqoBohuAbm7m3A/60k3plw5rQMoQJ20ofo3nT7xZs6OT7TQbXvrquJGlseg6PymXa7EcM727nH82q1RXfPO+Q96wY0Dm031UR6GAD9fCrluUiocnrMIK4vpWWPFIUlorxNEID5rMS6EeMjb9ICRFsFI6aXM4C++yIJfFJTnmkM46ZOqLmtycDT8EPbOBqzCOWgtG3E+2xgSmWEVFq3Xjlmc8uONZhgQSOHZkl1m9FXlffMatBXbwZneugsr9USqdBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2eJNN4dCHKXCHO0PloeRFlBAY6RwNLqAxvDklrwRSw=;
 b=j5KG1zRuS7isbksrZK5x93bPHZHqlGiulOdwuQjXzSMxkpoUHtrA9N7qv83LL/k7uVDeQXZEfToHnSnFdv+36I2ypu7duFr12zwCcIZFiT9gvprr07aQr8t08JToiFKLlyWFFhbKkeSvaubgX8wE44ndVmxqbK9F3AQMEWCiVMwasIjZM3fDaDtMguVDYGKUrHIGz7TzKXxnwO4XcFeZtnY8LkM8HCGmNsB5TQ2hAZXZPZiJ0bVfnjaUGCNqvWHuxMAL87+U15lvNewNXEOJpuQGuH6InN59Qql18ay5s0Rb2jyy6/sQawzn03OIoqUDPchQIrYwQVCnOon78DnViA==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PA1PR04MB10442.eurprd04.prod.outlook.com (2603:10a6:102:44a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 06:24:00 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 06:24:00 +0000
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
Subject: RE: [PATCH v4 4/5] rtc: pcf85363: add oscillator offset calibration
 support
Thread-Topic: [PATCH v4 4/5] rtc: pcf85363: add oscillator offset calibration
 support
Thread-Index: AQHcWuACYg9aBq8NxE+gxgdP8rIcubZAaSDA
Date: Mon, 15 Jun 2026 06:23:59 +0000
Message-ID:
 <AS4PR04MB9362CCF065D9A8A26C7325D5FBE62@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251121121137.3043764-1-lakshay.piplani@nxp.com>
 <20251121121137.3043764-4-lakshay.piplani@nxp.com>
In-Reply-To: <20251121121137.3043764-4-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PA1PR04MB10442:EE_
x-ms-office365-filtering-correlation-id: f9c25cfd-63ae-4ad8-0f15-08decaa6b00c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|23010399003|1800799024|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003|921020|38070700021;
x-microsoft-antispam-message-info:
 2dQJklRyhTG1opkqWu4/esQZosyR6qXJ11w8dUPhjoaeBpzGWFom4idUFmagn9DQxOA/wvQQz8FM3enmUANUQcoBvnywr2jCCHTl05KSYaAFGWpJRMAeT9hgPFbo+HjnWqIGmPtAtwVQC9xZSDbCLDDbZbSQgeU+RydsZxwlWEc7fYKwxQqkwGf1Y7phGVpA0HY2zlGgZPSqj+AQjo2AQVEhL5B+RiqcDLMIciWj+02h0iRNs856S4kNm9dnl2WCSuXojSkJdmm8BiHapxUjKap8sD6L8aBRdF7QzCFfCtkJWtxfVvymqFKsYAVcXjuIZikXeeNLfg8mwEEe+EA2RXFIZ9UzKxLOAV/Gx78im6O56zwf50ruoBVKW2ii5N/C/UWXpNU8Mi6h5XoVYxxMo20qXI8S2zVvfYX+KntlVLc55/6tiQZvg8F8leAtMHzGYVXPjxOqJDK0sQdyE4ApWk9t6yb3xEHkneQXa1ePY6pMgPfVMNyjPUo4cZvYffyUz+Cc9N+Zq4iL5Nt1vDYYFy8pUETPRqrr9DEAEK/ED+kfAVs04g0DgDjycLJmQRJtOFB2r4kelB2paUw7ujFBnCJxOUSZzFf3bxNMg6QIaYHqYV3nF6nr5AzXL94P7k6zDB9397VTs7pLxooVaNEa6CQ/db5VCR+jNxd2yUgGuVKkRmY5ddDfKVqCmK4rLebEDunfzfjekkmXWdi3X7kQbXhMjHRWYXYeAaLerWlTjamJiRaX/pufW7aR5SjUikA4Fe+2+AYh6jo8AY81sHZzZg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qj3hOGxCJP8+lZIn1TdMuSFTizzKKBwkV2rzhGqEr+muP9qKv1VF9/Znfn6D?=
 =?us-ascii?Q?YG+KLSxaH1Tqb5XGH3lZ7BuzQaCnDGpYhMjKFxCdNIWn9FmpRnFWOovFKw6R?=
 =?us-ascii?Q?/QVHz8ieP5E28Pf8stVvbjPvMeDsby/tzu4HgZ6mICP3hTX2zm1KBGtnurDU?=
 =?us-ascii?Q?/1JC7PjskwpbDINUzAsU1pwkWbDE9eKGD613UFikUvrj/8IsvKRUklDUw14x?=
 =?us-ascii?Q?dzCsxBs49rYuWYGAquTbauf6coTuTG2K/zlwntr+IcqBxrZ7NIqp0tpL6sJX?=
 =?us-ascii?Q?AFTqedYibSETFyN6iUNynm52GMR5P7u60orQqV6xBVJ1qi1B9XIKHrdVzJMo?=
 =?us-ascii?Q?153tQbiBmVG1nF5nWq1CYaJB/TC1HvR0fykzTTRRt2K4OHk4mt3VWjg4MVOf?=
 =?us-ascii?Q?vaJA2u7vJLMzrrHx7z4nj9rO0CpR8hMpCHMwqP6e5T8jlPVaOkMpGTros5eb?=
 =?us-ascii?Q?/A5RCXkE46APqFsxadx0kZyathPDRvmF6gGH6N81BxsimkLQVb2S3MI6HMb5?=
 =?us-ascii?Q?04JrNAcqShOvY0TPB8u0i/5BdSJIxtDMonFoL1uu79NlG4h1opQAaua5tFqD?=
 =?us-ascii?Q?Rn+3nnSxvzJg3Ooq+MnwI+oqKljgcoQkCHCIHjHB927aOH7d6bcDXNbyACSj?=
 =?us-ascii?Q?5l7QaUrh234oZIxuyoJmDqZt0ttBV8OJj/6fX0xUN/4TH+wgWGhvw9AC5a+T?=
 =?us-ascii?Q?SR/HQVhevPlQ9RzUgHqhq94uOmON47r6uQ+5n5pNV9vWoRDpDoq1PmFJfDU5?=
 =?us-ascii?Q?oDfy/yUx3f7uyJiHuiZNq5DAc/bG3kULjs2OTAYQkVMTHT2SVYTVTVdzfxmy?=
 =?us-ascii?Q?aQ/7MjUXc9H5I2ezROMSxsZX0lDVqw9nkSIejN52GdH4JtVZueRevlKfR24i?=
 =?us-ascii?Q?NVjgvjjKzDnUKYahrmCQ2CpZgxAR0zlADVC5FOVw7rqE005G2r4NitpU+3en?=
 =?us-ascii?Q?vqxXvWfBFqyyv2ggVGNI6HhpcMa9MzWD8Bst+dJro1je6mSlYcsfwD9YVQYq?=
 =?us-ascii?Q?ktotZGn/hv6FWll+Le+bo4CnbN3m6grhT4bqyjIDC5t5C0SEKIlG14CeN3n6?=
 =?us-ascii?Q?KA0G/KLbch/pmP0oWmIUazx+jr5hYYYtUvYQKoQPdxVE+RuGkEbjsgmmZigX?=
 =?us-ascii?Q?PG1zRkzBMloPZviJRWMEQfcKua0+57lw4X/nMfxrvjwFngm8Z+X5pfBqcMPh?=
 =?us-ascii?Q?A201JoJ2WC4VKOplDKp5Lbdhtkx9JMtTLoNNG9688/622gYr8p0RNDbe52dU?=
 =?us-ascii?Q?j+9JZpJsqFiE5CILx1nhJi/ytqpiwfF/T7/7BqIFz/D8NlwIO24VSr8Mk5ph?=
 =?us-ascii?Q?yy4CVn3jZ5DaTcBel88tei4DEOjG3S2kWwdbJ0fQd9ljk/9N4B+Hrsxk2QVj?=
 =?us-ascii?Q?8trK/5xRMFrT0aqOCPmSAVdFqvFNkTwf4vV3Fx7sjrnbXq6xplbS9yY4dExJ?=
 =?us-ascii?Q?sJss7vGLKpiu859IkbxWqCciVkp+omvCrA3yv2HE53RQH4w17HYmFmfcSTjn?=
 =?us-ascii?Q?wMvWxoGLL72VH9XvlNo5Oa3O3bYgKpkiOQicJrTnU8KO81+1QQ1VQM6qjG8k?=
 =?us-ascii?Q?pFWaO2B8xtF+MCDyvrmFaZmcDJWQzgUW8ysBMmmgxPNXuNLwrwzwiCFlUA/O?=
 =?us-ascii?Q?UCRizyVZ1jsB1q8SkIOnouu4P0ohEvJ6ITaM7CxIMyBrs/rKADOLWHqoIoDv?=
 =?us-ascii?Q?vb+tYcJSeEUfaPzS0Yt/ws9ZoozF4kyU+9IFZv646Cx0zBwMdorTaWCwaGO+?=
 =?us-ascii?Q?xorPgfpG7Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c25cfd-63ae-4ad8-0f15-08decaa6b00c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 06:24:00.0059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUgduAXCOxW5cdNU9nNa2YE9A/8lCzIpndJ7w9GAxEVHHjWjPOBKvYmwiPhMRq1rikmM6MZG6EP4Sfz/6CB+zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10442
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6653-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25367683C19



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
> Subject: [PATCH v4 4/5] rtc: pcf85363: add oscillator offset calibration =
support
>=20
> Expose the oscillator offset register of PCF85263/PCF85363 through the
> rtc_class_ops read_offset and set_offset callbacks, allowing userspace to=
 apply
> frequency correction for drift compensation.
>=20
> The correction mode defaults to normal mode (OFFM =3D 0), where each step
> introduces an offset of approximately 2.170 ppm and corrections occur eve=
ry 4
> hours.
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
>  drivers/rtc/rtc-pcf85363.c | 46
> ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>=20
> diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c inde=
x
> e10e58f69012..665bbbb169b0 100644
> --- a/drivers/rtc/rtc-pcf85363.c
> +++ b/drivers/rtc/rtc-pcf85363.c
> @@ -123,6 +123,11 @@
>  #define TSR2_SHIFT      2
>  #define TSR3_SHIFT      6
>=20
> +#define OFFSET_SIGN_BIT 7
> +#define OFFSET_MINIMUM  -128
> +#define OFFSET_MAXIMUM  127
> +#define OFFSET_MASK     0xFF
> +
>  struct pcf85363 {
>  	struct rtc_device	*rtc;
>  	struct regmap		*regmap;
> @@ -359,6 +364,45 @@ static irqreturn_t pcf85363_rtc_handle_irq(int irq,
> void *dev_id)
>  	return handled ? IRQ_HANDLED : IRQ_NONE;  }
>=20
> +/*
> + * Read the current RTC offset from the CTRL_OFFSET
> + * register. This value is an 8-bit signed 2's complement
> + * value that corrects osciallator drift.
> + */
> +static int pcf85363_read_offset(struct device *dev, long *offset) {
> +	struct pcf85363 *pcf85363 =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(pcf85363->regmap, CTRL_OFFSET, &val);
> +
> +	if (ret)
> +		return ret;
> +
> +	*offset =3D sign_extend32(val & OFFSET_MASK, OFFSET_SIGN_BIT);
> +
> +	return 0;
> +}
> +
> +/*
> + * Write an oscillator offset correction value to
> + * the CTRL_OFFSET register. The valid range is
> + * -128 to 127 (8-bit signed), typically used to fine
> + * tune accuracy.
> + */
> +static int pcf85363_set_offset(struct device *dev, long offset) {
> +	struct pcf85363 *pcf85363 =3D dev_get_drvdata(dev);
> +
> +	if (offset < OFFSET_MINIMUM || offset > OFFSET_MAXIMUM) {
> +		dev_warn(dev, "Offset out of range: %ld\n", offset);
> +		return -ERANGE;
> +	}
> +
> +	return regmap_write(pcf85363->regmap, CTRL_OFFSET, offset &
> +OFFSET_MASK); }
> +
>  static int pcf85363_rtc_ioctl(struct device *dev,
>  			      unsigned int cmd, unsigned long arg)  { @@ -396,6
> +440,8 @@ static const struct rtc_class_ops rtc_ops =3D {
>  	.read_alarm	=3D pcf85363_rtc_read_alarm,
>  	.set_alarm	=3D pcf85363_rtc_set_alarm,
>  	.alarm_irq_enable =3D pcf85363_rtc_alarm_irq_enable,
> +	.read_offset =3D pcf85363_read_offset,
> +	.set_offset =3D pcf85363_set_offset,
>  };
>=20
>  static int pcf85363_nvram_read(void *priv, unsigned int offset, void *va=
l,
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

