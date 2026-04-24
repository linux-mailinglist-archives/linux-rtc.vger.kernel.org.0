Return-Path: <linux-rtc+bounces-6409-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMysB43X6mm+EgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6409-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Apr 2026 04:38:05 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6DC459046
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Apr 2026 04:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3FB43002D11
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Apr 2026 02:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAC8262808;
	Fri, 24 Apr 2026 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aRWFrvnK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F35A19C556;
	Fri, 24 Apr 2026 02:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776998279; cv=fail; b=W+I/a5kz5A1T/DVvhpV6ksDb4OMZjNl7ZIuV7uUiZgrHIJId8A3vzndtuJEUcGquaOprYuNIqgDqjgKUV+qxhoujQ+97ZdjDeue6+Nwd0Xev01J2DJeemjLba9pWKmJIJtSjU8NNezp/zOd7yaXhqe1F/xpkHElfMLsjd86XVfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776998279; c=relaxed/simple;
	bh=6sOlfL9GakZwyMcdJC4vnJw255ZMSH4N6F5dWFPUso4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RVgbD820rjJdnh8qbRFuzZasb8Iaos38SzQwAvDSD/3/+rYTR/oH1qVTdEDkr7lkXWkyz5591QeD9K7sajIUqA4b1JNfNWVfm5Rn481I0A28anDYG4xSv8cvqWsOFcl/UDX3hC7bBpwC3bVMqtMGgUfipdiiy9eTFwiIgEW9ZQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aRWFrvnK; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqj0X5Z20U6zPhcfxu+YDVTHiZCB5Q+n0MmarljUtFa4Df1A3gJM/nE3UyYelW2HB2R/lUCCQm0lb8Nv84WFxC+FngutJRRFzZSkdoJiaYKIAovJs2nCy600AFuitpGnvO1pAqoWBrVEUoaSuBKnCR/Jl+KyV39r1iCBpUlEwXPojKCxvm6f47UDwQIyBuHL6zXjaKFqn4ggDM1o8uaRuINMfQuV66WWVymI6vfuYNvjj5VLpnok+EiuPxm/P6+ZWSiAo0wHL3PKDmKoxbZqgMB9gXtlUAC/XTZhVlzLQSP0v649qW8ghO4bYqwlTsRp/gNSFof757dcTgEuNymeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9naO2asym6rozfuJ9s+/1elkx6Bbj8Aejo47f5wrr0U=;
 b=T87n5IVcHtyyKKEmD1GylM0/fPr6+nOW0WKOuUbItVWSvLhPGpGl0SdwY8w+AzO4dFbqqaz7a/KklVKbcUundGhEYEH9tUIs1dgdpt1WJ5aDXNNsIbA3gwRHWffmmVxoNF5olmTQgyqTquVJR8QEQm3lKQ2a7PjhJRr4HNvq8cxw6jUGP1TA+kQxgmXeZ9rZCNoueb5FFfxpbBFcfEiEwGMKQF3E8Eaa5b9iuJI7s51DkQbpUUIxgTVXpyP8+gQ7ga4f0gimUQ0hOQWj/MVyLtCeKDPgUU9qqvhuzB2phUYLfteh95B/uTIT8ULVx0dfgO4so7ottT4w0izfvX00rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9naO2asym6rozfuJ9s+/1elkx6Bbj8Aejo47f5wrr0U=;
 b=aRWFrvnK2ObpvNk4aGARa0te12r/h0vmSSeX74xMYyUTekH3epqfUK5fJv1BmHg2BY9g45WswVE2jzL9E4vc5x/23XSrZQdsTS0PUsfK52bsMwi5eNySyhXlmb8qYoEn+vyjloAplOlpl5Xo1XNVgUN91VwLrt+ypYCIKMvCtJV4F3L2p6ImtPGHzV0kqNQS1Ly3WN3e1PBVsuvYB2/b2Xp5aVm1Ewuy19R9Wn53lNzluJI5skOHe5K2RufCkW1oXHE7oK1vvuyS2DGyPZ8nQpfH9EG+8AWFpyQ38T6xpDXdGbovTIPeHdu0/jGZ00/L3cn4HdF+Xv3u9228qbePxA==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by DBBPR04MB7964.eurprd04.prod.outlook.com (2603:10a6:10:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Fri, 24 Apr
 2026 02:37:56 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.20.9846.016; Fri, 24 Apr 2026
 02:37:55 +0000
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
Thread-Index: AQHcX5YSbxaLSC8IOEuGOO6UoJ4wY7XuZonA
Date: Fri, 24 Apr 2026 02:37:55 +0000
Message-ID:
 <AS4PR04MB93629FC0E5B22263A41914E9FB2B2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
In-Reply-To: <20251127120456.1849177-1-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|DBBPR04MB7964:EE_
x-ms-office365-filtering-correlation-id: 6cb092c7-36b1-421a-2a7d-08dea1aa7d8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 1DCsIi7HKIrwjIYj6Jjjfok3fs4FTE7DzUzU5w3qTDPlkaOt4MdNDAEzGOBwiH8JsJDiQuaf9A+QIkAfSYZVMyRqmApCgqJv2MwOBzw5DY3SA5dUsoQeb8ipiqNV67kX+33AUbF7d17cGhz97dtGh2KGNVExfxs2F5Th06oFxBrt+t/CsmGsIrSf7DBE+b5pLqslu2xJL5jhPYsdDl9fMjSe/L6lRAbNpdNQ/k4OVoyCr5UFaZNekwrcPYwyjA0xj1/K0bOquQwmx3ZK0mCO9A4ERJwlzCjsrN3PE4TSsElVa/iQ9qtrxOCoXyPHL1oLwEUvd8zV5w3zQ/04Sk4iydjtFqGm8VKSUXzyrL/KsFGcAVpB7K2jhu0jDNSQ96Y3Gj82U8feFhkZ9snJin/ISfReC81+pSydBxesJNDMGARwW6OEiyMNDi7SpCtWV4LxkQ4J03Xx3eBfoWm59aLXzqOGTEgjze4B86rtlDzTREZKYYsCVSLW4DDIXVpe3iETae3L77JrYxo2BZEPfvQdg7Ui0mbmnqkLmkP69TKvQS7KS4dDWfudsfZ156lwfzL7P8RgarQ1Qofm2nfTwoA6rlQHEyf1p/V1SKmxKtn3KAUjt8PX8MmT0U56XGgCxk8mto7DQYMDvzHKo1QfZCJI57dqSwvfjepM/UwBLDAbq+Fz+IZ+fY8rQeJSZycfOfPAcWcFeMAC09meO8bzeL/Wt6opAnQPRIxdbCpg9uc/DVTzKhJYAJxr/Iyzq6LePCsNkiumo4Sq1IqOEbL/vW+1RovmkU3Wuf4uXOtzU5k8NHk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4BWNz+ix5c7cOxQR4ZPMblbqWQOl2G4daP1yuiPviiWU0hIzpJFxF2mzl6mr?=
 =?us-ascii?Q?556mvQp6P7QVeDPjPfcHDIiWfXan5uNeTUNWYqi+EfPNVccXXhUb8QSzBWbM?=
 =?us-ascii?Q?wk0QHWwfTu+rEHc614jRZxHWtPkSPBileeCzTkuqlEqNrcIirtc5DK2fKIO0?=
 =?us-ascii?Q?dfnyWJRyKtmhJmmAB3gIzCy1Dae73EDVeS2h2T6tj0TOH2/Ou/by/uzlHeBF?=
 =?us-ascii?Q?uuZj7SGEmCWn0c0xbNKUkAInnzjMcyNX6+w2B7qQEYiobG8zUbdRmWCV7HEy?=
 =?us-ascii?Q?yVKKnAzKP+6ImuHKYlAGuKtBmdvQok+m4IQEHfexVO5TghFdb2c1fkOUNIPE?=
 =?us-ascii?Q?WRr2GBBQRX6wMXr/3qgY/ZUvnaOJdPA+IEMo0+A51ESC88IeHvgCQqqjs3Ph?=
 =?us-ascii?Q?r8zNQEd7nr5oboFY8KvD8TPFFV3Q62WVhTq2msnzpH9Ju2DBx5V621eAlE0t?=
 =?us-ascii?Q?U6BwW4n8hJOCzs9ieRbQxq4cU9qCAEptXvx1F/1kN+cAwcE/5RkccYZdZRW5?=
 =?us-ascii?Q?2klxril2wcKG8kDfpWQHlusSw8QWh249WHuDAMuM5//XbHHYYmzZczUeVZJq?=
 =?us-ascii?Q?eSw0PF/olaUKfEZjUChXjXajRa92fmm57VArTtnFWl8ODFxXzbhc0PW7YDbx?=
 =?us-ascii?Q?ddV+NMYJS8cQc0g2FocDea6cNhJnT0ni87rqS2aismNdNVzJ5i/RFEP6qVvY?=
 =?us-ascii?Q?H0b60RTCmT5Wko3m0Dq3daI2UaIxHD8LEKxJ8dREGeZ72M8b0h+Xwsqy2ksf?=
 =?us-ascii?Q?u1J85VMQcD2eUVy1M2o7YqnPXJd1sBVDD4sT+xAwSqK8zJ0nJOkwysG1UKwM?=
 =?us-ascii?Q?uqsYkb181i4PpFtKmODy3sEoartXNH5AxrVLJtWHIuPbEG4bJFx6M8IfytxK?=
 =?us-ascii?Q?Dq2K61DR1X95UEZurtz/bCNP18SEZ8AcdUKcpoSKCY6ouMiBPB85y7pZPLc3?=
 =?us-ascii?Q?SXIwed5Dnnd4EOnTfxziYFhGBe8VNRN80mTHZIrO07ai2cOgNAfhdtQgF99x?=
 =?us-ascii?Q?5nggtfauP8Qsc24ng4PLJB2QhONM3EIe4iTFZzfATFqd0AcyoJaHc4zhQfVq?=
 =?us-ascii?Q?x/zs8uIEUY9PrkLjBb+IW/fO3BtDA4K80mgcs93WFooOXBtq1HRqvqnDVA1u?=
 =?us-ascii?Q?vO2yJKW5kTTn1bSiEJCyZEZz4c7PVICgTUr2l1uQ2x6P69FM6HBsOYHjCf/f?=
 =?us-ascii?Q?ekSi3+0/UgIPKbwuYQYl6eSQ4USTTMD068Pd5yMnHymTH3kSAbCAxE2A/2Zh?=
 =?us-ascii?Q?CKLatd81dFuONEN4sDgHmmYPMjtQADv4Nfj9DnH/ocIO0v9oqActIaeUjz4i?=
 =?us-ascii?Q?z/nfDkvU7moWUZSDPn233a73OuWJwXaW87/TFuz6RMc9cJbNVwRtMp4Mxjpy?=
 =?us-ascii?Q?HXYNaxL8iAVUdglWm151TJ3uhvZLrwqRdTgkZipgnX4WRYj5+ZiIdCpL8MJU?=
 =?us-ascii?Q?OjJ97gQ4g0IHrcNXr+GHe0lOj//dJ4tf1KlzkwVvh5T61xbF8j0FZswicKYE?=
 =?us-ascii?Q?bvvRAqqB8J0GW2h2lCbJQnS3PZUQhvKFWF+Rc5WAMJkZpGnF8tL8rF8WtpYL?=
 =?us-ascii?Q?Zr+ubph7Qre+xURxLvTuBcqlej2vzHybtuIMJoVNI4QuL05XlyqeRfF99LT4?=
 =?us-ascii?Q?+8wZaGwwhqgwNmQB0fVsxcxpIZEs7pYjWal3klWDqzyzEMziUZXetUeAKekv?=
 =?us-ascii?Q?2RUXuMAh/LwqP8rH8H0PEssXRcPYiy10PPV6LBi5braSHjF5Sj1T+FnX8SYn?=
 =?us-ascii?Q?i5Lze4SDTA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb092c7-36b1-421a-2a7d-08dea1aa7d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 02:37:55.5821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DG+Li30CZ0rKihysfYklUorONCYOjbKeL8dYgue+4cYMynEPS32g67zPvWvVQmD6Po4Qb4kwsTQWcK8lYxM/yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7964
X-Rspamd-Queue-Id: 0E6DC459046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6409-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lakshay.piplani@nxp.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,6f:email]

> +
> +    i2c1 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      rtc@6f {
> +        compatible =3D "nxp,pcf85053";
> +        reg =3D <0x6f>;
> +        nxp,interface =3D "secondary";
> +      };
> +    };
> --
> 2.25.1

Hi,

This is a gentle follow up on the patch series I submitted in November
(regarding the v7 of PCF85053 RTC driver). I haven't seen any review feedba=
ck
Yet. So, I wanted to check whether you might have had a chance to look at
the series.

Please let me know if there is anything further needed from my side.

Thanks,
Lakshay Piplani

